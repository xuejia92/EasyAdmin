<?php
namespace app\index\controller;

use think\Db;

class Login extends Base
{
    public $title='登录 EasyAdmin - 基于ThinkPHP5的极速后台开发框架';

    public function index(){
        return $this->fetch('login/index',['title'=>$this->title]);
    }

    public function login(){
        if($this->request->isPost()){
            $da=$this->request->post('');

            if(!$res=Db::name('dusy_user')->where(['account'=>$da['account']])->find()){
                $this->error('用户账号或密码错误');
            }

            if($res['password']!=md5('EasyAdmin*'.$da['password'])){
                $this->error('用户账号或密码错误');
            }

            if($res){
                session('account',$res);
                $this->success('恭喜登录成功！','/home/index/user');
            }else{
                $this->error('登录失败，请联系客服处理！');
            }
        }else{
            $this->error('非法登录!');
        }
    }
}