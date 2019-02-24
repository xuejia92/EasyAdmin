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
use think\facade\App;

class Pay extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '支付参数配置';

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
            $this->success('支付参数配置成功！', '');
        }
    }

    public function test()
    {
        if ($this->request->isGet()) {
            return $this->fetch('alipay', ['title' => $this->title]);
        }
        if ($this->request->isPost()) {
            $type = $this->request->post('type');
            switch ($type){
                case 'pagepay':
                    require_once App::getAppPath()."../extend/vendor/Alipay/pagepay/pagepay.php";
                    break;
                case 'query':
                    require_once App::getAppPath()."../extend/vendor/Alipay/pagepay/query.php";
                    break;
            }
        }
    }

    public function notify_url()
    {
        require_once App::getAppPath()."../extend/vendor/Alipay/notify_url.php";
    }

    public function return_url()
    {
        require_once App::getAppPath()."../extend/vendor/Alipay/return_url.php";
    }


}