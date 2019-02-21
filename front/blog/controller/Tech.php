<?php
namespace app\blog\controller;

use think\Db;

class Tech extends Base {
    public function index(){
        $tabList=Db::name('BlogTech')->where(['status'=>1,'pid'=>0])->order('sort asc')->select();

        foreach($tabList as &$v){
            if($v['pid']=='0'){
                $v['subcategory']=Db::name('BlogTech')->where(['status'=>1,'pid'=>$v['id']])->order('sort asc')->select();
            }else{
                $v['subcategory']=[];
            }
        }

        return $this->fetch('',[
            'tabList'=>$tabList,
        ]);
    }
}