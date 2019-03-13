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

use service\DataService;
use service\NodeService;
use think\Container;
use think\Db;
use think\facade\Hook;
use think\facade\Request;
/**
 * 打印输出数据到文件
 * @param mixed $data 输出的数据
 * @param bool $force 强制替换
 * @param string|null $file
 */
function p($data, $force = false, $file = null)
{
    is_null($file) && $file = env('runtime_path') . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . PHP_EOL;
    $force ? file_put_contents($file, $str) : file_put_contents($file, $str, FILE_APPEND);
}

/**
 * RBAC节点权限验证
 * @param string $node
 * @return bool
 */
function auth($node)
{
    return NodeService::checkAuthNode($node);
}

/**
 * 设备或配置系统参数
 * @param string $name 参数名称
 * @param bool $value 默认是null为获取值，否则为更新
 * @return string|bool
 * @throws \think\Exception
 * @throws \think\exception\PDOException
 */
function sysconf($name, $value = null)
{
    static $config = [];
    if ($value !== null) {
        list($config, $data) = [[], ['name' => $name, 'value' => $value]];
        return DataService::save('SystemConfig', $data, 'name');
    }
    if (empty($config)) {
        $config = Db::name('SystemConfig')->column('name,value');
    }
    return isset($config[$name]) ? $config[$name] : '';
}

/**
 * 日期格式标准输出
 * @param string $datetime 输入日期
 * @param string $format 输出格式
 * @return false|string
 */
function format_datetime($datetime, $format = 'Y年m月d日 H:i:s')
{
    if(trim($datetime)==''){
        return '';
    }
    if(date('Y-m-d H:i:s', strtotime($datetime)) != $datetime) {
        return date($format, $datetime);
    } else {
        return date($format, strtotime($datetime));
    }

}

/**
 * UTF8字符串加密
 * @param string $string
 * @return string
 */
function encode($string)
{
    list($chars, $length) = ['', strlen($string = iconv('utf-8', 'gbk', $string))];
    for ($i = 0; $i < $length; $i++) {
        $chars .= str_pad(base_convert(ord($string[$i]), 10, 36), 2, 0, 0);
    }
    return $chars;
}

/**
 * UTF8字符串解密
 * @param string $string
 * @return string
 */
function decode($string)
{
    $chars = '';
    foreach (str_split($string, 2) as $char) {
        $chars .= chr(intval(base_convert($char, 36, 10)));
    }
    return iconv('gbk', 'utf-8', $chars);
}

/**
 * 下载远程文件到本地
 * @param string $url 远程图片地址
 * @return string
 */
function local_image($url)
{
    return \service\FileService::download($url)['url'];
}

//人性化时间
function formatTime($time) {
    $rtime = date("m-d H:i", $time);
    $htime = date("H:i", $time);
    $time = time() - $time;
    if ($time < 60) {
        $str = '刚刚';
    } elseif ($time < 60 * 60) {
        $min = floor($time / 60);
        $str = $min . '分钟前';
    } elseif ($time < 60 * 60 * 24) {
        $h = floor($time / (60 * 60));
        $str = $h . '小时前 ';
    } elseif ($time < 60 * 60 * 24 * 3) {
        $d = floor($time / (60 * 60 * 24));
        if ($d == 1) {
            $str = '昨天 ' . $rtime;
        } else {
            $str = '前天 ' . $rtime;
        }
    } else {
        $str = $rtime;
    }
    return $str;
}

// 向 Request 对象注入 referer 方法
Request::hook('referer', function($request, $url = null){
    if (is_null($url) && isset($_SERVER["HTTP_REFERER"])) {
        $url = $request->url(true) == $_SERVER["HTTP_REFERER"] ? cookie('__forward__') : $_SERVER["HTTP_REFERER"];
    } elseif (is_string($url) && '' !== $url) {
        $url = (strpos($url, '://') || 0 === strpos($url, '/')) ? $url : Container::get('url')->build($url);
    }
    return $url;
});
/**
 * 递归创建某目录
 * @param unknown $dirname
 * @return boolean
 */
