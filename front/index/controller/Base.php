<?php
namespace app\index\controller;

use controller\BasicFront;
use think\Db;
use think\facade\Env;

class Base extends BasicFront
{
    public $title='EasyAdmin - 基于ThinkPHP5的极速后台开发框架';

    public function fetch($template = '', $vars = [], $config = []) {
        $appRoot = app('request')->root();
        $uriRoot = rtrim(preg_match('/\.php$/', $appRoot) ? dirname($appRoot) : $appRoot, '\\/');
        $this->view->engine([
            'tpl_replace_string'=>[
                '__STATIC__' => $uriRoot . "/static",
            ]
        ]);
        $vars = array_merge($vars,['nav'=>$this->getNav()]);
        return parent::fetch($template, $vars, $config);
    }

    public function getNav() {
        $_menus = Db::name('DusyNav')->where(['status' => '1','pid'=>0])->order('sort asc,id asc')->select();
        foreach ($_menus as $key => &$menu) {
            $menu['sub'] =  Db::name('DusyNav')->where(['status' => '1','pid'=>$menu['id']])->order('sort asc,id asc')->select();
        }
        return $_menus;
    }
}