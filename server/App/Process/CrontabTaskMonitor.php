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
class CrontabTaskMonitor extends AbstractProcess{
    public $table = 'service_crontab';
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
                        if(time()>$vo['end_time']){
                            $mysqlObject->where('id',$vo['id'])->update($this->table,['status'=>0,'pre_exec_time'=>0]);
                            continue;
                        }
                        $find = $mysqlObject->where('id',$vo['id'])->getOne($this->table);
                        if($find['has_exec_num']>=$find['most_exec_num'] && $find['most_exec_num']!=0){
                            $mysqlObject->where('id',$vo['id'])->update($this->table,['status'=>0,'pre_exec_time'=>0]);
                            continue;
                        }

                        if(!CronExpression::isValidExpression($vo['rule'])){
                            continue;
                        }

                        $cron = CronExpression::factory($vo['rule']);
                        $nextTime = $cron->getNextRunDate()->format('YmdHi'); 
                        $mysqlObject->where('id',$vo['id'])->update($this->table,[
                            'pre_exec_time'=>strtotime($nextTime),
                        ]);

                        if (!$cron->isDue(date("YmdHi", $execTime))) {
                            continue;
                        }

                        if($execTime !== $find['pre_exec_time']){
                            continue;
                        }

                        $mysqlObject->where('id',$vo['id'])->update($this->table,[
                            'status'=>2,
                            'last_exec_time'=>time(),
                        ]);
                        switch ($vo['type']) {
                            case 0://sql
                                $ret = $mysqlObject->rawQuery($vo['content']);
                                $mysqlObject->insert('service_crontab_log',[
                                    'crontab_id'=>$vo['id'],
                                    'exec_time'=>$execTime,
                                    'content'=>'[执行sql的结果]'.$vo['content'].PHP_EOL.json_encode($ret),
                                ]);
                                break;
                            case 1://url
                                $client = new HttpClient();
                                $client->setUrl($vo['content']);
                                $client->setTimeout(10);
                                $ret = $client->exec();
                                $mysqlObject->insert('service_crontab_log',[
                                    'crontab_id'=>$vo['id'],
                                    'exec_time'=>$execTime,
                                    'content'=>'[访问url]'.$vo['content'].PHP_EOL.$ret,
                                ]);
                                break;
                            case 2:
                                $class = "\App\Task\\".$vo['content'];
                                if(!class_exists($class)){
                                    Logger::getInstance()->log('模板不存在'.$class, 'crontab_' . $vo['id']);
                                    $mysqlObject->insert('service_crontab_log',[
                                        'crontab_id'=>$vo['id'],
                                        'exec_time'=>$execTime,
                                        'content'=>'[任务模板不存在]'.$class,
                                    ]);
                                }
                                $vo['table']='service_crontab_log';
                                $task = new $class($vo);
                                TaskManager::async($task);
                                break;
                        }
                        $mysqlObject->where('id',$vo['id'])->setInc($this->table,'has_exec_num',1);
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