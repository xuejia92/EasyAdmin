<?php
namespace app\cms\controller;

use think\Db;

class Single extends Base
{
    public $title='首页';

    public function index(){
        $id = $this->request->get('id','');
        $res = Db::name("CmsPageSingle")->find();
        if($id==''){
            $result = $res;
        }else{
            $result = Db::name("CmsPageSingle")->where(['nid'=>$id])->find();
            if(!$result){
                $result = $res;
            }
        }
        return $this->fetch('',['title'=>$result['title'],'result'=>$result]);
    }
}