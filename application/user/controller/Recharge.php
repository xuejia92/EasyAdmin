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
class Recharge extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'DusyCodepayOrder';

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
        $this->title = '充值记录';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];

        if(isset($get['id']) && $get['id'] !== '') {
            $payid=Db::name('DusyUser')->where('id',$get['id'])->value('account');
            $db->where('pay_id', "{$payid}");
        }

        foreach (['pay_id'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }

        if (isset($get['creat_time']) && $get['creat_time'] !== '') {
            list($start, $end) = explode(' - ', $get['creat_time']);
            $db->whereBetween('creat_time', [strtotime("{$start} 00:00:00"),
                strtotime("{$end} 23:59:59")]);
        }
        return parent::_list($db->order('creat_time','desc'));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vp) {
            $vp['id']=Db::name('DusyUser')->where('account',$vp['pay_id'])->value('id');
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
    public function chongzhi()
    {
        if($this->request->isGet()){
            return $this->_form($this->table, 'form');
        }else{
            if($this->request->post('res')==''){
                return $this->error('请搜索后再操作');
            }
            if($this->request->post('id')==''){
                return $this->error('请搜索后再操作');
            }
            $id =  $this->request->post('id');
            $type = $this->request->post('type');
            $price = $this->request->post('price');
            if($type==1){
                $res = Db::name('DusyUser')->where('id',$id)->setInc('money',$price);
            }else{
                $res = Db::name('DusyUser')->where('id',$id)->setInc('dongjiemoney',$price);
            }
            if($res){
                $maninfo = Db::name('DusyUser')->where('id',$id)->find();

                $data['pay_id']=$maninfo['account'];
                $data['money']=$price;
                $data['price']=$price;
                $data['type']=4;
                $data['order_id']="sy_".date('YmdHis').mt_rand(100000,999999);
                $data['pay_tag']='系统充值';
                $data['status']=2;
                $data['creat_time']=time();
                Db::name($this->table)->insert($data);

                $da['userid']=$maninfo['id'];
                $da['remark']=14;
                if($type==1){
                    $da['trade']=$price;
                }else{
                    $da['trade']=$price;
                }
                $da['yue']=$maninfo['money'];
                $da['bxx']=$maninfo['dongjiemoney'];
                $da['otime']=time();
                Db::name('DusyTrade')->insert($da);
                return $this->success('充值成功','');
            }else{
                return $this->error('充值失败');
            }
        }
    }

    public function search(){
        if($this->request->isGet()){
            return $this->error('查询错误');
        }else{
            $nameorid = trim($this->request->post('nameorid'));
            if($nameorid!=''){
                $res = Db::name('DusyUser')->where('id','=',$nameorid)->find();
                if($res){
                    $data = 'Id：'.$res['id'].' 用户名：'.$res['account'].' 余额：'.$res['money'].' 冻结金额：'.$res['dongjiemoney'];
                    return $this->success('已查询',null,['data'=>$data,'id'=>$res['id']]);
                }else{
                    $result = Db::name('DusyUser')->where('account',$nameorid)->find();
                    if($result){
                        $data = 'Id：'.$result['id'].' 用户名：'.$result['account'].' 余额：'.$result['money'].' 冻结金额：'.$result['dongjiemoney'];
                        return $this->success('已查询',null,['data'=>$data,'id'=>$result['id']]);
                    }else{
                        return $this->error('无查询结果');
                    }
                }
            }else{
                return $this->error('请时输入查询内容');
            }
        }
    }
}
