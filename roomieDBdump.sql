-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: roomieDB
-- ------------------------------------------------------
-- Server version	5.6.25

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

USE test_djangoDB;

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add room',8,'add_room'),(23,'Can change room',8,'change_room'),(24,'Can delete room',8,'delete_room'),(25,'Can add bookmark',9,'add_bookmark'),(26,'Can change bookmark',9,'change_bookmark'),(27,'Can delete bookmark',9,'delete_bookmark'),(28,'Can add friend',10,'add_friend'),(29,'Can change friend',10,'change_friend'),(30,'Can delete friend',10,'delete_friend');
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
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$DcEeXwSaa6oH$eIrpAOc3lEscBzOtvpmr+61Qc+0rEYDdcz0BvTi5suM=','2015-06-20 08:19:40.567157',1,'admin','','','a@gmail.com',1,1,'2015-06-20 07:33:31.521704');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_bookmark`
--

DROP TABLE IF EXISTS `bulletin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulletin_bookmark_uid_id_678b148c8b856b6_uniq` (`user_id`,`room_id`),
  KEY `bulletin_bookmark_b61c6d37` (`room_id`),
  KEY `bulletin_bookmark_71422c2d` (`user_id`),
  CONSTRAINT `bulletin_bookmark_room_id_20f010a6a12e518e_fk_bulletin_room_id` FOREIGN KEY (`room_id`) REFERENCES `bulletin_room` (`id`),
  CONSTRAINT `bulletin_bookmark_user_id_383e07d8d611b022_fk_bulletin_user_id` FOREIGN KEY (`user_id`) REFERENCES `bulletin_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_bookmark`
--

