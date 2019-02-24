<?php
namespace app\index\controller;

use anerg\OAuth2\OAuth;
use service\SnsService;
use think\Db;
use think\facade\Config;

class Index extends Base
{
    public $title='首页 EasyAdmin - 基于ThinkPHP5的极速后台开发框架';

    public function index(){
        return $this->fetch('index/index',['title'=>$this->title]);
    }

    public function qqlogin(){
        $qq = new SnsService();
        $redirect_url = $qq->login('qq');
        return $this->redirect($redirect_url);
    }

    public function qqcallback(){
        $qq = new SnsService();
        $callbackInfo = $qq->callback('qq');
        print_r($callbackInfo);
    }

    public function weixinlogin(){
        $qq = new SnsService();
        $qq->login('weixin');
    }

    public function weibologin(){
        $qq = new SnsService();
        $qq->login('weibo');
    }

    public function sns(){
        $platform = $this->request->param('sns_platform');
        //获取本站的第三方登录配置
        $config = Config::get($platform . '.' . Config::get($platform));
        // $config['proxy'] = 'http://127.0.0.1:1080';
        //QQ,Facebook,Line,要求客户端传递access_token即可
        $config['access_token'] = $this->request->param('access_token', '');
        //Twitter需要传递下面四个参数
        $config['oauth_token']        = $this->request->param('oauth_token', '');
        $config['oauth_token_secret'] = $this->request->param('oauth_token_secret', '');
        $config['user_id']            = $this->request->param('user_id', '');
        $config['screen_name']        = $this->request->param('screen_name', '');

        $snsInfo = OAuth::$platform($config)->userinfo();
        print_r($snsInfo);
    }
}