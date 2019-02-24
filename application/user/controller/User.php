<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\user\controller;

use controller\BasicAdmin;
use service\DataService;
use service\ExcelService;
use think\Db;

/**
 * 系统用户管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class User extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'DusyUser';

    /**
     * 用户列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '用户管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['account', 'phone','id','tuijianren'] as $key) {
//            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode(' - ', $get['date']);
            $db->whereBetween('register_time', [strtotime("{$start} 00:00:00"),
                strtotime("{$end} 23:59:59")]);
        }
        return parent::_list($db->where('is_daili',0)->order('id','desc'));
    }

    public function user()
    {
        return $this->_form($this->table, 'user');
    }

    public function outExcel(){
        if ($this->request->isGet()) {
            $data=[
                'head'=>Db::name('DusyUser')->getTableFields(),
                'data'=>Db::name('DusyUser')->select(),
                'width'=>['avator'=>40,'nickname'=>10,'password'=>32]
            ];
            $res = (new ExcelService())->outExcel('用户表数据',$data);
            if(!$res){
                $this->error('导出失败！', '',$res);
            }
        }else{
            $this->error('导出失败！', '');
        }
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $vo['levelName']=Db::name("DusyLevel")->where('id',$vo['level'])->value('name');
        }
    }


    /**
     * 用户添加
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function add()
    {
        return $this->_form($this->table, 'form');
    }

    public function autoadd()
    {
        $chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
        $chars2 = '0123456789';
        $chars1 = 'abcdefghijklmnopqrstuvwxyz';
        $password = '';
        $account = '';
        $rpassword = '';
        for ( $i = 0; $i < 7; $i++ )
        {
            $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
            if($i<5){
                $account .= $chars1[ mt_rand(0, strlen($chars1) - 1) ];
            }
            if($i<4){
                $rpassword .= $chars2[ mt_rand(0, strlen($chars2) - 1) ];
            }
        }
        $data['account']=$account;
        $data['password']=md5('EasyAdmin*'.$password);
        $data['rpassword']=$rpassword;
        $data['register_time']=time();
        $data['register_ip']=$this->request->ip();

        if (Db::name($this->table)->where(['account' => $data['account']])->count() > 0) {
            $this->error('用户生成失败！');
        }

        if (DataService::save($this->table, $data, 'id')) {
            $id = Db::name('DusyUser')->where('account',$account)->value('id');
            $data = "用户id：".$id.'<br/>';
            $data .= "用户账号：".$account.'<br/>';
            $data .= "用户登录密码：".$password.'<br/>';
            $data .= "用户提款密码：".$rpassword.'<br/>';
            return $this->_form(null, 'form_auto','',[],[
                'id'=>$id,
                'account'=>$account,
                'password'=>$password,
                'rpassword'=>$rpassword,
                'data'=>$data
            ]);
        }else{
            $this->error('用户生成失败！', '');
        }
    }

    /**
     * 用户编辑
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function edit()
    {
        return $this->_form($this->table, 'form');
    }

    /**
     * 用户密码修改
     * @return array|string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function pass()
    {
        if ($this->request->isGet()) {
            $this->assign('verify', false);
            return $this->_form($this->table, 'pass');
        }
        $post = $this->request->post();
        if ($post['password'] !== $post['repassword']) {
            $this->error('两次输入的密码不一致！');
        }
        $data = ['id' => $post['id'], 'password' => md5('EasyAdmin*'.$post['password'])];
        if (DataService::save($this->table, $data, 'id')) {
            $this->success('密码修改成功，下次请使用新密码登录！', '');
        }
        $this->error('密码修改失败，请稍候再试！');
    }

    /**
     * 表单数据默认处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _form_filter(&$data)
    {
        if ($this->request->isPost()) {

            if (isset($data['id'])) {
                unset($data['account']);
            } elseif (Db::name($this->table)->where(['account' => $data['account']])->count() > 0) {
                $this->error('用户账号已经存在，请使用其它账号！');
            }
            if(isset($data['password']) && !empty($data['password'])){
                $data['password']=md5('dusy.*+jiage'.$data['password']);
            }
        }else{
            $data['levelName']=Db::name("DusyLevel")->where('id',$data['level'])->value('name');
        }
    }

    /**
     * 删除用户
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (in_array('10000', explode(',', $this->request->post('id')))) {
            $this->error('系统超级账号禁止删除！');
        }
        if (DataService::update($this->table)) {
            $this->success("用户删除成功！", '');
        }
        $this->error("用户删除失败，请稍候再试！");
    }

    /**
     * 用户禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (in_array('10000', explode(',', $this->request->post('id')))) {
            $this->error('系统超级账号禁止操作！');
        }
        if (DataService::update($this->table)) {
            $this->success("用户禁用成功！", '');
        }
        $this->error("用户禁用失败，请稍候再试！");
    }

    /**
     * 用户禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("用户启用成功！", '');
        }
        $this->error("用户启用失败，请稍候再试！");
    }

    public function songfen() {
        if ($this->request->isGet()) {
            return $this->_form($this->table, 'songfen');
        }else{
            if($this->request->post('res')==''){
                return $this->error('请搜索后再操作');
            }
            if($this->request->post('id')==''){
                return $this->error('请搜索后再操作');
            }
            $curid =  $this->request->post('curid');
            $type = $this->request->post('type');
            $price = $this->request->post('price');
            $id =  $this->request->post('id');
            $curuser =Db::name('DusyUser')->where('id',$curid)->find();

            if($curid==$id){
                return $this->error('不可送给自己');
            }

            if($type==1){
                if($price>$curuser['money']){
                    return $this->error('当前余额不足');
                }
            }else{
                if($price>$curuser['dongjiemoney']){
                    return $this->error('当前保险箱余额不足');
                }
            }
            if($price<=0){
                return $this->error('请输入正确转移金额');
            }
            if($type==1){
                $res = Db::name('DusyUser')->where('id',$id)->setInc('money',$price);
                $res1 = Db::name('DusyUser')->where('id',$curid)->setDec('money',$price);
            }else{
                $res = Db::name('DusyUser')->where('id',$id)->setInc('dongjiemoney',$price);
                $res1 = Db::name('DusyUser')->where('id',$curid)->setDec('dongjiemoney',$price);
            }
            if($res && $res1){
                $maninfo = Db::name('DusyUser')->where('id',$id)->find();
                $maninfo1 = Db::name('DusyUser')->where('id',$curid)->find();

                $da['userid']=$maninfo['id'];
                $da['remark']=15;
                if($type==1){
                    $da['trade']=$price;
                }else{
                    $da['trade']=$price;
                }
                $da['yue']=$maninfo['money'];
                $da['bxx']=$maninfo['dongjiemoney'];
                $da['otime']=time();
                Db::name('DusyTrade')->insert($da);

                $da['userid']=$maninfo1['id'];
                $da['remark']=15;
                $da['trade']=-$price;
                $da['yue']=$maninfo1['money'];
                $da['bxx']=$maninfo1['dongjiemoney'];
                $da['otime']=time();
                Db::name('DusyTrade')->insert($da);
                return $this->success('操作成功','');
            }else{
                return $this->error('操作失败');
            }
        }
    }

}