function mk_dirs($dirname){
    if (!is_dir($dirname)) {
        if (!mk_dirs(dirname($dirname))) {
            return false;
        }
        if (!mkdir($dirname, 0777)) {
            return false;
        }
    }
    return true;
}

/**
 * 复制文件夹
 * @param $source
 * @param $dest
 */
function copydir($source, $dest)
{
    if (!file_exists($dest)) mkdir($dest);
    $handle = opendir($source);
    while (($item = readdir($handle)) !== false) {
        if ($item == '.' || $item == '..') continue;
        $_source = $source . '/' . $item;
        $_dest = $dest . '/' . $item;
        if (is_file($_source)) copy($_source, $_dest);
        if (is_dir($_source)) copydir($_source, $_dest);
    }
    closedir($handle);
}

/**
 * 递归删除某目录
 * @param string $dirname
 * @return boolean
 */
function rm_dirs($dirname)
{
    if (!file_exists($dirname)) {
        return false;
    }
    if (is_file($dirname) || is_link($dirname)) {
        return unlink($dirname);
    }
    $dir = dir($dirname);
    if ($dir) {
        while (false !== $entry = $dir->read()) {
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            rm_dirs($dirname . DIRECTORY_SEPARATOR . $entry);
        }
    }
    $dir->close();
    return @rmdir($dirname);
}

function int_to_string(&$data,$map=array('status'=>array(1=>'正常',-1=>'删除',0=>'禁用',2=>'未审核',3=>'草稿'))) {
    if($data === false || $data === null ){
        return $data;
    }
    $data = (array)$data;
    foreach ($data as $key => $row){
        foreach ($map as $col=>$pair){
            if(isset($row[$col]) && isset($pair[$row[$col]])){
                $data[$key][$col.'_text'] = $pair[$row[$col]];
            }
        }
    }
    return $data;
}
/**
 * 字符串转换为数组，主要用于把分隔符调整到第二个参数
 * @param  string $str  要分割的字符串
 * @param  string $glue 分割符
 * @return array
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function str2arr($str, $glue = ','){
    return explode($glue, $str);
}
/**
 * 数组转换为字符串，主要用于把分隔符调整到第二个参数
 * @param  array  $arr  要连接的数组
 * @param  string $glue 分割符
 * @return string
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function arr2str($arr, $glue = ','){
    return implode($glue, $arr);
}
/**
 * 对查询结果集进行排序
 * @access public
 * @param array  $list 查询结果
 * @param string $field 排序的字段名
 * @param array  $sortby 排序类型
 * asc正向排序 desc逆向排序 nat自然排序
 * @return array
 */
function list_sort_by($list, $field, $sortby = 'asc')
{

    if (is_array($list)) {
        $refer =array(); $resultSet = array();

        foreach ($list as $i => $data){


            $refer[$i] = $data[$field];

        }


        switch ($sortby) {
            case 'asc': // 正向排序
                asort($refer);
                break;
            case 'desc': // 逆向排序
                arsort($refer);
                break;
            case 'nat': // 自然排序
                natcasesort($refer);
                break;
        }
        foreach ($refer as $key => $val)
            $resultSet[] = & $list[$key];
        return $resultSet;
    }
    return false;
}

/**
 * array_column 函数兼容
 */
if (!function_exists("array_column")) {
    function array_column(array &$rows, $column_key, $index_key = null)
    {
        $data = [];
        foreach ($rows as $row) {
            if (empty($index_key)) {
                $data[] = $row[$column_key];
            } else {
                $data[$row[$index_key]] = $row[$column_key];
            }
        }
        return $data;
    }
}

/**
 * 手机号中间4位用****替换
 * @param string $mobile 原手机号
 * @return string
 */
