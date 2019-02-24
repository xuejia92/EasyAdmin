<?php
namespace addons\test\controller;

use think\Addons;

class Index extends Addons
{
    public function link()
    {
        return $this->fetch();
    }

    public function install() {
        // TODO: Implement install() method.
    }

    public function uninstall() {
        // TODO: Implement uninstall() method.
    }
}