<?php
namespace service;
use DirectoryIterator;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use think\Exception;
use ZipArchive;

class ExcelService{
    /**
     * 导出Excel
     * @param  object $spreadsheet  数据
     * @param  string $format       格式:excel2003 = xls, excel2007 = xlsx
     * @param  string $savename     保存的文件名
     * @return filedownload         浏览器下载
     */
    function exportExcel($spreadsheet, $format = 'xls', $savename = 'export') {
        if (!$spreadsheet) return false;
        if ($format == 'xls') {
            //输出Excel03版本
            header('Content-Type:application/vnd.ms-excel');
            $class = "\PhpOffice\PhpSpreadsheet\Writer\Xls";
        } elseif ($format == 'xlsx') {
            //输出07Excel版本
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            $class = "\PhpOffice\PhpSpreadsheet\Writer\Xlsx";
        }
        //输出名称
        header('Content-Disposition: attachment;filename="'.$savename.'.'.$format.'"');
        //禁止缓存
        header('Cache-Control: max-age=0');
        $writer = new $class($spreadsheet);
        $filePath = env('runtime_path')."temp/".time().microtime(true).".tmp";
        $writer->save($filePath);
        readfile($filePath);
        unlink($filePath);
    }

    public function stringFromColumnIndex($pColumnIndex = 0) {
        //    Using a lookup cache adds a slight memory overhead, but boosts speed
        //    caching using a static within the method is faster than a class static,
        //        though it's additional memory overhead
        static $_indexCache = array();

        if (!isset($_indexCache[$pColumnIndex])) {
            // Determine column string
            if ($pColumnIndex < 26) {
                $_indexCache[$pColumnIndex] = chr(65 + $pColumnIndex);
            } elseif ($pColumnIndex < 702) {
                $_indexCache[$pColumnIndex] = chr(64 + ($pColumnIndex / 26)) .
                    chr(65 + $pColumnIndex % 26);
            } else {
                $_indexCache[$pColumnIndex] = chr(64 + (($pColumnIndex-26) / 676)) .
                    chr(65 + ((($pColumnIndex-26) % 676) / 26)) .
                    chr(65 + $pColumnIndex % 26);
        }
        }
        return $_indexCache[$pColumnIndex];
    }

    public function outExcel($saveName,$data){
            // Create new Spreadsheet object
            $spreadsheet = new Spreadsheet();
            // Add title

            foreach ($data['head'] as $key=>$vp){
                $key = $this->stringFromColumnIndex($key);
                $spreadsheet->setActiveSheetIndex(0)->setCellValue($key.'1', $vp);
                if(isset($data['width'][$vp])){
                    //Set width
                    $spreadsheet->getActiveSheet() ->getColumnDimension($key)->setWidth($data['width'][$vp]);
                }
            }
            // Rename worksheet
            $spreadsheet->getActiveSheet()->setTitle($saveName);
            $i = 2;
            foreach ($data['data'] as $rs) {
                // Add data
                foreach ($data['head'] as $key=>$vm){
                    $keyName = $this->stringFromColumnIndex($key);
                    $spreadsheet->getActiveSheet()->setCellValue($keyName.$i, $rs[$vm]);
                }
                $i++;
            }

            // Set alignment
//            $spreadsheet->getActiveSheet()->getStyle('A1:F'.$i)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
//            $spreadsheet->getActiveSheet()->getStyle('C2:C'.$i)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
            // Set active sheet index to the first sheet, so Excel opens this as the first sheet
            $spreadsheet->setActiveSheetIndex(0);
            return $this->exportExcel($spreadsheet, 'xls', $saveName);
      }
}