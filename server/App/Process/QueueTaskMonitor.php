<?php
/**
 * Created by PhpStorm.
 * User: evalor
 * Date: 2018-11-26
 * Time: 23:18
 */
namespace App\Process;
use App\Crontab\CustomCrontab;
use App\Task\CrontabTask;
use App\Utility\Pool\MysqlObject;
use App\Utility\Pool\MysqlPool;
use App\Utility\Redis;
use Cron\CronExpression;
use EasySwoole\Component\Process\AbstractProcess;
use EasySwoole\EasySwoole\Crontab\Crontab;
use EasySwoole\EasySwoole\Logger;
use EasySwoole\EasySwoole\Swoole\Task\TaskManager;
use EasySwoole\HttpClient\HttpClient;
use Swoole\Timer;
/**
 * 数据库中的定时任务监控
 * Class TaskMonitor
 * @package App\Process
 */
class QueueTaskMonitor extends AbstractProcess{
    public $table = 'service_queue';
    /**
     * 启动定时器进行循环扫描
     */
    public function run($arg){
        Timer::tick(1*1000,function (){
            MysqlPool::invoke(function (MysqlObject $mysqlObject) {
                $res = $mysqlObject->where('is_deleted',0)->get($this->table);
                if(!empty($res)){
                    $execTime = time();
                    foreach ($res as $vo){
                        if(time()<$vo['begin_time']){
                            continue;
                        }
                        $mysqlObject->where('id',$vo['id'])->update($this->table,[
                            'status'=>2,
                        ]);
                        if($vo['status']!=1){
                            continue;
                        }
                        $redis = (new Redis())->getConnect();
                        $redis->delete('task_queue_list_num'.$vo['id']);
                        $class = "\App\Task\\".$vo['content'];
                        if(!class_exists($class)){
                            Logger::getInstance()->log('消息队列模板不存在'.$class, 'queue' . $vo['id']);
                            $mysqlObject->insert('service_crontab_log',[
                                'crontab_id'=>$vo['id'],
                                'exec_time'=>$execTime,
                                'content'=>'[消息队列模板不存在]'.$class,
                            ]);
                        }
                        $vo['table']=$this->table;
                        $task = new $class($vo);
                        TaskManager::async($task);
                    }
                }
            });
        });
    }


    public function onShutDown(){
        // TODO: Implement onShutDown() method.
    }

    public function onReceive(string $str){
        // TODO: Implement onReceive() method.
    }
}