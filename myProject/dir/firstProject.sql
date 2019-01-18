-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: firstProject
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add banner',8,'add_banner'),(23,'Can change banner',8,'change_banner'),(24,'Can delete banner',8,'delete_banner'),(25,'Can add shoplist',9,'add_shoplist'),(26,'Can change shoplist',9,'change_shoplist'),(27,'Can delete shoplist',9,'delete_shoplist'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$l97c4Hlq721K$MeAysd0QJGRNxBYZJYmkjhKcGSI2xAbbpxgTls0HB8k=','2019-01-14 11:24:49.974495',1,'admin','','','',1,1,'2019-01-11 09:24:10.215221');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-01-11 09:30:07.420911','2','1001',1,'[{\"added\": {}}]',8,1),(2,'2019-01-11 09:30:39.523410','3','1002',1,'[{\"added\": {}}]',8,1),(3,'2019-01-11 09:31:04.458928','4','1003',1,'[{\"added\": {}}]',8,1),(4,'2019-01-11 09:31:34.409168','5','1004',1,'[{\"added\": {}}]',8,1),(5,'2019-01-11 09:31:53.446426','6','1005',1,'[{\"added\": {}}]',8,1),(6,'2019-01-11 09:32:22.896648','7','1006',1,'[{\"added\": {}}]',8,1),(7,'2019-01-11 09:32:54.479195','8','1007',1,'[{\"added\": {}}]',8,1),(8,'2019-01-11 09:33:16.532852','9','1008',1,'[{\"added\": {}}]',8,1),(9,'2019-01-11 09:33:45.832051','10','1009',1,'[{\"added\": {}}]',8,1),(10,'2019-01-11 09:34:18.999377','2','1001',2,'[{\"changed\": {\"fields\": [\"bgcolor\"]}}]',8,1),(11,'2019-01-14 11:30:11.248381','1','Shoplist object',1,'[{\"added\": {}}]',9,1),(12,'2019-01-14 11:31:17.958963','2','Shoplist object',1,'[{\"added\": {}}]',9,1),(13,'2019-01-14 11:32:13.035300','3','Shoplist object',1,'[{\"added\": {}}]',9,1),(14,'2019-01-14 11:33:28.929352','4','Shoplist object',1,'[{\"added\": {}}]',9,1),(15,'2019-01-14 11:34:26.199292','5','Shoplist object',1,'[{\"added\": {}}]',9,1),(16,'2019-01-14 11:35:32.577105','6','Shoplist object',1,'[{\"added\": {}}]',9,1),(17,'2019-01-14 11:36:28.144438','7','Shoplist object',1,'[{\"added\": {}}]',9,1),(18,'2019-01-14 11:37:22.565926','8','Shoplist object',1,'[{\"added\": {}}]',9,1),(19,'2019-01-14 11:38:26.335589','8','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(20,'2019-01-14 11:39:21.793891','7','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(21,'2019-01-14 11:40:03.458942','6','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(22,'2019-01-14 11:40:50.618276','5','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(23,'2019-01-14 11:41:00.897741','4','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(24,'2019-01-14 11:41:40.475574','3','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(25,'2019-01-14 11:41:53.756144','3','Shoplist object',2,'[]',9,1),(26,'2019-01-14 11:42:18.910585','2','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(27,'2019-01-14 11:42:56.656075','1','Shoplist object',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(28,'2019-01-14 13:16:25.092346','8','【自营】英国摩飞 MR9200便携式果汁机',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(29,'2019-01-14 13:17:24.962593','7','【仅限京津地区销售】龙和海鲜儿童水饺四种口味混合装215gx4袋',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(30,'2019-01-14 13:18:04.580006','6','【自营】碧然德净水器/饮用水加热器 1.8L',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(31,'2019-01-14 13:18:24.975348','6','【自营】碧然德净水器/饮用水加热器 1.8L',2,'[]',9,1),(32,'2019-01-14 13:18:29.488029','8','【自营】英国摩飞 MR9200便携式果汁机',2,'[]',9,1),(33,'2019-01-14 13:18:33.567101','7','【仅限京津地区销售】龙和海鲜儿童水饺四种口味混合装215gx4袋',2,'[]',9,1),(34,'2019-01-14 13:19:26.937520','5','【包邮】暖民山楂100g 无核山楂干片 山楂干果茶 花果茶',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(35,'2019-01-14 13:19:36.568041','4','【自营】美的（Midea）电热水壶MK-GE1703（养生壶 玻璃壶 煎药壶 茶水)',2,'[]',9,1),(36,'2019-01-14 13:19:43.294694','5','【包邮】暖民山楂100g 无核山楂干片 山楂干果茶 花果茶',2,'[]',9,1),(37,'2019-01-14 13:20:25.306259','3','【中粮海外直采】红帽子黄色什锦饼干礼盒136.5g（日本进口 盒）',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(38,'2019-01-14 13:20:45.790325','2','【自营】桂格即食燕麦片超值装1478g（新老包装替换）',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(39,'2019-01-14 13:21:37.754551','1','【自营】蒙牛纯甄巴氏杀菌热处理风味酸牛奶利乐钻200g*24/箱',2,'[{\"changed\": {\"fields\": [\"zoom\", \"small\"]}}]',9,1),(40,'2019-01-14 13:21:41.533068','8','【自营】英国摩飞 MR9200便携式果汁机',2,'[]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'womai','banner'),(10,'womai','cart'),(9,'womai','shoplist'),(7,'womai','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-10 13:05:27.876890'),(2,'auth','0001_initial','2019-01-10 13:05:28.886435'),(3,'admin','0001_initial','2019-01-10 13:05:29.057429'),(4,'admin','0002_logentry_remove_auto_add','2019-01-10 13:05:29.095201'),(5,'contenttypes','0002_remove_content_type_name','2019-01-10 13:05:29.215880'),(6,'auth','0002_alter_permission_name_max_length','2019-01-10 13:05:29.266558'),(7,'auth','0003_alter_user_email_max_length','2019-01-10 13:05:29.367328'),(8,'auth','0004_alter_user_username_opts','2019-01-10 13:05:29.383583'),(9,'auth','0005_alter_user_last_login_null','2019-01-10 13:05:29.433899'),(10,'auth','0006_require_contenttypes_0002','2019-01-10 13:05:29.446206'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-10 13:05:29.470827'),(12,'auth','0008_alter_user_username_max_length','2019-01-10 13:05:29.530008'),(13,'sessions','0001_initial','2019-01-10 13:05:29.606674'),(14,'womai','0001_initial','2019-01-10 13:05:29.789589'),(15,'womai','0002_auto_20190110_1346','2019-01-10 13:46:41.175789'),(16,'womai','0003_banner','2019-01-11 09:23:42.387225'),(17,'womai','0004_shoplist','2019-01-14 11:07:19.573811'),(18,'womai','0005_shoplist_unit','2019-01-14 11:17:29.409259'),(19,'womai','0006_delete_shoplist','2019-01-14 11:24:04.285017'),(20,'womai','0007_shoplist','2019-01-14 11:24:31.025240'),(21,'womai','0008_auto_20190115_0735','2019-01-15 07:35:08.633575'),(22,'womai','0009_auto_20190115_0735','2019-01-15 07:35:34.783707'),(23,'womai','0010_auto_20190115_1004','2019-01-15 10:04:51.328122'),(24,'womai','0011_cart','2019-01-16 08:15:48.175686');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ae3gndik8fxyf193zzvkt8ffqmpyhpuz','MjYwZjJhYmMzNjg0OTNhMTg3MDBlZWNiMGMzMTIzNzQzZTgwMGQxMjp7InRva2VuIjoiMTdmYTg0NmVlOGZiODEzOGNlNGQ2ODJkOWI4ZGMwMTExNjEzNDlkZjMwMjc4NmQzZDY2NTA5ZmMifQ==','2019-01-30 12:04:04.186150'),('qu6js8j15f2qubg6olzs4asfjo37kpjw','ZjU3N2Q3NDJiMDVkYmE4ZGUzMzY4YjdkYjM5ZDM2ZmMxMWFmODIxNTp7InRva2VuIjoiYjFkMDQ0ZjljMTQ5MjQxNmVkYTE1NmQ2MzFkODc0ZDY3Y2Y4NGUzNTM4OTMyODgwNDRjYjljNzcifQ==','2019-01-24 13:47:53.377410'),('zjc02cta0pbosz6u9egiagz2i305mqem','YWE3NWQ4NGQxOGNjM2U3ODUwNTM1YWExNTE3MGQyZWI3ZTQyYmU3Mzp7InRva2VuIjoiMjhkNTNjNmFhM2I5YThlNmU1YzYwNTdkMWQwN2JkNGVjZDA5MTY0NjdjMGNmZWZhNWVjZTBmYTMifQ==','2019-01-29 12:13:21.577232');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `womai_banner`
--

DROP TABLE IF EXISTS `womai_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `womai_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `headImg` varchar(100) NOT NULL,
  `bgcolor` varchar(20) NOT NULL,
  `opicaty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `womai_banner`
--

LOCK TABLES `womai_banner` WRITE;
/*!40000 ALTER TABLE `womai_banner` DISABLE KEYS */;
INSERT INTO `womai_banner` VALUES (2,1001,'img/indeximg/banner-01.jpg','0, 182, 255',0),(3,1002,'img/indeximg/banner-02.jpg','142, 225, 233',0),(4,1003,'img/indeximg/banner-03.jpg','102, 52, 156',0),(5,1004,'img/indeximg/banner-04.jpg','246, 202, 69',0),(6,1005,'img/indeximg/banner-05.jpg','210, 239, 255',0),(7,1006,'img/indeximg/banner-06.jpg','230, 236, 236',0),(8,1007,'img/indeximg/banner-07.jpg','49, 21, 9',0),(9,1008,'img/indeximg/banner-08.jpg','226, 211, 204',0),(10,1009,'img/indeximg/banner-09.jpg','138, 181, 226',0);
/*!40000 ALTER TABLE `womai_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `womai_cart`
--

DROP TABLE IF EXISTS `womai_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `womai_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(10) unsigned NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womai_cart_goods_id_05371ce1_fk_womai_shoplist_id` (`goods_id`),
  KEY `womai_cart_user_id_55365d47_fk_womai_user_id` (`user_id`),
  CONSTRAINT `womai_cart_goods_id_05371ce1_fk_womai_shoplist_id` FOREIGN KEY (`goods_id`) REFERENCES `womai_shoplist` (`id`),
  CONSTRAINT `womai_cart_user_id_55365d47_fk_womai_user_id` FOREIGN KEY (`user_id`) REFERENCES `womai_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `womai_cart`
--

LOCK TABLES `womai_cart` WRITE;
/*!40000 ALTER TABLE `womai_cart` DISABLE KEYS */;
INSERT INTO `womai_cart` VALUES (1,7,1,1,11),(2,1,1,2,11),(3,3,1,3,11),(4,0,1,2,10),(5,0,1,3,10),(6,0,1,7,10),(7,0,1,1,10),(8,0,1,4,10);
/*!40000 ALTER TABLE `womai_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `womai_shoplist`
--

DROP TABLE IF EXISTS `womai_shoplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `womai_shoplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sip` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `headImg` varchar(100) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `zoom` varchar(255) NOT NULL,
  `small` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `womai_shoplist`
--

LOCK TABLES `womai_shoplist` WRITE;
/*!40000 ALTER TABLE `womai_shoplist` DISABLE KEYS */;
INSERT INTO `womai_shoplist` VALUES (1,1001,'【自营】蒙牛纯甄巴氏杀菌热处理风味酸牛奶利乐钻200g*24/箱',84.90,'img/indeximg/mad-01.jpg','￥','/img/detailimg/common1-01.jpg,/img/detailimg/common1-02.jpg,/img/detailimg/common1-03.jpg,/img/detailimg/common1-04.jpg','/img/detailimg/small01-01.jpg,/img/detailimg/small01-02.jpg,/img/detailimg/small01-03.jpg,/img/detailimg/small01-04.jpg'),(2,1002,'【自营】桂格即食燕麦片超值装1478g（新老包装替换）',23.90,'img/indeximg/mad-02.jpg','￥','/img/detailimg/common2-01.jpg,/img/detailimg/common2-02.jpg','/img/detailimg/small02-01.jpg,/img/detailimg/small02-02.jpg'),(3,1003,'【中粮海外直采】红帽子黄色什锦饼干礼盒136.5g（日本进口 盒）',69.00,'img/indeximg/mad-03.jpg','￥','/img/detailimg/common3-01.jpg,/img/detailimg/common3-02.jpg,/img/detailimg/common3-03.jpg,/img/detailimg/common3-04.jpg','/img/detailimg/small03-01.jpg,/img/detailimg/small03-02.jpg,/img/detailimg/small03-03.jpg,/img/detailimg/small03-04.jpg'),(4,1004,'【自营】美的（Midea）电热水壶MK-GE1703（养生壶 玻璃壶 煎药壶 茶水)',699.00,'img/indeximg/mad-04.jpg','￥','/img/detailimg/common4-01.jpg','/img/detailimg/small04-01.jpg'),(5,1005,'【包邮】暖民山楂100g 无核山楂干片 山楂干果茶 花果茶',17.40,'img/indeximg/mad-05.jpg','￥','/img/detailimg/common5-01.jpg,/img/detailimg/common5-02.jpg,/img/detailimg/common5-03.jpg,/img/detailimg/common5-04.jpg','/img/detailimg/small05-01.jpg,/img/detailimg/small05-02.jpg,/img/detailimg/small05-03.jpg,/img/detailimg/small05-04.jpg'),(6,1006,'【自营】碧然德净水器/饮用水加热器 1.8L',258.00,'img/indeximg/mad-06.jpg','￥','/img/detailimg/common6-01.jpg,/img/detailimg/common6-02.jpg,/img/detailimg/common6-03.jpg','/img/detailimg/small06-01.jpg,/img/detailimg/small06-02.jpg,/img/detailimg/small06-03.jpg'),(7,1007,'【仅限京津地区销售】龙和海鲜儿童水饺四种口味混合装215gx4袋',169.00,'img/indeximg/mad-07.jpg','￥','/img/detailimg/common7-01.jpg,/img/detailimg/common7-02.jpg,/img/detailimg/common7-03.jpg,/img/detailimg/common7-04.jpg','/img/detailimg/small07-01.jpg,/img/detailimg/small07-02.jpg,/img/detailimg/small07-03.jpg,/img/detailimg/small07-04.jpg'),(8,1008,'【自营】英国摩飞 MR9200便携式果汁机',258.00,'img/indeximg/mad-08.jpg','￥','/img/detailimg/common8-01.jpg,/img/detailimg/common8-02.jpg,/img/detailimg/common8-03.jpg,/img/detailimg/common8-04.jpg','/img/detailimg/small08-01.jpg,/img/detailimg/small08-02.jpg,/img/detailimg/small08-03.jpg,/img/detailimg/small08-04.jpg');
/*!40000 ALTER TABLE `womai_shoplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `womai_user`
--

DROP TABLE IF EXISTS `womai_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `womai_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenum` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `womai_user_phonenum_b36566f5_uniq` (`phonenum`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `womai_user`
--

LOCK TABLES `womai_user` WRITE;
/*!40000 ALTER TABLE `womai_user` DISABLE KEYS */;
INSERT INTO `womai_user` VALUES (1,'admin101','101','101','101','80a76c2f5b3f68404ac4cf81bc58d2ea9f1184035e6e71b429ac94fe'),(2,'admin102','102','102','102','bef131e27e6010dcdcc7a1585c2b9102ed0b377f351bdde43dfcc4de'),(3,'admin104','c9e1074f5b3f9fc8ea15d152add07294','104','104','b553b8d9a340125f24d41420e65cf0008932e1a0ace84becffeb1902'),(4,'admin103','6974ce5ac660610b44d9b9fed0ff9548','103','103','3c8c46956361c514f5dfd740915c993cef6c50524c48a991c718b6cd'),(5,'admin105','65b9eea6e1cc6bb9f0cd2a47751a186f','105','105','407c9cc9424252899258bc055e5c35ead34a6ced490e1776c1342533'),(6,'admin106','f0935e4cd5920aa6c7c996a5ee53a70f','106','106','309e3516dce25abb8d415cdd632570d30c606d25da05dd05cbd800b8'),(7,'admin107','a97da629b098b75c294dffdc3e463904','107','107','1c2768145124ad806f4212cf3a95a29a309337fbddbcd81fdc2d9b24'),(8,'admin110','bcd8e9aa62e70aab7fa339b1a9ebb2d2','787418444@qq.com','17375667510','02c8a9aae83314510773f1ae3e42684f08f6cfc69e1edc61456f2ba5'),(9,'admin111','27e7197b448941a191a11d216fab007a','787418444@qq.com','17375667511','33dd3a4c281c16d59b13378e9422d7c7812db14a0d50f0e855b65846'),(10,'admin12','1844156d4166d94387f1a4ad031ca5fa','787418444@qq.com','17375667512','17fa846ee8fb8138ce4d682d9b8dc011161349df302786d3d66509fc'),(11,'admin13','168dc28ec35926442cefc69c18d6e85d','787418444@qq.com','17375667513','9a708852a4dc348e39a27be7313646669ad961cba9a74ed3cdfcdaf3');
/*!40000 ALTER TABLE `womai_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-17 15:36:38
