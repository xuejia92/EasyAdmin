<?php
namespace app\cms\controller;

use think\Db;

class Index extends Base
{
    public $title='首页';

    public function index(){
        $focus = Db::name("CmsSiteSlider")->where(['status' => '1','type'=>0])->order('sort asc')->select();
        $product = Db::name("CmsPageProduct")->where(['is_status' => '1','is_recommend'=>1])->order('id desc')->limit(8)->select();
        $news = Db::name("CmsPageArticle")->where(['status' => '1','is_recommend'=>1])->order('id desc')->limit(4)->select();
        foreach($news as &$vb){
            $vb['cname'] = Db::name('CmsSiteChannel')->where(['id'=>$vb['nid']])->value('title');
        }
        $link = Db::name("CmsSiteSlider")->where(['status' => '1','type'=>1])->order('sort asc')->limit(10)->select();
        return $this->fetch('',['title'=>$this->title,'focus'=>$focus,'product'=>$product,'news'=>$news,'link'=>$link]);
    }
}