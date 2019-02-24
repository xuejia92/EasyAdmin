<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use service\MailService;

class Mail extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '邮件发送配置';

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
            $this->success('邮件参数配置成功！', '');
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
}