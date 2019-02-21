<?php
namespace app\index\controller;

use think\Db;
use think\facade\Config;

class User extends Base
{
    public $title='会员中心 EasyAdmin - 基于ThinkPHP5的极速后台开发框架';

    public function __construct(){
        parent::__construct();
        if(!session('account')){
            $this->redirect('/index/login');
        }
    }

    public function index(){
        $user =Db::name('DusyUser')->where('account',session('account')['account'])->find();
        $user['levelName']=Db::name("DusyLevel")->where('id',$user['level'])->value('name');
        return $this->fetch('user/index',['title'=>$this->title,'user'=>$user,'focus'=>'user']);

    }

    public function user_profile(){
        if($this->request->isPost()){
            $da=$this->request->post('');
            if($da['nickname']==''){
                $this->error('昵称不能为空');
            }
            if($res=Db::name('DusyUser')->where('account',$da['account'])->update([
                'nickname'=>$da['nickname'],
                'desc'=>$da['desc']
            ])){
                $this->success('修改成功！');
            }else{
                $this->error('修改失败或无改变');
            }
        }else {
            $user =Db::name('DusyUser')->where('account',session('account')['account'])->find();
            return $this->fetch('user/user_profile', ['title' => $this->title, 'user' => $user,'focus'=>'user_profile']);
        }
    }

    public function user_changepwd(){
        if($this->request->isPost()){
            $da=$this->request->post('');
            if($da['oldpassword']=='' ||$da['newpassword']=='' ||$da['renewpassword']==''  ){
                $this->error('所填内容不能为空');
            }
            if($da['newpassword']!=$da['renewpassword']){
                $this->error('两次新密码输入不一致');
            }
            if(md5('EasyAdmin*'.$da['oldpassword'])!=session('account')['password']){
                $this->error('原密码输入错误，请核实！');
            }

            if($res=Db::name('DusyUser')->where('account',session('account')['account'])->update([
                'password'=>md5('EasyAdmin*'.$da['newpassword'])
            ])){
                $this->success('修改成功！');
            }else{
                $this->error('修改失败或无改变');
            }
        }else{
            return $this->fetch('user/user_changepwd',['title'=>$this->title,'focus'=>'user_changepwd']);
        }
    }

    public function user_recharge(){
        return $this->fetch('user/user_recharge',['title'=>$this->title,'focus'=>'user_recharge']);
    }

    public function user_moneylog(){
        return $this->fetch('user/user_moneylog',['title'=>$this->title,'focus'=>'user_moneylog']);
    }

    public function blog(){
        return $this->fetch('user/user_blog_articles',['title'=>$this->title,'focus'=>'user_blog']);
    }

    public function user_qiandao(){
        return $this->fetch('user/user_qiandao',['title'=>$this->title,'focus'=>'user_qiandao']);
    }

    public function signDay(){
        $uid = session('account')?session('account')['id']:false;
        if(!$uid){
            return -1;
        }
        $curr = date('Y-m-d', time());
        list($start, $end) = [strtotime("{$curr} 00:00:00"),strtotime("{$curr} 23:59:59")];
        $repeat = Db::name("dusy_leesign")
            ->whereBetween('addtime', [$start, $end])
            ->where('uid',$uid)
            ->where('status',1)
            ->find();
        if($repeat){
            return 0;
        }
        $data['uid']=$uid;
        $data['addtime']=time();
        $data['status']=1;
        $data['point']=0;
        $res = Db::name("dusy_leesign")->insert($data);
        if($res){
            Db::name('DusyUser')->where('id',$uid)->setInc('point',sysconf('user_leesign_point'));
            $one = date('Y-m-1', time());
            $last = date('Y-m-31', time());
            list($start, $end) = [strtotime("{$one} 00:00:00"),strtotime("{$last} 23:59:59")];
            $count = Db::name("dusy_leesign")
                ->whereBetween('addtime', [$start, $end])
                ->where('uid',$uid)
                ->where('status',1)
                ->count();
            if($count>=20){
                Db::name('DusyUser')->where('id',$uid)->setInc('point',sysconf('user_leesign_point_20'));
            }
            return 1;
        }else{
            return 2;
        }
    }

    public function logout(){
        session('account',null);
        $this->redirect('/index/login');
    }
}