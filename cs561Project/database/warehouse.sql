/*
 Navicat Premium Data Transfer

 Source Server         : 561Project
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : warehouse

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 26/11/2019 22:19:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-11-14 18:58:22.002568');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-11-14 18:58:22.081941');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-11-14 18:58:22.255115');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-11-14 18:58:22.300075');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-14 18:58:22.306512');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-11-14 18:58:22.356730');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-11-14 18:58:22.375311');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-11-14 18:58:22.394751');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-11-14 18:58:22.401894');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-11-14 18:58:22.427709');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-11-14 18:58:22.429159');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-11-14 18:58:22.435514');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-11-14 18:58:22.463689');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-11-14 18:58:22.489386');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-11-14 18:58:22.504597');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-11-14 18:58:22.511611');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2019-11-14 18:58:22.522299');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('ui6k7850ozmt5aoan0go6oa06110wzu7', 'MjA4ZWNiNWE3YjgxMmYzMDZjZjRlNWI2NGE5Y2RjMjM5ZTA5MGZhMzp7Il9hdXRoX3VzZXJfaWQiOiI0ODY2MzE3NzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhY2NvdW50LnZpZXdzLmxvZ0luV2l0aEVtYWlsb3JVc2VyTmFtZSIsIl9hdXRoX3VzZXJfaGFzaCI6IiJ9', '2019-12-10 22:06:07.409870');
COMMIT;

-- ----------------------------
-- Table structure for lender_account
-- ----------------------------
DROP TABLE IF EXISTS `lender_account`;
CREATE TABLE `lender_account` (
  `use_id` int(10) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`use_id`),
  CONSTRAINT `lender_account_ibfk_1` FOREIGN KEY (`use_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lender_account
-- ----------------------------
BEGIN;
INSERT INTO `lender_account` VALUES (249531390, 200);
INSERT INTO `lender_account` VALUES (486631773, 200);
COMMIT;

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
-- Records of rent_order
-- ----------------------------
BEGIN;
INSERT INTO `rent_order` VALUES (878, 320501486, '2019-11-15 03:56:32');
INSERT INTO `rent_order` VALUES (1118, 320501486, '2019-11-15 03:54:09');
INSERT INTO `rent_order` VALUES (1907, 320501486, '2019-11-15 03:55:25');
INSERT INTO `rent_order` VALUES (1921, 320501486, '2019-11-15 03:54:12');
INSERT INTO `rent_order` VALUES (1973, 320501486, '2019-11-15 03:54:12');
INSERT INTO `rent_order` VALUES (2587, 320501486, '2019-11-15 03:54:11');
INSERT INTO `rent_order` VALUES (2873, 320501486, '2019-11-15 03:54:29');
INSERT INTO `rent_order` VALUES (3629, 320501486, '2019-11-15 03:54:36');
INSERT INTO `rent_order` VALUES (3636, 320501486, '2019-11-15 03:54:06');
INSERT INTO `rent_order` VALUES (3767, 320501486, '2019-11-15 03:54:29');
INSERT INTO `rent_order` VALUES (4099, 320501486, '2019-11-15 03:54:11');
INSERT INTO `rent_order` VALUES (5853, NULL, NULL);
INSERT INTO `rent_order` VALUES (5877, 320501486, '2019-11-15 03:54:11');
INSERT INTO `rent_order` VALUES (5943, 320501486, '2019-11-15 03:54:12');
INSERT INTO `rent_order` VALUES (6138, 320501486, '2019-11-15 03:54:11');
INSERT INTO `rent_order` VALUES (6218, 320501486, '2019-11-15 03:54:08');
INSERT INTO `rent_order` VALUES (6491, 320501486, '2019-11-20 18:01:12');
INSERT INTO `rent_order` VALUES (7209, 320501486, '2019-11-15 03:52:05');
INSERT INTO `rent_order` VALUES (7407, NULL, NULL);
INSERT INTO `rent_order` VALUES (7789, 320501486, '2019-11-15 03:54:30');
INSERT INTO `rent_order` VALUES (7985, 320501486, '2019-11-15 03:54:11');
INSERT INTO `rent_order` VALUES (8343, 320501486, '2019-11-15 03:54:07');
INSERT INTO `rent_order` VALUES (8644, NULL, NULL);
INSERT INTO `rent_order` VALUES (8880, 320501486, '2019-11-15 03:54:12');
INSERT INTO `rent_order` VALUES (9091, 320501486, '2019-11-20 18:18:05');
INSERT INTO `rent_order` VALUES (9711, 320501486, '2019-11-15 04:00:45');
INSERT INTO `rent_order` VALUES (9742, 320501486, '2019-11-15 03:54:05');
COMMIT;

-- ----------------------------
-- Table structure for renter_account
-- ----------------------------
DROP TABLE IF EXISTS `renter_account`;
CREATE TABLE `renter_account` (
  `user_id` int(10) NOT NULL,
  `balance` float(200,0) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of renter_account
-- ----------------------------
BEGIN;
INSERT INTO `renter_account` VALUES (32474456, 200);
INSERT INTO `renter_account` VALUES (42216153, 200);
INSERT INTO `renter_account` VALUES (50794157, 200);
INSERT INTO `renter_account` VALUES (83685260, 200);
INSERT INTO `renter_account` VALUES (287775753, 200);
INSERT INTO `renter_account` VALUES (320501486, 544);
INSERT INTO `renter_account` VALUES (410268862, 200);
INSERT INTO `renter_account` VALUES (538973823, 200);
INSERT INTO `renter_account` VALUES (583095034, 200);
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
INSERT INTO `user` VALUES (32474456, 'xcakscn', 'pbkdf2_sha256$150000$jWvJnMH430rQ$4A1NXpWTDmBAan5Mxrd8xDhcv/2S9Ii+gG8d9OJCLFM=', '2019-11-15 02:54:59', 'DFSD', ',mnl', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (42216153, 'yuxuan', 'pbkdf2_sha256$150000$REu39RwaXWuk$1clRCQUo7d1DS0dxf0OhctXVfYbPPpcPeDjXKRSUNQ4=', '2019-11-14 19:09:49', 'che', 'chwe', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (50794157, 'SVKZDSKLGNSL', 'pbkdf2_sha256$150000$kEeUQ8oAwZiy$KEdpxcXI+3YPuu9jG3qkSjDe/QPEvajBqO2DUi599cM=', '2019-11-15 02:34:40', 'dkfksdh', 'nsdfndsj', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (78133484, 'test4', 'pbkdf2_sha256$150000$7ZfpS12IaWmL$myrIpJrqKq/ZYcCK6YcMBGqRkwBXbEiQuFCAtYTqh/o=', NULL, 'Tyler', '1', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (83685260, 'cheyudh', 'pbkdf2_sha256$150000$OC2bXqdsNVGM$UaOaUQagF8fb0/Ql0JQfHkcL7qK+OUoMlhTgT3PKTe0=', '2019-11-14 20:05:49', NULL, NULL, NULL, 2);
INSERT INTO `user` VALUES (107369111, 'sjdchvsljvh', 'pbkdf2_sha256$150000$eGIpVzmv3Pz1$U/htPFxkCnn9sRKNM3lEA0O54JpSTNwznCdBi3j9w+w=', '2019-11-15 02:46:20', 'dscfn', 'ln;lj', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (249531390, 'sdjgfhah', 'pbkdf2_sha256$150000$XidZQGnRVuOB$bzVq81KlD9HcLKzwL0spXF8OsEeEgRzTu1Z6TpVYbqI=', NULL, 'sejagf', 'lsgho;ihg', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (287775753, 'test5', 'pbkdf2_sha256$150000$jRbqtS7xGsED$SC2SIanM8fPo8QpocMsvGWBsO4o1VCNyOpA74mGmMes=', NULL, 'Angel', '1', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (320501486, 'djksfhfsaaaa', 'pbkdf2_sha256$150000$S86YLPBjzGww$3KKwonMLWvRoZQgkJDRJtNUMcUUlFGLHbqBOME3atYE=', '2019-11-15 03:26:18', 'asssasasa', 'azzcxzxzxzx', 'csdssdsdsheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (410268862, 'test3', 'pbkdf2_sha256$150000$fwmn0oX9AnkD$GBywKFwKWUbNv3hui3Naeywwm2an7WVeDgftzDAQNIw=', NULL, 'Dylan', '1', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (486631773, 'niushifu', 'pbkdf2_sha256$150000$OVRSjuJHK0D7$AJgrbWg3Ku5Xks7eItXyDBKjv4xOxtdPGtXnm2bGzG0=', '2019-11-26 22:06:07', 'bvbf', 'htht', 'dsfkjslkf@qq.com', 0);
INSERT INTO `user` VALUES (538973823, 'test19', 'pbkdf2_sha256$150000$DWnTWFpLuwdf$Fe2tmL8/ywLoBUYlG5cdrrxs9MNL27PFxRnho4qTSBk=', '2019-11-14 18:59:41', 's', 's', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (544048974, 'kadjfhlsadfh', 'pbkdf2_sha256$150000$TKLsXo72dN2H$mSs69y/Mc5iGNx373het85suISR3HakX2i2S9etx9FQ=', NULL, 'hliuh', 'kjblk', 'cheyuxuanll@icloud.com', 1);
INSERT INTO `user` VALUES (583095034, 'CHEGHGH', 'pbkdf2_sha256$150000$c4Wqs1lk3rTf$pRp3kYBAPc3QdKkW+oqnDkTZILujG9cWWaj13u2En6o=', '2019-11-14 20:07:18', 'GEG', 'RGSEG', 'cheyuxuanll@icloud.com', 2);
INSERT INTO `user` VALUES (675887700, 'yuchedajiji', 'pbkdf2_sha256$150000$Zj1CI4IL8D49$5nPq/tQzSmh2x5Oy6iON5C6Z0WAzUEm83CYihAC+H/A=', '2019-11-15 02:05:32', 'cheuan', 'cskjhe', 'cheyuxuanll@icloud.com', 1);
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
  `warehouse_currentuser_use_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
BEGIN;
INSERT INTO `warehouse` VALUES (2, 'warehouse02', 12, 'test02', NULL, 12, 'small', 0, NULL, '0002', NULL);
INSERT INTO `warehouse` VALUES (3, 'warehouse03', 13, 'test03', NULL, 13, 'small', 0, NULL, '0003', NULL);
INSERT INTO `warehouse` VALUES (4, 'warehouse04', 14, 'test04', NULL, 14, 'small', 0, NULL, '0004', NULL);
INSERT INTO `warehouse` VALUES (5, 'warehouse05', 15, 'test05', NULL, 15, 'small', 1, NULL, '0005', NULL);
INSERT INTO `warehouse` VALUES (6, 'warehouse06', 100, 'test06', NULL, 100, 'big', 0, 320501486, '383410578', 583095034);
INSERT INTO `warehouse` VALUES (8, 'warehouse08', 120, 'test08', NULL, 120, 'big', 0, 320501486, '716791979', NULL);
INSERT INTO `warehouse` VALUES (9, 'warehouse09', 130, 'test09', NULL, 130, 'big', 0, NULL, '0009', NULL);
INSERT INTO `warehouse` VALUES (10, 'warehouse10', 140, 'test10', NULL, 140, 'big', 0, NULL, '893855453', 320501486);
INSERT INTO `warehouse` VALUES (96006443, 'sdasdff', 3, 'efewf', 'f', 4, '2', 0, 675887700, NULL, NULL);
INSERT INTO `warehouse` VALUES (107390849, 'fort', 56, 'this', 'try', 5656, 'BIG', 1, 486631773, NULL, NULL);
INSERT INTO `warehouse` VALUES (281337247, 'sd', 34, 'dog', 'r', 34, 'BIG', 0, 107369111, '185716770', 320501486);
INSERT INTO `warehouse` VALUES (347185644, 'ed', 2323, 'dad', 'dosa', 23, 'BIG', 0, 107369111, '512120338', 320501486);
INSERT INTO `warehouse` VALUES (390779395, 'fxrogdsss', 2323, 'vcasdvgf', 'sdvadvrfdg', 3, '1', 0, 675887700, NULL, NULL);
INSERT INTO `warehouse` VALUES (397411560, 'sdhvjv', 45, 'fsjn', 'duh', 23, 'SMALL', 1, 107369111, NULL, NULL);
INSERT INTO `warehouse` VALUES (436858987, 'CHEYU', 11, 'MDWD', 'KNK', 22, 'SMALL', 0, 675887700, '690934372', 320501486);
INSERT INTO `warehouse` VALUES (508607434, 'damskvn', 34, 'dasd', '3', 22, 'BIG', 1, 107369111, NULL, NULL);
INSERT INTO `warehouse` VALUES (931925663, 'sdhvjv', 45, 'fsjn', 'duh', 23, 'SMALL', 1, 107369111, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
