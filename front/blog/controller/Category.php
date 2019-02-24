<?php
namespace app\blog\controller;

use think\Db;

class Category extends Base {
    public function index(){
        $cid = $this->request->get('id','');
        if($cid=='' || !is_numeric($cid)){
            $this->redirect('/blog');
        }
        $todayTop=Db::name('BlogArticle')->where(['isfabu'=>1,'category'=>$cid])->order('pub_time desc')->limit(12)->select();

        foreach($todayTop as &$v){
            $v['catename']=Db::name('BlogCategory')->where(['id'=>$v['category']])->value('name');
            $v['comments']=Db::name('BlogCommit')->where(['articleid'=>$v['id'],'isshow'=>1])->count();
            $v['peraddtime']=formatTime($v['pub_time']);
        }
        $catename=Db::name('BlogCategory')->where(['id'=>$cid])->value('name');

        return $this->fetch('',[
            'catename'=>$catename,
            'todayTop'=>$todayTop,
            'isLogin'=>true
        ]);
    }
}