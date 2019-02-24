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
 * 系统消息管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Message extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'ForumMessage';

    /**
     * 消息列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '消息管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        (isset($get['type']) && $get['type'] !== '') && $db->where('type', $get['type']);
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
            if($v['uid']==0){
                $v['uid_name']='系统管理员';
            }else{
                $v['uid_name'] = Db::name('DusyUser')->where('id',$v['uid'])->value('nickname');
            }
            if($v['touid']==0){
                $v['touid_name']='所有人';
            }else{
                $v['touid_name'] = Db::name('DusyUser')->where('id',$v['touid'])->value('nickname');
            }
        }
    }
 

    /**
     * 消息添加
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
     * 消息编辑
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
     * 删除消息
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("消息删除成功！", '');
        }
        $this->error("消息删除失败，请稍候再试！");
    }

    /**
     * 消息禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("消息禁用成功！", '');
        }
        $this->error("消息禁用失败，请稍候再试！");
    }

    /**
     * 消息禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("消息启用成功！", '');
        }
        $this->error("消息启用失败，请稍候再试！");
    }

}
