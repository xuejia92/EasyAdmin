<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2019/2/14
 * Time: 13:36
 */

namespace App\Model;
use App\Utility\Pool\MysqlObject;

class BaseModel
{
    private $db;
    function __construct(MysqlObject $db)
    {
        $this->db = $db;
    }
    protected function getDb(): MysqlObject {
        return $this->db;
    }
}