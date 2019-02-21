<?php

// +----------------------------------------------------------------------
// | ThinkApiAdmin
// +----------------------------------------------------------------------

namespace app\api\behavior;

use app\api\model\ApiFields;
use think\facade\Cache;
use think\facade\Request;
use util\ApiLog;
use util\ReturnCode;
use util\DataType;
use think\Validate;

/**
 * 输入参数过滤行为
 * Class RequestFilter
 * @package app\api\behavior
 */
class RequestFilter
{

    /**
     * 默认行为函数
     * @throws \think\exception\DbException
     */
    public function run()
    {
        $request = \request();
        $method = strtoupper($request->method());
        switch ($method) {
            case 'GET':
                $data = $request->get();
                break;
            case 'POST':
                $data = $request->post();
                break;
            case 'DELETE':
                $data = $request->delete();
                break;
            case 'PUT':
                $data = $request->put();
                break;
            default :
                $data = [];
                break;
        }
        ApiLog::setRequest($data);
        $hash = $request->routeInfo();
        $ru = explode('/',$hash['rule']);
        if (isset($ru[1])) {
            $hash = $ru[1];

            $has = Cache::has('RequestFields:NewRule:' . $hash);
            if ($has) {
                $newRule = cache('RequestFields:NewRule:' . $hash);
                $rule = cache('RequestFields:Rule:' . $hash);
            } else {
                $rule = ApiFields::all(['hash' => $hash, 'type' => 0]);
                $newRule = $this->buildValidateRule($rule);
                cache('RequestFields:NewRule:' . $hash, $newRule);
                cache('RequestFields:Rule:' . $hash, $rule);
            }

            if ($newRule) {
                $validate = new Validate($newRule);
                if (!$validate->check($data)) {
                    return json(['code' => ReturnCode::PARAM_INVALID, 'msg' => $validate->getError(), 'data' => []]);
                }
            }

            $newData = [];
            foreach ($rule as $item) {
                if (!$item['isMust'] && $item['default'] !== null && !isset($data[$item['fieldName']])) {
                    $newData[$item['fieldName']] = $item['default'];
                } else {
                    $newData[$item['fieldName']] = $data[$item['fieldName']];
                }
            }

            switch ($method) {
                case 'GET':
                    foreach($newData as $k=>$vo){
                        Request::get($k,$vo);
                    }
                    break;
                case 'POST':
                    foreach($newData as $k=>$vo){
                        Request::post($k,$vo);
                    }
                    break;
                case 'DELETE':
                    foreach($newData as $k=>$vo){
                        Request::delete($k,$vo);
                    }
                    break;
                case 'PUT':
                    foreach($newData as $k=>$vo){
                        Request::put($k,$vo);
                    }
                    break;
            }
            ApiLog::setRequestAfterFilter($newData);
        }
        ApiLog::setHeader($request->header());
    }

    /**
     * 将数据库中的规则转换成TP_Validate使用的规则数组
     * @param array $rule
     * @return array
     */
    public function buildValidateRule($rule = array())
    {
        $newRule = [];
        if ($rule) {
            foreach ($rule as $value) {
                if ($value['isMust']) {
                    $newRule[$value['fieldName']][] = 'require';
                }
                switch ($value['dataType']) {
                    case DataType::TYPE_INTEGER:
                        $newRule[$value['fieldName']][] = 'number';
                        if ($value['range']) {
                            $range = htmlspecialchars_decode($value['range']);
                            $range = json_decode($range, true);
                            if (isset($range['min'])) {
                                $newRule[$value['fieldName']]['egt'] = $range['min'];
                            }
                            if (isset($range['max'])) {
                                $newRule[$value['fieldName']]['elt'] = $range['max'];
                            }
                        }
                        break;
                    case DataType::TYPE_STRING:
                        if ($value['range']) {
                            $range = htmlspecialchars_decode($value['range']);
                            $range = json_decode($range, true);
                            if (isset($range['min'])) {
                                $newRule[$value['fieldName']]['min'] = $range['min'];
                            }
                            if (isset($range['max'])) {
                                $newRule[$value['fieldName']]['max'] = $range['max'];
                            }
                        }
                        break;
                    case DataType::TYPE_ENUM:
                        if ($value['range']) {
                            $range = htmlspecialchars_decode($value['range']);
                            $range = json_decode($range, true);
                            $newRule[$value['fieldName']]['in'] = implode(',', $range);
                        }
                        break;
                    case DataType::TYPE_FLOAT:
                        $newRule[$value['fieldName']][] = 'float';
                        if ($value['range']) {
                            $range = htmlspecialchars_decode($value['range']);
                            $range = json_decode($range, true);
                            if (isset($range['min'])) {
                                $newRule[$value['fieldName']]['egt'] = $range['min'];
                            }
                            if (isset($range['max'])) {
                                $newRule[$value['fieldName']]['elt'] = $range['max'];
                            }
                        }
                        break;
                    case DataType::TYPE_ARRAY:
                        $newRule[$value['fieldName']][] = 'array';
                        if ($value['range']) {
                            $range = htmlspecialchars_decode($value['range']);
                            $range = json_decode($range, true);
                            if (isset($range['min'])) {
                                $newRule[$value['fieldName']]['min'] = $range['min'];
                            }
                            if (isset($range['max'])) {
                                $newRule[$value['fieldName']]['max'] = $range['max'];
                            }
                        }
                        break;
                    case DataType::TYPE_MOBILE:
                        $newRule[$value['fieldName']]['regex'] = '/^1[345678]\d{9}$/';
                        break;
                }
            }
        }

        return $newRule;
    }

}
