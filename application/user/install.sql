/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : esadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-01 12:55:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dusy_announce`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_announce`;
CREATE TABLE `dusy_announce` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `name` varchar(30) NOT NULL,
  `addtime` int(10) NOT NULL,
  `isyong` tinyint(5) NOT NULL DEFAULT '1',
  `adduser` int(10) NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_announce
-- ----------------------------
INSERT INTO `dusy_announce` VALUES ('3', '尊敬的会员：千呼万唤始出来，平台系统已全面升级，新增各大活动优惠邀您参与。如有意见或建议请联系客服反馈！', '0', '1530489643', '1', '10000', '0');

-- ----------------------------
-- Table structure for `dusy_bank`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_bank`;
CREATE TABLE `dusy_bank` (
  `id` int(10) NOT NULL,
  `bankname` varchar(50) DEFAULT NULL,
  `banknumber` varchar(25) NOT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `accountname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_bank
-- ----------------------------
INSERT INTO `dusy_bank` VALUES ('3', '中国建行', '6222021102046285011', '天罪支行', '王章');
INSERT INTO `dusy_bank` VALUES ('100001', '', 'zaiynuoq6124@163.com', '', '肖振新');
INSERT INTO `dusy_bank` VALUES ('10001', '', 'dusy92@163.com', '', '王振');
INSERT INTO `dusy_bank` VALUES ('11214', '', '11@qq.com', '', '经济法');
INSERT INTO `dusy_bank` VALUES ('10011', '', '111', '', '111');
INSERT INTO `dusy_bank` VALUES ('10000', '', 'hxfqgr9575@sandbox.com', '', '沙箱环境');

