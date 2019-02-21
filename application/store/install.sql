/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : esadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-31 16:04:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `store_express`
-- ----------------------------
DROP TABLE IF EXISTS `store_express`;
CREATE TABLE `store_express` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `express_title` varchar(50) DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) DEFAULT '' COMMENT '快递公司代码',
  `express_desc` text COMMENT '快递公司描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商城快递配置';

-- ----------------------------
-- Records of store_express
-- ----------------------------
INSERT INTO `store_express` VALUES ('5', 'AAE全球专递', 'aae', '顺丰快递公司', '0', '0', '0', '2017-09-12 11:53:40');
INSERT INTO `store_express` VALUES ('6', '安捷快递', 'anjie', '', '0', '0', '0', '2017-09-13 15:27:26');
INSERT INTO `store_express` VALUES ('7', '安信达快递', 'anxindakuaixi', null, '0', '0', '0', '2017-09-13 16:05:19');
INSERT INTO `store_express` VALUES ('8', '彪记快递', 'biaojikuaidi', null, '0', '0', '0', '2017-09-13 16:05:26');
INSERT INTO `store_express` VALUES ('9', 'BHT', 'bht', '', '0', '0', '0', '2017-09-13 16:05:37');
INSERT INTO `store_express` VALUES ('10', '百福东方国际物流', 'baifudongfang', null, '0', '0', '0', '2017-09-13 16:05:41');
INSERT INTO `store_express` VALUES ('11', '中国东方（COE）', 'coe', null, '0', '0', '0', '2017-09-13 16:05:48');
INSERT INTO `store_express` VALUES ('12', '长宇物流', 'changyuwuliu', null, '0', '0', '0', '2017-09-13 16:05:58');
INSERT INTO `store_express` VALUES ('13', '大田物流', 'datianwuliu', null, '0', '0', '0', '2017-09-13 16:06:06');
INSERT INTO `store_express` VALUES ('14', '德邦物流', 'debangwuliu', null, '1', '1', '0', '2017-09-13 16:06:14');
INSERT INTO `store_express` VALUES ('15', 'DHL', 'dhl', null, '0', '0', '0', '2017-09-13 16:06:24');
INSERT INTO `store_express` VALUES ('16', 'DPEX', 'dpex', null, '0', '0', '0', '2017-09-13 16:06:29');
INSERT INTO `store_express` VALUES ('17', 'd速快递', 'dsukuaidi', null, '0', '0', '0', '2017-09-13 16:06:34');
INSERT INTO `store_express` VALUES ('18', '递四方', 'disifang', null, '0', '0', '0', '2017-09-13 16:06:40');
INSERT INTO `store_express` VALUES ('19', 'EMS快递', 'ems', '', '1', '0', '0', '2017-09-13 16:06:47');
INSERT INTO `store_express` VALUES ('20', 'FEDEX（国外）', 'fedex', null, '0', '0', '0', '2017-09-13 16:06:56');
INSERT INTO `store_express` VALUES ('21', '飞康达物流', 'feikangda', null, '0', '0', '0', '2017-09-13 16:07:03');
INSERT INTO `store_express` VALUES ('22', '凤凰快递', 'fenghuangkuaidi', null, '0', '0', '0', '2017-09-13 16:07:10');
INSERT INTO `store_express` VALUES ('23', '飞快达', 'feikuaida', null, '0', '0', '0', '2017-09-13 16:07:16');
INSERT INTO `store_express` VALUES ('24', '国通快递', 'guotongkuaidi', null, '0', '0', '0', '2017-09-13 16:07:27');
INSERT INTO `store_express` VALUES ('25', '港中能达物流', 'ganzhongnengda', null, '0', '0', '0', '2017-09-13 16:07:33');
INSERT INTO `store_express` VALUES ('26', '广东邮政物流', 'guangdongyouzhengwuliu', null, '0', '0', '0', '2017-09-13 16:08:22');
INSERT INTO `store_express` VALUES ('27', '共速达', 'gongsuda', null, '0', '0', '0', '2017-09-13 16:08:48');
INSERT INTO `store_express` VALUES ('28', '汇通快运', 'huitongkuaidi', null, '0', '0', '0', '2017-09-13 16:08:56');
INSERT INTO `store_express` VALUES ('29', '恒路物流', 'hengluwuliu', null, '0', '0', '0', '2017-09-13 16:09:02');
INSERT INTO `store_express` VALUES ('30', '华夏龙物流', 'huaxialongwuliu', null, '0', '0', '0', '2017-09-13 16:09:12');
INSERT INTO `store_express` VALUES ('31', '海红', 'haihongwangsong', null, '0', '0', '0', '2017-09-13 16:09:20');
INSERT INTO `store_express` VALUES ('32', '海外环球', 'haiwaihuanqiu', null, '0', '0', '0', '2017-09-13 16:09:27');
INSERT INTO `store_express` VALUES ('33', '佳怡物流', 'jiayiwuliu', null, '0', '0', '0', '2017-09-13 16:09:35');
INSERT INTO `store_express` VALUES ('34', '京广速递', 'jinguangsudikuaijian', null, '0', '0', '0', '2017-09-13 16:09:42');
INSERT INTO `store_express` VALUES ('35', '急先达', 'jixianda', null, '0', '0', '0', '2017-09-13 16:09:49');
INSERT INTO `store_express` VALUES ('36', '佳吉物流', 'jjwl', null, '0', '0', '0', '2017-09-13 16:10:01');
INSERT INTO `store_express` VALUES ('37', '加运美物流', 'jymwl', null, '0', '0', '0', '2017-09-13 16:10:13');
INSERT INTO `store_express` VALUES ('38', '金大物流', 'jindawuliu', null, '0', '0', '0', '2017-09-13 16:10:22');
INSERT INTO `store_express` VALUES ('39', '嘉里大通', 'jialidatong', null, '0', '0', '0', '2017-09-13 16:10:33');
INSERT INTO `store_express` VALUES ('40', '晋越快递', 'jykd', null, '0', '0', '0', '2017-09-13 16:10:40');
INSERT INTO `store_express` VALUES ('41', '快捷速递', 'kuaijiesudi', null, '0', '0', '0', '2017-09-13 16:10:49');
INSERT INTO `store_express` VALUES ('42', '联邦快递（国内）', 'lianb', null, '0', '0', '0', '2017-09-13 16:10:58');
INSERT INTO `store_express` VALUES ('43', '联昊通物流', 'lianhaowuliu', null, '0', '0', '0', '2017-09-13 16:11:07');
INSERT INTO `store_express` VALUES ('44', '龙邦物流', 'longbanwuliu', null, '0', '0', '0', '2017-09-13 16:11:15');
INSERT INTO `store_express` VALUES ('45', '立即送', 'lijisong', null, '0', '0', '0', '2017-09-13 16:11:25');
INSERT INTO `store_express` VALUES ('46', '乐捷递', 'lejiedi', null, '0', '0', '0', '2017-09-13 16:11:36');
INSERT INTO `store_express` VALUES ('47', '民航快递', 'minghangkuaidi', null, '0', '0', '0', '2017-09-13 16:11:45');
INSERT INTO `store_express` VALUES ('48', '美国快递', 'meiguokuaidi', null, '0', '0', '0', '2017-09-13 16:11:53');
INSERT INTO `store_express` VALUES ('49', '门对门', 'menduimen', null, '0', '0', '0', '2017-09-13 16:12:01');
INSERT INTO `store_express` VALUES ('50', 'OCS', 'ocs', null, '0', '0', '0', '2017-09-13 16:12:10');
INSERT INTO `store_express` VALUES ('51', '配思货运', 'peisihuoyunkuaidi', null, '0', '0', '0', '2017-09-13 16:12:18');
INSERT INTO `store_express` VALUES ('52', '全晨快递', 'quanchenkuaidi', null, '0', '0', '0', '2017-09-13 16:12:26');
INSERT INTO `store_express` VALUES ('53', '全峰快递', 'quanfengkuaidi', null, '0', '0', '0', '2017-09-13 16:12:34');
INSERT INTO `store_express` VALUES ('54', '全际通物流', 'quanjitong', null, '0', '0', '0', '2017-09-13 16:12:41');
INSERT INTO `store_express` VALUES ('55', '全日通快递', 'quanritongkuaidi', null, '0', '0', '0', '2017-09-13 16:12:49');
INSERT INTO `store_express` VALUES ('56', '全一快递', 'quanyikuaidi', null, '0', '0', '0', '2017-09-13 16:12:56');
INSERT INTO `store_express` VALUES ('57', '如风达', 'rufengda', null, '0', '0', '0', '2017-09-13 16:13:03');
INSERT INTO `store_express` VALUES ('58', '三态速递', 'santaisudi', null, '0', '0', '0', '2017-09-13 16:13:15');
INSERT INTO `store_express` VALUES ('59', '盛辉物流', 'shenghuiwuliu', null, '0', '0', '0', '2017-09-13 16:13:22');
INSERT INTO `store_express` VALUES ('60', '申通', 'shentong', null, '0', '0', '0', '2017-09-13 16:13:34');
INSERT INTO `store_express` VALUES ('61', '顺丰', 'shunfeng', '', '1', '0', '0', '2017-09-13 16:13:41');
INSERT INTO `store_express` VALUES ('62', '速尔物流', 'sue', null, '0', '0', '0', '2017-09-13 16:13:48');
INSERT INTO `store_express` VALUES ('63', '盛丰物流', 'shengfeng', null, '0', '0', '0', '2017-09-13 16:13:55');
INSERT INTO `store_express` VALUES ('64', '赛澳递', 'saiaodi', null, '0', '0', '0', '2017-09-13 16:14:02');
INSERT INTO `store_express` VALUES ('65', '天地华宇', 'tiandihuayu', null, '0', '0', '0', '2017-09-13 16:14:11');
INSERT INTO `store_express` VALUES ('66', '天天快递', 'tiantian', null, '0', '0', '0', '2017-09-13 16:14:19');
INSERT INTO `store_express` VALUES ('67', 'TNT', 'tnt', null, '0', '0', '0', '2017-09-13 16:14:26');
INSERT INTO `store_express` VALUES ('68', 'UPS', 'ups', null, '0', '0', '0', '2017-09-13 16:14:29');
INSERT INTO `store_express` VALUES ('69', '万家物流', 'wanjiawuliu', null, '0', '0', '0', '2017-09-13 16:14:37');
INSERT INTO `store_express` VALUES ('70', '文捷航空速递', 'wenjiesudi', null, '0', '0', '0', '2017-09-13 16:14:46');
INSERT INTO `store_express` VALUES ('71', '伍圆', 'wuyuan', null, '0', '0', '0', '2017-09-13 16:14:52');
INSERT INTO `store_express` VALUES ('72', '万象物流', 'wxwl', null, '0', '0', '0', '2017-09-13 16:15:00');
INSERT INTO `store_express` VALUES ('73', '新邦物流', 'xinbangwuliu', null, '0', '0', '0', '2017-09-13 16:15:06');
INSERT INTO `store_express` VALUES ('74', '信丰物流', 'xinfengwuliu', null, '0', '0', '0', '2017-09-13 16:15:15');
INSERT INTO `store_express` VALUES ('75', '亚风速递', 'yafengsudi', null, '0', '0', '0', '2017-09-13 16:15:23');
INSERT INTO `store_express` VALUES ('76', '一邦速递', 'yibangwuliu', null, '0', '0', '0', '2017-09-13 16:15:30');
INSERT INTO `store_express` VALUES ('77', '优速物流', 'youshuwuliu', null, '0', '0', '0', '2017-09-13 16:15:36');
INSERT INTO `store_express` VALUES ('78', '邮政包裹挂号信', 'youzhengguonei', null, '0', '3', '0', '2017-09-13 16:15:44');
INSERT INTO `store_express` VALUES ('79', '邮政国际包裹挂号信', 'youzhengguoji', null, '0', '2', '0', '2017-09-13 16:15:51');
INSERT INTO `store_express` VALUES ('80', '远成物流', 'yuanchengwuliu', null, '0', '0', '0', '2017-09-13 16:15:57');
INSERT INTO `store_express` VALUES ('81', '圆通速递', 'yuantong', null, '1', '1', '0', '2017-09-13 16:16:03');
INSERT INTO `store_express` VALUES ('82', '源伟丰快递', 'yuanweifeng', null, '0', '0', '0', '2017-09-13 16:16:10');
INSERT INTO `store_express` VALUES ('83', '元智捷诚快递', 'yuanzhijiecheng', null, '0', '0', '0', '2017-09-13 16:16:17');
INSERT INTO `store_express` VALUES ('84', '韵达快运', 'yunda', null, '1', '0', '0', '2017-09-13 16:16:24');
INSERT INTO `store_express` VALUES ('85', '运通快递', 'yuntongkuaidi', null, '0', '0', '0', '2017-09-13 16:16:33');
INSERT INTO `store_express` VALUES ('86', '越丰物流', 'yuefengwuliu', null, '0', '0', '0', '2017-09-13 16:16:40');
INSERT INTO `store_express` VALUES ('87', '源安达', 'yad', null, '0', '0', '0', '2017-09-13 16:16:47');
INSERT INTO `store_express` VALUES ('88', '银捷速递', 'yinjiesudi', null, '0', '0', '0', '2017-09-13 16:16:56');
INSERT INTO `store_express` VALUES ('89', '宅急送', 'zhaijisong', null, '0', '0', '0', '2017-09-13 16:17:03');
INSERT INTO `store_express` VALUES ('90', '中铁快运', 'zhongtiekuaiyun', null, '0', '0', '0', '2017-09-13 16:17:10');
INSERT INTO `store_express` VALUES ('91', '中通速递', 'zhongtong', '', '0', '0', '0', '2017-09-13 16:17:16');
INSERT INTO `store_express` VALUES ('92', '中邮物流', 'zhongyouwuliu', null, '0', '0', '0', '2017-09-13 16:17:27');
INSERT INTO `store_express` VALUES ('93', '忠信达', 'zhongxinda', null, '0', '0', '0', '2017-09-13 16:17:34');
INSERT INTO `store_express` VALUES ('94', '芝麻开门', 'zhimakaimen', null, '0', '0', '0', '2017-09-13 16:17:41');

