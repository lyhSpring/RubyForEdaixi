/*
Navicat MySQL Data Transfer

Source Server         : baidu
Source Server Version : 50554
Source Host           : 180.76.165.224:3306
Source Database       : edaixitest

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-05-28 14:45:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addresses`
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL COMMENT '详细地址#联系人#电话',
  `addressable_id` int(11) DEFAULT NULL,
  `addressable_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `factory_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'beijinghaidian#lyh#18811439847', '1', '3', null, null, '2017-05-06 18:00:58', '2017-05-06 18:00:58', '1');

-- ----------------------------
-- Table structure for `ar_internal_metadata`
-- ----------------------------
DROP TABLE IF EXISTS `ar_internal_metadata`;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_internal_metadata
-- ----------------------------
INSERT INTO `ar_internal_metadata` VALUES ('environment', 'development', '2017-03-19 16:44:01', '2017-03-19 16:44:01');

-- ----------------------------
-- Table structure for `cards`
-- ----------------------------
DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `true_money` int(11) DEFAULT NULL,
  `fake_money` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cards
-- ----------------------------
INSERT INTO `cards` VALUES ('1', '1', '250', '12501', '2017-05-17 09:14:05', '2017-05-27 04:50:02');
INSERT INTO `cards` VALUES ('2', '2', '582', '75', '2017-05-17 09:14:05', '2017-05-27 13:43:56');
INSERT INTO `cards` VALUES ('3', '3', '100', '20', '2017-05-17 09:14:05', '2017-05-17 09:14:05');
INSERT INTO `cards` VALUES ('4', '4', '100', '20', '2017-05-17 09:14:06', '2017-05-17 09:14:06');
INSERT INTO `cards` VALUES ('5', '5', '100', '20', '2017-05-17 09:14:06', '2017-05-17 09:14:06');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '洗衣', 'http://ons52g6mv.bkt.clouddn.com/category_chenshan.png', '0', '2017-04-14 16:04:55', '2017-05-27 00:33:38');
INSERT INTO `categories` VALUES ('2', '洗鞋', 'http://ons52g6mv.bkt.clouddn.com/category_chuanglian.png', '0', '2017-04-14 16:04:55', '2017-05-27 00:34:04');
INSERT INTO `categories` VALUES ('3', '洗家纺', 'http://ons52g6mv.bkt.clouddn.com/category_jiafang.png', '0', '2017-04-14 16:04:56', '2017-05-27 00:34:12');
INSERT INTO `categories` VALUES ('4', '洗窗帘', 'http://ons52g6mv.bkt.clouddn.com/category_chenshan.png', '0', '2017-04-16 08:10:53', '2017-05-27 00:34:45');
INSERT INTO `categories` VALUES ('5', 'lyh2我很聪明', 'http://ons52g6mv.bkt.clouddn.com/category_chuanglian.png', '0', '2017-04-16 08:10:53', '2017-04-16 08:10:53');
INSERT INTO `categories` VALUES ('6', '2222', 'http://ons52g6mv.bkt.clouddn.com/category_jiafang.png', '0', '2017-04-16 08:10:53', '2017-05-27 04:45:37');
INSERT INTO `categories` VALUES ('7', '1111', null, null, '2017-05-27 04:45:29', '2017-05-27 04:45:29');

-- ----------------------------
-- Table structure for `couriers`
-- ----------------------------
DROP TABLE IF EXISTS `couriers`;
CREATE TABLE `couriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `settlement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of couriers
-- ----------------------------
INSERT INTO `couriers` VALUES ('1', 'lyh1', '0', '1234567@qq.com', '123456', '123456', '2', '2017-05-10 10:00:18', '2017-05-27 04:59:09', '1');
INSERT INTO `couriers` VALUES ('2', 'lyh2', '0', '123@qq.com', '12345', '123456', '9', '2017-05-17 09:14:05', '2017-05-27 04:28:31', '2');

-- ----------------------------
-- Table structure for `discount_rules`
-- ----------------------------
DROP TABLE IF EXISTS `discount_rules`;
CREATE TABLE `discount_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(255) DEFAULT NULL,
  `base_money` int(11) DEFAULT NULL,
  `added_money` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discount_rules
-- ----------------------------
INSERT INTO `discount_rules` VALUES ('1', '1', '111', '22', '2017-05-15', '2017-08-01', '2017-05-17 18:03:09', '2017-05-27 03:55:37');
INSERT INTO `discount_rules` VALUES ('2', '0', '100', '22', '2017-05-15', '2017-08-01', '2017-05-17 18:08:48', '2017-05-27 04:50:56');
INSERT INTO `discount_rules` VALUES ('3', '0', '111', '11', '2017-05-27', '2017-08-01', '2017-05-27 04:07:32', '2017-05-27 04:07:38');
INSERT INTO `discount_rules` VALUES ('4', '0', '11', '1', '2017-05-27', '2017-05-27', '2017-05-27 04:50:16', '2017-05-27 04:50:16');

-- ----------------------------
-- Table structure for `factories`
-- ----------------------------
DROP TABLE IF EXISTS `factories`;
CREATE TABLE `factories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `station_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factories
-- ----------------------------
INSERT INTO `factories` VALUES ('1', '东城区', '110101', '0', '132@qq.com', '456', '2', '2017-05-06 18:00:06', '2017-05-06 18:00:06', '110101');
INSERT INTO `factories` VALUES ('2', '888', '110101', '0', '132@qq.com', '456', '2', '2017-05-06 18:01:41', '2017-05-27 04:48:02', '110102');
INSERT INTO `factories` VALUES ('3', '朝阳区', '110105', '0', '132@qq.com', '456', '2', '2017-05-25 13:22:35', '2017-05-25 13:22:35', '110105');
INSERT INTO `factories` VALUES ('4', '丰台区', '123', '0', '132@qq.com', '456', '0', '2017-05-26 09:02:07', '2017-05-26 09:02:07', '110106');
INSERT INTO `factories` VALUES ('5', '石景山区', '123', '0', '132@qq.com', '456', '0', '2017-05-26 09:30:41', '2017-05-26 09:30:41', '110107');
INSERT INTO `factories` VALUES ('6', '海淀区', '123', '0', '132@qq.com', '456', '0', '2017-05-26 13:36:14', '2017-05-26 13:36:14', '110108');
INSERT INTO `factories` VALUES ('7', '门头沟区', 'hi', '0', 'wyl@qq', '456', '0', '2017-05-26 14:25:46', '2017-05-26 14:25:46', '110109');
INSERT INTO `factories` VALUES ('8', '房山区', '123', '0', '133332@qq.com', '456', '0', '2017-05-11 09:00:38', '2017-05-10 09:00:43', '110111');
INSERT INTO `factories` VALUES ('9', '通州区', '123', '0', 'qwe@qq.com', '456', '0', '2017-05-11 09:01:43', '2017-05-11 09:01:47', '110112');
INSERT INTO `factories` VALUES ('10', '顺义区', '123', '0', 'qsc@qq.com', '456', '0', '2017-05-10 09:03:48', '2017-05-10 09:03:52', '110113');
INSERT INTO `factories` VALUES ('11', '昌平区', '123', '0', 'qaz@qq.com', '456', '0', '2017-05-10 09:04:20', '2017-05-10 09:04:16', '110114');
INSERT INTO `factories` VALUES ('12', '大兴区', '123', '0', 'qwsx@qq.com', '456', '0', '2017-05-10 09:04:58', '2017-05-10 09:05:01', '110115');
INSERT INTO `factories` VALUES ('13', '怀柔区', '123', '0', 'lyh@qq.com', '456', '0', '2017-05-10 09:05:29', '2017-05-10 09:05:33', '110116');
INSERT INTO `factories` VALUES ('14', '平谷区', '123', '0', 'qdc@qq.com', '456', '0', '2017-05-10 09:05:57', '2017-05-10 09:06:00', '110117');
INSERT INTO `factories` VALUES ('15', '密云县', '123', '0', 'qgc@qq.com', '456', '0', '2017-05-10 09:06:56', '2017-05-10 09:07:00', '110228');
INSERT INTO `factories` VALUES ('16', '延庆县', '123', '0', 'qkjs@qq.com', '456', '0', '2017-05-10 09:08:12', '2017-05-10 09:08:15', '110229');

-- ----------------------------
-- Table structure for `factories_stations`
-- ----------------------------
DROP TABLE IF EXISTS `factories_stations`;
CREATE TABLE `factories_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factories_stations
-- ----------------------------
INSERT INTO `factories_stations` VALUES ('1', '1', '2', '2017-05-06 17:33:35', '2017-05-06 17:33:35');

-- ----------------------------
-- Table structure for `factory_stations`
-- ----------------------------
DROP TABLE IF EXISTS `factory_stations`;
CREATE TABLE `factory_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_stations
-- ----------------------------
INSERT INTO `factory_stations` VALUES ('1', '1', '2', '2017-05-06 17:33:35', '2017-05-06 17:33:35');
INSERT INTO `factory_stations` VALUES ('2', '1', '0', '2017-05-07 08:23:49', '2017-05-07 08:23:49');
INSERT INTO `factory_stations` VALUES ('3', '1', '0', '2017-05-07 08:53:57', '2017-05-07 08:53:57');
INSERT INTO `factory_stations` VALUES ('4', '1', '0', '2017-05-07 08:54:05', '2017-05-07 08:54:05');
INSERT INTO `factory_stations` VALUES ('5', '1', '0', '2017-05-07 08:54:20', '2017-05-07 08:54:20');
INSERT INTO `factory_stations` VALUES ('6', '1', '0', '2017-05-07 09:00:50', '2017-05-07 09:00:50');
INSERT INTO `factory_stations` VALUES ('7', '1', '0', '2017-05-22 07:01:19', '2017-05-22 07:01:19');
INSERT INTO `factory_stations` VALUES ('8', '1', '0', '2017-05-24 15:42:54', '2017-05-24 15:42:54');
INSERT INTO `factory_stations` VALUES ('9', '1', '0', '2017-05-24 15:45:29', '2017-05-24 15:45:29');
INSERT INTO `factory_stations` VALUES ('10', '1', null, '2017-05-24 15:46:34', '2017-05-24 15:46:34');
INSERT INTO `factory_stations` VALUES ('11', '1', null, '2017-05-24 15:47:38', '2017-05-24 15:47:38');
INSERT INTO `factory_stations` VALUES ('12', '1', null, '2017-05-24 15:55:33', '2017-05-24 15:55:33');
INSERT INTO `factory_stations` VALUES ('13', '1', null, '2017-05-24 15:55:43', '2017-05-24 15:55:43');
INSERT INTO `factory_stations` VALUES ('14', '1', null, '2017-05-24 15:58:04', '2017-05-24 15:58:04');
INSERT INTO `factory_stations` VALUES ('15', '1', null, '2017-05-24 15:58:24', '2017-05-24 15:58:24');
INSERT INTO `factory_stations` VALUES ('16', '1', null, '2017-05-24 15:58:50', '2017-05-24 15:58:50');
INSERT INTO `factory_stations` VALUES ('17', '1', null, '2017-05-24 15:59:30', '2017-05-24 15:59:30');
INSERT INTO `factory_stations` VALUES ('18', '1', null, '2017-05-24 16:00:27', '2017-05-24 16:00:27');
INSERT INTO `factory_stations` VALUES ('19', '1', null, '2017-05-24 16:01:34', '2017-05-24 16:01:34');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_number` int(11) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '1', '2', '2', '10', '2017-05-09 12:17:45', '2017-05-09 12:17:45');
INSERT INTO `items` VALUES ('2', '4', '2', '1', '5', '2017-05-09 12:17:45', '2017-05-09 12:17:45');
INSERT INTO `items` VALUES ('3', '6', '2', '1', '1', '2017-05-09 12:17:46', '2017-05-09 12:17:46');
INSERT INTO `items` VALUES ('4', '5', '3', '1', '1', '2017-05-12 07:46:39', '2017-05-12 07:46:39');
INSERT INTO `items` VALUES ('5', '6', '3', '1', '1', '2017-05-12 07:46:39', '2017-05-12 07:46:39');
INSERT INTO `items` VALUES ('6', '8', '3', '2', '10', '2017-05-12 07:46:39', '2017-05-12 07:46:39');
INSERT INTO `items` VALUES ('7', '1', '4', '1', '0', '2017-05-13 15:16:00', '2017-05-13 15:16:00');
INSERT INTO `items` VALUES ('8', '5', '4', '1', '0', '2017-05-13 15:16:00', '2017-05-13 15:16:00');
INSERT INTO `items` VALUES ('9', '6', '4', '1', '0', '2017-05-13 15:16:00', '2017-05-13 15:16:00');
INSERT INTO `items` VALUES ('10', '8', '4', '2', '0', '2017-05-13 15:16:00', '2017-05-13 15:16:00');
INSERT INTO `items` VALUES ('11', '7', '4', '1', '0', '2017-05-13 15:16:00', '2017-05-13 15:16:00');
INSERT INTO `items` VALUES ('12', '1', '5', '1', '0', '2017-05-13 15:34:41', '2017-05-13 15:34:41');
INSERT INTO `items` VALUES ('13', '5', '5', '1', '0', '2017-05-13 15:34:41', '2017-05-13 15:34:41');
INSERT INTO `items` VALUES ('14', '6', '5', '2', '0', '2017-05-13 15:34:41', '2017-05-13 15:34:41');
INSERT INTO `items` VALUES ('15', '5', '6', '1', '0', '2017-05-14 07:55:31', '2017-05-14 07:55:31');
INSERT INTO `items` VALUES ('16', '6', '6', '1', '0', '2017-05-14 07:55:31', '2017-05-14 07:55:31');
INSERT INTO `items` VALUES ('17', '1', '10', '1', '5', '2017-05-19 13:27:42', '2017-05-19 13:27:42');
INSERT INTO `items` VALUES ('18', '4', '10', '1', '5', '2017-05-19 13:27:42', '2017-05-19 13:27:42');
INSERT INTO `items` VALUES ('19', '5', '10', '1', '1', '2017-05-19 13:27:42', '2017-05-19 13:27:42');
INSERT INTO `items` VALUES ('20', '6', '10', '1', '1', '2017-05-19 13:27:42', '2017-05-19 13:27:42');
INSERT INTO `items` VALUES ('21', '1', '11', '1', '5', '2017-05-19 15:52:49', '2017-05-19 15:52:49');
INSERT INTO `items` VALUES ('22', '4', '11', '1', '5', '2017-05-19 15:52:49', '2017-05-19 15:52:49');
INSERT INTO `items` VALUES ('23', '1', '12', '1', '5', '2017-05-19 15:55:55', '2017-05-19 15:55:55');
INSERT INTO `items` VALUES ('24', '4', '12', '1', '5', '2017-05-19 15:55:55', '2017-05-19 15:55:55');
INSERT INTO `items` VALUES ('25', '1', '13', '1', '5', '2017-05-21 07:00:11', '2017-05-21 07:00:11');
INSERT INTO `items` VALUES ('26', '4', '13', '1', '5', '2017-05-21 07:00:11', '2017-05-21 07:00:11');
INSERT INTO `items` VALUES ('27', '6', '13', '1', '1', '2017-05-21 07:00:11', '2017-05-21 07:00:11');
INSERT INTO `items` VALUES ('28', '1', '14', '21', '105', '2017-05-21 07:04:07', '2017-05-21 07:04:07');
INSERT INTO `items` VALUES ('29', '6', '15', '1', '1', '2017-05-27 01:28:00', '2017-05-27 01:28:00');
INSERT INTO `items` VALUES ('30', '7', '15', '1', '5', '2017-05-27 01:28:00', '2017-05-27 01:28:00');
INSERT INTO `items` VALUES ('31', '6', '1', '1', '1', '2017-05-27 01:48:54', '2017-05-27 01:48:54');
INSERT INTO `items` VALUES ('32', '7', '1', '1', '5', '2017-05-27 01:48:54', '2017-05-27 01:48:54');
INSERT INTO `items` VALUES ('33', '6', '2', '1', '2', '2017-05-27 02:04:00', '2017-05-27 02:04:00');
INSERT INTO `items` VALUES ('34', '7', '2', '1', '4', '2017-05-27 02:04:00', '2017-05-27 02:04:00');
INSERT INTO `items` VALUES ('35', '6', '1', '1', '1', '2017-05-27 02:24:30', '2017-05-27 02:24:30');
INSERT INTO `items` VALUES ('36', '7', '1', '1', '5', '2017-05-27 02:24:30', '2017-05-27 02:24:30');
INSERT INTO `items` VALUES ('37', '4', '2', '1', '4', '2017-05-27 02:40:48', '2017-05-27 02:40:48');
INSERT INTO `items` VALUES ('38', '5', '2', '1', '2', '2017-05-27 02:40:49', '2017-05-27 02:40:49');
INSERT INTO `items` VALUES ('39', '4', '3', '1', '4', '2017-05-27 02:49:52', '2017-05-27 02:49:52');
INSERT INTO `items` VALUES ('40', '6', '3', '1', '2', '2017-05-27 02:49:52', '2017-05-27 02:49:52');
INSERT INTO `items` VALUES ('41', '6', '4', '1', '2', '2017-05-27 03:18:37', '2017-05-27 03:18:37');
INSERT INTO `items` VALUES ('42', '7', '4', '1', '4', '2017-05-27 03:18:37', '2017-05-27 03:18:37');
INSERT INTO `items` VALUES ('43', '9', '5', '28', '112', '2017-05-27 04:02:59', '2017-05-27 04:02:59');
INSERT INTO `items` VALUES ('44', '8', '6', '2', '100', '2017-05-27 04:17:32', '2017-05-27 04:17:32');
INSERT INTO `items` VALUES ('45', '7', '6', '3', '12', '2017-05-27 04:17:32', '2017-05-27 04:17:32');
INSERT INTO `items` VALUES ('46', '8', '7', '2', '100', '2017-05-27 04:32:08', '2017-05-27 04:32:08');
INSERT INTO `items` VALUES ('47', '9', '7', '3', '12', '2017-05-27 04:32:08', '2017-05-27 04:32:08');
INSERT INTO `items` VALUES ('48', '6', '8', '2', '6', '2017-05-27 04:52:26', '2017-05-27 04:52:26');
INSERT INTO `items` VALUES ('49', '7', '8', '1', '3', '2017-05-27 04:52:26', '2017-05-27 04:52:26');
INSERT INTO `items` VALUES ('50', '9', '8', '1', '3', '2017-05-27 04:52:26', '2017-05-27 04:52:26');
INSERT INTO `items` VALUES ('51', '8', '8', '2', '102', '2017-05-27 04:52:26', '2017-05-27 04:52:26');
INSERT INTO `items` VALUES ('52', '6', '9', '1', '3', '2017-05-27 13:43:56', '2017-05-27 13:43:56');
INSERT INTO `items` VALUES ('53', '7', '9', '1', '3', '2017-05-27 13:43:56', '2017-05-27 13:43:56');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) DEFAULT '0',
  `washing_status` int(11) DEFAULT '0',
  `factory_id` int(11) DEFAULT '0',
  `waybill_id` int(11) DEFAULT '0',
  `voucher_status` int(11) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `address_id` int(11) DEFAULT '1',
  `totalprice` decimal(10,0) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `act_pay` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', '1', '0', '1', '0', '1', '1', '7', '1', '6', '2', '2017-05-27 02:49:52', '2017-05-27 03:14:32', '6');
INSERT INTO `orders` VALUES ('4', '1', '0', '1', '0', '1', '1', '7', '1', '6', '2', '2017-05-27 03:18:37', '2017-05-27 03:24:57', '6');
INSERT INTO `orders` VALUES ('5', '0', '0', '1', '0', '1', '1', '1', '1', '112', '2', '2017-05-27 04:02:59', '2017-05-27 04:02:59', '92');
INSERT INTO `orders` VALUES ('6', '0', '0', '1', '0', '1', '1', '1', '1', '112', '2', '2017-05-27 04:17:32', '2017-05-27 04:17:32', '110');
INSERT INTO `orders` VALUES ('7', '0', '0', '1', '0', '1', '1', '1', '1', '112', '2', '2017-05-27 04:32:08', '2017-05-27 04:32:08', '110');
INSERT INTO `orders` VALUES ('8', '1', '0', '1', '0', '1', '1', '7', '1', '114', '2', '2017-05-27 04:52:26', '2017-05-27 04:58:09', '92');
INSERT INTO `orders` VALUES ('9', '0', '0', '1', '0', '1', '1', '5', '1', '6', '2', '2017-05-27 13:43:56', '2017-05-27 14:15:54', '6');

-- ----------------------------
-- Table structure for `price_rules`
-- ----------------------------
DROP TABLE IF EXISTS `price_rules`;
CREATE TABLE `price_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_rules
-- ----------------------------
INSERT INTO `price_rules` VALUES ('75', '3', '110101', '1', '2017-05-26 16:00:00', '2017-05-27 01:41:10', '2017-05-27 04:46:54');
INSERT INTO `price_rules` VALUES ('76', '1', '110101', '2', '2017-05-27 01:41:10', '2017-05-27 01:41:10', '2017-05-27 01:41:10');
INSERT INTO `price_rules` VALUES ('77', '1', '110101', '3', '2017-05-27 01:41:10', '2017-05-27 01:41:10', '2017-05-27 01:41:10');
INSERT INTO `price_rules` VALUES ('78', '1', '110101', '4', '2017-05-27 01:41:10', '2017-05-27 01:41:10', '2017-05-27 01:41:10');
INSERT INTO `price_rules` VALUES ('79', '1', '110101', '5', '2017-05-27 01:41:10', '2017-05-27 01:41:10', '2017-05-27 01:41:10');
INSERT INTO `price_rules` VALUES ('80', '1', '110101', '6', '2017-05-27 01:41:10', '2017-05-27 01:41:10', '2017-05-27 01:41:10');
INSERT INTO `price_rules` VALUES ('81', '1', '110102', '1', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');
INSERT INTO `price_rules` VALUES ('82', '1', '110102', '2', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');
INSERT INTO `price_rules` VALUES ('83', '1', '110102', '3', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');
INSERT INTO `price_rules` VALUES ('84', '1', '110102', '4', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');
INSERT INTO `price_rules` VALUES ('85', '1', '110102', '5', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');
INSERT INTO `price_rules` VALUES ('86', '1', '110102', '6', '2017-05-27 01:41:12', '2017-05-27 01:41:12', '2017-05-27 01:41:12');

-- ----------------------------
-- Table structure for `prices`
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price1` decimal(10,0) DEFAULT NULL,
  `price2` decimal(10,0) DEFAULT NULL,
  `price3` decimal(10,0) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prices
-- ----------------------------
INSERT INTO `prices` VALUES ('1', '5', '12', '3', '1', '2017-05-04 14:05:34', '2017-05-05 12:05:27');
INSERT INTO `prices` VALUES ('2', '5', '4', '3', '2', '2017-05-04 14:05:48', '2017-05-04 14:05:48');
INSERT INTO `prices` VALUES ('3', '5', '4', '3', '3', '2017-05-04 14:05:55', '2017-05-04 14:05:55');
INSERT INTO `prices` VALUES ('4', '5', '4', '3', '4', '2017-05-04 14:06:00', '2017-05-04 14:06:00');
INSERT INTO `prices` VALUES ('5', '1', '2', '3', '5', '2017-05-04 14:25:42', '2017-05-04 14:25:42');
INSERT INTO `prices` VALUES ('6', '1', '2', '3', '6', '2017-05-05 12:06:00', '2017-05-05 12:06:00');
INSERT INTO `prices` VALUES ('7', '5', '4', '3', '7', '2017-05-06 18:13:43', '2017-05-06 18:13:43');
INSERT INTO `prices` VALUES ('8', '50', '50', '51', '8', '2017-05-09 07:36:08', '2017-05-27 04:47:30');
INSERT INTO `prices` VALUES ('9', '5', '4', '3', '9', '2017-05-09 07:36:34', '2017-05-09 07:36:34');
INSERT INTO `prices` VALUES ('10', '5', '4', '3', '13', '2017-05-09 07:37:21', '2017-05-09 07:37:21');
INSERT INTO `prices` VALUES ('11', '40', '3', '3', '10', '2017-05-12 08:28:48', '2017-05-27 04:15:59');
INSERT INTO `prices` VALUES ('12', '2', '3', '4', '11', '2017-05-12 08:29:25', '2017-05-12 08:29:25');
INSERT INTO `prices` VALUES ('13', '10', '2', '1', '12', '2017-05-12 08:32:32', '2017-05-27 04:16:04');
INSERT INTO `prices` VALUES ('14', '5', '4', '3', '14', '2017-05-13 15:47:12', '2017-05-13 15:47:12');
INSERT INTO `prices` VALUES ('15', '8', '0', '99', '13', '2017-05-26 16:44:56', '2017-05-27 02:31:45');
INSERT INTO `prices` VALUES ('16', '22', '3', '0', '14', '2017-05-27 04:45:54', '2017-05-27 04:46:34');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` varchar(255) DEFAULT '0',
  `categories_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '243', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '3', '2017-04-14 16:04:56', '2017-05-26 16:42:24', '0');
INSERT INTO `products` VALUES ('2', 'product 2', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '2', '2017-04-14 16:04:56', '2017-04-14 16:04:56', '0');
INSERT INTO `products` VALUES ('3', 'product 3', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '3', '2017-04-14 16:04:56', '2017-04-14 16:04:56', '0');
INSERT INTO `products` VALUES ('4', '1234', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-15 09:22:44', '2017-04-15 09:22:44', '0');
INSERT INTO `products` VALUES ('5', '1234', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-15 09:23:07', '2017-04-15 09:23:07', '0');
INSERT INTO `products` VALUES ('6', '1234', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-15 13:14:55', '2017-04-15 13:14:55', '0');
INSERT INTO `products` VALUES ('7', 'product 1', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-16 08:10:53', '2017-04-16 08:10:53', '0');
INSERT INTO `products` VALUES ('8', 'product 2', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-16 08:10:53', '2017-04-16 08:10:53', '0');
INSERT INTO `products` VALUES ('9', 'product 3', 'http://ons52g6mv.bkt.clouddn.com/product.png', '0', '1', '2017-04-16 08:10:53', '2017-04-16 08:10:53', '0');
INSERT INTO `products` VALUES ('10', '243546', null, '1', '1', '2017-05-12 08:28:48', '2017-05-27 00:57:11', '0');
INSERT INTO `products` VALUES ('11', '2435467', null, '0', '1', '2017-05-12 08:29:24', '2017-05-12 08:29:24', '0');
INSERT INTO `products` VALUES ('12', '请求', null, '1', '1', '2017-05-12 08:32:32', '2017-05-26 15:59:13', '0');
INSERT INTO `products` VALUES ('13', 'hi', null, '0', '2', '2017-05-26 16:44:56', '2017-05-26 16:44:56', null);
INSERT INTO `products` VALUES ('14', '111', null, '1', '6', '2017-05-27 04:45:54', '2017-05-27 04:45:58', null);

-- ----------------------------
-- Table structure for `regions`
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110230 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES ('110101', '东城区', '2017-05-09 07:37:21', '2017-05-27 01:41:10', '1');
INSERT INTO `regions` VALUES ('110102', '西城区', '2017-05-09 07:37:21', '2017-05-27 01:41:12', '1');
INSERT INTO `regions` VALUES ('110105', '朝阳区', '2017-05-09 07:37:21', '2017-05-27 04:45:07', '0');
INSERT INTO `regions` VALUES ('110106', '丰台区', '2017-05-09 07:37:21', '2017-05-27 00:42:56', '0');
INSERT INTO `regions` VALUES ('110107', '石景山区', '2017-05-09 07:37:21', '2017-05-27 00:43:00', '0');
INSERT INTO `regions` VALUES ('110108', '海淀区', '2017-05-09 07:37:21', '2017-05-27 00:42:58', '0');
INSERT INTO `regions` VALUES ('110109', '门头沟区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110111', '房山区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110112', '通州区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110113', '顺义区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110114', '昌平区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110115', '大兴区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110116', '怀柔区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110117', '平谷区', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110228', '密云县', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');
INSERT INTO `regions` VALUES ('110229', '延庆县', '2017-05-09 07:37:21', '2017-05-09 07:37:21', '0');

-- ----------------------------
-- Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('20170319163514');
INSERT INTO `schema_migrations` VALUES ('20170328064248');
INSERT INTO `schema_migrations` VALUES ('20170413160816');
INSERT INTO `schema_migrations` VALUES ('20170414113421');
INSERT INTO `schema_migrations` VALUES ('20170414155504');
INSERT INTO `schema_migrations` VALUES ('20170414160433');
INSERT INTO `schema_migrations` VALUES ('20170415112452');
INSERT INTO `schema_migrations` VALUES ('20170416092236');
INSERT INTO `schema_migrations` VALUES ('20170417073451');
INSERT INTO `schema_migrations` VALUES ('20170422030859');
INSERT INTO `schema_migrations` VALUES ('20170422033715');
INSERT INTO `schema_migrations` VALUES ('20170422063141');
INSERT INTO `schema_migrations` VALUES ('20170422064256');
INSERT INTO `schema_migrations` VALUES ('20170422072102');
INSERT INTO `schema_migrations` VALUES ('20170504123702');
INSERT INTO `schema_migrations` VALUES ('20170504124053');
INSERT INTO `schema_migrations` VALUES ('20170504124304');
INSERT INTO `schema_migrations` VALUES ('20170504124405');
INSERT INTO `schema_migrations` VALUES ('20170504131609');
INSERT INTO `schema_migrations` VALUES ('20170504132242');
INSERT INTO `schema_migrations` VALUES ('20170504132452');
INSERT INTO `schema_migrations` VALUES ('20170504132639');
INSERT INTO `schema_migrations` VALUES ('20170504132824');
INSERT INTO `schema_migrations` VALUES ('20170504133836');
INSERT INTO `schema_migrations` VALUES ('20170504134152');
INSERT INTO `schema_migrations` VALUES ('20170504134503');
INSERT INTO `schema_migrations` VALUES ('20170504134536');
INSERT INTO `schema_migrations` VALUES ('20170507071639');
INSERT INTO `schema_migrations` VALUES ('20170509071709');
INSERT INTO `schema_migrations` VALUES ('20170509124735');
INSERT INTO `schema_migrations` VALUES ('20170510091802');
INSERT INTO `schema_migrations` VALUES ('20170513152712');
INSERT INTO `schema_migrations` VALUES ('20170517080912');
INSERT INTO `schema_migrations` VALUES ('20170517081200');
INSERT INTO `schema_migrations` VALUES ('20170517082113');
INSERT INTO `schema_migrations` VALUES ('20170517082253');
INSERT INTO `schema_migrations` VALUES ('20170517082420');
INSERT INTO `schema_migrations` VALUES ('20170517083045');
INSERT INTO `schema_migrations` VALUES ('20170517083143');
INSERT INTO `schema_migrations` VALUES ('20170517172603');
INSERT INTO `schema_migrations` VALUES ('20170517172842');
INSERT INTO `schema_migrations` VALUES ('20170517180212');
INSERT INTO `schema_migrations` VALUES ('20170519073205');
INSERT INTO `schema_migrations` VALUES ('20170519073747');
INSERT INTO `schema_migrations` VALUES ('20170525113632');
INSERT INTO `schema_migrations` VALUES ('20170525115507');
INSERT INTO `schema_migrations` VALUES ('20170526054457');
INSERT INTO `schema_migrations` VALUES ('20170526085238');

-- ----------------------------
-- Table structure for `settlements`
-- ----------------------------
DROP TABLE IF EXISTS `settlements`;
CREATE TABLE `settlements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settled` int(11) DEFAULT '0',
  `unsettled` int(11) DEFAULT '0',
  `money_settled` int(11) DEFAULT '0',
  `money_unsettled` int(11) DEFAULT '0',
  `courier_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settlements
-- ----------------------------
INSERT INTO `settlements` VALUES ('1', '19', '0', '19', '0', '1', '2017-05-10 09:58:57', '2017-05-27 04:59:01');
INSERT INTO `settlements` VALUES ('2', '19', '2', '19', '2', '2', '2017-05-10 10:01:59', '2017-05-10 10:02:02');

-- ----------------------------
-- Table structure for `stations`
-- ----------------------------
DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `factory_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stations
-- ----------------------------
INSERT INTO `stations` VALUES ('1', '交大站111', '110101', '0000-00-00 00:00:00', '2017-05-27 04:49:28', '1');
INSERT INTO `stations` VALUES ('2', '交大站222', '110102', '2017-02-24 16:14:06', '2017-05-27 01:54:45', '2');
INSERT INTO `stations` VALUES ('9', 'addOneStation', '110102', '2017-05-27 04:28:22', '2017-05-27 04:49:16', '2');
INSERT INTO `stations` VALUES ('10', '111', '110102', '2017-05-27 04:48:47', '2017-05-27 04:48:47', '2');

-- ----------------------------
-- Table structure for `turnovers`
-- ----------------------------
DROP TABLE IF EXISTS `turnovers`;
CREATE TABLE `turnovers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turnover_type` int(11) DEFAULT NULL,
  `true_money` int(11) DEFAULT NULL,
  `fake_money` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of turnovers
-- ----------------------------
INSERT INTO `turnovers` VALUES ('3', '0', '5', '0', '2', '2017-05-27 02:49:52', '2017-05-27 02:49:52');
INSERT INTO `turnovers` VALUES ('4', '0', '5', '0', '2', '2017-05-27 03:18:37', '2017-05-27 03:18:37');
INSERT INTO `turnovers` VALUES ('5', '0', '91', '0', '2', '2017-05-27 04:02:59', '2017-05-27 04:02:59');
INSERT INTO `turnovers` VALUES ('6', '0', '110', '0', '2', '2017-05-27 04:17:31', '2017-05-27 04:17:31');
INSERT INTO `turnovers` VALUES ('7', '0', '110', '0', '2', '2017-05-27 04:32:08', '2017-05-27 04:32:08');
INSERT INTO `turnovers` VALUES ('8', '1', null, '12121', '1', '2017-05-27 04:50:02', '2017-05-27 04:50:02');
INSERT INTO `turnovers` VALUES ('9', '0', '91', '0', '2', '2017-05-27 04:52:26', '2017-05-27 04:52:26');
INSERT INTO `turnovers` VALUES ('10', '2', '100', '1', '2', '2017-05-27 04:53:18', '2017-05-27 04:53:18');
INSERT INTO `turnovers` VALUES ('11', '2', '100', '1', '2', '2017-05-27 13:39:49', '2017-05-27 13:39:49');
INSERT INTO `turnovers` VALUES ('12', '0', '5', '0', '2', '2017-05-27 13:43:56', '2017-05-27 13:43:56');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '123', '123456', '123@qq.com', '18811439847', '2017-04-13 19:00:13', '2017-04-22 09:09:09', 'pt', '2', '1');
INSERT INTO `users` VALUES ('2', 'wyl', '123456', 'wyl@qq.com', '123456', '2017-04-13 19:57:41', '2017-04-13 19:57:41', 'pt', null, '2');
INSERT INTO `users` VALUES ('3', 'lyh2我很聪明', '123456', '123@qq.com', '18811439847', '2017-04-14 16:01:45', '2017-04-14 16:01:45', 'jg', null, '3');
INSERT INTO `users` VALUES ('4', 'lyh2我很聪明', '123456', '123@qq.com', '18811439847', '2017-04-14 16:04:55', '2017-04-14 16:04:55', 'qs', null, '4');
INSERT INTO `users` VALUES ('5', 'lyh2我很聪明', '123456', '123@qq.com', '18811439847', '2017-04-16 08:10:53', '2017-05-26 14:53:19', null, '3', '5');
INSERT INTO `users` VALUES ('6', 'lyh2我很聪明', '123456', '123@qq.com', '18811439847', '2017-04-22 06:21:49', '2017-05-26 15:30:59', 'qs', '3', '6');

-- ----------------------------
-- Table structure for `waybills`
-- ----------------------------
DROP TABLE IF EXISTS `waybills`;
CREATE TABLE `waybills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_type` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `recieve_id` int(11) DEFAULT '0',
  `exp_time` datetime DEFAULT NULL,
  `actual_time` datetime DEFAULT NULL,
  `waybill_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `recieve_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waybills
-- ----------------------------
INSERT INTO `waybills` VALUES ('5', '0', '2', '2', '1', '2017-05-28 02:00:00', '2017-05-27 03:15:57', '0', '3', '2017-05-27 02:49:52', '2017-05-27 03:14:23', '1');
INSERT INTO `waybills` VALUES ('6', '1', '0', '4', '0', '2017-05-27 05:08:21', null, '5', '3', '2017-05-27 03:06:47', '2017-05-27 03:13:08', '3');
INSERT INTO `waybills` VALUES ('7', '1', '0', '2', '0', '2017-05-27 05:08:37', null, '6', '3', '2017-05-27 03:07:02', '2017-05-27 03:07:02', '3');
INSERT INTO `waybills` VALUES ('8', '3', '1', '5', '0', '2017-05-27 05:14:42', null, '0', '3', '2017-05-27 03:13:08', '2017-05-27 03:13:08', '1');
INSERT INTO `waybills` VALUES ('9', '1', '0', '2', '0', '2017-05-27 05:15:57', null, '5', '3', '2017-05-27 03:14:23', '2017-05-27 03:14:23', '0');
INSERT INTO `waybills` VALUES ('10', '0', '2', '2', '1', '2017-05-28 06:00:00', '2017-05-27 03:26:25', '0', '4', '2017-05-27 03:18:37', '2017-05-27 03:24:51', '1');
INSERT INTO `waybills` VALUES ('11', '1', '0', '4', '0', '2017-05-27 05:21:01', null, '10', '4', '2017-05-27 03:19:26', '2017-05-27 03:24:09', '3');
INSERT INTO `waybills` VALUES ('12', '1', '0', '2', '0', '2017-05-27 05:21:09', null, '11', '4', '2017-05-27 03:19:34', '2017-05-27 03:19:34', '3');
INSERT INTO `waybills` VALUES ('13', '3', '1', '5', '0', '2017-05-27 05:25:43', null, '0', '4', '2017-05-27 03:24:09', '2017-05-27 03:24:09', '1');
INSERT INTO `waybills` VALUES ('14', '1', '0', '2', '0', '2017-05-27 05:26:25', null, '10', '4', '2017-05-27 03:24:51', '2017-05-27 03:24:51', '0');
INSERT INTO `waybills` VALUES ('15', '0', '2', '0', '0', '2017-05-28 02:00:00', null, '0', '5', '2017-05-27 04:02:59', '2017-05-27 04:02:59', '1');
INSERT INTO `waybills` VALUES ('16', '0', '2', '0', '0', '2017-05-28 06:00:00', null, '0', '6', '2017-05-27 04:17:32', '2017-05-27 04:17:32', '1');
INSERT INTO `waybills` VALUES ('17', '0', '2', '0', '0', '2017-05-28 10:00:00', null, '0', '7', '2017-05-27 04:32:08', '2017-05-27 04:32:08', '1');
INSERT INTO `waybills` VALUES ('18', '0', '2', '2', '1', '2017-05-28 02:00:00', '2017-05-27 04:59:22', '0', '8', '2017-05-27 04:52:27', '2017-05-27 04:57:48', '1');
INSERT INTO `waybills` VALUES ('19', '1', '0', '4', '0', '2017-05-27 06:55:57', null, '18', '8', '2017-05-27 04:54:23', '2017-05-27 04:56:39', '3');
INSERT INTO `waybills` VALUES ('20', '1', '0', '2', '0', '2017-05-27 06:56:14', null, '19', '8', '2017-05-27 04:54:40', '2017-05-27 04:54:40', '3');
INSERT INTO `waybills` VALUES ('21', '3', '1', '5', '0', '2017-05-27 06:58:14', null, '0', '8', '2017-05-27 04:56:40', '2017-05-27 04:56:40', '1');
INSERT INTO `waybills` VALUES ('22', '1', '0', '2', '0', '2017-05-27 06:59:22', null, '18', '8', '2017-05-27 04:57:48', '2017-05-27 04:57:48', '0');
INSERT INTO `waybills` VALUES ('23', '0', '2', '3', '0', '2017-05-28 02:00:00', null, '0', '9', '2017-05-27 13:43:56', '2017-05-27 13:43:56', '1');
INSERT INTO `waybills` VALUES ('24', '3', '1', '5', '0', '2017-05-27 16:15:44', null, '0', '9', '2017-05-27 14:15:54', '2017-05-27 14:15:54', '1');

-- ----------------------------
-- Table structure for `worker_roles`
-- ----------------------------
DROP TABLE IF EXISTS `worker_roles`;
CREATE TABLE `worker_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `workers`
-- ----------------------------
DROP TABLE IF EXISTS `workers`;
CREATE TABLE `workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workers
-- ----------------------------
