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
 * 系统文章管理控制器
 * Class User
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:12
 */
class Article extends BasicAdmin
{

    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'BlogArticle';

    /**
     * 文章列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '博客文章列表';
        $category = Db::name('BlogCategory')->select();
        $this->assign('category', $category);

        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['title','isfabu','category'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        (isset($get['category']) && $get['category'] !== '') && $db->where('category', "{$get['category']}");
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode(' - ', $get['date']);
            $db->whereBetween('pub_time', [strtotime("{$start} 00:00:00"), strtotime("{$end} 23:59:59")]);
        }
        $db->order('pub_time','desc')->where(['is_deleted'=>0]);
        return parent::_list($db);
    }

    /**
     * 列表数据处理
     * @param array $data
     */
    protected function _index_data_filter(&$data)
    {
        foreach ($data as &$vo) {
            $vo['categoryname']=Db::name("BlogCategory")->where('id',$vo['category'])->value('name');
        }
    }


    /**
     * 文章添加
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
     * 文章编辑
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
    public function _form_filter(&$vo)
    {
        $arrData = [];
        foreach(Db::name('BlogArticleLabel')->select() as $vp){
            $arrData[]=$vp['label_name'];
        }
        $this->assign('category',Db::name('BlogCategory')->select());
        $vo['strTitle'] = $arrData;
        $vo['pub_time'] = time();
        if(isset($vo['id'])){
            $vo['tags_arr'] = Db::name('BlogArticleLabel')->where('article_id',$vo['id'])->column('label_name');
        }
    }

    protected function _form_result(&$result,$data){
        $strTitle = $data['tags'];
        if($strTitle){
            $db = Db::name("BlogArticleLabel");
            $arrTtitle = explode(',',$strTitle);
            $db->where(['article_id'=>$data['id']])->delete();
            foreach ($arrTtitle as $vp){
                $da = ['label_name'=>$vp,'article_id'=>$data['id']];
                $db->insert($da);
            }
        }
    }

    /**
     * 删除文章
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("文章删除成功！", '');
        }
        $this->error("文章删除失败，请稍候再试！");
    }

    /**
     * 文章退稿
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("文章退稿成功！", '');
        }
        $this->error("文章发布失败，请稍候再试！");
    }

    /**
     * 文章发布
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("文章发布成功！", '');
        }
        $this->error("文章发布失败，请稍候再试！");
    }

}