-- ----------------------------
-- Table structure for `store_goods`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods`;
CREATE TABLE `store_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) unsigned DEFAULT '0' COMMENT '品牌ID',
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类id',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '商品单位ID',
  `spec_id` bigint(20) unsigned DEFAULT '0' COMMENT '规格ID',
  `tags_id` varchar(255) DEFAULT '' COMMENT '商品标签ID',
  `is_code` bigint(1) DEFAULT '1' COMMENT '是否有码商品',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标签',
  `goods_content` text COMMENT '商品内容',
  `goods_logo` varchar(255) DEFAULT '' COMMENT '商品LOGO',
  `goods_image` text COMMENT '商品图片地址',
  `goods_video` varchar(500) DEFAULT '' COMMENT '商品视频URL',
  `goods_desc` varchar(500) DEFAULT '' COMMENT '商品描述',
  `package_stock` bigint(20) unsigned DEFAULT '0' COMMENT '总库存数量',
  `package_sale` bigint(20) unsigned DEFAULT '0' COMMENT '已销售数量',
  `favorite_num` bigint(20) unsigned DEFAULT '0' COMMENT '收藏次数',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '数据排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商城商品主表';

-- ----------------------------
-- Records of store_goods
-- ----------------------------
INSERT INTO `store_goods` VALUES ('1', '0', '0', null, '0', ',,', '1', 'ddd', '', 'http://192.168.31.47/static/upload/00cbe1ebdfe7e146/0e05e5edcec2e771.jpg', 'http://192.168.31.47/static/upload/0b1a0ae70e94a69e/4aa5cadb79c1cc5d.jpg', '', '', '0', '0', '0', '0', '1', '1', '2018-06-13 17:33:00');

