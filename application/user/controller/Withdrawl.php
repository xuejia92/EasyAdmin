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
use think\Db;

/**
 * 系统用户管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Withdrawl extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'DusyWithdrawal';

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
        $this->title = '提现记录';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['id','status'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }

        if(isset($get['username']) && $get['username'] !== '') {
            $payid=Db::name('DusyUser')->where('account',$get['username'])->value('id');
            $db->where('id', "{$payid}");
        }

        if (isset($get['create_time']) && $get['create_time'] !== '') {
            list($start, $end) = explode(' - ', $get['create_time']);
            $db->whereBetween('create_time', [strtotime("{$start} 00:00:00"),
                strtotime("{$end} 23:59:59")]);
        }
        return parent::_list($db->order('create_time','desc'));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vp) {
            $vp['username'] = Db::name('DusyUser')->where('id',$vp['userid'])->value('account');
            $bank = Db::name('DusyBank')->where('id',$vp['userid'])->find();
            $vp['zfbhao']  = $bank?$bank['banknumber']:'';
            $vp['zfbname']  = $bank?$bank['accountname']:'';
        }
    }


    public function refuse() {
        $id = $this->request->get('id','');
        if($id==''){
            return $this->error('非法操作');
        }
        $data['remark'] = '提现失败，请稍后再试！';
        $data['status']=2;
        $data['opt_time']=time();
        $data['opt_admin']=session('user')['username'];
        $res = Db::name('DusyWithdrawal')->where('id',$id)->update($data);

        $data['id']=$id;
        $withdr=Db::name('DusyWithdrawal')->where('id',$data['id'])->find();
        Db::name('DusyUser')->where('id',$withdr['userid'])->setInc('money',$withdr['amount']);
        $curuser=Db::name('DusyUser')->where('id',$withdr['userid'])->find();
        $da['userid']=$curuser['id'];
        $da['otime']=time();
        $da['remark']=4;
        $da['trade']=$withdr['amount'];
        $da['yue']=$curuser['money'];
        $da['bxx']=$curuser['dongjiemoney'];
        Db::name('DusyTrade')->insert($da);
        return $this->success('操作成功','');
    }


}
