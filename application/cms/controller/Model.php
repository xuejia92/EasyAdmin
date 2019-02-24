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

namespace app\cms\controller;

use controller\BasicAdmin;
use service\DataService;
use service\NodeService;
use service\ToolsService;
use think\Db;

/**
 * 系统后台管理管理
 * Class Menu
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15
 */
class Model extends BasicAdmin
{

    /**
     * 绑定操作模型
     * @var string
     */
    public $table = 'CmsSiteType';

    /**
     * 模型列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = 'cms模型管理';
        $db = Db::name($this->table)->order('sort asc,id asc');
        return parent::_list($db, false);
    }



    /**
     * 添加模型
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
     * 编辑模型
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
     * 表单数据前缀方法
     * @param array $vo
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function _form_filter(&$vo)
    {
        if ($this->request->isGet()) {
            // 上级模型处理
            $_menus = Db::name($this->table)->where(['status' => '1'])->order('sort asc,id asc')->select();
            $_menus[] = ['title' => '顶级模型', 'id' => '0', 'pid' => '-1'];
            $menus = ToolsService::arr2table($_menus);
            foreach ($menus as $key => &$menu) {
                if (substr_count($menu['path'], '-') > 3) {
                    unset($menus[$key]);
                    continue;
                }
                if (isset($vo['pid'])) {
                    $current_path = "-{$vo['pid']}-{$vo['id']}";
                    if ($vo['pid'] !== '' && (stripos("{$menu['path']}-", "{$current_path}-") !== false || $menu['path'] === $current_path)) {
                        unset($menus[$key]);
                        continue;
                    }
                }
            }
            // 读取系统功能节点
            $nodes = NodeService::get();
            foreach ($nodes as $key => $node) {
                if (empty($node['is_menu'])) {
                    unset($nodes[$key]);
                }
            }
            // 设置上级模型
            if (!isset($vo['pid']) && $this->request->get('pid', '0')) {
                $vo['pid'] = $this->request->get('pid', '0');
            }
            $this->assign(['nodes' => array_column($nodes, 'node'), 'menus' => $menus]);
        }
    }

    /**
     * 删除模型
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("模型删除成功!", '');
        }
        $this->error("模型删除失败, 请稍候再试!");
    }

    /**
     * 模型禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("模型禁用成功!", '');
        }
        $this->error("模型禁用失败, 请稍候再试!");
    }

    /**
     * 模型禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("模型启用成功!", '');
        }
        $this->error("模型启用失败, 请稍候再试!");
    }

}