function mobileTotel($mobile)
{
    $new_tel = preg_replace('/(\d{3})\d{4}(\d{4})/', '$1****$2', $mobile);
    return isset($new_tel) ? $new_tel : '';
}

/**
 * 大于1000转k,大于10000转w
 * @param $num
 * @return string
 */
function num2String($num)
{
    if ($num < 1000) {
        return $num;
    } else if ($num >= 1000 && $num < 10000) {
        return round($num / 1000, 1) . 'k';
    } else if ($num >= 10000) {
        return round($num / 10000, 2) . 'w';
    }
}

/**
 * 系统非常规MD5加密方法
 * @param  string $str 要加密的字符串
 * @param  string $auth_key 要加密的字符串
 * @return string
 */
function user_md5($str, $auth_key = '')
{
    if (!$auth_key) {
        $auth_key = config('api.AUTH_KEY');
    }
    return '' === $str ? '' : md5(sha1($str) . $auth_key);
}

/**
 * 判断当前是否https
 * @return bool
 */
function is_https()
{
    if (!empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off') {
        return true;
    } elseif (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
        return true;
    } elseif (!empty($_SERVER['HTTP_FRONT_END_HTTPS']) && strtolower($_SERVER['HTTP_FRONT_END_HTTPS']) !== 'off') {
        return true;
    }
    return false;
}

/**
 * 文字超出长度部分转...
 * @param $str
 * @param $len
 * @param string $suffix
 * @return string
 */
function cut_str($str, $len = 8, $suffix = "...")
{
    if (function_exists('mb_substr')) {
        if (mb_strlen($str) > $len) {
            $str = mb_substr($str, 0, $len) . $suffix;
        }
    } else {
        if (strlen($str) > $len) {
            $str = substr($str, 0, $len) . $suffix;
        }
    }
    return $str;
}

/**
 * 判断是否为合法的身份证号码
 * @param $vStr
 * @return bool
 */
function isCreditNo($vStr)
{
    $vCity = array(
        '11', '12', '13', '14', '15', '21', '22',
        '23', '31', '32', '33', '34', '35', '36',
        '37', '41', '42', '43', '44', '45', '46',
        '50', '51', '52', '53', '54', '61', '62',
        '63', '64', '65', '71', '81', '82', '91'
    );
    if (!preg_match('/^([\d]{17}[xX\d]|[\d]{15})$/', $vStr)) return false;
    if (!in_array(substr($vStr, 0, 2), $vCity)) return false;
    $vStr = preg_replace('/[xX]$/i', 'a', $vStr);
    $vLength = strlen($vStr);
    if ($vLength == 18) {
        $vBirthday = substr($vStr, 6, 4) . '-' . substr($vStr, 10, 2) . '-' . substr($vStr, 12, 2);
    } else {
        $vBirthday = '19' . substr($vStr, 6, 2) . '-' . substr($vStr, 8, 2) . '-' . substr($vStr, 10, 2);
    }
    if (date('Y-m-d', strtotime($vBirthday)) != $vBirthday) return false;
    if ($vLength == 18) {
        $vSum = 0;
        for ($i = 17; $i >= 0; $i--) {
            $vSubStr = substr($vStr, 17 - $i, 1);
            $vSum += (pow(2, $i) % 11) * (($vSubStr == 'a') ? 10 : intval($vSubStr, 11));
        }
        if ($vSum % 11 != 1) return false;
    }
    return true;
}

function format_size($size){
    $size = doubleval($size);
    $rank =0;
    $rankchar ='Bytes';
    while($size>1024){
        $size = $size/1024;
        $rank++;
    }
    if($rank==1){
        $rankchar="KB";
    }
    else if($rank==2){
        $rankchar="MB";
    }
    else if($rank==3){
        $rankchar="GB";
    }
    $size = number_format($size, 2, '.', '');
    return "".$size." ".$rankchar;
}

