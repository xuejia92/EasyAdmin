<?php
/**
 * Created by PhpStorm.
 * User: evalor
 * Date: 2018-11-28
 * Time: 20:23
 */

namespace App\Task;

use App\Utility\Curl\Field;
use App\Utility\Curl\Headers;
use App\Utility\Curl\Request;
use App\Utility\Curl\UAGenerate;
use App\Utility\Mysql;
use co;
use EasySwoole\EasySwoole\ServerManager;
use EasySwoole\EasySwoole\Swoole\Task\AbstractAsyncTask;
use EasySwoole\Mysqli\Mysqli;

/**
 * 发送广播消息
 * Class BroadcastTask
 * @package App\Task
 */
class SucaihuoTask extends AbstractAsyncTask
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
        $vo = $taskData;
        $ret = $this->leeSign('1922884595@qq.com','13812865384');
        $this->insertDb($vo,$ret);
        return true;
    }

    public function insertDb($vo,$ret){
        $mysqlObject = Mysql::getInstance()->getConnect();
        $mysqlObject->insert($vo['table'],[
            'crontab_id'=>$vo['id'],
            'exec_time'=>time(),
            'content'=>'[模板定时任务]'.$vo['content'].PHP_EOL.$ret,
        ]);
        $mysqlObject->close();
    }

    public function leeSign($username,$password){
        $headers = (new Headers())
            ->setHeader('User-Agent', UAGenerate::mock(UAGenerate::SYS_OSX, false, UAGenerate::SYS_BIT_X64))
            ->setHeader('Connection', 'keep-alive')
            ->setHeader('Pragma', 'no-cache')
            ->setHeader('Cache-Control', 'no-cache');
        // 请求登录系统
        $request = new Request('https://www.sucaihuo.com/Login/check');
        $new_headers = $headers;
        $new_headers->setHeader('Referer', 'https://www.sucaihuo.com/login.html')
            ->setHeader('X-Requested-With', 'XMLHttpRequest');
        $response = $request
            ->setHeaders($new_headers)
            ->addPost(new Field('username', $username))
            ->addPost(new Field('pwd', $password))
            ->exec();
        if (!$enter = json_decode($response->getBody())) throw new \Exception('响应解析失败: ' . $response->getBody());
        if ($enter->error !== '') return $enter->error;
        $cookies = $response->getCookies();
        // 请求换取签到令牌
        $token_request = new Request('https://www.sucaihuo.com/Member/sign');
        $new_headers = $headers;
        $new_headers->setHeader('Referer', 'http://www.sucaihuo.com/login.html');
        $response = $token_request->setCookies($cookies)->setHeaders($new_headers)->exec();
        $tokenCheck = preg_match('/data-key="(.*)?"/i', $response->getBody(), $token);
        if (!$tokenCheck) return ('获取签到令牌失败');
        $enter->token = $token[1];
        // 请求操作签到接口
        $signDayRequest = new Request('https://www.sucaihuo.com/Member/signDay');
        $new_headers = $headers;
        $new_headers->setHeader('Referer', 'https://www.sucaihuo.com/Member/sign');
        $signDayResponse = $signDayRequest->setCookies($cookies)->addPost(new Field('key', $enter->token))->setHeaders($new_headers)->exec();
        $result = $signDayResponse->getBody();
        if ($result === 'key') return  ('签到令牌错误: ' . $enter->token);
        if ((int)$result <= 0) return ('今天已经签到过了');
        $enter->score = (int)$result;
        return json_encode($enter);
    }

    function finish($result, $task_id)
    {
        // TODO: Implement finish() method.
    }
}