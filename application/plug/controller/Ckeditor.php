<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use service\MailService;

class Ckeditor extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $title = 'ckeditor编辑器';

    /**
     * 显示短信常规配置
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        if ($this->request->isGet()) {
            return $this->fetch('', ['title' => $this->title]);
        }
    }

}