-- ----------------------------
-- Table structure for `store_goods_brand`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_brand`;
CREATE TABLE `store_goods_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_logo` varchar(1024) DEFAULT '' COMMENT '品牌logo',
  `brand_cover` varchar(1024) DEFAULT '' COMMENT '品牌封面',
  `brand_title` varchar(255) DEFAULT '' COMMENT '商品品牌名称',
  `brand_desc` text COMMENT '商品品牌描述',
  `brand_detail` text COMMENT '品牌图文信息',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品品牌';

-- ----------------------------
-- Records of store_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_cate`;
CREATE TABLE `store_goods_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '上级分类编号',
  `brand_id` bigint(20) DEFAULT '0' COMMENT '品牌ID',
  `cate_title` varchar(255) DEFAULT '' COMMENT '商品分类名称',
  `cate_desc` text COMMENT '商品分类',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品分类';

-- ----------------------------
-- Records of store_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_list`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_list`;
CREATE TABLE `store_goods_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格名称',
  `goods_number` bigint(20) unsigned DEFAULT '0' COMMENT '商品礼品-商品数量',
  `market_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '销售价格',
  `selling_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品价格',
  `goods_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存统计',
  `goods_sale` bigint(20) unsigned DEFAULT '0' COMMENT '已销售数量',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商城商品列表';

-- ----------------------------
-- Records of store_goods_list
-- ----------------------------
INSERT INTO `store_goods_list` VALUES ('1', '1', 'default:default', '0', '1.00', '1.00', '0', '0', '1', '0', '2018-06-13 17:33:00');

-- ----------------------------
-- Table structure for `store_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_spec`;
CREATE TABLE `store_goods_spec` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mch_id` bigint(20) unsigned DEFAULT '0' COMMENT '商户ID',
  `spec_title` varchar(255) DEFAULT '' COMMENT '商品规格名称',
  `spec_param` varchar(255) DEFAULT '' COMMENT '商品规格参数',
  `spec_desc` varchar(255) DEFAULT '' COMMENT '商品规格描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品规格排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_goods_spec_mch_id` (`mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品规格';

