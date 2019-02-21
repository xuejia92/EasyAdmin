<?php
namespace app\blog\controller;

use think\Controller;
use think\Db;

class Register extends Controller
{
    public $title='注册 EasyAdmin - 基于ThinkPHP5的极速后台开发框架';

    public function index(){
        return $this->fetch('index/register',['title'=>$this->title]);
    }

    public function register(){
        if($this->request->isPost()){
            $da=$this->request->post('');
            $captcha = $da['captcha'];
            if(!captcha_check($captcha)){
                $this->error('验证码错误');
            }
            unset($da['captcha']);
            if($da['password'] != $da['repassword']){
                $this->error('两次密码输入不一致');
            }
            unset($da['repassword']);
            if(strlen($da['account'])<4){
                $this->error('用户账号长度不少于4位');
            }
            if(strlen($da['password'])<4){
                $this->error('密码长度不少于6位');
            }
            $da['password']=md5('EasyAdmin*'.$da['password']);
            if(Db::name('dusy_user')->where(['account'=>$da['account']])->find()){
                $this->error('用户账号已存在');
            }
            $da['register_time']=time();
            $da['register_ip']=$this->request->ip();
            if($res=Db::name('dusy_user')->insert($da)){
                $this->success('恭喜注册成功！前往登录！','/index/login');
            }else{
                $this->error('注册失败，请联系客服处理！');
            }
        }else{
            $this->error('非法注册!');
        }
    }
}