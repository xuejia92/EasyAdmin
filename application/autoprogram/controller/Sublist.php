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

namespace app\autoprogram\controller;

use app\autoprogram\service\AddFileService;
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
class Sublist extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'AutoprogramChildList';

    /**
     * 列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '子项目管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['name'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode(' - ', $get['date']);
            $db->whereBetween('create_at', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }
        return parent::_list($db->where(['is_deleted' => '0','pid'=>$get['id']]));
    }

    public function fieldset(){
        $request = app('request');
        $id = $request->get('id','');
        if(!$id || !is_numeric($id)){
            $this->error('非法访问');
        }
        $res = Db::name('AutoprogramChildList')->where('id',$id)->find();
        $model = Db::name('AutoprogramCategory')->where('id',$res['model'])->find();
        $field = Db::name('AutoprogramField')->where(['pid'=>$res['id']])->find();
        if($field){
            return parent::_list(Db::name('AutoprogramField')->where(['pid'=>$res['id']]));
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
        return parent::_list(Db::name('AutoprogramField')->where(['pid'=>$res['id']]));
    }

    public function addFile(){
        $request = app('request');
        $id = $request->get('id','');
        if(!$id || !is_numeric($id)){
            $this->error('非法访问');
        }
        $res = Db::name('AutoprogramChildList')->where('id',$id)->find();
        $project = Db::name('AutoprogramList')->where('id',$res['pid'])->find();
        $model = Db::name('AutoprogramCategory')->where('id',$res['model'])->find();
        $conName = $project['dir_name'];
        $modelId = $res['model'];
        $template_path = env('app_path').$model['template_path'];
        if($conName=='' || $modelId=='' || !is_numeric($modelId)){
            $this->error('数据出错，请检查');
        }
        if(!file_exists(env('app_path').$conName)){
            mk_dirs(env('app_path').$conName.'/controller');
            mk_dirs(env('app_path').$conName.'/view');
        }else{
            $this->error('目录已存在，请删除后重新生成');
        }
        $controller_file = file_get_contents($template_path.'Index.php');
        $index_file = file_get_contents($template_path.'index.html');
        $form_file = file_get_contents($template_path.'form.html');

        $controller_file = AddFileService::reachControllerTemplate($controller_file);
        $index_file = AddFileService::reachViewIndexTemplate($index_file);
        $form_file = AddFileService::reachViewFormTemplate($form_file);

        file_put_contents(env('app_path').$conName.'/controller/'.$model['file_name'].'.php',$controller_file);
        file_put_contents(env('app_path').$conName.'/view/'.'index.html',$index_file);
        file_put_contents(env('app_path').$conName.'/view/form.html',$form_file);
        $this->success('文件已生成');
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vo) {
             $vo['catename'] = Db::name('AutoprogramCategory')->where('id',$vo['model'])->value('name');
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
            $category = Db::name("AutoprogramCategory")->where('is_deleted',0)->select();
            $this->assign('category',$category);
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
