<?php
namespace app\pub\controller;

use anerg\OAuth2\OAuth;
use think\Controller;
use think\facade\Config;

class Index extends Controller
{
    public function index(){
        $name = $this->request->param('name','qq');
        $config['app_id'] = sysconf($name.'_app_id');
        $config['app_secret'] = sysconf($name.'_app_secret');
        $config['scope'] = sysconf($name.'_scope');
        $config['callback'] = sysconf($name.'_callback');
        $redirect_url = OAuth::$name($config)->getRedirectUrl();
        $this->redirect($redirect_url);
    }
    public function callback()
    {
        $name = $this->request->param('name','qq');
        //获取配置
        $this->config = Config::get('sns.' . $name);

        //获取格式化后的第三方用户信息
        $snsInfo = OAuth::$name($this->config)->userinfo();

        //获取第三方返回的原始用户信息
        $snsInfoRaw = OAuth::$name($this->config)->userinfoRaw();

        //获取第三方openid
        $openid = OAuth::$name($this->config)->openid();

        var_dump($snsInfo);
        return [$snsInfo,$snsInfoRaw,$openid];
    }
}