/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : policyadmin

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-03-13 13:07:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bigcenter
-- ----------------------------
DROP TABLE IF EXISTS `t_bigcenter`;
CREATE TABLE `t_bigcenter` (
  `bigCenterId` int(11) NOT NULL AUTO_INCREMENT,
  `bigCenterName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bigCenterId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bigcenter
-- ----------------------------
INSERT INTO `t_bigcenter` VALUES ('1', '客服中心');
INSERT INTO `t_bigcenter` VALUES ('2', '商务中心');
INSERT INTO `t_bigcenter` VALUES ('3', '渠道');
INSERT INTO `t_bigcenter` VALUES ('4', '其他');
INSERT INTO `t_bigcenter` VALUES ('5', 'admin');

-- ----------------------------
-- Table structure for t_center
-- ----------------------------
DROP TABLE IF EXISTS `t_center`;
CREATE TABLE `t_center` (
  `centerId` int(11) NOT NULL AUTO_INCREMENT,
  `centerName` varchar(255) DEFAULT NULL,
  `bigCenter_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`centerId`),
  KEY `FK622B1E80958B7C0` (`bigCenter_Id`),
  CONSTRAINT `FK622B1E80958B7C0` FOREIGN KEY (`bigCenter_Id`) REFERENCES `t_bigcenter` (`bigCenterId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_center
-- ----------------------------
INSERT INTO `t_center` VALUES ('1', 'VIP维护中心', '1');
INSERT INTO `t_center` VALUES ('2', '客户发展中心', '1');
INSERT INTO `t_center` VALUES ('3', '分子公司管理中心', '1');
INSERT INTO `t_center` VALUES ('4', '运营支持中心', '1');
INSERT INTO `t_center` VALUES ('5', '直通车增值中心', '4');
INSERT INTO `t_center` VALUES ('6', '商务A区', '2');
INSERT INTO `t_center` VALUES ('7', '商务K区', '2');
INSERT INTO `t_center` VALUES ('8', '商务F区', '2');
INSERT INTO `t_center` VALUES ('9', '销售OS', '2');
INSERT INTO `t_center` VALUES ('10', '直通车销售', '2');
INSERT INTO `t_center` VALUES ('11', '大客户部', '2');
INSERT INTO `t_center` VALUES ('12', '地市一区', '2');
INSERT INTO `t_center` VALUES ('13', '地市二区', '2');
INSERT INTO `t_center` VALUES ('14', '地市三区', '2');
INSERT INTO `t_center` VALUES ('15', '地市四区', '2');
INSERT INTO `t_center` VALUES ('16', '地市五区', '2');
INSERT INTO `t_center` VALUES ('17', '渠道', '3');
INSERT INTO `t_center` VALUES ('18', '信息中心', '4');
INSERT INTO `t_center` VALUES ('19', '市场中心', '4');
INSERT INTO `t_center` VALUES ('20', '其他', '4');
INSERT INTO `t_center` VALUES ('21', 'admin', '5');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(255) DEFAULT NULL,
  `center_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`deptId`),
  KEY `FKCB5BDF3041716D54` (`center_Id`),
  CONSTRAINT `FKCB5BDF3041716D54` FOREIGN KEY (`center_Id`) REFERENCES `t_center` (`centerId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', 'KA增值部', '1');
INSERT INTO `t_dept` VALUES ('2', '医疗维护1部', '1');
INSERT INTO `t_dept` VALUES ('3', '医疗维护2部', '1');
INSERT INTO `t_dept` VALUES ('4', 'VIP维护1部', '1');
INSERT INTO `t_dept` VALUES ('5', 'VIP维护2部', '1');
INSERT INTO `t_dept` VALUES ('6', '客户发展1部', '2');
INSERT INTO `t_dept` VALUES ('7', '客户发展2部', '2');
INSERT INTO `t_dept` VALUES ('8', '客户发展3部', '2');
INSERT INTO `t_dept` VALUES ('9', '客户发展4部', '2');
INSERT INTO `t_dept` VALUES ('10', '客户发展5部', '2');
INSERT INTO `t_dept` VALUES ('11', '客户发展6部', '2');
INSERT INTO `t_dept` VALUES ('12', '分子1部', '3');
INSERT INTO `t_dept` VALUES ('13', '分子2部', '3');
INSERT INTO `t_dept` VALUES ('14', '分子3部', '3');
INSERT INTO `t_dept` VALUES ('15', '迷你维护部', '4');
INSERT INTO `t_dept` VALUES ('16', '归巢项目部', '4');
INSERT INTO `t_dept` VALUES ('17', '客户开发1部', '4');
INSERT INTO `t_dept` VALUES ('18', '客户开发2部', '4');
INSERT INTO `t_dept` VALUES ('19', '增值T部', '4');
INSERT INTO `t_dept` VALUES ('20', '直通车客服部', '5');
INSERT INTO `t_dept` VALUES ('21', '直通车审核部', '5');
INSERT INTO `t_dept` VALUES ('22', '商务A1', '6');
INSERT INTO `t_dept` VALUES ('23', '商务A2', '6');
INSERT INTO `t_dept` VALUES ('24', '商务A3', '6');
INSERT INTO `t_dept` VALUES ('25', '商务A4', '6');
INSERT INTO `t_dept` VALUES ('26', '商务A5', '6');
INSERT INTO `t_dept` VALUES ('27', '商务K1', '7');
INSERT INTO `t_dept` VALUES ('28', '商务K2', '7');
INSERT INTO `t_dept` VALUES ('29', '商务K3', '7');
INSERT INTO `t_dept` VALUES ('30', '商务K4', '7');
INSERT INTO `t_dept` VALUES ('31', '商务K5', '7');
INSERT INTO `t_dept` VALUES ('32', '商务K7', '7');
INSERT INTO `t_dept` VALUES ('33', '电商1部', '8');
INSERT INTO `t_dept` VALUES ('34', '商务F1', '8');
INSERT INTO `t_dept` VALUES ('35', '商务F2', '8');
INSERT INTO `t_dept` VALUES ('36', '商务F4', '8');
INSERT INTO `t_dept` VALUES ('37', '商务T部', '8');
INSERT INTO `t_dept` VALUES ('38', '客发二部', '9');
INSERT INTO `t_dept` VALUES ('39', '客发三部', '9');
INSERT INTO `t_dept` VALUES ('40', '客发四部', '9');
INSERT INTO `t_dept` VALUES ('41', '直通车1部', '10');
INSERT INTO `t_dept` VALUES ('42', '直通车2部', '10');
INSERT INTO `t_dept` VALUES ('43', 'LA开发部', '11');
INSERT INTO `t_dept` VALUES ('44', 'LA直通车连锁经营部', '11');
INSERT INTO `t_dept` VALUES ('45', '信阳分公司', '12');
INSERT INTO `t_dept` VALUES ('46', '信阳直通车', '12');
INSERT INTO `t_dept` VALUES ('47', '南阳一部', '12');
INSERT INTO `t_dept` VALUES ('48', '南阳三部', '12');
INSERT INTO `t_dept` VALUES ('49', '南阳直通车', '12');
INSERT INTO `t_dept` VALUES ('50', '驻马店分公司', '13');
INSERT INTO `t_dept` VALUES ('51', '驻马店直通车', '13');
INSERT INTO `t_dept` VALUES ('52', '漯河分公司', '13');
INSERT INTO `t_dept` VALUES ('53', '漯河直通车', '13');
INSERT INTO `t_dept` VALUES ('54', '平顶山分公司', '14');
INSERT INTO `t_dept` VALUES ('55', '平顶山直通车', '14');
INSERT INTO `t_dept` VALUES ('56', '许昌分公司', '14');
INSERT INTO `t_dept` VALUES ('57', '许昌直通车', '14');
INSERT INTO `t_dept` VALUES ('58', '商丘二部', '15');
INSERT INTO `t_dept` VALUES ('59', '商丘三部', '15');
INSERT INTO `t_dept` VALUES ('60', '商丘直通车', '15');
INSERT INTO `t_dept` VALUES ('61', '濮阳子公司', '15');
INSERT INTO `t_dept` VALUES ('62', '鹤壁分公司', '15');
INSERT INTO `t_dept` VALUES ('63', '开封分公司', '16');
INSERT INTO `t_dept` VALUES ('64', '开封直通车', '16');
INSERT INTO `t_dept` VALUES ('65', '三门峡分公司', '16');
INSERT INTO `t_dept` VALUES ('66', '三门峡直通车', '16');
INSERT INTO `t_dept` VALUES ('67', '周口分公司', '16');
INSERT INTO `t_dept` VALUES ('68', '渠道', '17');
INSERT INTO `t_dept` VALUES ('69', '网站建设', '18');
INSERT INTO `t_dept` VALUES ('70', '市场中心', '19');
INSERT INTO `t_dept` VALUES ('71', '其他', '20');
INSERT INTO `t_dept` VALUES ('72', 'admin', '21');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `createOrderTime` varchar(255) DEFAULT NULL,
  `orderFrom` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `danger` varchar(255) DEFAULT NULL,
  `classify_one` varchar(255) DEFAULT NULL,
  `classify_two` varchar(255) DEFAULT NULL,
  `classify_three` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `tousuren` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `eventDetail` varchar(255) DEFAULT NULL,
  `fatherUser` varchar(255) DEFAULT NULL,
  `firstContact` varchar(255) DEFAULT NULL,
  `beitousuren` varchar(255) DEFAULT NULL,
  `_user` int(11) DEFAULT NULL,
  `timeLimit` int(11) DEFAULT NULL,
  `timeAll` int(11) DEFAULT NULL,
  `chuliren` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `confirm` varchar(255) DEFAULT NULL,
  `isclose` varchar(255) DEFAULT NULL,
  `realReason1` varchar(255) DEFAULT NULL,
  `realReason2` varchar(255) DEFAULT NULL,
  `judge` varchar(255) DEFAULT NULL,
  `_level` varchar(255) DEFAULT NULL,
  `isrepeat` varchar(255) DEFAULT NULL,
  `aBP` varchar(255) DEFAULT NULL,
  `recordPerson` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKA0C0C3C31E5C0EAF` (`_user`),
  CONSTRAINT `FKA0C0C3C31E5C0EAF` FOREIGN KEY (`_user`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('5', '21', '2017-02-17 10:01:20', '回声系统', '投诉', '是', '产品问题', '审核问题', '审核时间过长', 'adf', 'ad', 'adf', 'adfa', 'adf', 'adf', 'adf', '7', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('6', '20', '2017-02-18 14:00:31', '回声系统', '咨询', '是', '产品问题', '审核问题', '咨询审核时长', 'adf', 'adf', 'adf', 'adf', 'adsf', 'adf', 'adf', '2', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('7', '1', '2017-02-18 14:01:00', '回声系统', '投诉', '是', '产品问题', '物料问题', '推广结果无法展现', 'adf', 'asdf', 'adf', 'adf', 'asdf', 'adf', 'adsf', '28', '21', '24', 'adf', 'af', 'adf', 'adfaf', 'adf', 'afdf', 'fdaf', 'fa', 'fa', 'ad', 'adf');
INSERT INTO `t_order` VALUES ('8', '1', '2017-02-18 14:01:21', '回声系统', '投诉', '是', '产品问题', '审核问题', '咨询信息拒绝', 'a', 'a', 'a', 'aa', 'a', 'a', 'a', '2', '0', '24', 'adf', 'adf', 'adf', 'af', 'adf', 'adf', 'adf', 'adf', 'adf', 'adf', 'adf');
INSERT INTO `t_order` VALUES ('9', '20', '2017-02-18 14:01:41', '回声系统', '投诉', '是', '产品问题', '推广效果不满意', '单纯要求更换客服', 'b', 'b', 'b', 'bb', 'b', 'b', 'b', '2', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('10', '20', '2017-02-18 14:02:23', '回声系统', '投诉', '是', '政策问题', '加V年检', '加V年检', 'cc', 'c', 'c', 'c', 'c', 'c', 'c', '2', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('11', '1', '2017-02-20 09:02:29', '回声系统', '投诉', '是', '产品问题', '审核问题', '咨询信息拒绝', 'a', 'a', 'a', 'aa', 'a', 'a', 'a', '2', '0', '0', 'adf', 'afd', 'adf', 'adf', '12分问题', null, 'af', 'af', 'ad', 'ad', 'af');
INSERT INTO `t_order` VALUES ('12', '20', '2017-02-20 09:29:11', '回声系统', '投诉', '是', '产品问题', '审核问题', '审核时间过长', 'adf', 'ad', 'adf', 'adfa', 'adf', 'adf', 'adf', '7', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('13', '20', '2017-02-20 11:37:42', '回声系统', '投诉', '是', '政策问题', '双站上线', '对于双站上线不解或有异议的', 'qq', 'adf', 'ad', 'qewr', 'af', 'ad', '', '28', '0', '24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_order` VALUES ('14', '20', '2017-02-20 11:50:29', '回声系统', '投诉', '是', '产品问题', '物料问题', '推广展现位置', 'ad', 'adf', 'ad', '', 'ad', 'ad', 'adf', '3', '0', '24', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `personName` varchar(255) DEFAULT NULL,
  `crm` varchar(255) DEFAULT NULL,
  `telNum` varchar(255) DEFAULT NULL,
  `dept_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`personId`),
  KEY `FK785BED80758B8DD4` (`dept_Id`),
  CONSTRAINT `FK785BED80758B8DD4` FOREIGN KEY (`dept_Id`) REFERENCES `t_dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('1', '陈志平', 'zhengzhou116', '55536863', '1');
INSERT INTO `t_person` VALUES ('2', '李佳', 'hnrich428', '55536835', '1');
INSERT INTO `t_person` VALUES ('3', '陈安娜', 'hnrich218', '55536819', '1');
INSERT INTO `t_person` VALUES ('4', '黄培培', 'hnrich1531', '55536885', '1');
INSERT INTO `t_person` VALUES ('5', '翟莉莉', 'hnrich029', '55536876', '1');
INSERT INTO `t_person` VALUES ('6', '马宁', 'hnrich1310', '55536969', '1');
INSERT INTO `t_person` VALUES ('7', '贾婷', 'hnrich2121', '55536241', '1');
INSERT INTO `t_person` VALUES ('8', '王晓娟', 'hnrich2203', '55536874', '1');
INSERT INTO `t_person` VALUES ('9', '杨帅', 'hnrich1133', '55536621', '1');
INSERT INTO `t_person` VALUES ('10', '马伟良', 'hnrich1214', '55536224', '1');
INSERT INTO `t_person` VALUES ('11', '匡姣阳', 'hnrich154', '55536941', '1');
INSERT INTO `t_person` VALUES ('12', '史世娟', 'hnrich122', '55536944', '1');
INSERT INTO `t_person` VALUES ('13', '王歌', 'zhengzhou119', '55536883', '1');
INSERT INTO `t_person` VALUES ('14', '石浩亮', 'hnrich1321', '55536792', '1');
INSERT INTO `t_person` VALUES ('15', '温馨', 'hnrich223', '55536813', '2');
INSERT INTO `t_person` VALUES ('16', '张黎辉', 'hnrich2206', '55536805', '2');
INSERT INTO `t_person` VALUES ('17', '吴娟', 'hnrich429', '55536972', '2');
INSERT INTO `t_person` VALUES ('18', '师月华', 'hnrich2201', '55536963', '2');
INSERT INTO `t_person` VALUES ('19', '张迎迎', 'hnrich1118', '55536861', '2');
INSERT INTO `t_person` VALUES ('20', '黄培丽', 'hnrich1215', '55536953', '2');
INSERT INTO `t_person` VALUES ('21', '刘芳芳', 'hnrich1161', '55536858', '2');
INSERT INTO `t_person` VALUES ('22', '任璐璐', 'hnrich211', '55536973', '2');
INSERT INTO `t_person` VALUES ('23', '郭趁芳', 'hnrich1217', '55536867', '3');
INSERT INTO `t_person` VALUES ('24', '孔平平', 'zhengzhou06', '55536801', '3');
INSERT INTO `t_person` VALUES ('25', '何洋洋', 'hnrich1117', '55536877', '3');
INSERT INTO `t_person` VALUES ('26', '谢文静', 'hnrich128', '55536943', '3');
INSERT INTO `t_person` VALUES ('27', '燕留情', 'hnrich1818', '55536878', '3');
INSERT INTO `t_person` VALUES ('28', '司延芳', 'hnrich168', '55536865', '3');
INSERT INTO `t_person` VALUES ('29', '李丁丁', 'hnrich144', '55536952', '3');
INSERT INTO `t_person` VALUES ('30', '朱艳', 'hnrich145', '55536869', '3');
INSERT INTO `t_person` VALUES ('31', '秦雅芬', 'xinyang2', '55536870', '3');
INSERT INTO `t_person` VALUES ('32', '刘素亭', 'hnrich555', '55536971', '4');
INSERT INTO `t_person` VALUES ('33', '申爽', 'hnrich224', '55536830', '4');
INSERT INTO `t_person` VALUES ('34', '张桂鹏', 'hnrich212', '55536864', '4');
INSERT INTO `t_person` VALUES ('35', '张锫沛', 'hnrich562', '55536807', '4');
INSERT INTO `t_person` VALUES ('36', '张慧', 'hnrich216', '55536823', '4');
INSERT INTO `t_person` VALUES ('37', '关军昌', 'hnrich558', '55536803', '4');
INSERT INTO `t_person` VALUES ('38', '王静霞', 'hnrich567', '55536997', '4');
INSERT INTO `t_person` VALUES ('39', '张世越', 'hnrich566', '55536811', '4');
INSERT INTO `t_person` VALUES ('40', '张君叶', 'hnrich559', '55536704', '4');
INSERT INTO `t_person` VALUES ('41', '张艳芳', 'hnrich678', '55536777', '4');
INSERT INTO `t_person` VALUES ('42', '邵姣姣', 'hnrich150', '55536789', '4');
INSERT INTO `t_person` VALUES ('43', '李倩', 'hnrich1116', '55536893', '5');
INSERT INTO `t_person` VALUES ('44', '朱丽亭', 'hnrich641', '55536998', '5');
INSERT INTO `t_person` VALUES ('45', '李晓红', 'hnrich1153', '55536779', '5');
INSERT INTO `t_person` VALUES ('46', '郭书靖', 'zhengzhou120', '55536988', '5');
INSERT INTO `t_person` VALUES ('47', '贾俊敏', 'hnrich1218', '55536827', '5');
INSERT INTO `t_person` VALUES ('48', '周玉林', 'hnrich2112', '55536797', '5');
INSERT INTO `t_person` VALUES ('49', '徐慧霞', 'hnrich1207', '55536795', '5');
INSERT INTO `t_person` VALUES ('50', '余运玲', 'hnrich28', '55536975', '5');
INSERT INTO `t_person` VALUES ('51', '王金金', 'hnrich1139', '55536857', '5');
INSERT INTO `t_person` VALUES ('52', '曹瑞', 'hnrich244', '55536964', '5');
INSERT INTO `t_person` VALUES ('53', '胡玲玲', 'hnrich153', '55536887', '5');
INSERT INTO `t_person` VALUES ('54', '刘丹丹', 'hnrich633', '55536859', '5');
INSERT INTO `t_person` VALUES ('55', '楚兰凤', 'hnrich1619', '55536948', '5');
INSERT INTO `t_person` VALUES ('56', '吕慧洁', 'hnrich1184', '55536949', '5');
INSERT INTO `t_person` VALUES ('57', '邵海侠', 'hnrich126', '55536303', '6');
INSERT INTO `t_person` VALUES ('58', '陈俊丽', 'hnrich131', '55536075', '6');
INSERT INTO `t_person` VALUES ('59', '张淑云', 'hnrich112', '55536554', '6');
INSERT INTO `t_person` VALUES ('60', '田茹', 'hnrich161', '55536300', '6');
INSERT INTO `t_person` VALUES ('61', '李彩君', 'hnrich160', '55536140', '6');
INSERT INTO `t_person` VALUES ('62', '赵勤勤', 'hnrich121', '55536190', '6');
INSERT INTO `t_person` VALUES ('63', '张新', 'hnrich129', '55536146', '6');
INSERT INTO `t_person` VALUES ('64', '赵华', 'hnrich138', '55536521', '6');
INSERT INTO `t_person` VALUES ('65', '李新芳', 'hnrich1219', '55536174', '6');
INSERT INTO `t_person` VALUES ('66', '丁曼', 'hnrich431', '55536645', '6');
INSERT INTO `t_person` VALUES ('67', '刘欢', 'hnrich1322', '55536091', '6');
INSERT INTO `t_person` VALUES ('68', '金红阳', 'hnrich116', '55536179', '7');
INSERT INTO `t_person` VALUES ('69', '赵世权', 'hnrich11115', '53389050', '7');
INSERT INTO `t_person` VALUES ('70', '孟胜男', 'hnrich124', '55536122', '7');
INSERT INTO `t_person` VALUES ('71', '李晓梅', 'hnrich1113', '55536904', '7');
INSERT INTO `t_person` VALUES ('72', '王春桃', 'hnrich217', '55536046', '7');
INSERT INTO `t_person` VALUES ('73', '张程媛', 'hnrich2204', '55536212', '7');
INSERT INTO `t_person` VALUES ('74', '费晨燕', 'hnrich139', '55536196', '7');
INSERT INTO `t_person` VALUES ('75', '陶艳艳', 'zhengzhou07', '55536202', '7');
INSERT INTO `t_person` VALUES ('76', '杨晓蒙', 'hnrich1138', '55536936', '7');
INSERT INTO `t_person` VALUES ('77', '孔祥芳', 'hnrich1175', '55536205', '7');
INSERT INTO `t_person` VALUES ('78', '谢宇果', 'hnrich1145', '55536018', '7');
INSERT INTO `t_person` VALUES ('79', '李慧云', 'zhengzhou113', '55536020', '7');
INSERT INTO `t_person` VALUES ('80', '徐旭', 'hnrich1111', '55536162', '8');
INSERT INTO `t_person` VALUES ('81', '章玉婷', 'hnrich1105', '55536110', '8');
INSERT INTO `t_person` VALUES ('82', '郭嘉良', 'hnrich1106', '55536651', '8');
INSERT INTO `t_person` VALUES ('83', '牛林林', 'hnrich2205', '55536126', '8');
INSERT INTO `t_person` VALUES ('84', '潘文平', 'hnrich167', '55536567', '8');
INSERT INTO `t_person` VALUES ('85', '孔丽', 'hnrich158', '55536074', '8');
INSERT INTO `t_person` VALUES ('86', '邓君', 'hnrich1103', '55536571', '8');
INSERT INTO `t_person` VALUES ('87', '郭莉平', 'hnrich1134', '55536123', '8');
INSERT INTO `t_person` VALUES ('88', '梁晓普', 'hnrich1568', '55536686', '8');
INSERT INTO `t_person` VALUES ('89', '赵丹丹', 'hnrich1530', '55536655', '8');
INSERT INTO `t_person` VALUES ('90', '刘丽芳', 'hnrich1204', '55536131', '8');
INSERT INTO `t_person` VALUES ('91', '田杏', 'hnrich1181', '55536657', '8');
INSERT INTO `t_person` VALUES ('92', '刘洪洪', 'hnrich1182', '55536246', '9');
INSERT INTO `t_person` VALUES ('93', '徐艳霞', 'hnrich231', '55536541', '9');
INSERT INTO `t_person` VALUES ('94', '吴若丝', 'hnrich1183', '55536159', '9');
INSERT INTO `t_person` VALUES ('95', '刘丹', 'hnrich1172', '55536113', '9');
INSERT INTO `t_person` VALUES ('96', '赵艳勤', 'hnrich230', '55536109', '9');
INSERT INTO `t_person` VALUES ('97', '高佳佳', 'xuchang04', '55536137', '9');
INSERT INTO `t_person` VALUES ('98', '赵海燕', 'xinyang1', '55328160', '9');
INSERT INTO `t_person` VALUES ('99', '王真真', 'xinyang5', '55536135', '9');
INSERT INTO `t_person` VALUES ('100', '何彩云', 'hnrich251', '55536156', '9');
INSERT INTO `t_person` VALUES ('101', '靳利芳', 'xinyang3', '55536199', '9');
INSERT INTO `t_person` VALUES ('102', '邹婷婷', 'hnrich252', '55536502', '9');
INSERT INTO `t_person` VALUES ('103', '唐佳烨', 'hnrich1220', '55536575', '9');
INSERT INTO `t_person` VALUES ('104', '李妍', 'hnrich1176', '55536271', '10');
INSERT INTO `t_person` VALUES ('105', '石冲', 'hnrich234', '55536155', '10');
INSERT INTO `t_person` VALUES ('106', '岳春岩', 'zhengzhou08', '55536101', '10');
INSERT INTO `t_person` VALUES ('107', '王术婷', 'hebixinrui', '55536119', '10');
INSERT INTO `t_person` VALUES ('108', '乔志惠', 'hnrich1146', '55536124', '10');
INSERT INTO `t_person` VALUES ('109', '史春雨', 'hnrich1537', '55536169', '10');
INSERT INTO `t_person` VALUES ('110', '宋科静', 'hnrich210', '55536237', '10');
INSERT INTO `t_person` VALUES ('111', '李真真', 'hnrich262', '55536059', '10');
INSERT INTO `t_person` VALUES ('112', '周英子', 'hnrich1171', '55536240', '10');
INSERT INTO `t_person` VALUES ('113', '王伟丽', 'hnrich424', '55536750', '10');
INSERT INTO `t_person` VALUES ('114', '王俊丽', 'hnrich1533', '55536121', '11');
INSERT INTO `t_person` VALUES ('115', '宋晓敏', 'hnrich163', '55536646', '11');
INSERT INTO `t_person` VALUES ('116', '闫幸民', 'hnrich113', '55536568', '11');
INSERT INTO `t_person` VALUES ('117', '李贝贝', 'hnrich246', '55536617', '11');
INSERT INTO `t_person` VALUES ('118', '张婷', 'hnrich1212', '55536658', '11');
INSERT INTO `t_person` VALUES ('119', '郭改军', 'hnrich1535', '55536138', '11');
INSERT INTO `t_person` VALUES ('120', '曲路路', 'hnrich1115', '55536178', '11');
INSERT INTO `t_person` VALUES ('121', '闫静沛', 'hnrich127', '55536115', '11');
INSERT INTO `t_person` VALUES ('122', '黄飞燕', 'hnrich1532', '55536613', '11');
INSERT INTO `t_person` VALUES ('123', '孟丽萍', 'hnrich1519', '55536648', '11');
INSERT INTO `t_person` VALUES ('124', '连丽真', 'hnrich215', '55529357', '11');
INSERT INTO `t_person` VALUES ('125', '余泓坤', 'hnrich1330', '55536615', '11');
INSERT INTO `t_person` VALUES ('126', '陈世豪', 'hnrich722', '55536354', '15');
INSERT INTO `t_person` VALUES ('127', '赵艾璐', 'hnrich1177', '55536251', '15');
INSERT INTO `t_person` VALUES ('128', '王晓晓', 'hnrich1108', '55536265', '15');
INSERT INTO `t_person` VALUES ('129', '李小航', 'hnrich561', '55536598', '15');
INSERT INTO `t_person` VALUES ('130', '付言言', 'hnrich2208', '55536330', '15');
INSERT INTO `t_person` VALUES ('131', '张敬涛', 'hnrich1522', '55536264', '15');
INSERT INTO `t_person` VALUES ('132', '徐辉', 'hnrich1102', '55536016', '15');
INSERT INTO `t_person` VALUES ('133', '东海', 'hnrich434', '55536254', '16');
INSERT INTO `t_person` VALUES ('134', '史少强', 'hnrich425', '55536260', '16');
INSERT INTO `t_person` VALUES ('135', '张仰龙', 'hnrich432', '55536004', '16');
INSERT INTO `t_person` VALUES ('136', '单启明', 'hnrich426', '55536654', '16');
INSERT INTO `t_person` VALUES ('137', '李立志', 'hnrich1164', '55536513', '16');
INSERT INTO `t_person` VALUES ('138', '魏晓磊', 'hnrich312', '55536257', '16');
INSERT INTO `t_person` VALUES ('139', '马丽丽', 'hnrich1366', '55536263', '16');
INSERT INTO `t_person` VALUES ('140', '徐亚娟', 'hnrich423', '55536142', '16');
INSERT INTO `t_person` VALUES ('141', '李君', 'hnrich1165', '55536301', '17');
INSERT INTO `t_person` VALUES ('142', '曹景超', 'hnrich1303', '55536363', '17');
INSERT INTO `t_person` VALUES ('143', '任伟伟', 'hnrich1159', '55536163', '17');
INSERT INTO `t_person` VALUES ('144', '陈嫚', 'hnrich258', '55536270', '17');
INSERT INTO `t_person` VALUES ('145', '张倩', 'hnrich266', '55536633', '17');
INSERT INTO `t_person` VALUES ('146', '贾慧真', 'hnrich1120', '55536039', '17');
INSERT INTO `t_person` VALUES ('147', '霍小杰', 'hnrich2110', '55536383', '17');
INSERT INTO `t_person` VALUES ('148', '马冰洁', 'hnrich117', '55536230', '18');
INSERT INTO `t_person` VALUES ('149', '林育秀', 'hnrich162', '55536225', '18');
INSERT INTO `t_person` VALUES ('150', '任芳', 'hnrich1110', '55536229', '18');
INSERT INTO `t_person` VALUES ('151', '赵楠', 'hnrich227', '55536632', '18');
INSERT INTO `t_person` VALUES ('152', '王亚辉', 'hnrich1306', '55536168', '18');
INSERT INTO `t_person` VALUES ('153', '刘水娟', 'hnrich115', '55536231', '18');
INSERT INTO `t_person` VALUES ('154', '贾婉', 'hnrich1539', '55536631', '18');
INSERT INTO `t_person` VALUES ('155', '闫利杰', 'hnrich226', '55536922', '18');
INSERT INTO `t_person` VALUES ('156', '桑新波', 'hnrich159', '55536166', '18');
INSERT INTO `t_person` VALUES ('157', '师清', 'hnrich221', '55536367', '18');
INSERT INTO `t_person` VALUES ('158', '杨甜甜', 'hnrich119', '55536106', '18');
INSERT INTO `t_person` VALUES ('159', '李阳', 'hnrich1154', '55536576', '12');
INSERT INTO `t_person` VALUES ('160', '刘静', 'hnrich164', '55536578', '12');
INSERT INTO `t_person` VALUES ('161', '李慧琪', 'hnrich1528', '55536573', '12');
INSERT INTO `t_person` VALUES ('162', '朱蓓蕾', 'hnrich435', '55536235', '12');
INSERT INTO `t_person` VALUES ('163', '刘志远', 'hnrich1529', '55536214', '12');
INSERT INTO `t_person` VALUES ('164', '王林青', 'hnrich1203', '55536207', '12');
INSERT INTO `t_person` VALUES ('165', '张倩', 'hnrich1210', '55536152', '12');
INSERT INTO `t_person` VALUES ('166', '段爱莲', 'hnrich2209', '55536001', '12');
INSERT INTO `t_person` VALUES ('167', '赵丽娜', 'hnrich1104', '55536681', '12');
INSERT INTO `t_person` VALUES ('168', '陈瑞瑞', 'hnrich1201', '55536182', '12');
INSERT INTO `t_person` VALUES ('169', '崔小西', 'hnrich1192', '55536636', '12');
INSERT INTO `t_person` VALUES ('170', '徐亚奇', 'hnrich1538', '55536637', '13');
INSERT INTO `t_person` VALUES ('171', '王玉珂', 'zhengzhou09', '55536650', '13');
INSERT INTO `t_person` VALUES ('172', '吴阳阳', 'hnrich1301', '55536027', '13');
INSERT INTO `t_person` VALUES ('173', '王淑倩', 'hnrich1527', '55536204', '13');
INSERT INTO `t_person` VALUES ('174', '程露露', 'hnrich563', '55536333', '13');
INSERT INTO `t_person` VALUES ('175', '陈姝婧', 'hnrich565', '55536306', '13');
INSERT INTO `t_person` VALUES ('176', '艾重阳', 'hnrich1308', '55636328', '13');
INSERT INTO `t_person` VALUES ('177', '魏嘉慧', 'hnrich2202', '55536211', '13');
INSERT INTO `t_person` VALUES ('178', '史培培', 'hrrich2115', '55536220', '13');
INSERT INTO `t_person` VALUES ('179', '郭靖', 'hnrich269', '55536522', '14');
INSERT INTO `t_person` VALUES ('180', '张书阁', 'hnrich141', '55536233', '14');
INSERT INTO `t_person` VALUES ('181', '张晓月', 'hnrich1194', '55536643', '14');
INSERT INTO `t_person` VALUES ('182', '魏慧娟', 'hnrich148', '55536201', '14');
INSERT INTO `t_person` VALUES ('183', '李依哲', 'hnrich146', '55536630', '14');
INSERT INTO `t_person` VALUES ('184', '钟媛媛', 'hnrich027', '55536228', '14');
INSERT INTO `t_person` VALUES ('185', '张佳佳', 'hnrich1195', '55536244', '14');
INSERT INTO `t_person` VALUES ('186', '刘亚平', 'puyang02', '55536234', '14');
INSERT INTO `t_person` VALUES ('187', '兰羊', 'hnrich125', '55536323', '14');
INSERT INTO `t_person` VALUES ('188', '吴瑞阳', 'puyang03', '55536104', '14');
INSERT INTO `t_person` VALUES ('189', '白燕红', 'hnrich1505', '55536591', '20');
INSERT INTO `t_person` VALUES ('190', '陈金玲', 'hnrich1169', '55536565', '20');
INSERT INTO `t_person` VALUES ('191', '李景', 'hnrich1625', '55536564', '20');
INSERT INTO `t_person` VALUES ('192', '叶成成', 'hnrich1628', '55536570', '20');
INSERT INTO `t_person` VALUES ('193', '侯腾博', 'hnrich1613', '55536590', '20');
INSERT INTO `t_person` VALUES ('194', '杨杰', 'hnrich1618', '55536545', '20');
INSERT INTO `t_person` VALUES ('195', '宋梦萍', 'hnrich137', '55536542', '20');
INSERT INTO `t_person` VALUES ('196', '支云杰', 'hnrich1162', '55536377', '20');
INSERT INTO `t_person` VALUES ('197', '尚凯雯', 'hnrich1627', '55536603', '20');
INSERT INTO `t_person` VALUES ('198', '张梦', 'hnrich1629', '55536610', '20');
INSERT INTO `t_person` VALUES ('199', '张亚菲', 'hnrich118', '55536680', '20');
INSERT INTO `t_person` VALUES ('200', '董慧', 'hnrich1142', '55536378', '20');
INSERT INTO `t_person` VALUES ('201', '王平伟', 'hnrich1132', '55536563', '20');
INSERT INTO `t_person` VALUES ('202', '张义玲', 'hnrich1617', '55536373', '20');
INSERT INTO `t_person` VALUES ('203', '翟松颖', 'hnrich1157', '55536519', '20');
INSERT INTO `t_person` VALUES ('204', '李哲', 'hnrich1626', '55536558', '20');
INSERT INTO `t_person` VALUES ('205', '王欠', 'hnrich1615', '55536682', '20');
INSERT INTO `t_person` VALUES ('206', '刘小双', 'hnrich1504', '55536562', '20');
INSERT INTO `t_person` VALUES ('207', '李瑞林', '暂无', '55536520', '20');
INSERT INTO `t_person` VALUES ('208', '王霄', 'hnrich1642', '55529326', '21');
INSERT INTO `t_person` VALUES ('209', '乔倩', 'hnrich2119', '53389005', '21');
INSERT INTO `t_person` VALUES ('210', '王帅', 'hnrich1643', '53389068', '21');
INSERT INTO `t_person` VALUES ('211', '马秋燕', 'hnrich1509', '53389063', '21');
INSERT INTO `t_person` VALUES ('212', '陈娇', 'hnrich1641', '53389093', '21');
INSERT INTO `t_person` VALUES ('213', '郭珂丽', 'hnrich1543', '53389062', '21');
INSERT INTO `t_person` VALUES ('214', '王广敏', 'hnrich1640', '53389045', '21');
INSERT INTO `t_person` VALUES ('215', '郭晓燕', 'hnrich616', '53389053', '21');
INSERT INTO `t_person` VALUES ('216', '周改杰', 'hnrich1505', '55529355', '21');

-- ----------------------------
-- Table structure for t_telmessage
-- ----------------------------
DROP TABLE IF EXISTS `t_telmessage`;
CREATE TABLE `t_telmessage` (
  `telMessageId` int(11) NOT NULL AUTO_INCREMENT,
  `telNum` varchar(255) DEFAULT NULL,
  `countAll` int(11) DEFAULT NULL,
  `allTime` varchar(255) DEFAULT NULL,
  `countOutAll` int(11) DEFAULT NULL,
  `outAllTime` varchar(255) DEFAULT NULL,
  `count_1out` int(11) DEFAULT NULL,
  `_1outTime` varchar(255) DEFAULT NULL,
  `count$1out` int(11) DEFAULT NULL,
  `$1outTime` varchar(255) DEFAULT NULL,
  `count$3out` int(11) DEFAULT NULL,
  `$3outTime` varchar(255) DEFAULT NULL,
  `countInAll` int(11) DEFAULT NULL,
  `inAllTime` varchar(255) DEFAULT NULL,
  `count_1in` int(11) DEFAULT NULL,
  `_1inTime` varchar(255) DEFAULT NULL,
  `count$1in` int(11) DEFAULT NULL,
  `$1inTime` varchar(255) DEFAULT NULL,
  `count$3in` int(11) DEFAULT NULL,
  `$3inTime` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  PRIMARY KEY (`telMessageId`),
  KEY `FK5CC6D8177F2FFF8D` (`personId`),
  CONSTRAINT `FK5CC6D8177F2FFF8D` FOREIGN KEY (`personId`) REFERENCES `t_person` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_telmessage
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `deptId` (`deptId`),
  KEY `FKCB63CCB6C94B0A9F` (`deptId`),
  CONSTRAINT `FKCB63CCB6C94B0A9F` FOREIGN KEY (`deptId`) REFERENCES `t_dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'test', '            test', 'NPC', '72');
INSERT INTO `t_user` VALUES ('2', 'kazengzhi', 'kazengzhi', 'Tasker', '1');
INSERT INTO `t_user` VALUES ('3', 'yiliaoweihu1', 'yiliaoweihu1', 'Tasker', '2');
INSERT INTO `t_user` VALUES ('4', 'yiliaoweihu2', 'yiliaoweihu2', 'Tasker', '3');
INSERT INTO `t_user` VALUES ('5', 'vipweihu1', 'vipweihu1', 'Tasker', '4');
INSERT INTO `t_user` VALUES ('6', 'vipweihu2', 'vipweihu2', 'Tasker', '5');
INSERT INTO `t_user` VALUES ('7', 'kehufazhan1', 'kehufazhan1', 'Tasker', '6');
INSERT INTO `t_user` VALUES ('8', 'kehufazhan2', 'kehufazhan2', 'Tasker', '7');
INSERT INTO `t_user` VALUES ('9', 'kehufazhan3', 'kehufazhan3', 'Tasker', '8');
INSERT INTO `t_user` VALUES ('10', 'kehufazhan4', 'kehufazhan4', 'Tasker', '9');
INSERT INTO `t_user` VALUES ('11', 'kehufazhan5', 'kehufazhan5', 'Tasker', '10');
INSERT INTO `t_user` VALUES ('12', 'kehufazhan6', 'kehufazhan6', 'Tasker', '11');
INSERT INTO `t_user` VALUES ('13', 'fenzi1', 'fenzi1', 'Tasker', '12');
INSERT INTO `t_user` VALUES ('14', 'fenzi2', 'fenzi2', 'Tasker', '13');
INSERT INTO `t_user` VALUES ('15', 'fenzi3', 'fenzi3', 'Tasker', '14');
INSERT INTO `t_user` VALUES ('16', 'miniweihu', 'miniweihu', 'Tasker', '15');
INSERT INTO `t_user` VALUES ('17', 'guichaoxiangmu', 'guichaoxiangmu', 'Tasker', '16');
INSERT INTO `t_user` VALUES ('18', 'kehukaifa1', 'kehukaifa1', 'Tasker', '17');
INSERT INTO `t_user` VALUES ('19', 'kehukaifa2', 'kehukaifa2', 'Tasker', '18');
INSERT INTO `t_user` VALUES ('20', 'zengzhit', 'zengzhit', 'Tasker', '19');
INSERT INTO `t_user` VALUES ('21', 'zhitongchekefu', 'zhitongchekefu', 'Tasker', '20');
INSERT INTO `t_user` VALUES ('22', 'zhitongcheshenhe', 'zhitongcheshenhe', 'Tasker', '21');
INSERT INTO `t_user` VALUES ('23', 'shangwua1', 'shangwua1', 'Tasker', '22');
INSERT INTO `t_user` VALUES ('24', 'shangwua2', 'shangwua2', 'Tasker', '23');
INSERT INTO `t_user` VALUES ('25', 'shangwua3', 'shangwua3', 'Tasker', '24');
INSERT INTO `t_user` VALUES ('26', 'shangwua4', 'shangwua4', 'Tasker', '25');
INSERT INTO `t_user` VALUES ('27', 'shangwua5', 'shangwua5', 'Tasker', '26');
INSERT INTO `t_user` VALUES ('28', 'shangwuk1', 'shangwuk1', 'Tasker', '27');
INSERT INTO `t_user` VALUES ('29', 'shangwuk2', 'shangwuk2', 'Tasker', '28');
INSERT INTO `t_user` VALUES ('30', 'shangwuk3', 'shangwuk3', 'Tasker', '29');
INSERT INTO `t_user` VALUES ('31', 'shangwuk4', 'shangwuk4', 'Tasker', '30');
INSERT INTO `t_user` VALUES ('32', 'shangwuk5', 'shangwuk5', 'Tasker', '31');
INSERT INTO `t_user` VALUES ('33', 'shangwuk7', 'shangwuk7', 'Tasker', '32');
INSERT INTO `t_user` VALUES ('34', 'dianshang1', 'dianshang1', 'Tasker', '33');
INSERT INTO `t_user` VALUES ('35', 'shangwuf1', 'shangwuf1', 'Tasker', '34');
INSERT INTO `t_user` VALUES ('36', 'shangwuf2', 'shangwuf2', 'Tasker', '35');
INSERT INTO `t_user` VALUES ('37', 'shangwuf4', 'shangwuf4', 'Tasker', '36');
INSERT INTO `t_user` VALUES ('38', 'shangwut', 'shangwut', 'Tasker', '37');
INSERT INTO `t_user` VALUES ('39', 'kefa2', 'kefa2', 'Tasker', '38');
INSERT INTO `t_user` VALUES ('40', 'kefa3', 'kefa3', 'Tasker', '39');
INSERT INTO `t_user` VALUES ('41', 'kefa4', 'kefa4', 'Tasker', '40');
INSERT INTO `t_user` VALUES ('42', 'zhitongceh1', 'zhitongceh1', 'Tasker', '41');
INSERT INTO `t_user` VALUES ('43', 'zhitongceh2', 'zhitongceh2', 'Tasker', '42');
INSERT INTO `t_user` VALUES ('44', 'lakaifa', 'lakaifa', 'Tasker', '43');
INSERT INTO `t_user` VALUES ('45', 'lazhitongcheliansuo', 'lazhitongcheliansuo', 'Tasker', '44');
INSERT INTO `t_user` VALUES ('46', 'xinyangfengongsi', 'xinyangfengongsi', 'Tasker', '45');
INSERT INTO `t_user` VALUES ('47', 'xinyangzhitongche', 'xinyangzhitongche', 'Tasker', '46');
INSERT INTO `t_user` VALUES ('48', 'nanyang1', 'nanyang1', 'Tasker', '47');
INSERT INTO `t_user` VALUES ('49', 'nanyang3', 'nanyang3', 'Tasker', '48');
INSERT INTO `t_user` VALUES ('50', 'nanyangzhitongche', 'nanyangzhitongche', 'Tasker', '49');
INSERT INTO `t_user` VALUES ('51', 'zhumadianfengongsi', 'zhumadianfengongsi', 'Tasker', '50');
INSERT INTO `t_user` VALUES ('52', 'zhumadianzhitongche', 'zhumadianzhitongche', 'Tasker', '51');
INSERT INTO `t_user` VALUES ('53', 'luohefengongsi', 'luohefengongsi', 'Tasker', '52');
INSERT INTO `t_user` VALUES ('54', 'luohezhitongche', 'luohezhitongche', 'Tasker', '53');
INSERT INTO `t_user` VALUES ('55', 'pingdingshanfengongsi', 'pingdingshanfengongsi', 'Tasker', '54');
INSERT INTO `t_user` VALUES ('56', 'pingdingshanzhitongche', 'pingdingshanzhitongche', 'Tasker', '55');
INSERT INTO `t_user` VALUES ('57', 'xuchangfengongsi', 'xuchangfengongsi', 'Tasker', '56');
INSERT INTO `t_user` VALUES ('58', 'xuchangzhitongche', 'xuchangzhitongche', 'Tasker', '57');
INSERT INTO `t_user` VALUES ('59', 'shangqiu2', 'shangqiu2', 'Tasker', '58');
INSERT INTO `t_user` VALUES ('60', 'shangqiu3', 'shangqiu3', 'Tasker', '59');
INSERT INTO `t_user` VALUES ('61', 'shangqiuzhitongche', 'shangqiuzhitongche', 'Tasker', '60');
INSERT INTO `t_user` VALUES ('62', 'puyangzigongsi', 'puyangzigongsi', 'Tasker', '61');
INSERT INTO `t_user` VALUES ('63', 'hebifengongsi', 'hebifengongsi', 'Tasker', '62');
INSERT INTO `t_user` VALUES ('64', 'kaifengfengongsi', 'kaifengfengongsi', 'Tasker', '63');
INSERT INTO `t_user` VALUES ('65', 'kaifengzhitongche', 'kaifengzhitongche', 'Tasker', '64');
INSERT INTO `t_user` VALUES ('66', 'sanmenxiafengongsi', 'sanmenxiafengongsi', 'Tasker', '65');
INSERT INTO `t_user` VALUES ('67', 'sanmenxiazhitongche', 'sanmenxiazhitongche', 'Tasker', '66');
INSERT INTO `t_user` VALUES ('68', 'zhoukoufengongsi', 'zhoukoufengongsi', 'Tasker', '67');
INSERT INTO `t_user` VALUES ('69', 'qudao', 'qudao', 'Tasker', '68');
INSERT INTO `t_user` VALUES ('70', 'wangzhanjianshe', 'wangzhanjianshe', 'Tasker', '69');
INSERT INTO `t_user` VALUES ('71', 'shichangzhongxin', 'shichangzhongxin', 'Tasker', '70');
INSERT INTO `t_user` VALUES ('72', 'qita', 'qita', 'Tasker', '71');
