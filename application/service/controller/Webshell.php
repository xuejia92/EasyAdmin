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

namespace app\service\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 定时任务管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Webshell extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'ServiceCrontab';

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
        if ($this->request->isGet()) {
            $alert = [
                'type' => 'danger',
                'title' => 'Shell In A Box（远程Linux服务器的SSH终端）',
                'content' => '[centos安装配置]:yum install openssl shellinabox <br>
                   配置文件 vi /etc/sysconfig/shellinaboxd <br>
                   指定端口号 PORT=6175  指定目的地SSH服务器的IP地址  OPTS="-s -t/:SSH:172.16.25.125"<br>
                   开启服务 sudo service shellinaboxd start  
                '
            ];
            return $this->fetch( 'webshell/index',['alert'=>$alert]);
        }
        if ($this->request->isPost()) {
            foreach ($this->request->post() as $key => $vo) {
                sysconf($key, $vo);
            }
            $this->success('设置成功！', '');
        }
    }

}
