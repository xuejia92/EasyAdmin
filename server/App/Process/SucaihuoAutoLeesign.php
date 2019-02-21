<?php
/**
 * Created by PhpStorm.
 * User: evalor
 * Date: 2018-11-26
 * Time: 23:18
 */
namespace App\Process;
use App\Utility\Curl\Field;
use App\Utility\Curl\Headers;
use App\Utility\Curl\Request;
use App\Utility\Curl\UAGenerate;
use EasySwoole\Component\Process\AbstractProcess;
use Swoole\Timer;
/**
 * 素材火自动签到
 * Class HotReload
 * @package App\Process
 */
class SucaihuoAutoLeesign extends AbstractProcess{
    /**
     * 启动定时器进行循环扫描
     */
    public function run($arg){
        Timer::tick(10*1000,function (){
            $res = $this->leeSign('1922884595@qq.com','13812865384');
            var_dump($res);
        });
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
        if ($enter->error !== '') throw new \Exception($enter->error);
        $cookies = $response->getCookies();
        // 请求换取签到令牌
        $token_request = new Request('https://www.sucaihuo.com/Member/sign');
        $new_headers = $headers;
        $new_headers->setHeader('Referer', 'http://www.sucaihuo.com/login.html');
        $response = $token_request->setCookies($cookies)->setHeaders($new_headers)->exec();
        $tokenCheck = preg_match('/data-key="(.*)?"/i', $response->getBody(), $token);
        if (!$tokenCheck) throw new \Exception('获取签到令牌失败');
        $enter->token = $token[1];
        // 请求操作签到接口
        $signDayRequest = new Request('https://www.sucaihuo.com/Member/signDay');
        $new_headers = $headers;
        $new_headers->setHeader('Referer', 'https://www.sucaihuo.com/Member/sign');
        $signDayResponse = $signDayRequest->setCookies($cookies)->addPost(new Field('key', $enter->token))->setHeaders($new_headers)->exec();
        $result = $signDayResponse->getBody();
        if ($result === 'key') throw new \Exception('签到令牌错误: ' . $enter->token);
        if ((int)$result <= 0) throw new \Exception('今天已经签到过了');
        $enter->score = (int)$result;
        return $enter;
    }

    public function onShutDown()
    {
        // TODO: Implement onShutDown() method.
    }
    public function onReceive(string $str)
    {
        // TODO: Implement onReceive() method.
    }
}