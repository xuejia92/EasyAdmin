<?php
namespace app\cms\controller;

use controller\BasicAdmin;

class Basic extends BasicAdmin {
    function initialize(){
        session('admin_id', session('user')['id']);
        //站点信息
        $this->assign('adminInfo',session('user'));
    }
    public function _getNode(){
        //获取spm
        $this->spm = I('get.spm');
        $this->assign('spm', $this->spm);
        //获取节点
        $spm_arr = explode('-',$this->spm);
        $this->nid = end($spm_arr);
        $this->assign('nid', $this->nid);
    }
}
