<?php
/**
 * Created by PhpStorm.
 * User: yf
 * Date: 2018/5/28
 * Time: 下午6:33
 */

namespace EasySwoole\EasySwoole;


use App\Process\Consumer;
use App\Process\CrontabTaskMonitor;
use App\Process\HotReload;
use App\Process\QueueTaskMonitor;
use App\Task\JdClient;
use App\Task\JdGoodClient;
use App\Utility\Pool\MysqlPool;
use App\Utility\Pool\RedisPool;
use App\Utility\Queue;
use App\WebSocket\WebSocketEvents;
use App\WebSocket\WebSocketParser;
use EasySwoole\Component\Pool\PoolManager;
use EasySwoole\Component\Timer;
use EasySwoole\EasySwoole\AbstractInterface\Event;
use EasySwoole\EasySwoole\Swoole\EventRegister;
use EasySwoole\Http\Request;
use EasySwoole\Http\Response;
use EasySwoole\Socket\Dispatcher;
use EasySwoole\Utility\File;

class EasySwooleEvent implements Event
{

    public static function initialize()
    {
        date_default_timezone_set('Asia/Shanghai');
        require_once EASYSWOOLE_ROOT."/App/Utility/simple_dom_html.php";
        self::loadConf();
        // 注册mysql数据库连接池
        PoolManager::getInstance()->register(MysqlPool::class, Config::getInstance()->getConf('MYSQL.POOL_MAX_NUM'))->setMinObjectNum((int)Config::getInstance()->getConf('MYSQL.POOL_MIN_NUM'));
        // 注册redis连接池
        PoolManager::getInstance()->register(RedisPool::class, Config::getInstance()->getConf('REDIS.POOL_MAX_NUM'))->setMinObjectNum((int)Config::getInstance()->getConf('REDIS.POOL_MIN_NUM'));
    }

    /**
     * mainServerCreate
     * @param EventRegister $register
     * @throws \Exception
     */
    public static function mainServerCreate(EventRegister $register)
    {
        $serverManager = ServerManager::getInstance()->getSwooleServer();
        // 注册WS事件回调
        $conf = new \EasySwoole\Socket\Config();
        $conf->setType($conf::WEB_SOCKET);
        $conf->setParser(new WebSocketParser);
        $dispatch = new Dispatcher($conf);
        // 收到客户端消息时的处理
        $register->set(EventRegister::onMessage, function (\swoole_server $server, \swoole_websocket_frame $frame) use ($dispatch) {
            $dispatch->dispatch($server, $frame->data, $frame);
        });
        // 链接打开和关闭时的处理
        $register->set(EventRegister::onOpen, [WebSocketEvents::class, 'onOpen']);
        $register->set(EventRegister::onClose, [WebSocketEvents::class, 'onClose']);
        // 启动时清理 在线用户列表直接清空
        $register->add($register::onWorkerStart, function (\swoole_server $server, $workerId) {
            if ($workerId == 0) {
                WebSocketEvents::cleanOnlineUser();
            }
        });

        //热重启
        $serverManager->addProcess((new HotReload('HotReload',['disableInotify'=>true]))->getProcess());
        //自定义进程
        $serverManager->addProcess((new CrontabTaskMonitor('CrontabTaskMonitor'))->getProcess());
        $serverManager->addProcess((new QueueTaskMonitor('QueueTaskMonitor'))->getProcess());
        //消息队列
        $allNum = 3;
        for ($i = 0 ;$i < $allNum;$i++){
            ServerManager::getInstance()->getSwooleServer()->addProcess((new Consumer("consumer_{$i}"))->getProcess());
        }
        //JdClient
        $conf = Config::getInstance()->getConf('REDIS');
        $redis = new \Redis();
        $redis->connect($conf['host'], $conf['port']);
        if (!empty($conf['auth'])) {
            $redis->auth($conf['auth']);
        }
        $redis->del(Queue::$queue);
        $register->add(EventRegister::onWorkerStart, function (\swoole_server $server, $workerId) {
            if ($workerId === 0) {
                \Co::create(function () {
                    $redis = PoolManager::getInstance()->getPool(RedisPool::class)->getObj();
                    if ($redis) {
                        $client = new JdClient($redis);     // 协程客户端
//                        $client->run();
                    } else {
                        echo 'redis pool is empty' . PHP_EOL;
                    }
                });

                // 定时任务
                $timer = Timer::getInstance()->loop(1 * 1000, function () use (&$timer) {
                    \Co::create(function () use (&$timer){
                        $db = PoolManager::getInstance()->getPool(MysqlPool::class)->getObj();
                        $redis = PoolManager::getInstance()->getPool(RedisPool::class)->getObj();
                        if ($db && $redis) {
                            $queue = new Queue($redis);
                            $goodTask = new JdGoodClient($db);        // 协程客户端
                            $task = $queue->rPop();
                            if($task) {
                                echo 'task-----'.$task.PHP_EOL;
                                $goodTask->handle($task);
                            } else {
                                if ($timer) {
                                    Timer::getInstance()->clear($timer);
                                }
                                echo 'end-----'.PHP_EOL;
                            }
                            PoolManager::getInstance()->getPool(MysqlPool::class)->recycleObj($db);
                            PoolManager::getInstance()->getPool(RedisPool::class)->recycleObj($redis);
                        } else {
                            if ($redis) {
                                echo 'mysql pool is empty'.PHP_EOL;
                                PoolManager::getInstance()->getPool(MysqlPool::class)->recycleObj($db);
                            } else {
                                echo 'redis pool is empty'.PHP_EOL;
                                PoolManager::getInstance()->getPool(RedisPool::class)->recycleObj($redis);
                            }
                        }
                    });
                });
            }
        });

    }

    public static function onRequest(Request $request, Response $response): bool
    {
        return true;
    }

    public static function afterRequest(Request $request, Response $response): void
    {

    }

    public static function onReceive(\swoole_server $server, int $fd, int $reactor_id, string $data): void
    {

    }

    /**
     * 引用自定义配置文件
     * @throws \Exception
     */
    public static function loadConf()
    {
        $files = File::scanDirectory(EASYSWOOLE_ROOT . '/App/Config');
        if (is_array($files)) {
            foreach ($files['files'] as $file) {
                $fileNameArr = explode('.', $file);
                $fileSuffix = end($fileNameArr);
                if ($fileSuffix == 'php') {
                    Config::getInstance()->loadFile($file);
                }
            }
        }
    }

}