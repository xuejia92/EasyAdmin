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

namespace app\code\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 系统管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Field extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'AutoprogramField';

    public function index(){
        $request = app('request');
        $id = $request->get('id','');
        if(!$id || !is_numeric($id)){
            $this->error('非法访问');
        }
        list($get, $db) = [$this->request->get(), Db::name('AutoprogramField')];
        if(!isset($get['action'])){
            $get['action']='list';
        }
        $db->where('type', $get['action']);
        $res = Db::name('AutoprogramChildList')->where('id',$id)->find();
        $model = Db::name('AutoprogramCategory')->where('id',$res['model'])->find();
        $field = Db::name('AutoprogramField')->where(['pid'=>$res['id']])->select();
        if($field){
            return parent::_list($db->where(['pid'=>$res['id']]));
        }

        $dbName = $res['database_name'];
        $isTable=db()->query('SHOW TABLES LIKE '."'".$dbName."'");
        if(!$isTable){
            $this->error('数据表不存在，请建表后操作');
        }
        $fields = Db::name($dbName)->getTableFields();
        foreach ($fields as $vp){
            $data['pid']=$id;
            $data['type']='list';
            $data['field']=$vp;
            Db::name('AutoprogramField')->insert($data);
            $data['type']='form';
            Db::name('AutoprogramField')->insert($data);
        }
        return parent::_list($db->where(['pid'=>$res['id']]));
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
     * 添加
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
     * 编辑
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
            
        } else {
            $this->assign('pid',$this->request->get('id',0));
        }
    }

    /**
     * 删除
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


    /**
     * 禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    { 
        if (DataService::update($this->table)) {
            $this->success("禁用成功！", '');
        }
        $this->error("禁用失败，请稍候再试！");
    }

    /**
     * 禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("启用成功！", '');
        }
        $this->error("启用失败，请稍候再试！");
    }

}