-- ----------------------------
-- Table structure for `dusy_codepay_order`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_codepay_order`;
CREATE TABLE `dusy_codepay_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) NOT NULL COMMENT '用户ID或订单ID',
  `money` decimal(6,2) NOT NULL COMMENT '实际金额',
  `price` decimal(6,2) NOT NULL COMMENT '原价',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `order_id` varchar(100) NOT NULL,
  `pay_no` varchar(100) DEFAULT NULL COMMENT '流水号',
  `param` varchar(1500) DEFAULT NULL COMMENT '自定义参数',
  `pay_time` varchar(30) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `pay_tag` varchar(100) NOT NULL DEFAULT '0' COMMENT '金额的备注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0代付款 1已付款 2已发货',
  `creat_time` bigint(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `up_time` bigint(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='用于区分是否已经处理';

-- ----------------------------
-- Records of dusy_codepay_order
-- ----------------------------
INSERT INTO `dusy_codepay_order` VALUES ('40', 'dusy92', '-10.00', '-10.00', '4', 'sy_20180705180913333928', null, null, '0', '系统充值', '2', '1530785353', '0');
INSERT INTO `dusy_codepay_order` VALUES ('41', 'ovoym', '200.00', '200.00', '4', 'sy_20181230095040561005', null, null, '0', '系统充值', '2', '1546134640', '0');
INSERT INTO `dusy_codepay_order` VALUES ('42', 'ovoym', '234.00', '234.00', '4', 'sy_20181230095059412671', null, null, '0', '系统充值', '2', '1546134659', '0');
INSERT INTO `dusy_codepay_order` VALUES ('43', 'dusy92', '1000.00', '1000.00', '4', 'sy_20190201114825613196', null, null, '0', '系统充值', '2', '1548992905', '0');
INSERT INTO `dusy_codepay_order` VALUES ('44', 'dusy92', '100.00', '100.00', '4', 'sy_20190201115013359010', null, null, '0', '系统充值', '2', '1548993013', '0');

-- ----------------------------
-- Table structure for `dusy_focus`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_focus`;
CREATE TABLE `dusy_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1启用,0禁用',
  `sort` int(1) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_at` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='幻灯片库';

-- ----------------------------
-- Records of dusy_focus
-- ----------------------------
INSERT INTO `dusy_focus` VALUES ('1', '1', '/static/upload/0e0261c87849063e/a3c4779fe12e1d45.jpg', '#', '第二', '0', '1', null);
INSERT INTO `dusy_focus` VALUES ('4', '11', 'http://127.0.0.1/static/upload/00f5796665022b8b/fe7332aad1310de7.jpg', '#', '首页面焦点图', '1', '0', null);

-- ----------------------------
-- Table structure for `dusy_level`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_level`;
CREATE TABLE `dusy_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `touxian` varchar(20) NOT NULL,
  `jifen` int(15) NOT NULL,
  `jiang` int(10) NOT NULL,
  `tiaojiang` int(10) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_level
-- ----------------------------
INSERT INTO `dusy_level` VALUES ('2', '普通会员', '草民', '10', '1', '1', '0');
INSERT INTO `dusy_level` VALUES ('3', '初级会员', '地主', '200', '5', '6', '0');
INSERT INTO `dusy_level` VALUES ('4', '中级会员', '知县', '1000', '10', '16', '0');
INSERT INTO `dusy_level` VALUES ('5', '高级会员', '通判', '10000', '58', '74', '0');
INSERT INTO `dusy_level` VALUES ('6', '青铜会员', '知府', '50000', '318', '392', '0');
INSERT INTO `dusy_level` VALUES ('1', '非会员', '非会员', '0', '0', '0', '0');
INSERT INTO `dusy_level` VALUES ('8', '白银会员', '总督', '250000', '1688', '2080', '0');
INSERT INTO `dusy_level` VALUES ('9', '黄金会员', '巡抚', '1000000', '6888', '8968', '0');

-- ----------------------------
-- Table structure for `dusy_trade`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_trade`;
CREATE TABLE `dusy_trade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `remark` tinyint(10) NOT NULL,
  `trade` float(10,2) NOT NULL,
  `yue` float(10,2) NOT NULL,
  `bxx` float(10,2) NOT NULL,
  `otime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_trade
-- ----------------------------
INSERT INTO `dusy_trade` VALUES ('113', '10000', '5', '1.00', '3.00', '0.00', '1504564544');
INSERT INTO `dusy_trade` VALUES ('114', '10000', '5', '10.00', '23.00', '0.00', '1504564573');
INSERT INTO `dusy_trade` VALUES ('115', '10000', '5', '10.00', '43.00', '0.00', '1504564660');
INSERT INTO `dusy_trade` VALUES ('116', '10000', '5', '10.00', '63.00', '0.00', '1504564882');
INSERT INTO `dusy_trade` VALUES ('117', '10000', '5', '10.00', '73.00', '0.00', '1504564895');
INSERT INTO `dusy_trade` VALUES ('118', '10000', '5', '10.00', '83.00', '0.00', '1504565055');
INSERT INTO `dusy_trade` VALUES ('119', '10000', '5', '15.00', '103.00', '0.00', '1504565089');
INSERT INTO `dusy_trade` VALUES ('120', '10000', '5', '6.00', '94.00', '0.00', '1504565124');
INSERT INTO `dusy_trade` VALUES ('121', '10000', '5', '8.00', '102.00', '0.00', '1504565136');
INSERT INTO `dusy_trade` VALUES ('122', '10000', '5', '5.00', '107.00', '0.00', '1504565175');
INSERT INTO `dusy_trade` VALUES ('123', '10000', '5', '5.00', '112.00', '0.00', '1504565302');
INSERT INTO `dusy_trade` VALUES ('124', '10000', '5', '5.00', '117.00', '0.00', '1504565402');
INSERT INTO `dusy_trade` VALUES ('125', '10000', '8', '1.00', '118.00', '0.00', '1504566516');
INSERT INTO `dusy_trade` VALUES ('126', '10000', '8', '5.00', '123.00', '0.00', '1504566595');
INSERT INTO `dusy_trade` VALUES ('127', '10000', '8', '74.00', '197.00', '0.00', '1504566663');
INSERT INTO `dusy_trade` VALUES ('128', '10000', '9', '-100.00', '97.00', '0.00', '1504609567');
INSERT INTO `dusy_trade` VALUES ('129', '10000', '1', '-20.00', '77.00', '0.00', '1504609894');
INSERT INTO `dusy_trade` VALUES ('130', '10000', '1', '-20.00', '57.00', '0.00', '1504609894');
INSERT INTO `dusy_trade` VALUES ('131', '10000', '6', '-10.00', '47.00', '10.00', '1504609979');
INSERT INTO `dusy_trade` VALUES ('132', '10000', '7', '10.00', '57.00', '0.00', '1504609994');
INSERT INTO `dusy_trade` VALUES ('133', '3', '4', '100.00', '763.32', '22.00', '1504610083');
INSERT INTO `dusy_trade` VALUES ('134', '10000', '2', '39.20', '96.20', '0.00', '1504610221');
INSERT INTO `dusy_trade` VALUES ('135', '10000', '5', '100.00', '196.20', '0.00', '1504611143');
INSERT INTO `dusy_trade` VALUES ('136', '10000', '9', '-100.00', '96.20', '0.00', '1504611170');
INSERT INTO `dusy_trade` VALUES ('137', '10000', '4', '100.00', '196.20', '0.00', '1504611199');
INSERT INTO `dusy_trade` VALUES ('138', '10000', '9', '-100.00', '96.20', '0.00', '1504611333');
INSERT INTO `dusy_trade` VALUES ('139', '10000', '5', '1000.00', '1096.20', '0.00', '1504611426');
INSERT INTO `dusy_trade` VALUES ('140', '10000', '9', '-100.00', '996.20', '0.00', '1504611494');
INSERT INTO `dusy_trade` VALUES ('141', '10000', '4', '100.00', '1096.20', '0.00', '1504611529');
INSERT INTO `dusy_trade` VALUES ('142', '10000', '4', '100.00', '1196.20', '0.00', '1504611663');
INSERT INTO `dusy_trade` VALUES ('143', '3', '4', '100.00', '863.32', '22.00', '1504611678');
INSERT INTO `dusy_trade` VALUES ('144', '10001', '5', '1000.00', '1000.00', '0.00', '1504612327');
INSERT INTO `dusy_trade` VALUES ('145', '10001', '9', '-100.00', '900.00', '0.00', '1504612347');
INSERT INTO `dusy_trade` VALUES ('146', '10001', '1', '-58.00', '842.00', '0.00', '1504612415');
INSERT INTO `dusy_trade` VALUES ('147', '10001', '1', '-29.00', '813.00', '0.00', '1504612415');
INSERT INTO `dusy_trade` VALUES ('148', '10001', '2', '113.68', '926.68', '0.00', '1504612621');
INSERT INTO `dusy_trade` VALUES ('149', '10001', '2', '56.84', '983.52', '0.00', '1504612621');
INSERT INTO `dusy_trade` VALUES ('150', '10001', '1', '-47.00', '936.52', '0.00', '1504612857');
INSERT INTO `dusy_trade` VALUES ('151', '10001', '1', '-15.00', '921.52', '0.00', '1504612857');
INSERT INTO `dusy_trade` VALUES ('152', '10001', '2', '29.40', '950.92', '0.00', '1504613221');
INSERT INTO `dusy_trade` VALUES ('153', '10001', '5', '1000.00', '1950.92', '0.00', '1504613300');
INSERT INTO `dusy_trade` VALUES ('154', '10001', '8', '16.00', '1966.92', '0.00', '1504613319');
INSERT INTO `dusy_trade` VALUES ('155', '10011', '5', '125.00', '125.00', '0.00', '1504619603');
INSERT INTO `dusy_trade` VALUES ('156', '10012', '5', '210.00', '210.00', '0.00', '1504619641');
INSERT INTO `dusy_trade` VALUES ('157', '10000', '13', '20.00', '230.00', '0.00', '1504619730');
INSERT INTO `dusy_trade` VALUES ('158', '10013', '5', '300.00', '300.00', '0.00', '1504619848');
INSERT INTO `dusy_trade` VALUES ('159', '10000', '13', '20.00', '1236.20', '0.00', '1504619918');
INSERT INTO `dusy_trade` VALUES ('160', '10000', '1', '-44.00', '1192.20', '0.00', '1504625146');
INSERT INTO `dusy_trade` VALUES ('161', '10000', '1', '-66.00', '1126.20', '0.00', '1504625146');
INSERT INTO `dusy_trade` VALUES ('162', '10000', '2', '86.24', '1212.44', '0.00', '1504625521');
INSERT INTO `dusy_trade` VALUES ('163', '10000', '3', '0.30', '1212.74', '0.00', '1504627531');
INSERT INTO `dusy_trade` VALUES ('164', '10000', '1', '-44.00', '1168.74', '0.00', '1504628800');
INSERT INTO `dusy_trade` VALUES ('165', '10000', '1', '-1.00', '1167.74', '0.00', '1504628800');
INSERT INTO `dusy_trade` VALUES ('166', '10000', '2', '86.24', '1253.98', '0.00', '1504629121');
INSERT INTO `dusy_trade` VALUES ('167', '10000', '2', '1.96', '1255.94', '0.00', '1504629121');
INSERT INTO `dusy_trade` VALUES ('168', '10000', '1', '-4.00', '1251.94', '0.00', '1504629845');
INSERT INTO `dusy_trade` VALUES ('169', '10000', '2', '7.84', '1259.78', '0.00', '1504630021');
INSERT INTO `dusy_trade` VALUES ('170', '10000', '1', '-55.00', '1204.78', '0.00', '1504633041');
INSERT INTO `dusy_trade` VALUES ('171', '10000', '1', '-22.00', '1182.78', '0.00', '1504633041');
INSERT INTO `dusy_trade` VALUES ('172', '10000', '2', '107.80', '1290.58', '0.00', '1504633321');
INSERT INTO `dusy_trade` VALUES ('173', '10000', '1', '-45.00', '1245.58', '0.00', '1504633753');
INSERT INTO `dusy_trade` VALUES ('174', '10000', '1', '-33.00', '1212.58', '0.00', '1504633753');
INSERT INTO `dusy_trade` VALUES ('175', '10000', '2', '88.20', '1300.78', '0.00', '1504633921');
INSERT INTO `dusy_trade` VALUES ('176', '10000', '1', '-67.00', '1233.78', '0.00', '1504636000');
INSERT INTO `dusy_trade` VALUES ('177', '10000', '1', '-55.00', '1178.78', '0.00', '1504636000');
INSERT INTO `dusy_trade` VALUES ('178', '10000', '2', '131.32', '1310.10', '0.00', '1504636321');
INSERT INTO `dusy_trade` VALUES ('179', '10000', '2', '107.80', '1417.90', '0.00', '1504636321');
INSERT INTO `dusy_trade` VALUES ('180', '10000', '1', '-77.00', '1340.90', '0.00', '1504636357');
INSERT INTO `dusy_trade` VALUES ('181', '10000', '1', '-6.00', '1334.90', '0.00', '1504636357');
INSERT INTO `dusy_trade` VALUES ('182', '10000', '1', '-88.00', '1246.90', '0.00', '1504638139');
INSERT INTO `dusy_trade` VALUES ('183', '10000', '1', '-66.00', '1180.90', '0.00', '1504638139');
INSERT INTO `dusy_trade` VALUES ('184', '10000', '2', '172.48', '1353.38', '0.00', '1504638421');
INSERT INTO `dusy_trade` VALUES ('185', '10000', '2', '129.36', '1482.74', '0.00', '1504638421');
INSERT INTO `dusy_trade` VALUES ('186', '10000', '1', '-88.00', '1394.74', '0.00', '1504639469');
INSERT INTO `dusy_trade` VALUES ('187', '10000', '1', '-16.00', '1378.74', '0.00', '1504639469');
INSERT INTO `dusy_trade` VALUES ('188', '10000', '2', '172.48', '1551.22', '0.00', '1504639621');
INSERT INTO `dusy_trade` VALUES ('189', '10000', '2', '31.36', '1582.58', '0.00', '1504639621');
INSERT INTO `dusy_trade` VALUES ('190', '10001', '9', '-100.00', '1866.92', '0.00', '1504722336');
INSERT INTO `dusy_trade` VALUES ('191', '10001', '9', '-100.00', '1766.92', '0.00', '1504722345');
INSERT INTO `dusy_trade` VALUES ('192', '10001', '9', '-100.00', '1666.92', '0.00', '1504722356');
INSERT INTO `dusy_trade` VALUES ('193', '10000', '9', '-100.00', '1482.58', '0.00', '1504722534');
INSERT INTO `dusy_trade` VALUES ('194', '10000', '9', '-100.00', '1382.58', '0.00', '1504722589');
INSERT INTO `dusy_trade` VALUES ('195', '10000', '9', '-100.00', '1282.58', '0.00', '1504722652');
INSERT INTO `dusy_trade` VALUES ('196', '10000', '9', '-100.00', '1182.58', '0.00', '1504722760');
INSERT INTO `dusy_trade` VALUES ('197', '10000', '9', '-100.00', '1082.58', '0.00', '1504723028');
INSERT INTO `dusy_trade` VALUES ('198', '10000', '4', '100.00', '1182.58', '0.00', '1504725416');
INSERT INTO `dusy_trade` VALUES ('199', '3', '1', '-96.00', '767.32', '22.00', '1504728733');
INSERT INTO `dusy_trade` VALUES ('200', '3', '1', '-56.00', '711.32', '22.00', '1504728733');
INSERT INTO `dusy_trade` VALUES ('201', '11214', '5', '10.00', '10.00', '0.00', '1504773810');
INSERT INTO `dusy_trade` VALUES ('202', '11214', '5', '10.00', '10.00', '0.00', '1504773810');
INSERT INTO `dusy_trade` VALUES ('203', '11214', '5', '5.00', '15.00', '0.00', '1504773998');
INSERT INTO `dusy_trade` VALUES ('204', '11214', '5', '5.00', '15.00', '0.00', '1504773998');
INSERT INTO `dusy_trade` VALUES ('205', '11214', '5', '12.00', '27.00', '0.00', '1504774032');
INSERT INTO `dusy_trade` VALUES ('206', '11214', '5', '14.00', '41.00', '0.00', '1504777026');
INSERT INTO `dusy_trade` VALUES ('207', '11214', '8', '1.00', '132.00', '0.00', '1504777971');
INSERT INTO `dusy_trade` VALUES ('208', '11214', '5', '18.00', '132.00', '0.00', '1504777989');
INSERT INTO `dusy_trade` VALUES ('209', '11214', '5', '5.00', '150.00', '0.00', '1504778016');
INSERT INTO `dusy_trade` VALUES ('210', '11214', '5', '52.00', '155.00', '0.00', '1504778062');
INSERT INTO `dusy_trade` VALUES ('211', '11214', '5', '52.00', '259.00', '0.00', '1504778135');
INSERT INTO `dusy_trade` VALUES ('212', '11214', '5', '10.00', '269.00', '0.00', '1504778154');
INSERT INTO `dusy_trade` VALUES ('213', '11214', '8', '16.00', '285.00', '0.00', '1504778480');
INSERT INTO `dusy_trade` VALUES ('214', '11214', '8', '392.00', '677.00', '0.00', '1504778751');
INSERT INTO `dusy_trade` VALUES ('215', '11214', '9', '-100.00', '577.00', '0.00', '1504778822');
INSERT INTO `dusy_trade` VALUES ('216', '11214', '5', '5.00', '582.00', '0.00', '1504778905');
INSERT INTO `dusy_trade` VALUES ('217', '3', '13', '20.00', '731.32', '0.00', '1504779412');
INSERT INTO `dusy_trade` VALUES ('218', '3', '5', '5.00', '736.32', '22.00', '1504779683');
INSERT INTO `dusy_trade` VALUES ('219', '10011', '8', '1.00', '126.00', '0.00', '1505117772');
INSERT INTO `dusy_trade` VALUES ('220', '10011', '6', '-111.00', '15.00', '111.00', '1510637308');
INSERT INTO `dusy_trade` VALUES ('221', '10011', '7', '11.00', '26.00', '100.00', '1510637319');
INSERT INTO `dusy_trade` VALUES ('222', '10011', '1', '-11.00', '15.00', '100.00', '1514884490');
INSERT INTO `dusy_trade` VALUES ('223', '10011', '1', '-11.00', '4.00', '100.00', '1514884490');
INSERT INTO `dusy_trade` VALUES ('224', '10011', '2', '21.56', '25.56', '100.00', '1514884621');
INSERT INTO `dusy_trade` VALUES ('225', '10011', '2', '21.56', '47.12', '100.00', '1514884621');
INSERT INTO `dusy_trade` VALUES ('226', '10011', '2', '21.56', '68.68', '100.00', '1529422532');
INSERT INTO `dusy_trade` VALUES ('227', '10000', '1', '-11.00', '1171.58', '0.00', '1529432641');
INSERT INTO `dusy_trade` VALUES ('228', '10000', '1', '-11.00', '1160.58', '0.00', '1529433374');
INSERT INTO `dusy_trade` VALUES ('229', '10000', '1', '-222.00', '938.58', '0.00', '1529433713');
INSERT INTO `dusy_trade` VALUES ('230', '10000', '1', '-33.00', '905.58', '0.00', '1529433724');
INSERT INTO `dusy_trade` VALUES ('231', '10000', '1', '-21.00', '884.58', '0.00', '1529433724');
INSERT INTO `dusy_trade` VALUES ('232', '10000', '1', '-44.00', '840.58', '0.00', '1529433851');
INSERT INTO `dusy_trade` VALUES ('233', '10000', '1', '-32.00', '808.58', '0.00', '1529433851');
INSERT INTO `dusy_trade` VALUES ('234', '10000', '1', '-11.00', '797.58', '0.00', '1529490848');
INSERT INTO `dusy_trade` VALUES ('235', '10000', '2', '21.45', '819.03', '0.00', '1529491583');
INSERT INTO `dusy_trade` VALUES ('236', '10000', '2', '21.45', '840.48', '0.00', '1529491646');
INSERT INTO `dusy_trade` VALUES ('237', '10000', '1', '-232.00', '608.48', '0.00', '1529492023');
INSERT INTO `dusy_trade` VALUES ('238', '10000', '1', '-32.00', '576.48', '0.00', '1529492038');
INSERT INTO `dusy_trade` VALUES ('239', '10000', '2', '62.40', '638.88', '0.00', '1529492746');
INSERT INTO `dusy_trade` VALUES ('240', '10000', '1', '-12.00', '626.88', '0.00', '1529493022');
INSERT INTO `dusy_trade` VALUES ('241', '10000', '1', '-12.00', '614.88', '0.00', '1529493022');
INSERT INTO `dusy_trade` VALUES ('242', '10000', '2', '23.40', '638.28', '0.00', '1529493951');
INSERT INTO `dusy_trade` VALUES ('243', '10000', '1', '-12.00', '626.28', '0.00', '1529495157');
INSERT INTO `dusy_trade` VALUES ('244', '10000', '1', '-11.00', '615.28', '0.00', '1529495189');
INSERT INTO `dusy_trade` VALUES ('245', '10000', '1', '-21.00', '594.28', '0.00', '1529495189');
INSERT INTO `dusy_trade` VALUES ('246', '10000', '1', '-100.00', '494.28', '0.00', '1529496133');
INSERT INTO `dusy_trade` VALUES ('247', '10000', '1', '-200.00', '294.28', '0.00', '1529496152');
INSERT INTO `dusy_trade` VALUES ('248', '10000', '1', '-100.00', '194.28', '0.00', '1529499743');
INSERT INTO `dusy_trade` VALUES ('249', '10000', '1', '-12.00', '182.28', '0.00', '1529499751');
INSERT INTO `dusy_trade` VALUES ('250', '10000', '1', '-12.00', '170.28', '0.00', '1529499751');
INSERT INTO `dusy_trade` VALUES ('251', '10000', '2', '195.00', '365.28', '0.00', '1529500553');
INSERT INTO `dusy_trade` VALUES ('252', '10000', '2', '23.40', '388.68', '0.00', '1529500553');
INSERT INTO `dusy_trade` VALUES ('253', '10000', '2', '23.40', '412.08', '0.00', '1529500553');
INSERT INTO `dusy_trade` VALUES ('254', '10000', '1', '-200.00', '212.08', '0.00', '1529502653');
INSERT INTO `dusy_trade` VALUES ('255', '10000', '1', '-11.00', '201.08', '0.00', '1529504892');
INSERT INTO `dusy_trade` VALUES ('256', '10000', '2', '390.00', '591.08', '0.00', '1529504908');
INSERT INTO `dusy_trade` VALUES ('257', '10000', '2', '21.45', '612.53', '0.00', '1529505051');
INSERT INTO `dusy_trade` VALUES ('258', '10000', '1', '-100.00', '512.53', '0.00', '1529505132');
INSERT INTO `dusy_trade` VALUES ('259', '10000', '1', '-200.00', '312.53', '0.00', '1529505370');
INSERT INTO `dusy_trade` VALUES ('260', '10000', '1', '-11.00', '301.53', '0.00', '1529505789');
INSERT INTO `dusy_trade` VALUES ('261', '10000', '1', '-12.00', '289.53', '0.00', '1529505987');
INSERT INTO `dusy_trade` VALUES ('262', '10000', '1', '-222.00', '67.53', '0.00', '1529506094');
INSERT INTO `dusy_trade` VALUES ('263', '10000', '2', '432.90', '500.43', '0.00', '1529506240');
INSERT INTO `dusy_trade` VALUES ('264', '10000', '1', '-111.00', '389.43', '0.00', '1529506327');
INSERT INTO `dusy_trade` VALUES ('265', '10000', '1', '-55.00', '334.43', '0.00', '1529516226');
INSERT INTO `dusy_trade` VALUES ('266', '10000', '1', '-333.00', '1.43', '0.00', '1529516713');
INSERT INTO `dusy_trade` VALUES ('267', '10000', '2', '107.25', '108.68', '0.00', '1529516746');
INSERT INTO `dusy_trade` VALUES ('268', '10000', '1', '-3000.00', '997000.00', '0.00', '1529517055');
INSERT INTO `dusy_trade` VALUES ('269', '10000', '1', '-3000.00', '994000.00', '0.00', '1529517420');
INSERT INTO `dusy_trade` VALUES ('270', '10000', '2', '5850.00', '999850.00', '0.00', '1529517641');
INSERT INTO `dusy_trade` VALUES ('271', '10000', '1', '-3000.00', '996850.00', '0.00', '1529517850');
INSERT INTO `dusy_trade` VALUES ('272', '10000', '1', '-3999.00', '992851.00', '0.00', '1529517862');
INSERT INTO `dusy_trade` VALUES ('273', '10000', '1', '-2500.00', '990351.00', '0.00', '1529517872');
INSERT INTO `dusy_trade` VALUES ('274', '10000', '3', '3.27', '990354.25', '0.00', '1529518603');
INSERT INTO `dusy_trade` VALUES ('275', '10000', '1', '-122.00', '990232.25', '0.00', '1529530564');
INSERT INTO `dusy_trade` VALUES ('276', '10000', '2', '237.90', '990470.12', '0.00', '1529546766');
INSERT INTO `dusy_trade` VALUES ('277', '10000', '2', '7798.05', '998268.19', '0.00', '1529547366');
INSERT INTO `dusy_trade` VALUES ('278', '10000', '2', '4875.00', '1003143.19', '0.00', '1529547366');
INSERT INTO `dusy_trade` VALUES ('279', '10000', '1', '-12333.00', '990810.19', '0.00', '1529593340');
INSERT INTO `dusy_trade` VALUES ('280', '10000', '2', '24049.35', '1014859.56', '0.00', '1529593856');
INSERT INTO `dusy_trade` VALUES ('281', '10000', '1', '-111.00', '1014748.56', '0.00', '1529604131');
INSERT INTO `dusy_trade` VALUES ('282', '10000', '3', '113.37', '1014861.94', '0.00', '1529614949');
INSERT INTO `dusy_trade` VALUES ('283', '10000', '3', '0.22', '1014862.19', '0.00', '1529718747');
INSERT INTO `dusy_trade` VALUES ('284', '10000', '1', '-3000.00', '1011862.19', '0.00', '1529900290');
INSERT INTO `dusy_trade` VALUES ('285', '10000', '5', '0.01', '10.02', '0.00', '1530770472');
INSERT INTO `dusy_trade` VALUES ('286', '10000', '14', '100.00', '410.01', '0.00', '1530784868');
INSERT INTO `dusy_trade` VALUES ('287', '10000', '14', '10.00', '420.01', '0.00', '1530785114');
INSERT INTO `dusy_trade` VALUES ('288', '10000', '14', '107.00', '420.01', '107.00', '1530785217');
INSERT INTO `dusy_trade` VALUES ('289', '10000', '14', '-100.00', '320.01', '107.00', '1530785262');
INSERT INTO `dusy_trade` VALUES ('290', '10000', '14', '-10.00', '310.01', '107.00', '1530785353');
INSERT INTO `dusy_trade` VALUES ('291', '10001', '4', '100.00', '1766.92', '0.00', '1530791410');
INSERT INTO `dusy_trade` VALUES ('292', '10001', '4', '100.00', '1866.92', '0.00', '1530791523');
INSERT INTO `dusy_trade` VALUES ('293', '10000', '4', '100.00', '410.01', '107.00', '1530791534');
INSERT INTO `dusy_trade` VALUES ('294', '10001', '4', '100.00', '1966.92', '0.00', '1530791962');
INSERT INTO `dusy_trade` VALUES ('295', '10000', '9', '-100.00', '310.01', '107.00', '1530792034');
INSERT INTO `dusy_trade` VALUES ('296', '10001', '4', '100.00', '2066.92', '0.00', '1530792076');
INSERT INTO `dusy_trade` VALUES ('297', '10000', '9', '-100.00', '210.01', '107.00', '1530792300');
INSERT INTO `dusy_trade` VALUES ('298', '10000', '4', '100.00', '310.01', '107.00', '1530793173');
INSERT INTO `dusy_trade` VALUES ('299', '11214', '4', '100.00', '682.00', '0.00', '1530793306');
INSERT INTO `dusy_trade` VALUES ('300', '10000', '4', '100.00', '410.01', '107.00', '1530793406');
INSERT INTO `dusy_trade` VALUES ('301', '10000', '4', '100.00', '510.01', '107.00', '1530793447');
INSERT INTO `dusy_trade` VALUES ('302', '10000', '4', '100.00', '610.01', '107.00', '1530793474');
INSERT INTO `dusy_trade` VALUES ('303', '11214', '4', '100.00', '782.00', '0.00', '1530793488');
INSERT INTO `dusy_trade` VALUES ('304', '10000', '1', '-22.00', '588.01', '107.00', '1530812278');
INSERT INTO `dusy_trade` VALUES ('305', '10000', '1', '-22.00', '566.01', '107.00', '1530812323');
INSERT INTO `dusy_trade` VALUES ('306', '10000', '1', '-22.00', '544.01', '107.00', '1530812451');
INSERT INTO `dusy_trade` VALUES ('307', '10000', '2', '42.90', '586.91', '107.00', '1530812755');
INSERT INTO `dusy_trade` VALUES ('308', '10000', '2', '42.90', '629.81', '107.00', '1530812755');
INSERT INTO `dusy_trade` VALUES ('309', '11250', '15', '10.00', '10.00', '0.00', '1530973484');
INSERT INTO `dusy_trade` VALUES ('310', '11214', '15', '-10.00', '772.00', '0.00', '1530973484');
INSERT INTO `dusy_trade` VALUES ('311', '11250', '15', '25.00', '35.00', '0.00', '1530973516');
INSERT INTO `dusy_trade` VALUES ('312', '11214', '15', '-25.00', '747.00', '0.00', '1530973516');
INSERT INTO `dusy_trade` VALUES ('313', '10000', '1', '-14.00', '615.81', '107.00', '1530982512');
INSERT INTO `dusy_trade` VALUES ('314', '10000', '1', '-13.00', '602.81', '107.00', '1530982512');
INSERT INTO `dusy_trade` VALUES ('315', '10000', '1', '-12.00', '590.81', '107.00', '1530982512');
INSERT INTO `dusy_trade` VALUES ('316', '10000', '1', '-3.00', '587.81', '107.00', '1530982570');
INSERT INTO `dusy_trade` VALUES ('317', '10000', '1', '-2.00', '585.81', '107.00', '1530982570');
INSERT INTO `dusy_trade` VALUES ('318', '10000', '1', '-1.00', '584.81', '107.00', '1530982570');
INSERT INTO `dusy_trade` VALUES ('319', '10000', '1', '-4.00', '580.81', '107.00', '1530982694');
INSERT INTO `dusy_trade` VALUES ('320', '10000', '1', '-3.00', '577.81', '107.00', '1530982694');
INSERT INTO `dusy_trade` VALUES ('321', '10000', '1', '-2.00', '575.81', '107.00', '1530982694');
INSERT INTO `dusy_trade` VALUES ('322', '10000', '1', '-14.00', '561.81', '107.00', '1530983071');
INSERT INTO `dusy_trade` VALUES ('323', '10000', '1', '-13.00', '548.81', '107.00', '1530983071');
INSERT INTO `dusy_trade` VALUES ('324', '10000', '1', '-12.00', '536.81', '107.00', '1530983071');
INSERT INTO `dusy_trade` VALUES ('325', '10000', '2', '23.40', '560.21', '107.00', '1530983150');
INSERT INTO `dusy_trade` VALUES ('326', '10000', '2', '1.95', '562.16', '107.00', '1530983150');
INSERT INTO `dusy_trade` VALUES ('327', '10000', '2', '3.90', '566.06', '107.00', '1530983150');
INSERT INTO `dusy_trade` VALUES ('328', '10000', '2', '27.30', '593.36', '107.00', '1530983451');
INSERT INTO `dusy_trade` VALUES ('329', '11256', '14', '200.00', '200.00', '0.00', '1546134640');
INSERT INTO `dusy_trade` VALUES ('330', '11256', '14', '234.00', '200.00', '234.00', '1546134659');
INSERT INTO `dusy_trade` VALUES ('331', '11254', '15', '10.00', '10.00', '0.00', '1546134771');
INSERT INTO `dusy_trade` VALUES ('332', '11256', '15', '-10.00', '190.00', '234.00', '1546134772');
INSERT INTO `dusy_trade` VALUES ('333', '11254', '15', '10.00', '10.00', '10.00', '1546134801');
INSERT INTO `dusy_trade` VALUES ('334', '11256', '15', '-10.00', '190.00', '224.00', '1546134802');
INSERT INTO `dusy_trade` VALUES ('335', '11254', '15', '10.00', '10.00', '20.00', '1546134832');
INSERT INTO `dusy_trade` VALUES ('336', '11256', '15', '-10.00', '190.00', '214.00', '1546134832');
INSERT INTO `dusy_trade` VALUES ('337', '11254', '15', '10.00', '10.00', '20.00', '1546134852');
INSERT INTO `dusy_trade` VALUES ('338', '11254', '15', '-10.00', '10.00', '20.00', '1546134852');
INSERT INTO `dusy_trade` VALUES ('339', '11254', '15', '20.00', '10.00', '20.00', '1546134864');
INSERT INTO `dusy_trade` VALUES ('340', '11254', '15', '-20.00', '10.00', '20.00', '1546134864');
INSERT INTO `dusy_trade` VALUES ('341', '11256', '15', '111.00', '190.00', '214.00', '1546135646');
INSERT INTO `dusy_trade` VALUES ('342', '11256', '15', '-111.00', '190.00', '214.00', '1546135646');

-- ----------------------------
-- Table structure for `dusy_user`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_user`;
CREATE TABLE `dusy_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL DEFAULT '匿名',
  `password` varchar(100) NOT NULL,
  `rpassword` varchar(100) NOT NULL COMMENT '取款密码',
  `avator` varchar(300) DEFAULT NULL,
  `sex` tinyint(5) DEFAULT '1' COMMENT '0:女  1：男',
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(30) DEFAULT NULL,
  `level` tinyint(10) NOT NULL DEFAULT '1' COMMENT '会员等级',
  `point` int(15) NOT NULL DEFAULT '1' COMMENT '成长积分',
  `isgetawards` tinyint(5) NOT NULL DEFAULT '1' COMMENT '1:已领取 2:没领',
  `money` float(15,2) NOT NULL DEFAULT '0.00',
  `dongjiemoney` float(15,2) NOT NULL DEFAULT '0.00',
  `register_time` int(10) NOT NULL,
  `register_ip` varchar(30) NOT NULL,
  `isforbid` tinyint(5) NOT NULL DEFAULT '0' COMMENT '0:不禁止 1：禁止登陆',
  `tuijianren` int(10) NOT NULL DEFAULT '0' COMMENT '推荐人id',
  `is_daili` tinyint(2) NOT NULL DEFAULT '0',
  `daili_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 申请中 1 已申请 2申请失败',
  `desc` varchar(110) DEFAULT NULL,
  `desc_err` varchar(110) NOT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_user
-- ----------------------------
INSERT INTO `dusy_user` VALUES ('10001', 'jiage', '王建立', '1acc214494915da3e860c7f005b27f60', '1200', null, '1', '18962294385', null, '1922884595', '4', '1000', '1', '2066.92', '0.00', '1504611784', '112.86.42.131', '0', '0', '0', '0', null, '', '1548613505', '127.0.0.1');
INSERT INTO `dusy_user` VALUES ('11251', 'gchci', '匿名', '82c707f5283493ac778aa3c0a6a7ab23', '9102', null, '1', null, null, null, '1', '1', '1', '0.00', '0.00', '1530795698', '127.0.0.1', '0', '0', '1', '1', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11252', 'tsyrq', '匿名', '248937426a54488e808c22003e62839c', '8545', null, '1', null, null, null, '1', '1', '1', '0.00', '0.00', '1530795798', '127.0.0.1', '0', '0', '1', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10000', 'dusy92', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1200', 'http://127.0.0.1/Public/image/C6021F3486D2B2DB.jpg', '1', '13812865384', null, '1922884595', '5', '22031', '1', '593.36', '107.00', '1504558612', '153.34.145.26', '0', '0', '1', '1', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10002', 'jiage1', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '1', '1', '1', '0.00', '0.00', '1504614693', '112.86.42.131', '0', '0', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10003', 'jiage2', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '1', '1', '1', '0.00', '0.00', '1504614741', '112.86.42.131', '1', '0', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11255', 'gahme', '匿名', '39d9d66f9d7fe8525fca11ec791ff4d1', '1899', null, '1', null, null, null, '1', '1', '1', '0.00', '0.00', '1531032744', '127.0.0.1', '0', '0', '1', '1', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10007', 'jiage6', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '1', '1', '1', '0.00', '0.00', '1504615448', '112.86.42.131', '0', '0', '1', '2', null, 'fuck you', null, null);
INSERT INTO `dusy_user` VALUES ('11254', 'xwakp', '匿名', '4d30d83ebb4e34c25b110312eb2efd47', '5362', null, '1', null, null, null, '1', '1', '1', '10.00', '20.00', '1531032733', '127.0.0.1', '0', '0', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11253', 'dcwhf', '匿名', '652b68012043bbef5146960ab94df99c', '3753', null, '1', null, null, null, '1', '1', '1', '0.00', '0.00', '1530795828', '127.0.0.1', '0', '0', '1', '1', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11250', 'wwykd', '匿名', 'd2cd7ae6323b36fa83cc134a9b99cb49', '9225', null, '1', null, null, null, '1', '1', '1', '35.00', '0.00', '1529900003', '127.0.0.1', '0', '0', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10011', 'jiage10', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '2', '125', '1', '68.68', '100.00', '1504615994', '112.86.42.131', '0', '10000', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10012', 'jiage11', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '1', '210', '1', '210.00', '0.00', '1504616140', '112.86.42.131', '0', '10000', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('10013', 'jiage12', '匿名', 'd1f4a3c3fcfb2a82ee30a7363b9aebc9', '1000', null, '1', '18962294385', null, '1922884595', '1', '300', '1', '300.00', '0.00', '1504616165', '112.86.42.131', '0', '10000', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11214', 'test', '匿名', '098f6bcd4621d373cade4e832627b4f6', '1230', 'http://www.dusy110.top/Public/image/1EF6FC3ACCBCD762.jpg', '1', '18962294385', null, '1922884595', '6', '223405', '1', '747.00', '0.00', '1504773524', '112.86.41.188', '0', '3', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11256', 'ovoym', '王者无敌', '7b78305fa3ddc14b504cd4440bde8523', '7898', null, '1', '', null, null, '1', '1', '1', '190.00', '214.00', '1546133466', '127.0.0.1', '0', '0', '0', '0', null, '', null, null);
INSERT INTO `dusy_user` VALUES ('11257', 'admin', '隔壁老王啊', 'c84b2990d18a24ad52c3c992451591c0', '', null, '1', null, '1922884595@qq.com', null, '1', '1', '1', '0.00', '0.00', '1546170709', '127.0.0.1', '0', '0', '0', '0', 'EsayAdmin后台管理系统开发者！~EsayAdmin后台管理系统开发者！~EsayAdmin后台管理系统开发者！~EsayAdmin后台管理系统开发者！~', '', null, null);
INSERT INTO `dusy_user` VALUES ('11274', 'acnty', '匿名', '838bbe8fc371672e4dfb977f117d2fd8', '1785', null, '1', null, null, null, '1', '1', '1', '0.00', '0.00', '1546272549', '127.0.0.1', '0', '0', '0', '0', null, '', null, null);

-- ----------------------------
-- Table structure for `dusy_withdrawal`
-- ----------------------------
DROP TABLE IF EXISTS `dusy_withdrawal`;
CREATE TABLE `dusy_withdrawal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '0' COMMENT '0:提交申请 1：成功 2：失败，返回余额',
  `create_time` int(10) NOT NULL,
  `opt_time` int(10) DEFAULT NULL,
  `opt_admin` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dusy_withdrawal
-- ----------------------------
INSERT INTO `dusy_withdrawal` VALUES ('17', '10000', '100', '1', '1504723028', '1530793692', 'admin', '提现已成功到账，请注意查收！');
INSERT INTO `dusy_withdrawal` VALUES ('18', '11214', '100', '2', '1504778822', '1530793488', 'admin', '收款用户姓名或其它信息不一致');
INSERT INTO `dusy_withdrawal` VALUES ('19', '10000', '100', '1', '1530792034', '1530793526', 'admin', '提现已成功到账，请注意查收！');
INSERT INTO `dusy_withdrawal` VALUES ('20', '10000', '100', '2', '1530792300', '1530793474', 'admin', '提现失败，请稍后再试！');
