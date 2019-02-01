<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\admin\controller;

use controller\BasicAdmin;
use Exception;
use mysqli;
use ReflectionClass;
use service\FileService;
use service\ToolsService;
use service\ZipService;
use think\Db;
use service\DataService;
use ZipArchive;

class Plug extends BasicAdmin {
    /**
     * 指定当前数据表
     * @var string
     */
    public $table = 'SystemPlugManage';

    /**
     * 插件列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function index()
    {
        $this->title = '系统插件管理';
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['title','model'] as $key) {
            (isset($get[$key]) && $get[$key] !== '') && $db->whereLike($key, "%{$get[$key]}%");
        }
        if (isset($get['create_time']) && $get['create_time'] !== '') {
            list($start, $end) = explode(' - ', $get['create_time']);
            $db->whereBetween('create_time', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }

        //生成菜单文件
        $menu = Db::name('SystemMenu')->where('pid',0)->select();
        foreach($menu as &$vo){
            $vo['sub']=Db::name('SystemMenu')->where('pid',$vo['id'])->select();
            $vo['tag'] = '';
            foreach ($vo['sub'] as &$vp){
                $vp['sub']=Db::name('SystemMenu')->where('pid',$vp['id'])->select();
                foreach ($vp['sub'] as $vn){
                    $url = explode('/',$vn['url']);
                    if(isset($url[0])){
                        if(file_exists(env('app_path').$url[0]) && $vo['tag']==''){
                            $vo['tag'] = $url[0];
                        }

                    }
                }
            }
        }

        foreach($menu as &$vo){
            if($vo['tag']==''){continue;}
            $filename = env('app_path').$vo['tag'].'/menu.php';
            unset($vo['tag']);
            $data = '<?php return '.var_export($vo,true).';';
            if(file_exists($filename)){
                unlink($filename);
            }
            file_put_contents($filename,$data);
        }

        try{
            $res = file_get_contents(config('addons.remote_plug').'plug.php');
            $res = json_decode($res,true);
            if(!is_array($res)){
                $this->error('远程插件数据错误');
            }else{
                foreach ($res as $k=>$vo){
                    if(!is_array($vo)){
                        $this->error('远程插件数据错误');
                    }
                    if(!$bn=Db::name($this->table)->where(['name'=>$vo['name']])->find()){
                        Db::name($this->table)->insert($vo);
                    }else{
                        switch(version_compare($vo['version'],$bn['version'])){
                            case 0:
                                $vo['version_set']=0;
                                break;
                            case 1:
                                $vo['version_set']=1;
                                break;
                            case -1:
                                $vo['version_set']=-1;
                                break;
                        }
                        $vo['version_remote'] = $vo['version'];
                        unset($vo['status']);
                        unset($vo['version']);
                        Db::name($this->table)->where(['id'=>$bn['id']])->update($vo);
                    }
                }
            }
        }catch (Exception  $e){
            return parent::_list($db);
        }
        return parent::_list($db);
    }

    public function _index_data_filter(&$data){
        foreach ($data as &$v){
            $v['model_name'] = $v['model']==1?'单应用':'完整应用';
            $v['price'] = $v['price'].'元';
            $name  = ucfirst(strtolower($v['name']));
            if(class_exists('\app\plug\controller\\'.$name)){
                $v['name_exist'] = 1;
                $controller = '\app\plug\controller\\'.$name;
                if(method_exists(new $controller,'test')){
                    $v['method_exist'] = 1;
                }else{
                    $v['method_exist'] = 0;
                }
            }else{
                $v['name_exist'] = 0;
                $v['method_exist'] = 0;
            }
            if(file_exists(env('app_path').$v['name'])){
                $v['model_exist']=1;
            }else{
                $v['model_exist']=0;
            }

        }
    }


    /**
     * 插件添加
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function add()
    {
        return $this->_form($this->table, 'form');
    }

    /**
     * 插件编辑
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\Exception
     */
    public function edit()
    {
        return $this->_form($this->table, 'form');
    }



