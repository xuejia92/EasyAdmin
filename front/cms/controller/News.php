<?php
namespace app\cms\controller;

use think\Db;

class News extends Base
{
    public $title='首页';

    public function index(){
        $id = $this->request->get('id','');
        $title = Db::name("CmsSiteChannel")->where('id',$id)->value('title');
        $title = $title ?$title:$this->title;
        $res = Db::name("CmsPageArticle")->limit(7)->order('id desc')->select();
        if($id==''){
            $result = $res;
        }else{
            $result = Db::name("CmsPageArticle")->where(['nid'=>$id])->order('id desc')->limit(7)->select();
            if(!$result){
                $result = $res;
            }
        }
        foreach ($result as &$vp){
            $time_f = strtotime($vp['create_time']);
            $vp['year'] = date('Y',$time_f);
            $vp['month'] = date('m-d',$time_f);
        }
        return $this->fetch('',['title'=>$title,'result'=>$result]);
    }

    public function a(){
        $id = $this->request->get('id','');
        $result = Db::name("CmsPageArticle")->where(['id'=>$id])->find();
        Db::name("CmsPageArticle")->where(['id'=>$id])->setInc('count');
        $title = Db::name("CmsSiteChannel")->where('id',$result['nid'])->value('title');
        return $this->fetch('',['title'=>$title,'result'=>$result]);
    }
}