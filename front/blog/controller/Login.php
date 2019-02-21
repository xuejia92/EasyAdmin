<?php
namespace app\blog\controller;

use think\Controller;
use think\Db;

class Login extends Base
{
    public $title='登录 - 夜神博客';

    public function index(){
        return $this->fetch('login/login',['title'=>$this->title]);
    }

    public function login(){
        if($this->request->isPost()){
            $da=$this->request->post('');
            $res = userLogin($da['account'],$da['password']);
            if($res){
                $this->success('恭喜登录成功！','/blog');
            }else{
                $this->error('登录失败，请联系客服处理！');
            }
        }else{
            $this->error('非法登录!');
        }
    }

    public function logout(){
        session('account',null);
        $this->success('退出登录成功！','/blog');
    }
}