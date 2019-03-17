<?php
namespace App\Crontab;

use EasySwoole\EasySwoole\Crontab\AbstractCronTask;
use EasySwoole\EasySwoole\Crontab\Crontab;

class CustomCrontab extends AbstractCronTask
{
    public static function getRule(): string{
        return '*/2 * * * *';
    }

    public static function getTaskName(): string{
        return 'taskTwo';
    }

    static function run(\swoole_server $server,int $taskId,int $fromWorkerId,$flags = null){
        $cron = Crontab::getInstance();
        $cron->resetTaskRule('taskTwo','*/5 * * * *'); // 可以重新设置某任务的执行规则
        $current = date('Y-m-d H:i:s');
        $rule = $cron->getTaskCurrentRule('taskTwo');
        $nextTime = date('Y-m-d H:i:s',$cron->getTaskNextRunTime('taskTwo'));
        $runCount = $cron->getTaskRunNumberOfTimes('taskTwo');
    }
}