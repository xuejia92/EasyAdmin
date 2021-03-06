<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use service\ExcelService;
use service\MailService;
use think\Db;

class Excel extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $title = 'excel文件导出';

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