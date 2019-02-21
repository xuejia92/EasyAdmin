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

namespace app\user\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 系统用户管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Money extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'DusyTrade';

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
        $this->title = '交易流水记录';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['id'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }

        if (isset($get['otime']) && $get['otime'] !== '') {
            list($start, $end) = explode(' - ', $get['otime']);
            $db->whereBetween('otime', [strtotime("{$start} 00:00:00"),
                strtotime("{$end} 23:59:59")]);
        }
        return parent::_list($db->order('otime','desc'));
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vp) {
            $vp['remark']=$this->getTraderemark($vp['remark']);
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
            if (isset($data['authorize']) && is_array($data['authorize'])) {
                $data['authorize'] = join(',', $data['authorize']);
            } else {
                $data['authorize'] = '';
            }
            if (isset($data['id'])) {
                unset($data['username']);
            } elseif (Db::name($this->table)->where(['username' => $data['username']])->count() > 0) {
                $this->error('用户账号已经存在，请使用其它账号！');
            }
            if(isset($data['password']) && !empty($data['password'])){
                $data['password']=md5($data['password']);
            }
        } else {
            $data['authorize'] = explode(',', isset($data['authorize']) ? $data['authorize'] : '');
            $this->assign('authorizes', Db::name('SystemAuth')->where(['status' => '1'])->select());
        }
    }

    /**
     * 删除用户
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (in_array('10000', explode(',', $this->request->post('id')))) {
            $this->error('系统超级账号禁止删除！');
        }
        if (DataService::update($this->table)) {
            $this->success("用户删除成功！", '');
        }
        $this->error("用户删除失败，请稍候再试！");
    }

    /**
     * 用户禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (in_array('10000', explode(',', $this->request->post('id')))) {
            $this->error('系统超级账号禁止操作！');
        }
        if (DataService::update($this->table)) {
            $this->success("用户禁用成功！", '');
        }
        $this->error("用户禁用失败，请稍候再试！");
    }

    /**
     * 用户禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("用户启用成功！", '');
        }
        $this->error("用户启用失败，请稍候再试！");
    }

}
