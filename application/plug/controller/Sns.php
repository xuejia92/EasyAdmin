<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use anerg\OAuth2\OAuth;
use controller\BasicAdmin;
use service\SmsAliService;
use service\SmsService;
use service\SnsService;
use think\facade\Config;

class Sns extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = 'sns第三方登录配置';

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
            $this->success('参数配置成功！', '');
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
    }
}