-- ----------------------------
-- Records of store_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_stock`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_stock`;
CREATE TABLE `store_goods_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品属性',
  `goods_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `stock_desc` varchar(255) DEFAULT '' COMMENT '商品库存描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '数据排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品库存';

-- ----------------------------
-- Records of store_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for `store_member`
-- ----------------------------
DROP TABLE IF EXISTS `store_member`;
CREATE TABLE `store_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT '' COMMENT '会员微信OPENID',
  `phone` varchar(16) DEFAULT '' COMMENT '会员手机号',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(20) DEFAULT '' COMMENT '会员昵称',
  `headimg` varchar(500) DEFAULT '' COMMENT '会员头像',
  `sex` char(2) DEFAULT '' COMMENT '性别',
  `level` tinyint(2) unsigned DEFAULT '1' COMMENT '会员级别',
  `remark` varchar(500) DEFAULT '' COMMENT '会员个性签名',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '会员状态(1有效,0无效)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_store_member_openid` (`openid`) USING BTREE,
  KEY `index_store_member_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城会员信息';

-- ----------------------------
-- Records of store_member
-- ----------------------------

-- ----------------------------
-- Table structure for `store_member_address`
-- ----------------------------
DROP TABLE IF EXISTS `store_member_address`;
CREATE TABLE `store_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `username` varchar(20) DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) DEFAULT '' COMMENT '收货地址省份',
  `city` varchar(50) DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0无效, 1新快递)',
  `is_default` tinyint(1) unsigned DEFAULT '1' COMMENT '默认收货地址',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城会员收货地址';

