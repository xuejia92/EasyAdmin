<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2019/2/14
 * Time: 13:44
 */
namespace App\Model\server_task_jd;
use App\Model\BaseModel;
use EasySwoole\Spl\SplBean;
class JdModel extends BaseModel
{
    private $table = 'server_task_jd';
    function insert(JdBean $jd) {
        var_dump($jd->toArray());
        $this->getDb()->insert($this->table, $jd->toArray(null, SplBean::FILTER_NOT_NULL));
    }
    function update(JdBean $jd, $price) {
        $this->getDb()->where('sku', $jd->getSku())->update($this->table, ['price' => $price]);
    }
}