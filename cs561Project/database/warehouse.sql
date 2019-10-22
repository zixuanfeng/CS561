/*
 Navicat Premium Data Transfer

 Source Server         : 561Project
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : wa

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 21/10/2019 22:25:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rent_order
-- ----------------------------
DROP TABLE IF EXISTS `rent_order`;
CREATE TABLE `rent_order` (
  `order_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for renter_account
-- ----------------------------
DROP TABLE IF EXISTS `renter_account`;
CREATE TABLE `renter_account` (
  `user_id` int(10) NOT NULL,
  `balance` float(200,0) DEFAULT NULL,
  `rented_warehouse` int(11) DEFAULT NULL,
  KEY `renter_account_ibfk_1` (`user_id`),
  CONSTRAINT `renter_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of renter_account
-- ----------------------------
BEGIN;
INSERT INTO `renter_account` VALUES (287775753, 200, NULL);
INSERT INTO `renter_account` VALUES (410268862, 200, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `root` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (26772537, 'test1', 'pbkdf2_sha256$150000$hXS9zY8bCkj1$fjDvdtlywuZsUW3x9bfAIBlbCuCQlwCUzEYIMmu9hyQ=', NULL, 'Tom', '1', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (78133484, 'test4', 'pbkdf2_sha256$150000$7ZfpS12IaWmL$myrIpJrqKq/ZYcCK6YcMBGqRkwBXbEiQuFCAtYTqh/o=', NULL, 'Tyler', '1', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (287775753, 'test5', 'pbkdf2_sha256$150000$jRbqtS7xGsED$SC2SIanM8fPo8QpocMsvGWBsO4o1VCNyOpA74mGmMes=', NULL, 'Angel', '1', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (410268862, 'test3', 'pbkdf2_sha256$150000$fwmn0oX9AnkD$GBywKFwKWUbNv3hui3Naeywwm2an7WVeDgftzDAQNIw=', NULL, 'Dylan', '1', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (966047037, 'test2', 'pbkdf2_sha256$150000$sIhpmIPfVbPU$2Zyq23DagdyqPy17ZYXUXFqEeS97FeXFwRLKOgYCCAg=', NULL, 'David', '1', 'cheyuxuanll@icloud.com', 1);
COMMIT;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_name` varchar(150) DEFAULT NULL,
  `warehouse_size` int(10) DEFAULT NULL,
  `warehouse_desc` varchar(254) DEFAULT NULL,
  `warehouse_image` varchar(255) DEFAULT NULL,
  `warehouse_price` double DEFAULT NULL,
  `warehouse_category` varchar(150) DEFAULT NULL,
  `warehouse_isAvailable` tinyint(1) DEFAULT NULL,
  `warehouse_currentowenr_use_id` int(10) DEFAULT NULL,
  `current_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
BEGIN;
INSERT INTO `warehouse` VALUES (1, 'warehouse01', 11, 'test01', NULL, 11, 'small', 1, NULL, '0001');
INSERT INTO `warehouse` VALUES (2, 'warehouse02', 12, 'test02', NULL, 12, 'small', 0, NULL, '0002');
INSERT INTO `warehouse` VALUES (3, 'warehouse03', 13, 'test03', NULL, 13, 'small', 0, NULL, '0003');
INSERT INTO `warehouse` VALUES (4, 'warehouse04', 14, 'test04', NULL, 14, 'small', 0, NULL, '0004');
INSERT INTO `warehouse` VALUES (5, 'warehouse05', 15, 'test05', NULL, 15, 'small', 1, NULL, '0005');
INSERT INTO `warehouse` VALUES (6, 'warehouse06', 100, 'test06', NULL, 100, 'big', 0, NULL, '0006');
INSERT INTO `warehouse` VALUES (7, 'warehouse07', 110, 'test07', NULL, 110, 'big', 0, NULL, '0007');
INSERT INTO `warehouse` VALUES (8, 'warehouse08', 120, 'test08', NULL, 120, 'big', 0, NULL, '0008');
INSERT INTO `warehouse` VALUES (9, 'warehouse09', 130, 'test09', NULL, 130, 'big', 0, NULL, '0009');
INSERT INTO `warehouse` VALUES (10, 'warehouse10', 140, 'test10', NULL, 140, 'big', 1, NULL, '0010');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
