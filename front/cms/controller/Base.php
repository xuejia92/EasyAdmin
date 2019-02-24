<?php
namespace app\cms\controller;

use controller\BasicFront;
use think\Db;
use think\facade\Env;

class Base extends BasicFront
{
    public $title='cms系统';

    public function getNav(){
        $_menus = Db::name('CmsSiteNav')->where(['status' => '1','pid'=>0])->order('sort asc,id asc')->select();
        foreach ($_menus as $key => &$menu) {
            $menu['sub'] =  Db::name('CmsSiteNav')->where(['status' => '1','pid'=>$menu['id']])->order('sort asc,id asc')->select();
        }
        return $_menus;
    }

    public function fetch($template = '', $vars = [], $config = []) {
        $vars = array_merge($vars,['nav'=>$this->getNav()]);

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