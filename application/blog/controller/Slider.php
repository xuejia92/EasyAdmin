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

namespace app\blog\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 后台参数配置控制器
 * Class Config
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:05
 */
class Slider extends BasicAdmin
{

    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'BlogSiteSlider';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '图片友链管理';

    /**
     * 显示系统常规配置
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function index(){
        $db = Db::name($this->table);
        $get = $this->request->get();
        foreach (['title'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        (isset($get['type']) && $get['type'] !== '') && $db->where('type', $get['type']);
        return $this->_list($db);
    }

    public function _index_data_other(&$data){

    }

    /**
     * 添加栏目
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
     * 编辑栏目
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
     * 删除栏目
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("栏目删除成功!", '');
        }
        $this->error("栏目删除失败, 请稍候再试!");
    }

    /**
     * 栏目禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("栏目禁用成功!", '');
        }
        $this->error("栏目禁用失败, 请稍候再试!");
    }

    /**
     * 栏目禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("栏目启用成功!", '');
        }
        $this->error("栏目启用失败, 请稍候再试!");
    }

}
