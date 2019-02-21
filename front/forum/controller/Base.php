<?php
namespace app\forum\controller;

use controller\BasicFront;
use think\Db;

class Base extends BasicFront
{
    public $title='论坛系统';
    public $site_config=[];

    protected function initialize() {
        parent::initialize();
        \think\facade\Config::set('dispatch_error_tmpl','forum/index_tips');
        \think\facade\Config::set('dispatch_success_tmpl','forum/index_tips');

        $conf = Db::name('SystemConfig')->whereLike('name','forum_%')->select();
        $site_conf=[];
        foreach ($conf as $v){
            $site_conf[str_replace('forum_','',$v['name'])]=$v['value'];
        }
        $this->site_config=$site_conf;
        $this->assign('site_config' , $site_conf);
        $this->assign('nav' , Db::name('ForumNav')->select());
        $show['show'] = 1;
        $status['status'] = 1;
        $open['open'] = 1;
        $choice['choice'] = 1;
        $tptm =  Db::name('ForumForum')->alias('f')
            ->join('dusy_user u', 'f.uid=u.id')
            ->field('u.*,count(f.id) as forumnum,u.avator as userhead,u.nickname as username')
            ->group('uid')->order('forumnum desc')->limit(12)
            ->select();
        $this->assign('tptm', $tptm);
        $tpte = Db::name('ForumForum')->where($open)->where($choice)->order('id desc')->limit(9)->select();
        $this->assign('tpte', $tpte);
        $tptf = Db::name('ForumForum')->where($open)->order('view desc')->limit(9)->select();
        $this->assign('tptf', $tptf);
        $tpto = Db::name('ForumForumcate')->where($show)->where('is_deleted',0)->order('sort desc')->limit(12)->select();
        $this->assign('tpto', $tpto);
    }

    public function fetch($template = '', $vars = [], $config = []) {
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