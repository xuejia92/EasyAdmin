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

namespace app\forum\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 系统评论管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Comment extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'ForumComment';

    /**
     * 评论列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '评论管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode(' - ', $get['date']);
            $db->whereBetween('time', [strtotime("{$start} 00:00:00"), strtotime("{$end} 23:59:59")]);
        }
        return parent::_list($db->where(['is_deleted' => '0'])->order('time desc'));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach($data as &$v){
            $v['uid_name'] = Db::name('DusyUser')->where('id',$v['uid'])->value('nickname');
            $v['fid_name'] = Db::name('ForumForum')->where('id',$v['fid'])->value('title');
        }
    }
 

    /**
     * 评论添加
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
     * 评论编辑
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
     * 删除评论
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("评论删除成功！", '');
        }
        $this->error("评论删除失败，请稍候再试！");
    }

    /**
     * 评论禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("评论禁用成功！", '');
        }
        $this->error("评论禁用失败，请稍候再试！");
    }

    /**
     * 评论禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("评论启用成功！", '');
        }
        $this->error("评论启用失败，请稍候再试！");
    }

}
