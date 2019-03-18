<?php
/**
 * Created by PhpStorm.
 * User: Tioncico
 * Date: 2018/10/18 0018
 * Time: 9:43
 */

namespace App\Process;

use App\Utility\Pool\RedisObject;
use App\Utility\Redis;
use EasySwoole\Component\Process\AbstractProcess;
use EasySwoole\EasySwoole\Logger;
use EasySwoole\EasySwoole\Swoole\Task\TaskManager;

class Consumer extends AbstractProcess
{
    private $isRun = false;
    public $table = 'service_queue';

    public function run($arg)
    {
        $this->addTick(500,function (){
            if(!$this->isRun){
                $this->isRun = true;
                $redis = (new Redis())->getConnect();//此处为伪代码，请自己建立连接或者维护redis连接
                while (true){
                    try{
                        $task = $redis->rPop('task_queue_list');
                        if($task){
                            $mock = json_decode($task,true);
                            $action = $mock['action'];
                            $params = $mock['params'];
                            $class = "\App\Task\\".$action;
                            if(!class_exists($class)){
                                Logger::getInstance()->log('消息队列模板不存在'.$class, 'queueTask');
                            }
                            $vo = $mock;
                            $vo['table']='service_queue';
                            $vo['queueData']=$params;
                            $taskMan = new $class($vo);
                            TaskManager::async($taskMan);
                        }else{
                            break;
                        }
                    }catch (\Throwable $throwable){
                        break;
                    }
                }
                $this->isRun = false;
            }
        });
    }

    public function onShutDown()
    {
        // TODO: Implement onShutDown() method.
    }

    public function onReceive(string $str, ...$args)
    {
        // TODO: Implement onReceive() method.
    }
}