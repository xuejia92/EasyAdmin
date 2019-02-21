<?php
namespace app\blog\controller;
use controller\BasicFront;
use think\Controller;
use think\Db;
use think\facade\Env;

class Base extends BasicFront{
    public function _initialize(){

    }

    protected function fetch($template = '', $vars = [], $config = []) {
        $tabList = Db::name('BlogNav')->where('pid',0)->select();
        foreach ($tabList as &$v){
            $v['subid'] = Db::name('BlogNav')->where('pid',$v['id'])->select();
        }
        $notifylist = Db::name('BlogNotify')->select();
        $labellist = Db::name('BlogArticleLabel')->orderRand()->limit(30)->select();
        $maxview = Db::name('BlogArticle')->where(['isfabu'=>1,"is_deleted"=>0])->limit(6)->order('view_count','desc')->select();
        $newcommits = Db::name('BlogCommit')->order('addtime','desc')->limit(6)->select();
        $readers = Db::name('DusyUser')->order('register_time','desc')->limit(15)->select();

        foreach($newcommits as &$v){
            $v['user'] = Db::name('DusyUser')->where('id',$v['uid'])->select();
            $v['title'] = Db::name('BlogArticle')->where('id',$v['articleid'])->value('title');
        }
        $isLogin= session('account')!=false?1:'';
        $vars = array_merge($vars,[
            'tablist'=>$tabList,
            'notifylist'=>$notifylist,
            'labellist'=>$labellist,
            'newcommits'=>$newcommits,
            'maxview'=>$maxview,
            'readers'=>$readers,
            'isLogin'=>$isLogin,
        ]);

        $appRoot = app('request')->root();
        $uriRoot = rtrim(preg_match('/\.php$/', $appRoot) ? dirname($appRoot) : $appRoot, '\\/');
        $this->view->engine([
            'tpl_replace_string'=>[
                '__STATIC__' => $uriRoot . "/static",
            ]
        ]);
        return parent::fetch($template, $vars, $config);
    }
}