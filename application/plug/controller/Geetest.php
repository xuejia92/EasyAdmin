<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use service\GeetestService;
use service\MailService;

class Geetest extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '极验验证码配置';

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
            $this->success('极验验证码配置成功！', '');
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
            $to = $this->request->post('to');
            $name = $this->request->post('name');
            $subject = $this->request->post('subject');
            $body = $this->request->post('body');
            $attment = $this->request->post('attment');
            if(MailService::sendMail($to,$name,$subject,$body,$attment)){
                $this->success('发送成功！', '');
            }else{
                $this->error('发送失败！', '');
            }
        }
    }

    /**
     * geetest生成验证码
     */
    public function geetest_show_verify(){
        echo GeetestService::geetest_show_verify();
    }
    /**
     * geetest submit 提交验证
     */
    public function geetest_submit_check(){
        if (GeetestService::geetest_chcek_verify($this->request->post(''))) {
            echo '验证成功';
        }else{
            echo '验证失败';
        }
    }
    /**
     * geetest ajax 验证
     */
    public function geetest_ajax_check(){
        $data=$this->request->post('');
        echo intval(GeetestService::geetest_chcek_verify($data));
    }
}