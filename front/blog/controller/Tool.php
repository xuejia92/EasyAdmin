<?php
namespace app\blog\controller;

use think\Db;

class Tool extends Base {
    public function websocket(){
        return $this->fetch('tool/websocket',[
        ]);
    }
}