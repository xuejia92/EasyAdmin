<?php
namespace app\cms\controller;
class SiteNode extends Basic {
    // 定义全局参数
    public $table = 'SiteNode';

    function initialize(){
        parent::_getNode();
        //得到节点内容
        $this->nodeInfo = M('SysNode')->where(array('id'=>$this->nid))->find();
        $this->assign('nodeInfo', $this->nodeInfo);
        //节点列表
        $list = M($this->table)->order('order_id desc')->select();
        $list = !empty($list) ? toLevel($list) : [];
        foreach ($list as &$vp){
            switch ($vp['tid']){
                case 0:
                    $vp['tid_name']='首页';
                    break;
                case 1:
                    $vp['tid_name']='文章';
                    break;
                case 2:
                    $vp['tid_name']='单页';
                    break;
                case 3:
                    $vp['tid_name']='产品';
                    break;
                default:
                    $vp['tid_name']=$vp['tid'];
                    break;
            }
        }
        $this->assign('list', $list);
        //栏目模型
        $type = M('SiteType')->where(array('is_status'=>1))->select();
        $this->assign('type', $type);
    }
    public function index(){
        $this->display();
    }
    // 新增
    public function insert(){
        $this->display('form');
    }
    public function add(){
        if(IS_AJAX){
            $Model_Data = M($this->table);
            //同级不可重名
            $Model_Data->where(array('pid'=>I('pid'),'flag'=>I('flag')))->find() && $this->error('同级节点已存在，请修改访问路径!');
            $p_node = $Model_Data->where(array('id'=>I('pid')))->find();
            if($Model_Data->create()){
                //组装路径
                if(is_null($p_node)){
                    $Model_Data->path = '/' . I('flag');
                }else{
                    $Model_Data->path = $p_node['path'] . '/' . I('flag');
                }
                $Model_Data->is_show = I('is_show') != 1 ? 0 : 1;
                $Model_Data->is_url = I('is_url') != 1 ? 0 : 1;
                $result = $Model_Data->add();
                if($result !== false){
                    if(I('tid') == '2'){
                        $page['nid'] = $result;
                        $page['title'] = I('title');
                        $page['content'] = I('title');
                        M("PageSingle") -> add($page);
                    }
                    $this->success('新增成功!',U('index').'?spm='.$this->spm);
                }else{
                    $this->error('新增失败!');
                }
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
            //同级不可重名
            $where['id'] = array('NEQ',I('id'));
            $where['pid'] = array('EQ',I('pid'));
            $where['flag'] = array('EQ',I('flag'));
            $Model_Data->where($where)->find() && $this->error('同级节点已存在，请修改访问路径!');
            //组装路径
            $p_node = $Model_Data->where(array('id'=>I('pid')))->find();
            //更新子节点路径
            $oldPath = $Model_Data->where(array('id'=>I('id')))->getField('path');
            $map['path'] = array('like',$oldPath.'/%');
            $cNodes = $Model_Data->where($map)->select();
            if($Model_Data->create()){
                if(is_null($p_node)){
                    $Model_Data->path = '/' . I('flag');
                }else{
                    $Model_Data->path = $p_node['path'] . '/' . I('flag');
                }
                $oldPath = strlen($oldPath);
                if(count($cNodes)){
                    foreach ($cNodes as $cNode) {
                        $newPath = $Model_Data->path.substr($cNode['path'],$oldPath);
                        $Model_Data->where(array('id'=>$cNode['id']))->setField('path',$newPath);
                    }
                }
                $Model_Data->is_show = I('is_show') != 1 ? 0 : 1;
                $Model_Data->is_url = I('is_url') != 1 ? 0 : 1;
                if($Model_Data->save() !== false){
                    if(I('tid') == '2'){
                        if(M('PageSingle') -> where(array('nid' => I("id"))) -> find() == false){
                            $page['nid'] = I("id");
                            $page['title'] = I('title');
                            $page['content'] = I('title');
                            M("PageSingle") -> add($page);
                        }
                    }else{
                        M("PageSingle") -> where(array('nid' => I("id"))) -> delete();
                    }
                    $this->success('保存成功!',U('index').'?spm='.$this->spm);
                }else{
                    $this->error('保存失败!');
                }
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
            $tid = M($this->table)->where(array('id'=>I('get.id')))->getField('tid');
            $tid == '2' && M("PageSingle")->where(array('nid'=>I('get.id')))->delete();
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
    // 显示隐藏
    public function show(){
        if(IS_AJAX){
            $new_status = I('value')?'0':'1';
            M($this->table)->where(array('id'=>I('id')))->setField('is_show',$new_status) !== false ? $this->success('修改成功!','',$new_status) : $this->error('修改失败!');
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
    //获取最新导航
    public function getNode(){
        if (IS_AJAX) {
            $list = M($this->table)->order('order_id desc,id asc')->select();
            $list = !empty($list) ? toLevel($list) : [];
            $data = '';
            foreach ($list as $key => $value) {
                $_a = $value['pid'] ? '├ ' : '';
                $data .= '<li><a data-menu-node="m-1-'.$value['id'].'" data-url="'.U('page/index').'">'.$value['delimiter'].$_a.$value['title'].'</a></li>';
            }
            $this->ajaxReturn($data);
        }else{
            echo "非法操作";
        }
    }
}
