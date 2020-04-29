/*
Navicat MySQL Data Transfer

Source Server         : boke
Source Server Version : 50718
Source Host           : 127.0.0.1:3306
Source Database       : postgraduate_prediction

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-03-07 00:23:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administer`
-- ----------------------------
DROP TABLE IF EXISTS `administer`;
CREATE TABLE `administer` (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `head_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administer
-- ----------------------------
INSERT INTO `administer` VALUES ('1', 'root', '457c1f83e029bd680b348c98efccc7dc', 'static/images/user_head/root-static/images/user_head/lh-1557826576.3678536.jpg');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add post data', '7', 'add_postdata');
INSERT INTO `auth_permission` VALUES ('26', 'Can change post data', '7', 'change_postdata');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete post data', '7', 'delete_postdata');
INSERT INTO `auth_permission` VALUES ('28', 'Can view post data', '7', 'view_postdata');
INSERT INTO `auth_permission` VALUES ('29', 'Can add user', '8', 'add_user');
INSERT INTO `auth_permission` VALUES ('30', 'Can change user', '8', 'change_user');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete user', '8', 'delete_user');
INSERT INTO `auth_permission` VALUES ('32', 'Can view user', '8', 'view_user');

-- ----------------------------
-- Table structure for `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'prediction', 'postdata');
INSERT INTO `django_content_type` VALUES ('8', 'prediction', 'user');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-07 13:03:12.836021');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-03-07 13:03:22.580336');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-03-07 13:03:24.711537');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-03-07 13:03:24.763745');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-03-07 13:03:24.824391');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-03-07 13:03:26.057752');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-03-07 13:03:27.022318');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-03-07 13:03:28.134341');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-03-07 13:03:28.184967');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-03-07 13:03:28.871388');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-03-07 13:03:28.922067');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-03-07 13:03:28.974648');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-03-07 13:03:30.223058');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-03-07 13:03:31.600628');
INSERT INTO `django_migrations` VALUES ('15', 'prediction', '0001_initial', '2019-03-07 13:03:31.649745');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-03-07 13:03:32.986027');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0ioaa41db4kx7lyi5fzjr8i96s1tzu0m', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 13:42:53.735593');
INSERT INTO `django_session` VALUES ('0t6ntmnxioqljs727x64y9uoy3t8wwhz', 'OGRkN2U4YzQ5OTY5YTQ1YzAzOWRkYThhZmU1OWJiYWQzMzQ1NmY4Zjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6Ind5IiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-25 12:05:25.411607');
INSERT INTO `django_session` VALUES ('21q7ntkz66w3ylb0iavxktop81r723ok', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 13:26:02.779575');
INSERT INTO `django_session` VALUES ('251oa0uxjakpgzk2x5u59jc4p3yfouc8', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 10:42:00.020352');
INSERT INTO `django_session` VALUES ('30fmfdrqk4ymhxaqsjqw9rgfr3klzssq', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-24 08:40:35.390937');
INSERT INTO `django_session` VALUES ('37qrrkk8e8ro2uy4gamffjgaromerd2e', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-13 05:05:15.468031');
INSERT INTO `django_session` VALUES ('41c0qxw9jji9tll8ikfpkftrjl7ep11b', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-08 05:53:48.162402');
INSERT INTO `django_session` VALUES ('44p41ak7zy90gwiermurd3ls1d8ps51l', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 08:56:38.966611');
INSERT INTO `django_session` VALUES ('49wydzfox8k6ynnveclxwhmbuyhhmg87', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 12:25:20.895176');
INSERT INTO `django_session` VALUES ('4t6nz3axxo4icesl24xyku8pn36la84z', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 12:59:17.333714');
INSERT INTO `django_session` VALUES ('5r3kgqtu7eb95epg2igwk872ra19prjb', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-08 05:51:10.892395');
INSERT INTO `django_session` VALUES ('5up6g7bgw9s8na1dptb1y417q1kbc79b', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 11:25:50.993242');
INSERT INTO `django_session` VALUES ('68aej9u5k0nzdw8ppbjai79g1qr6zk0a', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 12:51:56.753893');
INSERT INTO `django_session` VALUES ('6m48csepx8e9of4jbe5xvyr4dbnfkrru', 'OGI4ZmE4MDhhMTA1YTI4NjAyYmQ1N2NmNzUyNzBjODY3YTUyYTYyODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidXNlcl9pZCI6MTAsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9ray0xNTU3ODI2NTc2LjM2Nzg1MzYuanBnIn0=', '2019-05-16 05:06:59.926837');
INSERT INTO `django_session` VALUES ('6pl271gy1730po6scnmap3od4j1pjdof', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 06:21:25.621465');
INSERT INTO `django_session` VALUES ('79peihj7zf3ciir52tes46wnack5i52p', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 08:26:20.265743');
INSERT INTO `django_session` VALUES ('7fb9xq1ht017pqlh1vq2awpfpdmytpp2', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 15:25:17.094556');
INSERT INTO `django_session` VALUES ('7qe5lhplfmy4zz7pjb1ddwreo6ry5df3', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 11:58:06.569456');
INSERT INTO `django_session` VALUES ('8eceoap440tzurctyle4lhx2o0pjqqwk', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-28 11:09:29.260409');
INSERT INTO `django_session` VALUES ('9ro51g4hcccr9yol6kakm92ufv8ge0k3', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-07 13:45:23.737769');
INSERT INTO `django_session` VALUES ('9rsp8d0boi71covyjqvhcxh4h080ri7j', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-24 09:56:09.622454');
INSERT INTO `django_session` VALUES ('a0qrympao10qjv11z61155ljoomd82g7', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-14 11:50:55.416254');
INSERT INTO `django_session` VALUES ('a3pjdj4ef36x84f6nrhfsa8ua67qd81o', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 16:04:12.998010');
INSERT INTO `django_session` VALUES ('a88kz76nadsi1q0zgqf8r4yp384rvkll', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-25 13:06:14.027824');
INSERT INTO `django_session` VALUES ('ab5mtnkqjmh5qxon94airnxhhc3qtspw', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-07 13:52:10.804408');
INSERT INTO `django_session` VALUES ('bjnb9eguco3otl1zu6ch88asz6a2g3x7', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-14 12:19:55.454324');
INSERT INTO `django_session` VALUES ('cb6usqb1fc6jzd4c28d8zy6i0ts9u7eq', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-05-12 15:33:25.327296');
INSERT INTO `django_session` VALUES ('d5ocfuwr2szv1bz0iww5zmd9e2k6jj91', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 06:01:15.413802');
INSERT INTO `django_session` VALUES ('de6jpnmzbuzgaqrq5pl47lwhs40s848d', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 05:47:49.174588');
INSERT INTO `django_session` VALUES ('djz4dlhz8i5uomu57e2vzed7ad85f6hc', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 08:25:52.884006');
INSERT INTO `django_session` VALUES ('dyu25cdv27a1bur0zn64va14u4i4z7pi', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 14:23:51.195423');
INSERT INTO `django_session` VALUES ('ecerlnossugq80mp4shoaks9y46xve49', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-24 08:07:09.109295');
INSERT INTO `django_session` VALUES ('euxe9h4r7xmmqsoaiu7t2qajwebctmgu', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 13:54:31.391546');
INSERT INTO `django_session` VALUES ('f5xw46lqt4l4lanfgrekt3qmy95fss0s', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 11:17:20.583308');
INSERT INTO `django_session` VALUES ('f8jlqlzyotj4xwyu6t11sizbxfgra0pc', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 11:55:43.535429');
INSERT INTO `django_session` VALUES ('foygdq5237mjba2vtnuf26r4wyrkzp9e', 'NGM2YzVhYjBkZTM5N2I0NDk1OGNhOWE3MGRkNmJmNzdmZjg3NTJkZTp7InVzZXJfaWQiOjE0LCJ1c2VyX25hbWUiOiJ3eSIsInBhc3N3b3JkIjoiMjAyY2I5NjJhYzU5MDc1Yjk2NGIwNzE1MmQyMzRiNzAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL3d5LTE1NTgzMzQ2ODUuMDgxNDAxLmpwZyJ9', '2019-05-20 06:54:53.759977');
INSERT INTO `django_session` VALUES ('g2pgp5qxqop25lzj0axjckykgu78b1i0', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 15:03:23.268415');
INSERT INTO `django_session` VALUES ('gc4ii0fuv3kvlc5vdvb6rpcdqip93e33', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 11:33:31.033731');
INSERT INTO `django_session` VALUES ('gddxnobu8q8d98o46t1e8zdahthp9hra', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 16:14:47.118383');
INSERT INTO `django_session` VALUES ('gsdic0l9dp3auo1ll5lt0e108wb8rich', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 12:36:13.138616');
INSERT INTO `django_session` VALUES ('gvxel7gm07qhkiquf5ig9wo809750g1f', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-08 05:40:39.345616');
INSERT INTO `django_session` VALUES ('h0cnv3cbvjj5jqr3vajg1vx4uabv5sa1', 'ZjA3ZTVlY2I0NjY5Nzk3NmM5NTE1MTFkMWFjOTdhZjFiNTA5Mzg2NDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjQ1N2MxZjgzZTAyOWJkNjgwYjM0OGM5OGVmY2NjN2RjIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9yb290LXN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xoLTE1NTc4MjY1NzYuMzY3ODUzNi5qcGcifQ==', '2019-05-19 15:33:57.452432');
INSERT INTO `django_session` VALUES ('h9nq167seavxuq8whrjsbd77r87qegve', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 02:18:09.749340');
INSERT INTO `django_session` VALUES ('hh5bgwzd9ft4nkztvod68tpvp70lw8b3', 'OWE1NjllNjMzYjJkOTVhYWMyYzFmMWE1YzQwMmRkMWZlZGJlYmU4Mjp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9ray0xNTU2MzY1NjAzLjA5OTYxLmpwZyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJkYXRhX2lkIjoyMTB9', '2019-05-13 02:18:06.248561');
INSERT INTO `django_session` VALUES ('hq49qtqcrml9y454i066cfjbljsudse9', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 10:40:23.236774');
INSERT INTO `django_session` VALUES ('hs03ckd3fd12s5qbanytje2d5h9b5kv2', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-13 04:56:03.109136');
INSERT INTO `django_session` VALUES ('htohas9m2ttw0v8rldfgmxrm52kkvvd9', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 13:16:42.486945');
INSERT INTO `django_session` VALUES ('i7b9oc332gog67y3ny3jhaw0amhfcv3j', 'ZTU3MTY4MjNmYjg0NzdkZmI0MzA2MjY5ZGY5ZjgzOTRlNDU0YTBkYTp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-12 13:55:16.668809');
INSERT INTO `django_session` VALUES ('j17kctwxr648g75m0esm5piydmso6a8w', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 14:34:28.367983');
INSERT INTO `django_session` VALUES ('jd4tphbtj989fs0vol0vj8azehgudcea', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 00:41:13.649893');
INSERT INTO `django_session` VALUES ('jkyqlbrjqmvd3bv9126tapbyhpgubctv', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 05:26:17.430191');
INSERT INTO `django_session` VALUES ('jlmxzrec9a1efgoupzaw6cr1l2vhrkwy', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-08 05:17:13.913819');
INSERT INTO `django_session` VALUES ('jmr4iowqrgs7jdrg3lcaq0g11pfu31eh', 'ZTU3MTY4MjNmYjg0NzdkZmI0MzA2MjY5ZGY5ZjgzOTRlNDU0YTBkYTp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-13 02:32:42.897238');
INSERT INTO `django_session` VALUES ('k5z36zasli5jkz9z3uppj84hixnseuqk', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 14:06:43.759402');
INSERT INTO `django_session` VALUES ('k8rt3i0awcvrjfoz78i0m0f50secrlnc', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 12:40:29.143629');
INSERT INTO `django_session` VALUES ('khxtrz0wi43nch9rwyduxzi50bxsz5dn', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 07:17:27.433157');
INSERT INTO `django_session` VALUES ('kkvcsnh0aa86yi2vslb9mqzd883w9y5l', 'NTc3MjZmODVhMmVmZTljNmVkNWQxYzA0ZmI0ZjMzNzNhZDM0MzBkMzp7InVzZXJfaWQiOjEzLCJ1c2VyX25hbWUiOiJobXAiLCJwYXNzd29yZCI6IjIwMmNiOTYyYWM1OTA3NWI5NjRiMDcxNTJkMjM0YjcwIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2htcC0xNTU4Mjc3ODc1LjAzMjU0NzIuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsImRhdGFfaWQiOjI1MX0=', '2019-05-19 15:08:35.816252');
INSERT INTO `django_session` VALUES ('kp2ktiogcwl7pyxlnue5ksdveau91azu', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 05:37:14.578079');
INSERT INTO `django_session` VALUES ('l03rx0nxqk4jkczlr4rzn4ffu7twyov1', 'NTYxYjQ5Njk2ZTcyMThlNDBmYjBmNTc0N2M5MzMxOTYyYTMwOGIyMDp7InVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9yb290LXN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xoLTE1NTc4MjY1NzYuMzY3ODUzNi5qcGciLCJwYXNzd29yZCI6IjQ1N2MxZjgzZTAyOWJkNjgwYjM0OGM5OGVmY2NjN2RjIiwiYWRtaW5pc3Rlcl9pZCI6MSwidXNlcl9uYW1lIjoicm9vdCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-20 03:39:19.709682');
INSERT INTO `django_session` VALUES ('lk2q5ukh537hh0mje3a3xq4491jmalxe', 'ZTU3MTY4MjNmYjg0NzdkZmI0MzA2MjY5ZGY5ZjgzOTRlNDU0YTBkYTp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-12 13:38:26.701999');
INSERT INTO `django_session` VALUES ('lr02cn5ez1we4d1klm5l82i6v1nel358', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-05-12 15:18:47.056944');
INSERT INTO `django_session` VALUES ('m2seh6t719e8dd9ie5si37plkecn3qs2', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-05-10 03:19:19.878508');
INSERT INTO `django_session` VALUES ('md7zevp182lkg4vhqpwtebzbznj4072h', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 12:08:51.905880');
INSERT INTO `django_session` VALUES ('n3u51k1prjbf92qi0n70f5y4lxtexff1', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-07 14:02:48.931774');
INSERT INTO `django_session` VALUES ('n5cftksxsdy228hlqw7cxde8itjc29v0', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 13:48:29.755293');
INSERT INTO `django_session` VALUES ('n8dqq2s7thn3kv3vyc3sksu9203so8nu', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 08:56:46.950634');
INSERT INTO `django_session` VALUES ('o5ybbp3ohiomy1q34qknbs3nbim0636o', 'NDZkNjJkZmJhYjM4YTNiY2Y3MGE5YzAyN2YyOTQzZTBiMDhhMGU5ZDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6IjEyMyIsInBhc3N3b3JkIjoiMTIzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVzZXJfaWQiOjcsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC8xMjMtMTU1NzcxOTQ3MS4zNDY2MTgyLmpwZyIsImRhdGFfaWQiOjIxN30=', '2019-05-13 04:25:25.973977');
INSERT INTO `django_session` VALUES ('oem7fzsrvn2sr1sa5kladvnre8j3jg46', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 09:19:31.345343');
INSERT INTO `django_session` VALUES ('osureq464vqjz6vayt3aky6vws6rpj8y', 'ZTU3MTY4MjNmYjg0NzdkZmI0MzA2MjY5ZGY5ZjgzOTRlNDU0YTBkYTp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-13 01:33:32.559066');
INSERT INTO `django_session` VALUES ('prwjzzbvt9bew3j9r4k1b6c1hx48hrd0', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 09:22:59.421866');
INSERT INTO `django_session` VALUES ('pshp4gfddslg33lg0k8gq0m6qqjim1py', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-07 14:04:48.764834');
INSERT INTO `django_session` VALUES ('pxrxdfjwzw7pwj6ke16z5cg009l4kaqk', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 14:22:27.743504');
INSERT INTO `django_session` VALUES ('pz8b1xhd8yt8jk0ewz0jdfszp0fembsk', 'ZjA3ZTVlY2I0NjY5Nzk3NmM5NTE1MTFkMWFjOTdhZjFiNTA5Mzg2NDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjQ1N2MxZjgzZTAyOWJkNjgwYjM0OGM5OGVmY2NjN2RjIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9yb290LXN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xoLTE1NTc4MjY1NzYuMzY3ODUzNi5qcGcifQ==', '2019-05-19 14:51:57.970674');
INSERT INTO `django_session` VALUES ('q2a58b0crl64xec1lipauggaqj1mnzd5', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 13:02:24.514718');
INSERT INTO `django_session` VALUES ('q65tldb071kt0v71wtv5qbakc1ltwlnh', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 14:10:45.174700');
INSERT INTO `django_session` VALUES ('q96hj1irxhnif5bjrq1tew4y2g5zz413', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-24 10:06:47.121483');
INSERT INTO `django_session` VALUES ('qamhdy5a19d9hfoc3t8x9d6h39pzv0ew', 'ZTU3MTY4MjNmYjg0NzdkZmI0MzA2MjY5ZGY5ZjgzOTRlNDU0YTBkYTp7InVzZXJfaWQiOm51bGwsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-12 17:07:48.632844');
INSERT INTO `django_session` VALUES ('qjjmosnfpuuce36xlzy3bo5nu1dmiyqd', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 09:29:55.625905');
INSERT INTO `django_session` VALUES ('qlhkbcmu8pajr9jhpomy20dm9kavcj9z', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 12:47:30.560796');
INSERT INTO `django_session` VALUES ('rvexye2s8ck27ays8s31f6kjcwddbi4r', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 13:09:19.054649');
INSERT INTO `django_session` VALUES ('rx2rhgqwr9lpxpam446ibzzlw7mgpsdt', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 05:33:36.706927');
INSERT INTO `django_session` VALUES ('s2cv9da4i2pa72blt9lm0dbnp6bpsuwo', 'OGE5NDExODNlNWU4MzAyNjI2NDEzM2ZmOWY2MmU5MTgwNDEwZjQ3MDp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2trLTE1NTYzNjU2MDMuMDk5NjEuanBnIn0=', '2019-05-12 15:02:11.592690');
INSERT INTO `django_session` VALUES ('s7sh5pfjfojg8spi7exl6eqo2lwi2xnu', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 12:14:47.412546');
INSERT INTO `django_session` VALUES ('smr0f0uclx0so5geo0n6wzj1bjj2r6i7', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 14:38:51.338540');
INSERT INTO `django_session` VALUES ('supdwublmtggzwapvv4cjbjd220ohedy', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 09:07:04.147463');
INSERT INTO `django_session` VALUES ('suvy6j32eidq6lwdukjy5h2xmlw0o81m', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-28 11:50:21.966467');
INSERT INTO `django_session` VALUES ('t14m4tt72gbvicflffj9pw3s4sbalz2p', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-28 11:58:54.878577');
INSERT INTO `django_session` VALUES ('ub35qd3oxw3n1sjvm1dgd8enpzewjv29', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 10:42:00.020352');
INSERT INTO `django_session` VALUES ('umg93iz9dev2iiowuktcgvgqftfu4tb7', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-08 04:04:01.767568');
INSERT INTO `django_session` VALUES ('uzncho2qgynlnfk587qgnlbbmy8qwiqz', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-18 15:19:52.001510');
INSERT INTO `django_session` VALUES ('vk4191mk125rkege72kw17x2pewwhyeq', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 10:24:13.720291');
INSERT INTO `django_session` VALUES ('vswlq70wo3gmbpwrlhprml52ypgomkop', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-25 10:42:23.516087');
INSERT INTO `django_session` VALUES ('vv964u1jmu2den68yop15sqvrll9jacm', 'NjY2MjU4NTMxZmNmYTY5MzZiNWM4MWZiYjEyNDA3NTVjNjZmN2EzMzp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJwYXNzd29yZCI6IjEyMyIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC90ZXN0LTE1NTE5NTc5ODIuOTE3ODkwOC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-24 08:51:19.119124');
INSERT INTO `django_session` VALUES ('wp957gz8uvz36te0n00krp7yt9uh1bfh', 'NDhkNzk0NGE4OTM5YTViYjZkMWMxOTA0NTBiMjE5MjZhYjc0NDdiNDp7InVzZXJfaWQiOjEwLCJ1c2VyX25hbWUiOiJrayIsInBhc3N3b3JkIjoiMTIzIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2trLTE1NTc4MjY1NzYuMzY3ODUzNi5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-05-14 11:10:56.814360');
INSERT INTO `django_session` VALUES ('wqoleb2wcfwf9pjurmstwwo2fzwf3gif', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-04-11 08:14:18.439584');
INSERT INTO `django_session` VALUES ('x19h703ov3xc2xahhfedv19q4rf80c58', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 15:36:19.163392');
INSERT INTO `django_session` VALUES ('xr0vyntj61hl1lt2ki0kqebxfya8cu5q', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 10:42:00.020352');
INSERT INTO `django_session` VALUES ('xv1b04m178nuxpkcf365kng0f94d23yj', 'NjI3ZTYyYjg4MmU1OGFhNDEyMWU2OGU5ZjJjNDJjNGZiY2NlYTQ0MDp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6IjEyMzQ1NiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2019-05-14 09:51:08.832558');
INSERT INTO `django_session` VALUES ('xx28wurw3oxhno1ycg7lau6diyek90sw', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 13:27:59.127491');
INSERT INTO `django_session` VALUES ('z3rkrd3ck6chgfc3c2n3go6v6lsgm9q9', 'YjE0MmMzOGExZTViZGJlNjQ0NGFhMzQxNTBlNmI0OWVmN2M0OTYwMTp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoidGVzdCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwMH0=', '2019-03-07 13:24:47.009952');
INSERT INTO `django_session` VALUES ('zadicvee791nclwtqasut07okhzl3idw', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 10:50:35.907653');
INSERT INTO `django_session` VALUES ('zavxtfuemojjdo6vddab6mjjy1ptn553', 'N2Y2ZDA4M2Y3YTZjMTY3ZGVhZGYwZmQ5ODkzOWIwMmMxODUyNzY1Njp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6ImtrIiwicGFzc3dvcmQiOiIxMjMiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQva2stMTU1NjM2NTYwMy4wOTk2MS5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2019-04-27 15:13:44.699946');
INSERT INTO `django_session` VALUES ('zqtmw3buyse79oauyw48alcwd0rziq8w', 'MTE4ZWJmNmUzMDM4MDc5M2U5YzE2NjdmNmMyM2FmYmJlOWFhZmNjYjp7InVzZXJfaWQiOjQsInVzZXJfbmFtZSI6InRlc3QiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvdGVzdC0xNTUxOTU3OTgyLjkxNzg5MDguanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-03-21 13:25:49.638452');
INSERT INTO `django_session` VALUES ('ztk4p9gpjoepu08tznonwn80yqxc6cu5', 'NjVhMzgwYjlkYmUyYjE5OWI1OTM1NzczYTU1MWY1OWZlYjJkYjJjZjp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QiLCJwYXNzd29yZCI6ImxpaHVpIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2019-05-16 04:11:40.239475');

-- ----------------------------
-- Table structure for `post_data`
-- ----------------------------
DROP TABLE IF EXISTS `post_data`;
CREATE TABLE `post_data` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) unsigned NOT NULL,
  `computer_name` int(4) DEFAULT NULL,
  `computer_size` int(4) DEFAULT NULL,
  `computer_color` int(4) DEFAULT NULL,
  `order_channel` int(4) DEFAULT NULL,
  `customer_will` int(4) DEFAULT NULL,
  `computer_configuration` int(4) DEFAULT NULL,
  `order_factor` int(4) DEFAULT NULL,
  `customer_salary` int(4) DEFAULT NULL,
  `customer_cost` int(4) DEFAULT NULL,
  `urgent_need` int(4) DEFAULT NULL,
  `total_score` float(4,0) DEFAULT NULL,
  `result` float(20,2) NOT NULL,
  `post_time` datetime NOT NULL,
  `verdict` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_data
-- ----------------------------
INSERT INTO `post_data` VALUES ('244', '10', '1', '1', '1', '1', '1', '1', '1', '2', '1', '0', '4', '0.80', '2019-05-18 15:03:49', 'fsdf');
INSERT INTO `post_data` VALUES ('245', '10', '3', '2', '2', '2', '1', '3', '2', '4', '3', '0', '9', '0.51', '2019-05-18 15:04:10', null);
INSERT INTO `post_data` VALUES ('246', '10', '3', '2', '2', '2', '1', '3', '2', '4', '2', '0', '9', '0.59', '2019-05-18 15:04:26', 'fsdf');
INSERT INTO `post_data` VALUES ('247', '10', '1', '2', '2', '2', '1', '2', '2', '4', '2', '1', '7', '0.77', '2019-05-18 15:07:40', '很遗憾');
INSERT INTO `post_data` VALUES ('248', '9', '2', '1', '1', '1', '2', '1', '1', '4', '1', '0', '5', '0.88', '2019-05-18 15:09:07', '66');
INSERT INTO `post_data` VALUES ('249', '11', '1', '1', '1', '1', '1', '1', '1', '2', '1', '1', '4', '0.89', '2019-05-19 14:09:46', null);
INSERT INTO `post_data` VALUES ('250', '11', '1', '1', '1', '1', '1', '1', '1', '2', '1', '1', '4', '0.89', '2019-05-19 14:12:52', '默认好评');
INSERT INTO `post_data` VALUES ('251', '13', '1', '1', '2', '2', '2', '2', '2', '2', '1', '0', '6', '0.70', '2019-05-19 14:58:33', '默认好评');
INSERT INTO `post_data` VALUES ('252', '13', '1', '1', '1', '1', '1', '3', '2', '2', '1', '1', '4', '0.89', '2019-05-19 15:16:12', '默认好评');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `head_img` varchar(255) NOT NULL,
  `register_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'vv', '123', 'static/images/user_head/vv-1557815861.2630422.jpg', '2019-05-14 14:37:41');
INSERT INTO `user` VALUES ('10', 'kk', '123', 'static/images/user_head/kk-1557826576.3678536.jpg', '2019-05-14 17:36:16');
INSERT INTO `user` VALUES ('11', 'lh', '457c1f83e029bd680b348c98efccc7dc', 'static/images/user_head/lh-1558274740.9393024.jpg', '2019-05-19 14:05:40');
INSERT INTO `user` VALUES ('13', 'hmp', '202cb962ac59075b964b07152d234b70', 'static/images/user_head/hmp-1558277875.0325472.jpg', '2019-05-19 14:57:55');
INSERT INTO `user` VALUES ('14', 'wy', '202cb962ac59075b964b07152d234b70', 'static/images/user_head/wy-1558334685.081401.jpg', '2019-05-20 06:44:45');
