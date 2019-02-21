<?php
namespace app\blog\controller;

use think\Db;

class Index extends Base {
    public function index(){
        $focuspic = Db::name('BlogSiteSlider')->where('type',0)->select();
        $todayTop = Db::name('BlogArticle')->where(['isfabu'=>1,"is_deleted"=>0])->limit(10)->select();
        foreach($todayTop as &$v){
            $v['catename'] = Db::name('BlogCategory')->where('id',$v['category'])->value('name');
            $v['comments'] = Db::name('BlogCommit')->where('articleid',$v['id'])->count();
        }

        return $this->fetch('',[
            'focuspic'=>$focuspic,
            'todaytop'=>$todayTop,
        ]);
    }
}

