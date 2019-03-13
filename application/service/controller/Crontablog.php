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
 * 定时任务日志管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Crontablog extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'ServiceCrontabLog';

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
        $this->title = '定时任务日志管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        $db->alias('scl');
        $db->join('service_crontab sc','sc.id=scl.crontab_id');
        if (isset($get['title']) && $get['title'] !== '') {
            $db->whereLike('sc.title',"%{$get['title']}%");
        }
        if (isset($get['type']) && $get['type'] !== '') {
            $db->where('sc.type', $get['type']);
        }
        return parent::_list($db->field('scl.*,sc.type,sc.title')->order('scl.id desc'));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as $key=>&$vo) {
            $find = Db::name("service_crontab")->find($vo['crontab_id']);
            $vo['type'] = $find['type'];
            $vo['title'] = $find['title'];
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
    public function add()
    {
        return $this->_form($this->table, 'form');
    }

    /**
     * 用户编辑
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function edit()
    {
        return $this->_form($this->table, 'form');
    }

    /**
     * 表单数据默认处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _form_filter(&$data)
    {

    }

    /**
     * 删除用户
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }
}
