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
use service\SmsService;

class Test extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '短信发送配置';

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
            $this->success('短信参数配置成功！', '');
        }
    }


    /**
     * 测试发送
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function test()
    {
        if ($this->request->isGet()) {
            return $this->_form(null, 'test_send');
        }
        if ($this->request->isPost()) {
            set_time_limit(0);

            $to = $this->request->post('to');
            $code= $this->request->post('code');

            $res = SmsAliService::sendSms($to,$code);
            if($res->Code=='OK'){
                $this->success('发送成功！', '');
            }else{
                $this->error('发送失败！'.$res->Message, '',$res);
            }
        }
    }
}