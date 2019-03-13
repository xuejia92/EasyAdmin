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
class Pl extends BasicAdmin
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
            $config = config('database.');
            require_once  env('app_path').'/service/view/pl/index.html';
        }
    }

}
