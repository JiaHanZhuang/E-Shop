/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : e

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-08-06 14:42:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动索引',
  `text` varchar(255) DEFAULT NULL COMMENT '活动内容',
  `is_deadline` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动是否过期，1为过期，0为未过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '第一', '0');
INSERT INTO `activity` VALUES ('2', null, '1');
INSERT INTO `activity` VALUES ('3', '哈哈哈哈', '0');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论表索引',
  `text` varchar(255) NOT NULL COMMENT '评论/回复的内容',
  `user_id` bigint(20) NOT NULL COMMENT '外键，关联客户',
  `shop_id` bigint(20) NOT NULL COMMENT '外键，关联商家',
  `comment_id` bigint(20) NOT NULL COMMENT '外键，自关联',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `comment_id` (`comment_id`),
  KEY `comment_ibfk_1` (`user_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `commodity`
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品表的索引',
  `color` varchar(15) NOT NULL COMMENT '商品颜色',
  `type` varchar(15) DEFAULT NULL COMMENT '商品类型',
  `detail` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `path` varchar(255) NOT NULL COMMENT '商品图片',
  `price` int(11) NOT NULL COMMENT '商品价钱',
  `inventory` int(11) DEFAULT NULL COMMENT '库存',
  `is_putaway` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已上架销售',
  `commodity_uuid` varchar(80) NOT NULL COMMENT '商品标识码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('32', '绿色', '台式电脑硬件', '<p>电脑硬件<br/></p>', 'ce2a628a-ed03-4946-a8e3-144b9d61dd3f.jpg,', '213', null, '1', '0f970f37-b485-43e2-8860-23c3b38dbfb7');
INSERT INTO `commodity` VALUES ('33', '黑色', '女装', '<p>黑色晚礼服</p>', '0f1ce145-f69d-42bf-b8a1-f0e8a4546cda.jpg,576699ec-14c4-45b9-a060-f7637a40f32b.jpg,6b574e1d-293b-44d5-83a0-cd8050b02f2c.jpg,', '1600', null, '1', '8f2e70b4-5113-470c-a383-47a3d6265961');
INSERT INTO `commodity` VALUES ('34', '白色', '女装', '<p>白色衣服<br/></p>', 'ca6d0010-19b3-42ae-9a9e-d5657ff7d6c9.jpg,', '235', null, '1', '76dc5877-e71f-4c1a-8125-2cf3441c4de3');
INSERT INTO `commodity` VALUES ('36', '紫色', '女装', '<p>时尚</p>', '76fc8fb0-1676-4bb0-92d3-0a4b0ccab858.jpg,', '265', null, '1', 'ec4a71f8-dbd5-449c-b95a-1e3f128c4c61');
INSERT INTO `commodity` VALUES ('37', '紫色', '女装', '<p>白色美人鱼服装</p>', '3aa54b68-c1b0-4ad8-826a-3145498eae38.jpg,', '254', null, '1', '0500e935-12c9-4d60-b19c-039c9f00e6ed');
INSERT INTO `commodity` VALUES ('38', '紫色', '女装', '<p>白色时尚</p>', '41519d80-26f4-47fa-a530-918efc9ecefb.jpg,', '245', null, '1', 'da0041ca-f4fb-433e-b764-6469606b4180');
INSERT INTO `commodity` VALUES ('39', '黑色', '女装', '<p>黑色时尚</p>', 'd391f556-00b8-45ef-874b-91acc59cefa5.jpg,', '256', null, '1', 'f0f1d78a-ce71-4a72-b085-217749df8c8c');
INSERT INTO `commodity` VALUES ('40', '红色', '女装', '<p>红色礼服与红色包包</p>', 'cfddc448-057f-4321-8681-c32df02c9732.jpg,ae910786-f3c7-4635-8a2d-e9f7859f43fd.jpg,', '245', null, '1', 'a5edc44a-6360-4939-bbd1-cf5a85f63b20');
INSERT INTO `commodity` VALUES ('41', '白色', '女装', '<p>白色便装</p>', 'e969ea0a-108c-4ebf-b0e3-22a8d2a4c3d8.jpg,', '125', null, '1', 'b5ec10e8-5b05-4797-91b8-57ecc0321c2d');
INSERT INTO `commodity` VALUES ('42', '白色', '女装', '<p>时尚便装</p>', 'dbd1bf0e-68a7-4b01-b941-80983911aabd.jpg,', '245', null, '1', '54b897fc-a786-4026-b540-8ddbec44b01c');
INSERT INTO `commodity` VALUES ('44', '紫色', '女装', '<p>衣服<br/></p>', '91d7e414-8160-4cb3-b367-41ed23eefb7c.jpg,', '254', null, '1', '8db0b29b-870f-4d6d-aadb-6ca8c916902a');
INSERT INTO `commodity` VALUES ('47', '白色', '数码电子', '<p>触摸板<br/></p>', '2a95bf28-b383-4625-85d2-886240294505.jpg,', '154', null, '1', '1621a16f-bf3f-4086-8ca5-7a00b1cf699d');
INSERT INTO `commodity` VALUES ('48', '黑色', '男装', '<p>男士西装<br/></p>', '8dcb074b-02b5-45cc-a657-9c0e670d0ac7.jpg,', '1245', null, '1', '06889b0b-2f79-451e-a613-efef71125372');
INSERT INTO `commodity` VALUES ('49', '紫色', '男装', '<p>黑色运动服</p>', 'b03626fe-eff2-42ab-9211-234809b7ffca.jpg,', '254', null, '1', 'f7e3eb21-fcb5-4708-ad2e-d88b56cbabeb');

-- ----------------------------
-- Table structure for `commodity_shop`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_shop`;
CREATE TABLE `commodity_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL COMMENT '管理userId',
  `commodity_id` bigint(20) NOT NULL COMMENT '关联商品Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of commodity_shop
-- ----------------------------
INSERT INTO `commodity_shop` VALUES ('3', '6', '32');
INSERT INTO `commodity_shop` VALUES ('4', '6', '33');
INSERT INTO `commodity_shop` VALUES ('5', '6', '34');
INSERT INTO `commodity_shop` VALUES ('7', '6', '36');
INSERT INTO `commodity_shop` VALUES ('8', '6', '37');
INSERT INTO `commodity_shop` VALUES ('9', '6', '38');
INSERT INTO `commodity_shop` VALUES ('10', '6', '39');
INSERT INTO `commodity_shop` VALUES ('11', '6', '40');
INSERT INTO `commodity_shop` VALUES ('12', '6', '41');
INSERT INTO `commodity_shop` VALUES ('13', '6', '42');
INSERT INTO `commodity_shop` VALUES ('14', '6', '43');
INSERT INTO `commodity_shop` VALUES ('15', '6', '44');
INSERT INTO `commodity_shop` VALUES ('16', '6', '47');
INSERT INTO `commodity_shop` VALUES ('17', '6', '48');
INSERT INTO `commodity_shop` VALUES ('18', '6', '49');

-- ----------------------------
-- Table structure for `commodity_type`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type`;
CREATE TABLE `commodity_type` (
  `id` int(11) NOT NULL COMMENT '索引',
  `type_name` varchar(15) NOT NULL COMMENT '商品类型',
  `parent_id` int(4) NOT NULL DEFAULT '0' COMMENT '上一级目录,0则为最高级目录',
  `is_parent` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为父目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity_type
-- ----------------------------
INSERT INTO `commodity_type` VALUES ('1', '服装', '0', '1');
INSERT INTO `commodity_type` VALUES ('2', '女装', '1', '0');
INSERT INTO `commodity_type` VALUES ('3', '男装', '1', '0');
INSERT INTO `commodity_type` VALUES ('4', '童装', '1', '0');
INSERT INTO `commodity_type` VALUES ('5', '数码电子类', '0', '1');
INSERT INTO `commodity_type` VALUES ('6', '数码电子', '5', '0');
INSERT INTO `commodity_type` VALUES ('7', '电子硬件', '0', '1');
INSERT INTO `commodity_type` VALUES ('8', '台式电脑硬件', '7', '0');
INSERT INTO `commodity_type` VALUES ('9', '笔记本电脑硬件', '7', '0');
INSERT INTO `commodity_type` VALUES ('10', '手机硬件', '7', '0');
INSERT INTO `commodity_type` VALUES ('11', '食物', '0', '1');
INSERT INTO `commodity_type` VALUES ('12', '补品', '11', '0');
INSERT INTO `commodity_type` VALUES ('13', '蔬菜水果', '11', '0');
INSERT INTO `commodity_type` VALUES ('14', '零食', '11', '0');
INSERT INTO `commodity_type` VALUES ('15', '主食', '11', '0');

-- ----------------------------
-- Table structure for `financial`
-- ----------------------------
DROP TABLE IF EXISTS `financial`;
CREATE TABLE `financial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expend` int(11) NOT NULL DEFAULT '0' COMMENT '支出',
  `earning` int(11) NOT NULL DEFAULT '0' COMMENT '收入',
  `time` date NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of financial
-- ----------------------------
INSERT INTO `financial` VALUES ('1', '100', '200', '2017-07-09');
INSERT INTO `financial` VALUES ('2', '120', '56', '2017-07-10');
INSERT INTO `financial` VALUES ('3', '52', '85', '2017-07-10');
INSERT INTO `financial` VALUES ('4', '85', '85', '2017-07-10');
INSERT INTO `financial` VALUES ('5', '8', '90', '2017-07-10');
INSERT INTO `financial` VALUES ('6', '78', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('7', '8', '9', '2017-07-10');
INSERT INTO `financial` VALUES ('8', '546', '87', '2017-07-10');
INSERT INTO `financial` VALUES ('9', '58', '65', '2017-07-11');
INSERT INTO `financial` VALUES ('10', '56', '56', '2017-07-11');
INSERT INTO `financial` VALUES ('11', '56', '45', '2017-07-10');
INSERT INTO `financial` VALUES ('12', '0', '0', '2017-07-09');
INSERT INTO `financial` VALUES ('13', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('14', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('15', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('16', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('17', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('18', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('19', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('20', '0', '0', '2017-07-11');
INSERT INTO `financial` VALUES ('21', '0', '0', '2017-07-11');
INSERT INTO `financial` VALUES ('22', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('23', '0', '0', '2017-07-09');
INSERT INTO `financial` VALUES ('24', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('25', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('26', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('27', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('28', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('29', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('30', '0', '0', '2017-07-10');
INSERT INTO `financial` VALUES ('31', '0', '0', '2017-07-11');
INSERT INTO `financial` VALUES ('32', '0', '0', '2017-07-11');
INSERT INTO `financial` VALUES ('33', '0', '0', '2017-07-10');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单明细表的索引',
  `buy_time` date DEFAULT NULL COMMENT '购买的时间',
  `buy_number` varchar(80) NOT NULL COMMENT '订单号，由系统自行生成',
  `commodity_id` bigint(20) NOT NULL COMMENT '外键，关联commodity表的id',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `size` varchar(4) NOT NULL DEFAULT 'L' COMMENT '大小',
  PRIMARY KEY (`id`),
  KEY `commodity_id` (`commodity_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', null, '3d06c966-443d-406b-be08-802ac03b848c', '32', '1', 'L');
INSERT INTO `order_detail` VALUES ('4', null, '35e00840-8c15-496e-bde4-8c0eba86c97a', '33', '1', 'L');
INSERT INTO `order_detail` VALUES ('5', null, 'd40cb820-ea68-45c3-9f5c-8ee19e2527ba', '33', '1', 'L');
INSERT INTO `order_detail` VALUES ('6', '2017-08-01', '4f570cc1-df43-49d7-8eab-3a238aba74cc', '37', '1', 'L');
INSERT INTO `order_detail` VALUES ('7', null, '19b1bd30-3e1d-4a45-a92d-b3d9e2946934', '34', '1', 'L');
INSERT INTO `order_detail` VALUES ('8', null, '15fc4339-18ba-4502-851e-2f6039956001', '34', '1', 'L');
INSERT INTO `order_detail` VALUES ('9', null, '561eb067-c339-49e5-9e63-dcce80fa681f', '36', '1', 'L');
INSERT INTO `order_detail` VALUES ('11', null, '34f0994e-c852-4848-91e7-726dbe1d01a0', '33', '1', 'L');
INSERT INTO `order_detail` VALUES ('12', null, '79848b66-7c01-46f4-81ba-8308af6ac8bb', '34', '1', 'L');
INSERT INTO `order_detail` VALUES ('13', null, '59dd7070-1ff1-4004-be54-b39808531b11', '36', '1', 'L');
INSERT INTO `order_detail` VALUES ('14', null, '773642a2-f4a8-42a5-9ccd-c55eeead685e', '38', '1', 'L');
INSERT INTO `order_detail` VALUES ('15', '2017-07-31', 'afcb7801-0c66-41ab-ae6a-740128cf5bd7', '32', '1', 'L');
INSERT INTO `order_detail` VALUES ('16', '2017-07-31', '3ae59f0a-c429-476f-a6ea-4c7b1d7a7700', '34', '1', 'L');
INSERT INTO `order_detail` VALUES ('17', '2017-07-31', '61286771-7ec9-4c11-bce7-f509d9b5e1c5', '33', '1', 'M');
INSERT INTO `order_detail` VALUES ('18', '2017-07-31', '70ca8901-9788-4bbc-93f9-3d28cf9b45cf', '32', '1', 'M');
INSERT INTO `order_detail` VALUES ('19', '2017-08-01', '0c805703-40ac-46cd-8271-e4eae80ca4f5', '36', '1', 'L');
INSERT INTO `order_detail` VALUES ('21', null, '961eca94-451d-4ce1-be89-510719996ec7', '37', '1', 'L');
INSERT INTO `order_detail` VALUES ('28', null, '1533b070-b40b-45fd-90c7-d743b1469b06', '36', '1', 'L');
INSERT INTO `order_detail` VALUES ('29', null, '0facfbaf-2d6a-4e34-9951-b9b108950b93', '34', '1', 'L');

-- ----------------------------
-- Table structure for `shop_activity`
-- ----------------------------
DROP TABLE IF EXISTS `shop_activity`;
CREATE TABLE `shop_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `shop_id` bigint(20) NOT NULL COMMENT '商家id',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `shop_activity_ibfk_2` (`shop_id`),
  CONSTRAINT `shop_activity_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `shop_activity_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shop_activity
-- ----------------------------
INSERT INTO `shop_activity` VALUES ('1', '1', '6');

-- ----------------------------
-- Table structure for `user_basic`
-- ----------------------------
DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'user主表id',
  `user_name` varchar(20) NOT NULL COMMENT '昵称',
  `is_shop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为商家，0为不是，1为是',
  `member` int(5) NOT NULL DEFAULT '0' COMMENT '会员等级，0为青铜，1为白银，2为黄金，3为钻石，最大为3，默认为0',
  `password` varchar(80) NOT NULL COMMENT '密码',
  `integral` bigint(20) NOT NULL DEFAULT '0' COMMENT '积分',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '用户余额',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_basic
-- ----------------------------
INSERT INTO `user_basic` VALUES ('6', '落叶', '1', '0', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', 'zhuangjiahan16@s.nuit.edu.cn');
INSERT INTO `user_basic` VALUES ('7', 'e友', '0', '0', '', '0', '0', '');
INSERT INTO `user_basic` VALUES ('8', 'e友', '0', '0', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '2583970510@qq.com');

-- ----------------------------
-- Table structure for `user_expand`
-- ----------------------------
DROP TABLE IF EXISTS `user_expand`;
CREATE TABLE `user_expand` (
  `id` bigint(20) NOT NULL COMMENT '关联basic表，进行用户信息拓展',
  `birthday` date DEFAULT NULL COMMENT '用户生日',
  `is_sex` tinyint(1) NOT NULL COMMENT '用户性别，1为男，0为女',
  `phone` varchar(20) DEFAULT NULL COMMENT '用户手机号码',
  `name` varchar(10) DEFAULT NULL COMMENT '用户姓名',
  `age` tinyint(4) NOT NULL DEFAULT '10' COMMENT '年龄（0—150）',
  PRIMARY KEY (`id`),
  CONSTRAINT `user_expand_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_expand
-- ----------------------------
INSERT INTO `user_expand` VALUES ('6', '2017-07-19', '1', '17765602455', '庄家瀚', '28');
INSERT INTO `user_expand` VALUES ('8', '2017-07-12', '1', '15113503956', '测试', '21');

-- ----------------------------
-- Table structure for `user_order`
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表索引',
  `user_id` bigint(20) NOT NULL COMMENT '外键，对应user表',
  `order_detail_id` bigint(20) NOT NULL COMMENT '外键，对应orderDetail表',
  PRIMARY KEY (`id`),
  KEY `orderDetail_id` (`order_detail_id`),
  KEY `order_ibfk_1` (`user_id`),
  CONSTRAINT `user_order_ibfk_2` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`id`),
  CONSTRAINT `user_order_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES ('1', '7', '1');
INSERT INTO `user_order` VALUES ('4', '8', '4');
INSERT INTO `user_order` VALUES ('5', '8', '5');
INSERT INTO `user_order` VALUES ('6', '8', '6');
INSERT INTO `user_order` VALUES ('7', '8', '7');
INSERT INTO `user_order` VALUES ('8', '8', '8');
INSERT INTO `user_order` VALUES ('9', '8', '9');
INSERT INTO `user_order` VALUES ('11', '8', '11');
INSERT INTO `user_order` VALUES ('12', '8', '12');
INSERT INTO `user_order` VALUES ('13', '8', '13');
INSERT INTO `user_order` VALUES ('14', '8', '14');
INSERT INTO `user_order` VALUES ('15', '8', '15');
INSERT INTO `user_order` VALUES ('16', '8', '16');
INSERT INTO `user_order` VALUES ('17', '8', '17');
INSERT INTO `user_order` VALUES ('18', '8', '18');
INSERT INTO `user_order` VALUES ('19', '8', '19');
INSERT INTO `user_order` VALUES ('20', '8', '21');
INSERT INTO `user_order` VALUES ('27', '8', '28');
INSERT INTO `user_order` VALUES ('28', '8', '29');