LOCK TABLES `bulletin_bookmark` WRITE;
/*!40000 ALTER TABLE `bulletin_bookmark` DISABLE KEYS */;
INSERT INTO `bulletin_bookmark` VALUES (5,4,1),(1,1,2),(4,3,2),(2,2,4),(3,3,6);
/*!40000 ALTER TABLE `bulletin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_friend`
--

DROP TABLE IF EXISTS `bulletin_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletin_friend_de6eebc8` (`user1_id`),
  KEY `bulletin_friend_6cc9864c` (`user2_id`),
  CONSTRAINT `bulletin_friend_user1_id_2e5d51e4dd52e26_fk_bulletin_user_id` FOREIGN KEY (`user1_id`) REFERENCES `bulletin_user` (`id`),
  CONSTRAINT `bulletin_friend_user2_id_7f28f5ab0e7ec6d9_fk_bulletin_user_id` FOREIGN KEY (`user2_id`) REFERENCES `bulletin_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_friend`
--

LOCK TABLES `bulletin_friend` WRITE;
/*!40000 ALTER TABLE `bulletin_friend` DISABLE KEYS */;
INSERT INTO `bulletin_friend` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,6),(5,2,4),(6,2,5),(7,2,6),(8,2,7),(9,3,5),(10,3,7),(11,6,7);
/*!40000 ALTER TABLE `bulletin_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_room`
--

DROP TABLE IF EXISTS `bulletin_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) COLLATE utf8_bin NOT NULL,
  `district` varchar(200) COLLATE utf8_bin NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `isPrivate` tinyint(1) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `moveInDate` date NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `numExistingMates` int(10) unsigned NOT NULL,
  `pictureURL` varchar(200) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stayPeriod` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bulletin_room_71422c2d` (`user_id`),
  CONSTRAINT `bulletin_room_user_id_39429146e1346df3_fk_bulletin_user_id` FOREIGN KEY (`user_id`) REFERENCES `bulletin_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_room`
--

LOCK TABLES `bulletin_room` WRITE;
/*!40000 ALTER TABLE `bulletin_room` DISABLE KEYS */;
INSERT INTO `bulletin_room` VALUES (1,'LKF','central',22.280812,114.155676,0,5000,'2015-06-20',100,1,'http://google.com',1,12),(2,'Shop 111, Level 1, Citylink Plaza, 1 Sha Tin Station Circuit, Sha Tin','central',22.280812,114.155676,1,6000,'2015-06-27',300,2,'http://icons.iconarchive.com/icons/google/chrome/128/Google-Chrome-icon.png',3,12),(3,'1 &2/F, Way On Commercial Building, 500 Jaffe Road, Causeway Bay','Causeway Bay',22.280812,114.155676,0,6000,'2015-07-09',350,1,'http://google.com',5,8),(4,'G/F, The Royal Garden, 69 Mody Road, Tsim Sha Tsui, Kowloon','Kowloon',22.280812,114.155676,0,4500,'2015-06-22',400,0,'http://google.com',7,15);
/*!40000 ALTER TABLE `bulletin_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_user`
--

DROP TABLE IF EXISTS `bulletin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fbid` varchar(200) COLLATE utf8_bin NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `gender` varchar(1) COLLATE utf8_bin NOT NULL,
  `occupation` varchar(200) COLLATE utf8_bin NOT NULL,
  `hasPet` tinyint(1) NOT NULL,
  `smoker` tinyint(1) NOT NULL,
  `quiet` tinyint(1) NOT NULL,
  `fbProfilePhotoURL` varchar(200) COLLATE utf8_bin NOT NULL,
  `gender_mate` varchar(1) COLLATE utf8_bin NOT NULL,
  `occupation_mate` varchar(200) COLLATE utf8_bin NOT NULL,
  `hasPet_mate` tinyint(1) NOT NULL,
  `smoker_mate` tinyint(1) NOT NULL,
  `quiet_mate` tinyint(1) NOT NULL,
  `district` varchar(200) COLLATE utf8_bin NOT NULL,
  `isPrivate` tinyint(1) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `moveInDate` date NOT NULL,
  `stayPeriod` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_user`
--

LOCK TABLES `bulletin_user` WRITE;
/*!40000 ALTER TABLE `bulletin_user` DISABLE KEYS */;
INSERT INTO `bulletin_user` VALUES (1,'aaa','allen',23,'M','student',1,0,0,'http://google.com','M','student',0,0,0,'central',0,5000,'2015-06-20',12),(2,'bbb','ben',28,'M','work',0,0,0,'http://google.com','F','student',0,0,1,'central',0,5000,'2015-06-20',12),(3,'1234561','Alice Wang',25,'F','student',0,0,1,'http://google.com','F','student',0,0,1,'Kowloon',0,6000,'2015-06-30',12),(4,'24235234','Bob Hu',27,'M','work',0,1,0,'http://google.com','F','work',0,1,0,'Causeway Bay',1,5800,'2015-06-30',6),(5,'23487923','Cynthia Chen',23,'F','work',1,0,0,'http://google.com','F','work',0,0,1,'central',1,4000,'2015-07-10',15),(6,'7786878','David Xiao',35,'M','work',0,0,0,'http://google.com','M','work',0,0,0,'Wan Chai',0,7200,'2015-06-25',9),(7,'3423r4','Ella Yu',55,'F','work',1,0,0,'http://google.com','F','work',0,1,0,'central',0,4700,'2015-07-20',12);
/*!40000 ALTER TABLE `bulletin_user` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-06-20 07:34:38.832428','1','allen',1,'',7,1),(2,'2015-06-20 07:35:03.210830','2','ben',1,'',7,1),(3,'2015-06-20 07:35:14.620561','1','user:allen friend with:ben',1,'',10,1),(4,'2015-06-20 07:35:31.254584','1','room id:1, owner:allen',1,'',8,1),(5,'2015-06-20 07:35:44.710166','1','user:ben bookmark room:1',1,'',9,1),(6,'2015-06-20 08:25:15.329447','3','Alice Wang',1,'',7,1),(7,'2015-06-20 08:28:48.842470','4','Bob Hu',1,'',7,1),(8,'2015-06-20 08:28:55.735268','4','Bob Hu',2,'No fields changed.',7,1),(9,'2015-06-20 08:30:46.405845','5','Cynthia Chen',1,'',7,1),(10,'2015-06-20 08:32:23.414500','6','David Xiao',1,'',7,1),(11,'2015-06-20 08:33:16.612041','7','Ella Yu',1,'',7,1),(12,'2015-06-20 08:40:00.204056','2','room id:2, owner:Alice Wang',1,'',8,1),(13,'2015-06-20 08:41:11.651807','3','room id:3, owner:Cynthia Chen',1,'',8,1),(14,'2015-06-20 08:43:38.029577','4','room id:4, owner:Ella Yu',1,'',8,1),(15,'2015-06-20 08:44:28.561372','2','user:Bob Hu bookmark room:2',1,'',9,1),(16,'2015-06-20 08:44:45.989240','3','user:David Xiao bookmark room:3',1,'',9,1),(17,'2015-06-20 08:45:05.850807','4','user:ben bookmark room:3',1,'',9,1),(18,'2015-06-20 08:45:24.591191','5','user:allen bookmark room:4',1,'',9,1),(19,'2015-06-20 08:45:51.566898','2','user:allen friend with:Alice Wang',1,'',10,1),(20,'2015-06-20 08:45:59.727752','3','user:allen friend with:Bob Hu',1,'',10,1),(21,'2015-06-20 08:46:08.109792','4','user:allen friend with:David Xiao',1,'',10,1),(22,'2015-06-20 08:46:28.725611','5','user:ben friend with:Bob Hu',1,'',10,1),(23,'2015-06-20 08:46:37.292902','6','user:ben friend with:Cynthia Chen',1,'',10,1),(24,'2015-06-20 08:46:44.779554','7','user:ben friend with:David Xiao',1,'',10,1),(25,'2015-06-20 08:46:50.680089','8','user:ben friend with:Ella Yu',1,'',10,1),(26,'2015-06-20 08:47:13.776391','9','user:Alice Wang friend with:Cynthia Chen',1,'',10,1),(27,'2015-06-20 08:47:23.337153','10','user:Alice Wang friend with:Ella Yu',1,'',10,1),(28,'2015-06-20 08:47:32.526715','11','user:David Xiao friend with:Ella Yu',1,'',10,1);
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
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'bulletin','bookmark'),(10,'bulletin','friend'),(8,'bulletin','room'),(7,'bulletin','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-06-20 07:32:08.824422'),(2,'auth','0001_initial','2015-06-20 07:32:13.531449'),(3,'admin','0001_initial','2015-06-20 07:32:14.645015'),(4,'contenttypes','0002_remove_content_type_name','2015-06-20 07:32:15.862747'),(5,'auth','0002_alter_permission_name_max_length','2015-06-20 07:32:16.218447'),(6,'auth','0003_alter_user_email_max_length','2015-06-20 07:32:16.673578'),(7,'auth','0004_alter_user_username_opts','2015-06-20 07:32:16.699008'),(8,'auth','0005_alter_user_last_login_null','2015-06-20 07:32:17.203026'),(9,'auth','0006_require_contenttypes_0002','2015-06-20 07:32:17.207994'),(10,'bulletin','0001_initial','2015-06-20 07:32:24.623844'),(11,'bulletin','0002_room_stayperiod','2015-06-20 07:32:25.461019'),(12,'bulletin','0003_auto_20150620_1517','2015-06-20 07:32:29.062694'),(13,'bulletin','0004_auto_20150620_1522','2015-06-20 07:32:30.869257'),(14,'bulletin','0005_auto_20150620_1529','2015-06-20 07:32:31.465906'),(15,'sessions','0001_initial','2015-06-20 07:32:31.844753');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0qebypmth5az6ojv6pxqdfpj6ym0j39n','MTg0NDc3OTg0ZDc2NzM2M2IwOWI5MzMzZTBhNzc5MTRjNWQ2OTI1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxZjA0YjNjNWFmMDczNThkODcwYzcxODE2YjI2MjZiYWFmMDE1YzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-07-04 07:33:59.510194'),('fksv0u8fx4qnjmlmpeh4slm5sy5xsik2','MTg0NDc3OTg0ZDc2NzM2M2IwOWI5MzMzZTBhNzc5MTRjNWQ2OTI1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxZjA0YjNjNWFmMDczNThkODcwYzcxODE2YjI2MjZiYWFmMDE1YzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-07-04 08:19:40.617865'),('koh6qqafhhuyqzkn7u1svrq6wut8f9kc','MTg0NDc3OTg0ZDc2NzM2M2IwOWI5MzMzZTBhNzc5MTRjNWQ2OTI1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxZjA0YjNjNWFmMDczNThkODcwYzcxODE2YjI2MjZiYWFmMDE1YzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-07-04 08:06:40.315087');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-20 17:36:24