    /**
     * 表单数据默认处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _form_filter(&$data)
    {
        if ($this->request->isPost()) {
            $data['create_time']=date('Y-m-d H:i:s');
            if (!isset($data['id']) && Db::name($this->table)->where(['title' => $data['title']])->whereOr(['name'=>$data['name']])->count() > 0) {
                $this->error('插件号或标识已经存在，请使用其它！');
            }
        } else {

        }
    }

    public function install(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(class_exists('\app\plug\controller\\'.$name) || trim($name)==''){
            $this->error('该插件已经存在或标识错误');
        }
        $savefileControllerDir = env('root_path').'application/plug/controller/';
        $savefileViewDir = env('root_path').'application/plug/view/';

        $downloadFile = config('addons.remote_plug_url').$name.'.zip';
        $res = \service\FileService::download($downloadFile,true);
        if(count($res)<2){
            $this->error('插件不存在,请确认插件标识');
        }
        $file = $res['file'];
        $zip_file = (new ZipService)->unzip($file,$savefileControllerDir);
        if($zip_file){
            $r1=copy($savefileControllerDir.$name.'/'.ucfirst($name).'.php',$savefileControllerDir.ucfirst($name).'.php');
            $r2=rename($savefileControllerDir.$name.'/'.$name,$savefileViewDir.$name);
            if(!$r1 || !$r2){
                $this->error('安装失败，请卸载后重装！');
            }
            rm_dirs($savefileControllerDir.$name);
            $this->success('安装成功！','');
        }else{
            rm_dirs($savefileControllerDir.$name);
            $this->error('插件解压缩文件失败！');
        }
        $this->error('插件解压缩文件失败！');
    }

    public function uninstall(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            $this->error('该插件标识错误');
        }
        $id = Db::name($this->table)->where('name',$name)->value('id');
        Db::name($this->table)->where('id',$id)->update(['status'=>0]);
        $savefileControllerDir = env('root_path').'application/plug/controller/'.ucfirst($name).'.php';
        $savefileViewDir = env('root_path').'application/plug/view/'.$name;
        unlink($savefileControllerDir);
        rm_dirs($savefileViewDir);
        $this->success('卸载成功！','');
    }

    public function packon(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('该插件标识错误') ;</script>";die;
            $this->error('该插件标识错误');
        }

        if(!class_exists('\app\plug\controller\\'.ucfirst($name))){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('插件未开发') ;</script>";die;
            $this->error("插件未开发！");
        }
        $savefileControllerDir = env('root_path').'application/plug/controller/';
        $savefileViewDir = env('root_path').'application/plug/view/'.$name;

        mk_dirs($savefileControllerDir.$name);
        mk_dirs($savefileControllerDir.$name.'/'.$name);
        copy($savefileControllerDir.ucfirst($name).'.php',$savefileControllerDir.$name.'/'.ucfirst($name).'.php');
        copydir($savefileViewDir,$savefileControllerDir.$name.'/'.$name);

        mk_dirs(env('root_path').'static/');

        $zip_file = (new ZipService)->zip(env('root_path').'static/'.$name.'.zip',$savefileControllerDir.$name);
        if($zip_file){
            rm_dirs($savefileControllerDir.$name);
            ob_end_clean();
            $filename = env('root_path').'static/'.$name.'.zip';

            header('Content-Type: application/zip;charset=utf8');
            header('Content-disposition: attachment; filename=' . $name. '.zip');
            header('Content-Length: ' . filesize($filename));
            readfile($filename);
            unlink($filename);
//            $this->success('打包成功！','');
        }else{
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('打包失败!') ;</script>";die;
            $this->error('打包失败！','');
        }
    }

    public function upgrade(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            $this->error('该插件标识错误');
        }
        $savefileControllerDir = env('root_path').'application/plug/controller/'.ucfirst($name).'.php';
        $savefileViewDir = env('root_path').'application/plug/view/'.$name;
        unlink($savefileControllerDir);
        rm_dirs($savefileViewDir);
        //安装
        if(class_exists('\app\plug\controller\\'.$name) || trim($name)==''){
            $this->error('该插件已经存在或标识错误');
        }
        $savefileControllerDir = env('root_path').'application/plug/controller/';
        $savefileViewDir = env('root_path').'application/plug/view/';

        $downloadFile = config('addons.remote_plug_url').$name.'.zip';
        $res = \service\FileService::download($downloadFile,true);
        if(count($res)<2){
            $this->error('插件不存在,请确认插件标识');
        }
        $file = $res['file'];
        $zip_file = (new ZipService)->unzip($file,$savefileControllerDir);
        if($zip_file){
            $r1=copy($savefileControllerDir.$name.'/'.ucfirst($name).'.php',$savefileControllerDir.ucfirst($name).'.php');
            $r2=rename($savefileControllerDir.$name.'/'.$name,$savefileViewDir.$name);
            if(!$r1 || !$r2){
                $this->error('升级失败，请卸载后重装！');
            }
            rm_dirs($savefileControllerDir.$name);
            $getData = Db::name($this->table)->where('name',$name)->find();
            Db::name($this->table)->where('id',$getData['id'])->update(['version'=>$getData['version_remote']]);
            $this->success('升级成功！','');
        }else{
            rm_dirs($savefileControllerDir.$name);
            $this->error('插件解压缩文件失败！');
        }
        $this->error('插件解压缩文件失败！');
    }

    public function upgradeModule(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            $this->error('该插件标识错误');
        }
        $plug = Db::name($this->table)->where(['name'=>$name])->find();
        $name_home =$plug['name_home'];
        $savefileControllerDir = env('app_path').$name;
        $savefileContDir = env('app_path').'home/controller/'.$name_home;
        $savefileViewDir = env('app_path').'home/view/'.$name_home;

        $menu_file = $savefileControllerDir.'/menu.php';
        if(file_exists($menu_file)){
            $menu = include($menu_file);
            Db::name('SystemMenu')->where('id',$menu['id'])->delete();
            foreach ($menu['sub'] as &$vp){
                Db::name('SystemMenu')->where('id',$vp['id'])->delete();
                foreach ($vp['sub'] as $vn){
                    Db::name('SystemMenu')->where('id',$vn['id'])->delete();
                }
            }
        }

        rm_dirs($savefileControllerDir);
        rm_dirs($savefileContDir);
        rm_dirs($savefileViewDir);

        //安装
        if(file_exists(env('app_path').$name) || trim($name)==''){
            $this->error('该插件已经存在或标识错误');
        }

        $downloadFile = config('addons.remote_plug_url').$name.'.zip';
        $res = \service\FileService::download($downloadFile,true);
        if(count($res)<2){
            $this->error('插件不存在,请确认插件标识');
        }
        $plug = Db::name($this->table)->where(['name'=>$name])->find();
        $name_home =$plug['name_home'];
        $file = $res['file'];
        $savefileControllerDir = env('root_path').'static/';
        $savefileViewDir = env('root_path').'application/';

        $zip_file = (new ZipService)->unzip($file,$savefileControllerDir);
        if($zip_file){
            $r1=copydir($savefileControllerDir.$name.'/'.$name,$savefileViewDir.$name);

            if(file_exists($savefileControllerDir.$name.'/home/controller/'.$name_home) &&
                file_exists($savefileControllerDir.$name.'/home/view/'.$name_home)){
                $r2=copydir($savefileControllerDir.$name.'/home/controller/'.$name_home,$savefileViewDir.'home/controller/'.$name_home);
                $r3=copydir($savefileControllerDir.$name.'/home/view/'.$name_home,$savefileViewDir.'home/view/'.$name_home);
            }
            $sql = $savefileControllerDir.$name.'/'.$name.'/install.sql';
            $_sql = file_get_contents($sql);

            $_arr = explode(';', $_sql);
            $_mysqli = new mysqli(config('database.hostname'),config('database.username'),
                config('database.password'),config('database.database'));
            if (mysqli_connect_errno()) {
                exit('连接数据库出错');
            }
            foreach ($_arr as $_value) {
                $_mysqli->query($_value.';');
            }
            $_mysqli->close();
            $_mysqli = null;

            $menu_file = $savefileControllerDir.$name.'/'.$name.'/menu.php';
            if(file_exists($menu_file)){
                $menu = include($menu_file);
                $menu_de = include($menu_file);
                unset($menu['id']);
                unset($menu['pid']);
                unset($menu['sub']);
                $menu['pid']=0;
                $id = Db::name('SystemMenu')->insertGetId($menu);
                foreach ($menu_de['sub'] as $vp){
                    $menu_sec = $vp;
                    unset($vp['id']);
                    unset($vp['pid']);
                    unset($vp['sub']);
                    $vp['pid'] = $id;
                    $secid = Db::name('SystemMenu')->insertGetId($vp);
                    foreach ($menu_sec['sub'] as $vn){
                        unset($vn['id']);
                        unset($vn['pid']);
                        $vn['pid']=$secid;
                        Db::name('SystemMenu')->insert($vn);
                    }
                }
            }else{
                $getData = Db::name($this->table)->where('name',$name)->find();
                Db::name($this->table)->where('id',$getData['id'])->update(['version'=>$getData['version_remote']]);
                rm_dirs($savefileControllerDir.$name);
                $this->success('升级完成，缺失菜单文件需自己添加！','');
            }
            $getData = Db::name($this->table)->where('name',$name)->find();
            Db::name($this->table)->where('id',$getData['id'])->update(['version'=>$getData['version_remote']]);
            rm_dirs($savefileControllerDir.$name);
            $this->success('升级成功！','');
        }else{
            rm_dirs($savefileControllerDir.$name);
            $this->error('插件解压缩文件失败！');
        }
        rm_dirs($savefileControllerDir.$name);
        $this->error('插件解压缩文件失败！');
    }

    public function getPlugConfig(){
        $data = Db::name($this->table)->where(['publish'=>1])->field('version_set,zip',true)->select();
        $filename = env('root_path').'plug.php';
        file_put_contents($filename,'<?php $plug= '.var_export($data,true).';echo json_encode($plug);');
        header('Content-Type: application/force-download;charset=utf8');
        header('Content-disposition: attachment; filename=plug.php');
        header('Content-Length: ' . filesize($filename));
        readfile($filename);
        unlink($filename);
    }

    public function installModule(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);

        if(trim($name)==''){
            $this->error('该插件标识错误');
        }
        if(file_exists(env('app_path').$name)){
            $this->error('该插件已经存在');
        }

        $downloadFile = config('addons.remote_plug_url').$name.'.zip';
        $res = \service\FileService::download($downloadFile,true);
        if(count($res)<2){
            $this->error('插件不存在,请确认插件标识');
        }
        $plug = Db::name($this->table)->where(['name'=>$name])->find();
        $name_home =$plug['name_home'];
        $file = $res['file'];
        $savefileControllerDir = env('root_path').'static/';
        $savefileViewDir = env('root_path').'application/';

        $zip_file = (new ZipService)->unzip($file,$savefileControllerDir);
        if($zip_file){
            $r1=copydir($savefileControllerDir.$name.'/'.$name,$savefileViewDir.$name);

            if(file_exists($savefileControllerDir.$name.'/home/controller/'.$name_home) &&
                file_exists($savefileControllerDir.$name.'/home/view/'.$name_home)){
                $r2=copydir($savefileControllerDir.$name.'/home/controller/'.$name_home,$savefileViewDir.'home/controller/'.$name_home);
                $r3=copydir($savefileControllerDir.$name.'/home/view/'.$name_home,$savefileViewDir.'home/view/'.$name_home);
            }
            $sql = $savefileControllerDir.$name.'/'.$name.'/install.sql';
            $_sql = file_get_contents($sql);

            $_arr = explode(';', $_sql);
            $_mysqli = new mysqli(config('database.hostname'),config('database.username'),
                config('database.password'),config('database.database'));
            if (mysqli_connect_errno()) {
                exit('连接数据库出错');
            }
            foreach ($_arr as $_value) {
                $_mysqli->query($_value.';');
            }
            $_mysqli->close();
            $_mysqli = null;

            $menu_file = $savefileControllerDir.$name.'/'.$name.'/menu.php';
            if(file_exists($menu_file)){
                $menu = include($menu_file);
                $menu_de = include($menu_file);
                unset($menu['id']);
                unset($menu['pid']);
                unset($menu['sub']);
                $menu['pid']=0;
                $id = Db::name('SystemMenu')->insertGetId($menu);
                foreach ($menu_de['sub'] as $vp){
                    $menu_sec = $vp;
                    unset($vp['id']);
                    unset($vp['pid']);
                    unset($vp['sub']);
                    $vp['pid'] = $id;
                    $secid = Db::name('SystemMenu')->insertGetId($vp);
                    foreach ($menu_sec['sub'] as $vn){
                        unset($vn['id']);
                        unset($vn['pid']);
                        $vn['pid']=$secid;
                        Db::name('SystemMenu')->insert($vn);
                    }
                }
            }else{
                $this->success('安装完成，缺失菜单文件需自己添加！','');
            }

            rm_dirs($savefileControllerDir.$name);
            $this->success('安装成功！','');
        }else{
            rm_dirs($savefileControllerDir.$name);
            $this->error('插件解压缩文件失败！');
        }
        rm_dirs($savefileControllerDir.$name);
        $this->error('插件解压缩文件失败！');
    }

    public function uninstallModule(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            $this->error('该插件标识错误');
        }
        $plug = Db::name($this->table)->where(['name'=>$name])->find();
        $name_home =$plug['name_home'];
        $id = Db::name($this->table)->where('name',$name)->value('id');
        Db::name($this->table)->where('id',$id)->update(['status'=>0]);
        $savefileControllerDir = env('app_path').$name;
        $savefileContDir = env('app_path').'home/controller/'.$name_home;
        $savefileViewDir = env('app_path').'home/view/'.$name_home;

        $menu_file = $savefileControllerDir.'/menu.php';
        if(file_exists($menu_file)){
            $menu = include($menu_file);
            Db::name('SystemMenu')->where('id',$menu['id'])->delete();
            foreach ($menu['sub'] as &$vp){
                Db::name('SystemMenu')->where('id',$vp['id'])->delete();
                foreach ($vp['sub'] as $vn){
                    Db::name('SystemMenu')->where('id',$vn['id'])->delete();
                }
            }
        }

        rm_dirs($savefileControllerDir);
        rm_dirs($savefileContDir);
        rm_dirs($savefileViewDir);
        $this->success('卸载成功！,数据文件需自行删除！','');
    }

    public function packonModule(){
        $request = app('request');
        $name = $request->get('name','');
        $name = strtolower($name);
        if(trim($name)==''){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('该插件标识错误',{time:2*1000}) ;</script>";die;
            $this->error('该插件标识错误');
        }
        $plug = Db::name($this->table)->where(['name'=>$name])->find();
        $name_home =$plug['name_home'];
        if(!file_exists(env('app_path').$name)){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('插件未开发',{time:2*1000}) ;</script>";die;
        }
        if($name_home!='' && !file_exists(env('app_path').'home/controller/'.$name_home)){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('前端插件未开发',{time:2*1000}) ;</script>";die;
        }

        if(!file_exists(env('app_path').$name.'/install.sql')){
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script> layer.msg('缺少install.sql文件',{time:2*1000}) ;window.history.go(-1);</script>";die;
        }

        $adminControllerPath = env('app_path').$name;
        $homeControllerPath = env('app_path').'home/';
        $savefilePath = env('root_path').'static/'.$name;


        mk_dirs($savefilePath.'/'.$name);
        mk_dirs($savefilePath.'/home/controller');
        mk_dirs($savefilePath.'/home/view');

        copydir($adminControllerPath,$savefilePath.'/'.$name);
        if(file_exists($homeControllerPath.'controller/'.$name_home) &&
            file_exists($homeControllerPath.'view/'.$name_home)){
            copydir($homeControllerPath.'controller/'.$name_home,$savefilePath.'/home/controller/'.$name_home);
            copydir($homeControllerPath.'view/'.$name_home,$savefilePath.'/home/view/'.$name_home);
        }

        $zip_file = (new ZipService)->zip(env('root_path').'static/'.$name.'.zip',$savefilePath);
        if($zip_file){
            rm_dirs($savefilePath);
            ob_end_clean();
            $filename = env('root_path').'static/'.$name.'.zip';

            header('Content-Type: application/zip;charset=utf8');
            header('Content-disposition: attachment; filename=' . $name. '.zip');
            header('Content-Length: ' . filesize($filename));
            readfile($filename);
            unlink($filename);
//            $this->success('打包成功！','');
        }else{
            echo "<script src=\"/static/plugs/layui/layui.all.js\"></script>
<script>window.history.go(-1); layer.msg('打包失败!') ;</script>";die;
            $this->error('打包失败！','');
        }
    }

    /**
     * 删除插件
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        $request = app('request');
        $db = is_string($this->table) ? Db::name($this->table) : $this->table;
        list($pk, $table, $map) = [$db->getPk(), $db->getTable(), []];
        $map[] = [empty($pk) ? 'id' : $pk, 'in', explode(',', $request->post('id', ''))];
        $name= Db::table($table)->where($map)->value('name');
        if(class_exists('\app\plug\controller\\'.$name)){
            $this->error("插件删除失败，请先卸载！");
        }
        if (DataService::update($this->table)) {
            $this->success("插件删除成功！", '');
        }
        $this->error("插件删除失败，请稍候再试！");
    }

    /**
     * 插件禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("插件禁用成功！", '');
        }
        $this->error("插件禁用失败，请稍候再试！");
    }

    /**
     * 插件禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("插件启用成功！", '');
        }
        $this->error("插件启用失败，请稍候再试！");
    }

}