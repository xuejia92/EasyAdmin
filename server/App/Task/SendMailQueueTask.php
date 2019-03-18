<?php
/**
 * Created by PhpStorm.
 * User: evalor
 * Date: 2018-11-28
 * Time: 20:23
 */

namespace App\Task;

use App\Utility\Mysql;
use App\Utility\Redis;
use EasySwoole\EasySwoole\Swoole\Task\AbstractAsyncTask;

/**
 * 发送广播消息
 * Class BroadcastTask
 * @package App\Task
 */
class SendMailQueueTask extends AbstractAsyncTask
{
    /**
     * 执行投递
     * @param $taskData
     * @param $taskId
     * @param $fromWorkerId
     * @return bool
     */
    protected function run($taskData, $taskId, $fromWorkerId, $flags = null)
    {
        $redis = (new Redis())->getConnect();
        for ($i=1;$i<=10000;$i++){
            $mock = $taskData;
            $mock['action'] = $taskData['content'].'Run';
            $mock['params'] = [
                'email'=>'1922884595@qq.com',
                'msg'=>'test fasong'.$i
            ];
//            var_dump('已压入redis'.$i);
            $redis->lPush('task_queue_list',json_encode($mock));
        }
        $this->insertDb($taskData,$i-1);
        return true;
    }

    public function insertDb($vo,$ret){
        $mysqlObject = Mysql::getInstance()->getConnect();
        $mysqlObject->where(['id'=>$vo['id']])->update($vo['table'],[
            'most_exec_num'=>$ret,
        ]);
//        $mysqlObject->close();
    }

    function finish($result, $task_id)
    {
        // TODO: Implement finish() method.
    }
}