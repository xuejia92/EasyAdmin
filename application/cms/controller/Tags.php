<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\cms\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

/**
 * 后台参数配置控制器
 * Class Config
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 18:05
 */
class Tags extends BasicAdmin
{

    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'CmsTags';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = 'Cms标签配置';

    /**
     * 显示系统常规配置
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function index(){
        $db = Db::name($this->table);
        if ($this->request->isGet()) {
            return $this->_list($db);
        }
        if ($this->request->isPost()) {
            $strTitle = $this->request->post('title');
            if($strTitle){
                $arrData = [];
                foreach($db->select() as $vp){
                    $arrData[]=$vp['title'];
                }
                $arrTtitle = explode(',',$strTitle);
                foreach ($arrData as $vp){
                    if(!in_array($vp,$arrTtitle)){
                        $db->where('title','=',$vp)->delete();
                    }
                }
                foreach ($arrTtitle as $vp){
                    DataService::save($db,['title'=>$vp],'title');
                }
                $this->success('标签配置成功！', '');
            }else{
                $this->error('标签不能为空！', '');
            }
        }
    }

    public function _index_data_other(&$data){
        $arrData = [];
        foreach($data['list'] as $vp){
            $arrData[]=$vp['title'];
        }
        $data['strTitle'] = implode(',',$arrData);
    }

}
