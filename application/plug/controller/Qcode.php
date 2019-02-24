<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/13
 * Time: 21:43
 */

namespace app\plug\controller;


use controller\BasicAdmin;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use service\QrcodeService;
use think\facade\App;
use think\Response;

class Qcode extends BasicAdmin{
    /**
     * 当前默认数据模型
     * @var string
     */
    public $table = 'SystemConfig';

    /**
     * 当前页面标题
     * @var string
     */
    public $title = '二维码管理';

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

    // 生成二维码
    public function build()
    {
        $text = $this->request->get('text', 'hello world');
        $size = $this->request->get('size', 250);
        $padding = $this->request->get('padding', 15);
        $errorcorrection = $this->request->get('errorcorrection', 'medium');
        $foreground = $this->request->get('foreground', "#ffffff");
        $background = $this->request->get('background', "#000000");
        $logo = $this->request->get('logo');
        $logosize = $this->request->get('logosize');
        $label = $this->request->get('label');
        $labelfontsize = $this->request->get('labelfontsize');
        $labelhalign = $this->request->get('labelhalign');
        $labelvalign = $this->request->get('labelvalign');

        // 前景色
        list($r, $g, $b) = sscanf($foreground, "#%02x%02x%02x");
        $foregroundcolor = ['r' => $r, 'g' => $g, 'b' => $b];

        // 背景色
        list($r, $g, $b) = sscanf($background, "#%02x%02x%02x");
        $backgroundcolor = ['r' => $r, 'g' => $g, 'b' => $b];

        $qrCode = new QrCode();
        $qrCode->setText($text);
        $qrCode->setSize($size);
        $qrCode->setMargin($padding);
        $qrCode->setErrorCorrectionLevel(new ErrorCorrectionLevel($errorcorrection));
        $qrCode->setForegroundColor($foregroundcolor);
        $qrCode->setBackgroundColor($backgroundcolor);
        $qrCode->setLogoSize($logosize);
        $qrCode->setLabel($label,null,App::getRootPath().'static/plugs/awesome/fonts/fzltxh.ttf');
        $qrCode->setLabelFontSize($labelfontsize);
//        $qrCode->setLabelAlignment($labelhalign);
//        $qrCode->setLabelMargin($labelvalign);
//        $qrCode->setImageType(QrCode::IMAGE_TYPE_PNG);
        if ($logo) {
            $logo = $this->request->get('logoImag');
            $path = parse_url($logo);
            $path = $path['path'];
            $logo = App::getRootPath().$path;
            $qrCode->setLogoPath($logo);
        }
        //也可以直接使用render方法输出结果
        //$qrCode->render();
        return new Response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);
    }
}