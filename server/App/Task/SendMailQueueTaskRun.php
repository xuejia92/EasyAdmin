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
class SendMailQueueTaskRun extends AbstractAsyncTask
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
        $data = $taskData['queueData'];
        $this->sendMail($data['email'],$data['msg']);
        $redis = (new Redis())->getConnect();
        $redis->incr('task_queue_list_num'.$taskData['id'],1);
        $this->insertDb($taskData,$redis->get('task_queue_list_num'.$taskData['id']));
        return true;
    }

    public function insertDb($vo,$ret){
        $mysqlObject = Mysql::getInstance()->getConnect();
        $mysqlObject->where(['id'=>$vo['id']])->update($vo['table'],[
            'has_exec_num'=>$ret,
        ]);
//        $mysqlObject->close();
    }

    public function sendMail($email,$msg){
//        var_dump($email.'已发送:'.$msg);
         return $email.'已发送:'.$msg;
    }

    function finish($result, $task_id)
    {
        // TODO: Implement finish() method.
    }
}