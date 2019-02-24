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
class Crontab extends BasicAdmin
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
        $this->title = '定时任务管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['title'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['status']) && $get['status'] !== '') {
            $db->where('status', $get['status']);
        }
        return parent::_list($db->order('id desc')->where(['is_deleted' => '0']));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vo) {

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
        if ($this->request->isPost()) {
            if(isset($data['begin_time'])){
                $data['begin_time']=strtotime($data['begin_time']);
            }else{
                $this->error('请输入开始时间');
            }
            if(isset($data['end_time'])){
                $data['end_time']=strtotime($data['end_time']);
            }else{
                $this->error('请输入结束时间');
            }
            if($data['begin_time']>$data['end_time']){
                $this->error('结束时间不能早于开始时间');
            }
        }else{
            if(isset($data['begin_time'])) {
                $data['begin_time'] = date('Y-m-d H:i:s', $data['begin_time']);
            }
            if(isset($data['end_time'])) {
                $data['end_time'] = date('Y-m-d H:i:s', $data['end_time']);
            }

        }
    }

    /**
     * 删除用户
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        $id = $this->request->post('id');
        $res = Db::name($this->table)->where('id',$id)->value('status');
        if($res==2){
            $this->error("任务正在执行,删除失败，请稍候再试！");
        }
        if (DataService::update($this->table)) {
            $this->success("删除成功！", '');
        }
        $this->error("删除失败，请稍候再试！");
    }
}