-- ----------------------------
-- Records of store_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for `store_order`
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单类型(1普通订单,2积分订单)',
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` char(10) DEFAULT '' COMMENT '订单号',
  `freight_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费',
  `goods_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品总金额(不含快递费)',
  `real_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '真实支付金额(商品金额+快递金额)',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '订单支付状态(0.未支付,1.已支付)',
  `pay_type` varchar(255) DEFAULT '' COMMENT '支付方式 (wechat微信支付, alipay支付宝支付)',
  `pay_no` varchar(100) DEFAULT '' COMMENT '商户交易号',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `desc` text COMMENT '订单描述',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '订单状态(0.无效,1.新订单,2.待发货,3.已发货,4.已收货,5.已完成,6.已退货及退款)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_order_order_no` (`order_no`) USING BTREE,
  KEY `index_store_order_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单主表';

-- ----------------------------
-- Records of store_order
-- ----------------------------

-- ----------------------------
-- Table structure for `store_order_express`
-- ----------------------------
DROP TABLE IF EXISTS `store_order_express`;
CREATE TABLE `store_order_express` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '快递类型(0.订单快递,1.退货快递)',
  `order_no` char(10) DEFAULT '' COMMENT '订单编号',
  `company_title` varchar(50) DEFAULT '' COMMENT '物流公司名称',
  `company_code` varchar(50) DEFAULT '' COMMENT '物流公司编码',
  `username` varchar(20) DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) DEFAULT NULL COMMENT '收货地址省份',
  `city` varchar(50) DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `send_no` varchar(50) DEFAULT '' COMMENT '实际物流公司单号',
  `send_company_title` varchar(50) DEFAULT '' COMMENT '实际发货快递公司',
  `send_company_code` varchar(50) DEFAULT '' COMMENT '实际发货快递代码',
  `send_username` varchar(255) DEFAULT '' COMMENT '寄件人名称',
  `send_phone` varchar(16) DEFAULT '' COMMENT '寄件人手机号',
  `send_province` varchar(50) DEFAULT '' COMMENT '寄件人地址省份',
  `send_city` varchar(50) DEFAULT '' COMMENT '寄件人地址城市',
  `send_area` varchar(255) DEFAULT '' COMMENT '寄件人地址区域',
  `send_address` varchar(255) DEFAULT '' COMMENT '寄件人详细地址',
  `send_at` datetime DEFAULT NULL COMMENT '快递发货时间',
  `desc` text COMMENT '发货描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.新快递,2.已签收,3.签收失败)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单快递';

-- ----------------------------
-- Records of store_order_express
-- ----------------------------

-- ----------------------------
-- Table structure for `store_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `store_order_goods`;
CREATE TABLE `store_order_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` char(10) DEFAULT '' COMMENT '订单编号',
  `goods_id` bigint(20) DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标签',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格',
  `goods_logo` varchar(255) DEFAULT '' COMMENT '商品LOGO',
  `goods_image` text COMMENT '商品图片地址',
  `market_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '市场价格',
  `selling_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品销售价格',
  `price_field` varchar(20) DEFAULT 'selling_price' COMMENT '计价字段',
  `number` bigint(20) unsigned DEFAULT '0' COMMENT '订单商品数量',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_order_list_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单关联商品';

-- ----------------------------
-- Records of store_order_goods
-- ----------------------------
