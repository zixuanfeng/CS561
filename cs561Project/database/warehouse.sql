/*
Navicat MySQL Data Transfer

Source Server         : 001
Source Server Version : 50016
Source Host           : localhost:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50016
File Encoding         : 65001

Date: 2019-11-15 10:01:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lender_account
-- ----------------------------
DROP TABLE IF EXISTS `lender_account`;
CREATE TABLE `lender_account` (
  `use_id` int(10) NOT NULL,
  `balance` int(11) default NULL,
  PRIMARY KEY  (`use_id`),
  CONSTRAINT `lender_account_ibfk_1` FOREIGN KEY (`use_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lender_account
-- ----------------------------

-- ----------------------------
-- Table structure for renter_account
-- ----------------------------
DROP TABLE IF EXISTS `renter_account`;
CREATE TABLE `renter_account` (
  `user_id` int(10) NOT NULL,
  `balance` float(200,0) default NULL,
  KEY `renter_account_ibfk_1` (`user_id`),
  CONSTRAINT `renter_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of renter_account
-- ----------------------------
INSERT INTO `renter_account` VALUES ('287775753', '200');
INSERT INTO `renter_account` VALUES ('410268862', '200');

-- ----------------------------
-- Table structure for rent_order
-- ----------------------------
DROP TABLE IF EXISTS `rent_order`;
CREATE TABLE `rent_order` (
  `order_id` int(10) NOT NULL,
  `user_id` int(10) default NULL,
  `order_date` datetime default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rent_order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(150) default NULL,
  `password` varchar(128) default NULL,
  `last_login` datetime default NULL,
  `first_name` varchar(30) default NULL,
  `last_name` varchar(150) default NULL,
  `email` varchar(254) default NULL,
  `root` tinyint(1) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('26772537', 'test1', 'pbkdf2_sha256$150000$hXS9zY8bCkj1$fjDvdtlywuZsUW3x9bfAIBlbCuCQlwCUzEYIMmu9hyQ=', null, 'Tom', '1', 'cheyuxuanll@icloud.com', '1');
INSERT INTO `user` VALUES ('78133484', 'test4', 'pbkdf2_sha256$150000$7ZfpS12IaWmL$myrIpJrqKq/ZYcCK6YcMBGqRkwBXbEiQuFCAtYTqh/o=', null, 'Tyler', '1', 'cheyuxuanll@icloud.com', '1');
INSERT INTO `user` VALUES ('287775753', 'test5', 'pbkdf2_sha256$150000$jRbqtS7xGsED$SC2SIanM8fPo8QpocMsvGWBsO4o1VCNyOpA74mGmMes=', null, 'Angel', '1', 'cheyuxuanll@icloud.com', '2');
INSERT INTO `user` VALUES ('410268862', 'test3', 'pbkdf2_sha256$150000$fwmn0oX9AnkD$GBywKFwKWUbNv3hui3Naeywwm2an7WVeDgftzDAQNIw=', null, 'Dylan', '1', 'cheyuxuanll@icloud.com', '2');
INSERT INTO `user` VALUES ('966047037', 'test2', 'pbkdf2_sha256$150000$sIhpmIPfVbPU$2Zyq23DagdyqPy17ZYXUXFqEeS97FeXFwRLKOgYCCAg=', null, 'David', '1', 'cheyuxuanll@icloud.com', '1');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_name` varchar(150) default NULL,
  `warehouse_size` int(10) default NULL,
  `warehouse_desc` varchar(254) default NULL,
  `warehouse_image` varchar(255) default NULL,
  `warehouse_price` double default NULL,
  `warehouse_category` varchar(150) default NULL,
  `warehouse_isAvailable` tinyint(1) default NULL,
  `warehouse_currentowenr_use_id` int(10) default NULL,
  `current_password` varchar(255) default NULL,
  `warehouse_currentuser_use_id` int(10) default NULL,
  PRIMARY KEY  (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', 'warehouse01', '11', 'test01', null, '11', 'small', '1', null, '0001', null);
INSERT INTO `warehouse` VALUES ('2', 'warehouse02', '12', 'test02', null, '12', 'small', '0', null, '0002', null);
INSERT INTO `warehouse` VALUES ('3', 'warehouse03', '13', 'test03', null, '13', 'small', '0', null, '0003', null);
INSERT INTO `warehouse` VALUES ('4', 'warehouse04', '14', 'test04', null, '14', 'small', '0', null, '0004', null);
INSERT INTO `warehouse` VALUES ('5', 'warehouse05', '15', 'test05', null, '15', 'small', '1', null, '0005', null);
INSERT INTO `warehouse` VALUES ('6', 'warehouse06', '100', 'test06', null, '100', 'big', '0', null, '0006', null);
INSERT INTO `warehouse` VALUES ('7', 'warehouse07', '110', 'test07', null, '110', 'big', '0', null, '0007', null);
INSERT INTO `warehouse` VALUES ('8', 'warehouse08', '120', 'test08', null, '120', 'big', '0', null, '0008', null);
INSERT INTO `warehouse` VALUES ('9', 'warehouse09', '130', 'test09', null, '130', 'big', '0', null, '0009', null);
INSERT INTO `warehouse` VALUES ('10', 'warehouse10', '140', 'test10', null, '140', 'big', '1', null, '0010', null);
