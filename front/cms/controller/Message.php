<?php
namespace app\cms\controller;

use service\DataService;
use think\Db;

class Message extends Base
{
    public $title='客户留言';

    public function index(){
        if($this->request->isGet()){
            return $this->fetch('',['title'=>$this->title]);
        }
        if($this->request->isPost()){
            $data['name']=$this->request->post('name','');
            $data['phone']=$this->request->post('phone','');
            $data['mail']=$this->request->post('mail','');
            $data['content']=$this->request->post('content','');
            if(trim($data['name'])=='' || trim($data['phone'])=='' ||
                trim($data['mail'])=='' || trim($data['content'])==''){
                return $this->error('输入内容不能为空');
            }
            $data['create_time'] = date('Y-m-d H:i:s');
            $res = DataService::save(Db::name('CmsMessage'),$data);
            if($res){
                return $this->success('留言成功！');
            }else{
                return $this->error('留言失败，请稍后再试！');
            }
        }

    }
}