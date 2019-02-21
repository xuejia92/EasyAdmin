<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use service\SmsAliService;
use think\Db;

class Qiandao extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'DusyLeesign';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '日历签到管理';

    /**
     * 显示短信常规配置
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        if ($this->request->isGet()) {
            return $this->fetch('', ['title' => $this->title]);
        }
        if ($this->request->isPost()) {
            foreach ($this->request->post() as $key => $vo) {
                sysconf($key, $vo);
            }
            $this->success('日历系统参数配置成功！', '');
        }
    }

    public function test()
    {
        if ($this->request->isGet()) {
            return $this->_form(null, 'test_send');
        }
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
}