<?php
namespace app\cms\controller;

use think\Db;

class Product extends Base
{
    public $title='首页';

    public function index(){
        $id = $this->request->get('id','');
        $title = Db::name("CmsSiteChannel")->where('id',$id)->value('title');
        $title = $title ?$title:$this->title;
        $res = Db::name("CmsPageProduct")->limit(8)->order('id desc')->select();
        if($id==''){
            $result = $res;
        }else{
            $result = Db::name("CmsPageProduct")->where(['nid'=>$id])->order('id desc')->limit(8)->select();
            if(!$result){
                $result = $res;
            }
        }
        return $this->fetch('',['title'=>$title,'result'=>$result]);
    }

    public function a(){
        $id = $this->request->get('id','');
        $result = Db::name("CmsPageProduct")->where(['id'=>$id])->find();
        Db::name("CmsPageProduct")->where(['id'=>$id])->setInc('count');
        $title = Db::name("CmsSiteChannel")->where('id',$result['nid'])->value('title');
        return $this->fetch('',['title'=>$title,'result'=>$result]);
    }
}