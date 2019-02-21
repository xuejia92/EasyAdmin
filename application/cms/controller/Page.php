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
class Page extends BasicAdmin
{

    /**
     * 绑定操作模型
     * @var string
     */
    public $table = 'CmsPage';

    function initialize()
    {
        $get = $this->request->get();
        $this->table  = isset($get['type'])?$this->table.ucfirst($get['type']):$this->table.'Article';
    }

    /**
     * 页面列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $db  = Db::name($this->table);
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $res = DataService::save($db,$data,'id');
            if($res){
                $this->success('保存成功！', '');
            }else{
                $this->success('保存失败！', '');
            }
        }
        $this->title = 'cms页面管理';
        $get = $this->request->get();
        foreach (['title'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['create_time']) && $get['create_time'] !== '') {
            list($start, $end) = explode(' - ', $get['create_time']);
            $db->whereBetween('create_time', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }
        if(isset($get['nid']) && $get['nid']!=''){
            $channel = Db::name('CmsSiteChannel')->where('pid',$get['nid'])->field('id')->select();
            if(!empty($channel)){
                $str = [$get['nid']];
                foreach ($channel as $v){
                    $str[] = $v['id'];
                }
                $str = implode(',',$str);
                $db->where('nid','in',$str);
            }else{
                $db->where('nid',$get['nid']);
            }
        }
        $db = $db->order('create_time desc,id desc');
        return parent::_list($db);
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $channel = Db::name('CmsSiteChannel')->where('id',$vo['nid'])->find();
            $vo['channel_name']=$channel['title'];
            $vo['tname']=Db::name('CmsSiteType')->where('id',$channel['tid'])->value('title');
        }
        $data = ToolsService::arr2table($data);
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_other(&$result)
    {
        $result['channel_list'] = ToolsService::arr2table(Db::name('CmsSiteChannel')->select());
        foreach($result['channel_list'] as &$v){
            $v['tflag'] = Db::name('CmsSiteType')->where('id',$v['tid'])->value('flag');
        }
        $get = $this->request->get();
        $result['type'] =  isset($get['type'])?$get['type']:'article';
        switch ($result['type']){
            case 'single':
                $db  = Db::name($this->table);
                if(isset($get['nid']) && $get['nid']!=''){
                    $data = $db->where('nid',$get['nid'])->find();
                    $result['single_data'] = $data;
                }
                break;
            case 'product':
                break;
            case 'custom':
                break;
        }
     }

    /**
     * 添加页面
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function add()
    {
        $get = $this->request->get();
        $result['type'] =  isset($get['type'])?$get['type']:'article';
        $result['nid'] =  isset($get['nid'])?$get['nid']:0;
        switch ($result['type']){
            case 'article':
                return $this->_form($this->table, 'article_form','',[],['nid'=>$result['nid'],'create_time'=>date('Y-m-d H:i:s')]);
                break;
            case 'product':
                return $this->_form($this->table, 'product_form','',[],['nid'=>$result['nid'],'create_time'=>date('Y-m-d H:i:s')]);
                break;
            case 'custom':
                break;
        }
    }

    /**
     * 编辑页面
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function edit()
    {
        $get = $this->request->get();
        $result['type'] =  isset($get['type'])?$get['type']:'article';
        switch ($result['type']){
            case 'article':
                return $this->_form($this->table, 'article_form');
                break;
            case 'product':
                return $this->_form($this->table, 'product_form');
                break;
            case 'custom':
                break;
        }
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
        $arrData = [];
        foreach(Db::name('CmsTags')->select() as $vp){
            $arrData[]=$vp['title'];
        }
        $vo['strTitle'] = $arrData;
        $vo['tags_arr'] = isset($vo['tags']) && $vo['tags']!=''?explode(',',$vo['tags']):[];
    }

    protected function _form_result(&$result,$data){
        $strTitle = $data['tags'];
        if($strTitle){
            $db = Db::name("CmsTags");
            $arrTtitle = explode(',',$strTitle);
            foreach ($arrTtitle as $vp){
                DataService::save($db,['title'=>$vp],'title');
            }
        }
    }

    /**
     * 删除页面
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("页面删除成功!", '');
        }
        $this->error("页面删除失败, 请稍候再试!");
    }

    /**
     * 页面禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("页面禁用成功!", '');
        }
        $this->error("页面禁用失败, 请稍候再试!");
    }

    /**
     * 页面禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("页面启用成功!", '');
        }
        $this->error("页面启用失败, 请稍候再试!");
    }

}
