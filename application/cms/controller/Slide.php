<?php
namespace app\cms\controller;

class Slide extends Basic {
    // 定义全局参数
    public $table = 'SiteSlide';

    function initialize(){
        parent::_getNode();
        //得到节点内容
        $this->nodeInfo = M('SysNode')->where(array('id'=>$this->nid))->find();
        $this->assign('nodeInfo', $this->nodeInfo);
    }
    public function index(){
        $list = M($this->table)->select();
        $this->assign('list', $list);

        $this->display();
    }
    // 新增
    public function insert(){
        $this->display('form');
    }
    public function add(){
        if(IS_AJAX){
            $Model_Data = M($this->table);
            if($Model_Data->create()){
                $Model_Data->add() !== false ? $this->success('新增成功!',U('index').'?spm='.$this->spm) : $this->error('新增失败!');
            }else{
                $this->error($Model_Data->getError());
            }
        }else{
            echo "非法操作";
        }
    }
    // 编辑
    public function update(){
        $view = M($this->table)->where(array('id'=>I('get.id')))->find();
        $this->assign('view', $view);

        $this->display('form');
    }
    public function save(){
        if(IS_AJAX){
            $Model_Data = M($this->table);
            if($Model_Data->create()){
                $Model_Data->save() !== false ? $this->success('保存成功!',U('index').'?spm='.$this->spm) : $this->error('保存失败!');
            }else{
                $this->error($Model_Data->getError());
            }
        }else{
            echo "非法操作";
        }
    }
    // 删除
    public function delete(){
        if(IS_AJAX){
            $where['id'] = array('IN',I('get.id'));
            M($this->table)->where($where)->delete() !== false ? $this->success('删除成功!',U('index').'?spm='.$this->spm) : $this->error('删除失败!');
        }else{
            echo "非法操作";
        }
    }
    // 修改状态
    public function status(){
        if(IS_AJAX){
            $new_status = I('value')?'0':'1';
            M($this->table)->where(array('id'=>I('id')))->setField('is_status',$new_status) !== false ? $this->success('修改成功!','',$new_status) : $this->error('修改失败!');
        }else{
            echo "非法操作";
        }
    }
    //修改排序
    public function sort(){
        if(IS_AJAX){
            $Model_Data = M($this->table);
            $id = I('idarr');
			$order_id = I('order_id');
			foreach ($id as $key=>$value) {
				$Model_Data->where(array('id'=>$id[$key]))->setField('order_id',$order_id[$key]);
			}
            $this->success('排序成功!',U('index').'?spm='.$this->spm);
        }else{
            echo '非法请求';
        }
    }
}
