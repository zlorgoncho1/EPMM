-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: epmm_database
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Surveillant');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (16,1,5),(17,1,6),(18,1,7),(19,1,8),(20,1,17),(21,1,18),(22,1,19),(23,1,20),(2,1,41),(3,1,42),(4,1,43),(5,1,44),(10,1,57),(11,1,59),(12,1,60),(13,1,61),(14,1,62),(15,1,63),(1,1,64),(6,1,77),(7,1,78),(8,1,79),(9,1,80);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add annee scolaire',7,'add_anneescolaire'),(26,'Can change annee scolaire',7,'change_anneescolaire'),(27,'Can delete annee scolaire',7,'delete_anneescolaire'),(28,'Can view annee scolaire',7,'view_anneescolaire'),(29,'Can add personne',8,'add_personne'),(30,'Can change personne',8,'change_personne'),(31,'Can delete personne',8,'delete_personne'),(32,'Can view personne',8,'view_personne'),(33,'Can add eleve',9,'add_eleve'),(34,'Can change eleve',9,'change_eleve'),(35,'Can delete eleve',9,'delete_eleve'),(36,'Can view eleve',9,'view_eleve'),(37,'Can add tuteur',10,'add_tuteur'),(38,'Can change tuteur',10,'change_tuteur'),(39,'Can delete tuteur',10,'delete_tuteur'),(40,'Can view tuteur',10,'view_tuteur'),(41,'Can add eleve classe',11,'add_eleveclasse'),(42,'Can change eleve classe',11,'change_eleveclasse'),(43,'Can delete eleve classe',11,'delete_eleveclasse'),(44,'Can view eleve classe',11,'view_eleveclasse'),(45,'Can add indice',12,'add_indice'),(46,'Can change indice',12,'change_indice'),(47,'Can delete indice',12,'delete_indice'),(48,'Can view indice',12,'view_indice'),(49,'Can add niveau',13,'add_niveau'),(50,'Can change niveau',13,'change_niveau'),(51,'Can delete niveau',13,'delete_niveau'),(52,'Can view niveau',13,'view_niveau'),(53,'Can add serie',14,'add_serie'),(54,'Can change serie',14,'change_serie'),(55,'Can delete serie',14,'delete_serie'),(56,'Can view serie',14,'view_serie'),(57,'Can add classe',15,'add_classe'),(58,'Can change classe',15,'change_classe'),(59,'Can delete classe',15,'delete_classe'),(60,'Can view classe',15,'view_classe'),(61,'Can add professeur classe',16,'add_professeurclasse'),(62,'Can change professeur classe',16,'change_professeurclasse'),(63,'Can delete professeur classe',16,'delete_professeurclasse'),(64,'Can view professeur classe',16,'view_professeurclasse'),(65,'Can add professeur',17,'add_professeur'),(66,'Can change professeur',17,'change_professeur'),(67,'Can delete professeur',17,'delete_professeur'),(68,'Can view professeur',17,'view_professeur'),(69,'Can add professeur',18,'add_professeur'),(70,'Can change professeur',18,'change_professeur'),(71,'Can delete professeur',18,'delete_professeur'),(72,'Can view professeur',18,'view_professeur'),(73,'Can add professeur classe',19,'add_professeurclasse'),(74,'Can change professeur classe',19,'change_professeurclasse'),(75,'Can delete professeur classe',19,'delete_professeurclasse'),(76,'Can view professeur classe',19,'view_professeurclasse'),(77,'Can add paiement',20,'add_paiement'),(78,'Can change paiement',20,'change_paiement'),(79,'Can delete paiement',20,'delete_paiement'),(80,'Can view paiement',20,'view_paiement'),(81,'Can add type de paiement',21,'add_typedepaiement'),(82,'Can change type de paiement',21,'change_typedepaiement'),(83,'Can delete type de paiement',21,'delete_typedepaiement'),(84,'Can view type de paiement',21,'view_typedepaiement');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$PO5EB17taF7G7k8Y16Kv7N$ZhSrhy1ItbCnkfuMU9uf5/twAyU3+w1mrwRwWYsli8I=','2021-07-18 12:05:33.551813',1,'zlorgoncho','','','pamatardiop1@gmail.com',1,1,'2021-07-18 10:48:12.449005'),(2,'pbkdf2_sha256$260000$tvPbRM89tT0V2OvIZpAsLW$t0QutHSQQXTCQz6K4ptE3oI2pv88ODi8dDH3mqMaM+M=','2021-07-18 12:04:20.880587',0,'CheikhYabaDiop','','','',1,1,'2021-07-18 11:55:18.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_classe`
--

DROP TABLE IF EXISTS `classes_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_classe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `indice_id` bigint(20) DEFAULT NULL,
  `niveau_id` bigint(20) NOT NULL,
  `serie_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_classe_indice_id_df75b40a_fk_classes_indice_id` (`indice_id`),
  KEY `classes_classe_niveau_id_bdca21cb_fk_classes_niveau_id` (`niveau_id`),
  KEY `classes_classe_serie_id_f8851b20_fk_classes_serie_id` (`serie_id`),
  CONSTRAINT `classes_classe_indice_id_df75b40a_fk_classes_indice_id` FOREIGN KEY (`indice_id`) REFERENCES `classes_indice` (`id`),
  CONSTRAINT `classes_classe_niveau_id_bdca21cb_fk_classes_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `classes_niveau` (`id`),
  CONSTRAINT `classes_classe_serie_id_f8851b20_fk_classes_serie_id` FOREIGN KEY (`serie_id`) REFERENCES `classes_serie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_classe`
--

LOCK TABLES `classes_classe` WRITE;
/*!40000 ALTER TABLE `classes_classe` DISABLE KEYS */;
INSERT INTO `classes_classe` VALUES (2,NULL,2,3);
/*!40000 ALTER TABLE `classes_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_indice`
--

DROP TABLE IF EXISTS `classes_indice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_indice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `indice` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_indice`
--

LOCK TABLES `classes_indice` WRITE;
/*!40000 ALTER TABLE `classes_indice` DISABLE KEYS */;
INSERT INTO `classes_indice` VALUES (8,'A'),(9,'B'),(10,'C');
/*!40000 ALTER TABLE `classes_indice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_niveau`
--

DROP TABLE IF EXISTS `classes_niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_niveau` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `niveau` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_niveau`
--

LOCK TABLES `classes_niveau` WRITE;
/*!40000 ALTER TABLE `classes_niveau` DISABLE KEYS */;
INSERT INTO `classes_niveau` VALUES (2,'TERMINALE'),(3,'PREMIERE'),(4,'SECONDE'),(5,'TROISIEME'),(6,'QUATRIEME'),(7,'CINQUIEME'),(8,'SIXIEME');
/*!40000 ALTER TABLE `classes_niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_serie`
--

DROP TABLE IF EXISTS `classes_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_serie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serie` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_serie`
--

LOCK TABLES `classes_serie` WRITE;
/*!40000 ALTER TABLE `classes_serie` DISABLE KEYS */;
INSERT INTO `classes_serie` VALUES (1,'S'),(2,'L'),(3,'S1'),(4,'S2'),(5,'L1'),(6,'L2');
/*!40000 ALTER TABLE `classes_serie` ENABLE KEYS */;
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
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-07-18 10:51:01.176516','1','TERMINALE',1,'[{\"added\": {}}]',12,1),(2,'2021-07-18 10:51:07.943173','2','SECONDE',1,'[{\"added\": {}}]',12,1),(3,'2021-07-18 10:51:13.493826','3','PREMIERE',1,'[{\"added\": {}}]',12,1),(4,'2021-07-18 10:51:16.329573','4','TROISIEME',1,'[{\"added\": {}}]',12,1),(5,'2021-07-18 10:51:26.947583','5','QUATRIEME',1,'[{\"added\": {}}]',12,1),(6,'2021-07-18 10:51:50.745953','5','QUATRIEME',3,'',12,1),(7,'2021-07-18 10:51:50.825936','4','TROISIEME',3,'',12,1),(8,'2021-07-18 10:51:50.873929','3','PREMIERE',3,'',12,1),(9,'2021-07-18 10:51:50.953922','2','SECONDE',3,'',12,1),(10,'2021-07-18 10:51:50.985912','1','TERMINALE',3,'',12,1),(11,'2021-07-18 10:51:59.630023','6','L',1,'[{\"added\": {}}]',12,1),(12,'2021-07-18 10:52:04.089902','7','S',1,'[{\"added\": {}}]',12,1),(13,'2021-07-18 10:52:07.980092','8','A',1,'[{\"added\": {}}]',12,1),(14,'2021-07-18 10:52:12.698690','9','B',1,'[{\"added\": {}}]',12,1),(15,'2021-07-18 10:52:15.718023','10','C',1,'[{\"added\": {}}]',12,1),(16,'2021-07-18 10:52:34.749118','7','S',3,'',12,1),(17,'2021-07-18 10:52:34.790380','6','L',3,'',12,1),(18,'2021-07-18 10:52:47.401838','1','TER',1,'[{\"added\": {}}]',13,1),(19,'2021-07-18 10:52:59.060116','1','TER',3,'',13,1),(20,'2021-07-18 10:53:05.916389','2','TERMINALE',1,'[{\"added\": {}}]',13,1),(21,'2021-07-18 10:53:15.445300','3','PREMIERE',1,'[{\"added\": {}}]',13,1),(22,'2021-07-18 10:53:20.107224','4','SECONDE',1,'[{\"added\": {}}]',13,1),(23,'2021-07-18 10:53:26.065461','5','TROISIEME',1,'[{\"added\": {}}]',13,1),(24,'2021-07-18 10:53:30.847232','6','QUATRIEME',1,'[{\"added\": {}}]',13,1),(25,'2021-07-18 10:53:34.437454','7','CINQUIEME',1,'[{\"added\": {}}]',13,1),(26,'2021-07-18 10:53:37.813744','8','SIXIEME',1,'[{\"added\": {}}]',13,1),(27,'2021-07-18 10:54:05.550896','1','S',1,'[{\"added\": {}}]',14,1),(28,'2021-07-18 10:54:09.384487','2','L',1,'[{\"added\": {}}]',14,1),(29,'2021-07-18 10:54:13.946140','3','S1',1,'[{\"added\": {}}]',14,1),(30,'2021-07-18 10:54:19.154305','4','S2',1,'[{\"added\": {}}]',14,1),(31,'2021-07-18 10:54:23.847734','5','L1',1,'[{\"added\": {}}]',14,1),(32,'2021-07-18 10:54:29.939979','6','L2',1,'[{\"added\": {}}]',14,1),(33,'2021-07-18 11:30:13.418083','3','INSCRIPTION',1,'[{\"added\": {}}]',21,1),(34,'2021-07-18 11:30:19.790490','4','MENSUALITE',1,'[{\"added\": {}}]',21,1),(35,'2021-07-18 11:30:25.124309','5','TENUE',1,'[{\"added\": {}}]',21,1),(36,'2021-07-18 11:34:33.941995','2','TERMINALE S1 ',1,'[{\"added\": {}}]',15,1),(37,'2021-07-18 11:37:48.034553','2','Cheikh Yaba Diop',1,'[{\"added\": {}}]',10,1),(38,'2021-07-18 11:37:53.670761','3','Matar Diop',1,'[{\"added\": {}}]',9,1),(39,'2021-07-18 11:40:08.840214','1','2019/2020',1,'[{\"added\": {}}]',7,1),(40,'2021-07-18 11:40:43.042698','1','Matar Diop | TERMINALE S1  | 2019/2020',1,'[{\"added\": {}}]',11,1),(41,'2021-07-18 11:40:55.796637','1','Paiement object (1)',1,'[{\"added\": {}}]',20,1),(42,'2021-07-18 11:47:41.642923','4','Moustapha Dieng',1,'[{\"added\": {}}]',18,1),(43,'2021-07-18 11:48:27.797873','1','ProfesseurClasse object (1)',1,'[{\"added\": {}}]',19,1),(44,'2021-07-18 11:55:19.049988','2','CheikhYabaDiop',1,'[{\"added\": {}}]',4,1),(45,'2021-07-18 11:59:43.931916','1','Surveillant',1,'[{\"added\": {}}]',3,1),(46,'2021-07-18 12:00:12.269491','2','CheikhYabaDiop',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(47,'2021-07-18 12:02:18.257001','1','Surveillant',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(48,'2021-07-18 12:04:00.383600','2','CheikhYabaDiop',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(49,'2021-07-18 12:04:11.168576','2','CheikhYabaDiop',2,'[]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(15,'classes','classe'),(12,'classes','indice'),(13,'classes','niveau'),(14,'classes','serie'),(5,'contenttypes','contenttype'),(7,'eleves','anneescolaire'),(9,'eleves','eleve'),(11,'eleves','eleveclasse'),(8,'eleves','personne'),(10,'eleves','tuteur'),(20,'paiements','paiement'),(17,'paiements','professeur'),(16,'paiements','professeurclasse'),(21,'paiements','typedepaiement'),(18,'professeurs','professeur'),(19,'professeurs','professeurclasse'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-18 10:45:05.499998'),(2,'auth','0001_initial','2021-07-18 10:45:16.395470'),(3,'admin','0001_initial','2021-07-18 10:45:18.448249'),(4,'admin','0002_logentry_remove_auto_add','2021-07-18 10:45:18.573318'),(5,'admin','0003_logentry_add_action_flag_choices','2021-07-18 10:45:18.635742'),(6,'contenttypes','0002_remove_content_type_name','2021-07-18 10:45:19.385719'),(7,'auth','0002_alter_permission_name_max_length','2021-07-18 10:45:20.560326'),(8,'auth','0003_alter_user_email_max_length','2021-07-18 10:45:20.763451'),(9,'auth','0004_alter_user_username_opts','2021-07-18 10:45:20.857196'),(10,'auth','0005_alter_user_last_login_null','2021-07-18 10:45:21.513438'),(11,'auth','0006_require_contenttypes_0002','2021-07-18 10:45:21.607175'),(12,'auth','0007_alter_validators_add_error_messages','2021-07-18 10:45:21.685295'),(13,'auth','0008_alter_user_username_max_length','2021-07-18 10:45:21.919665'),(14,'auth','0009_alter_user_last_name_max_length','2021-07-18 10:45:22.122787'),(15,'auth','0010_alter_group_name_max_length','2021-07-18 10:45:22.638581'),(16,'auth','0011_update_proxy_permissions','2021-07-18 10:45:22.700890'),(17,'auth','0012_alter_user_first_name_max_length','2021-07-18 10:45:22.919642'),(18,'classes','0001_initial','2021-07-18 10:45:27.517496'),(19,'eleves','0001_initial','2021-07-18 10:45:35.296209'),(20,'sessions','0001_initial','2021-07-18 10:45:35.889942'),(21,'paiements','0001_initial','2021-07-18 11:03:25.044566'),(22,'paiements','0002_auto_20210718_1126','2021-07-18 11:27:37.898961'),(23,'professeurs','0001_initial','2021-07-18 11:27:43.369012'),(24,'classes','0002_auto_20210718_1146','2021-07-18 11:46:42.335394'),(25,'eleves','0002_alter_eleve_parent','2021-07-18 11:46:42.429438'),(26,'paiements','0003_auto_20210718_1146','2021-07-18 11:46:42.554136');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('au3q36po4so9yxcpi4ag1zkh9wo4rbtk','.eJxVjMEOwiAQRP-FsyFAwS0evfsNZJcFqRpISnsy_rtt0oPeJvPezFsEXJcS1p7mMLG4CC1Ovx1hfKa6A35gvTcZW13mieSuyIN2eWucXtfD_Tso2Mu2dmewg3GUEZzKStMWswVmZNDGJodqUDSiAs96jI4Mgfbok3WWLCnx-QLc8Te9:1m55Y5:wVGdgx2LswfCXhMSaUDekkypaarFWALT7xx0R-pfbQ4','2021-08-01 12:05:33.599813');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_anneescolaire`
--

DROP TABLE IF EXISTS `eleves_anneescolaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_anneescolaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anneeDebut` int(11) NOT NULL,
  `anneeFin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_anneescolaire`
--

LOCK TABLES `eleves_anneescolaire` WRITE;
/*!40000 ALTER TABLE `eleves_anneescolaire` DISABLE KEYS */;
INSERT INTO `eleves_anneescolaire` VALUES (1,2019,2020);
/*!40000 ALTER TABLE `eleves_anneescolaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_eleve`
--

DROP TABLE IF EXISTS `eleves_eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_eleve` (
  `personne_ptr_id` bigint(20) NOT NULL,
  `dateNaissance` date NOT NULL,
  `lieuNaissance` varchar(30) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`personne_ptr_id`),
  KEY `eleves_eleve_parent_id_bac1023a_fk_eleves_tuteur_personne_ptr_id` (`parent_id`),
  CONSTRAINT `eleves_eleve_parent_id_bac1023a_fk_eleves_tuteur_personne_ptr_id` FOREIGN KEY (`parent_id`) REFERENCES `eleves_tuteur` (`personne_ptr_id`),
  CONSTRAINT `eleves_eleve_personne_ptr_id_daa32021_fk_eleves_personne_id` FOREIGN KEY (`personne_ptr_id`) REFERENCES `eleves_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_eleve`
--

LOCK TABLES `eleves_eleve` WRITE;
/*!40000 ALTER TABLE `eleves_eleve` DISABLE KEYS */;
INSERT INTO `eleves_eleve` VALUES (3,'2003-01-08','Dakar',2);
/*!40000 ALTER TABLE `eleves_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_eleveclasse`
--

DROP TABLE IF EXISTS `eleves_eleveclasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_eleveclasse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anneeScolaire_id` bigint(20) NOT NULL,
  `classe_id` bigint(20) NOT NULL,
  `eleve_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eleves_eleveclasse_anneeScolaire_id_373667b7_fk_eleves_an` (`anneeScolaire_id`),
  KEY `eleves_eleveclasse_classe_id_b5bcecfc_fk_classes_classe_id` (`classe_id`),
  KEY `eleves_eleveclasse_eleve_id_708bb9ae_fk_eleves_el` (`eleve_id`),
  CONSTRAINT `eleves_eleveclasse_anneeScolaire_id_373667b7_fk_eleves_an` FOREIGN KEY (`anneeScolaire_id`) REFERENCES `eleves_anneescolaire` (`id`),
  CONSTRAINT `eleves_eleveclasse_classe_id_b5bcecfc_fk_classes_classe_id` FOREIGN KEY (`classe_id`) REFERENCES `classes_classe` (`id`),
  CONSTRAINT `eleves_eleveclasse_eleve_id_708bb9ae_fk_eleves_el` FOREIGN KEY (`eleve_id`) REFERENCES `eleves_eleve` (`personne_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_eleveclasse`
--

LOCK TABLES `eleves_eleveclasse` WRITE;
/*!40000 ALTER TABLE `eleves_eleveclasse` DISABLE KEYS */;
INSERT INTO `eleves_eleveclasse` VALUES (1,1,2,3);
/*!40000 ALTER TABLE `eleves_eleveclasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_personne`
--

DROP TABLE IF EXISTS `eleves_personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_personne` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_personne`
--

LOCK TABLES `eleves_personne` WRITE;
/*!40000 ALTER TABLE `eleves_personne` DISABLE KEYS */;
INSERT INTO `eleves_personne` VALUES (2,'Diop','Cheikh Yaba',NULL,770000000),(3,'Diop','Matar',NULL,NULL),(4,'Dieng','Moustapha',NULL,NULL);
/*!40000 ALTER TABLE `eleves_personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_tuteur`
--

DROP TABLE IF EXISTS `eleves_tuteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_tuteur` (
  `personne_ptr_id` bigint(20) NOT NULL,
  PRIMARY KEY (`personne_ptr_id`),
  CONSTRAINT `eleves_tuteur_personne_ptr_id_64bd0622_fk_eleves_personne_id` FOREIGN KEY (`personne_ptr_id`) REFERENCES `eleves_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_tuteur`
--

LOCK TABLES `eleves_tuteur` WRITE;
/*!40000 ALTER TABLE `eleves_tuteur` DISABLE KEYS */;
INSERT INTO `eleves_tuteur` VALUES (2);
/*!40000 ALTER TABLE `eleves_tuteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiements_paiement`
--

DROP TABLE IF EXISTS `paiements_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiements_paiement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `montant` int(11) NOT NULL,
  `dateDePaiement` date NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `mois` varchar(12) DEFAULT NULL,
  `eleve_id` bigint(20) NOT NULL,
  `typeDePaiement_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paiements_paiement_typeDePaiement_id_692f40cc_fk_paiements` (`typeDePaiement_id`),
  KEY `paiements_paiement_eleve_id_201764d9_fk_eleves_eleveclasse_id` (`eleve_id`),
  CONSTRAINT `paiements_paiement_eleve_id_201764d9_fk_eleves_eleveclasse_id` FOREIGN KEY (`eleve_id`) REFERENCES `eleves_eleveclasse` (`id`),
  CONSTRAINT `paiements_paiement_typeDePaiement_id_692f40cc_fk_paiements` FOREIGN KEY (`typeDePaiement_id`) REFERENCES `paiements_typedepaiement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements_paiement`
--

LOCK TABLES `paiements_paiement` WRITE;
/*!40000 ALTER TABLE `paiements_paiement` DISABLE KEYS */;
INSERT INTO `paiements_paiement` VALUES (1,50000,'2021-07-18',NULL,NULL,1,3);
/*!40000 ALTER TABLE `paiements_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiements_typedepaiement`
--

DROP TABLE IF EXISTS `paiements_typedepaiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiements_typedepaiement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements_typedepaiement`
--

LOCK TABLES `paiements_typedepaiement` WRITE;
/*!40000 ALTER TABLE `paiements_typedepaiement` DISABLE KEYS */;
INSERT INTO `paiements_typedepaiement` VALUES (3,'INSCRIPTION'),(4,'MENSUALITE'),(5,'TENUE');
/*!40000 ALTER TABLE `paiements_typedepaiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeurs_professeur`
--

DROP TABLE IF EXISTS `professeurs_professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeurs_professeur` (
  `personne_ptr_id` bigint(20) NOT NULL,
  `salaire` int(11) NOT NULL,
  `matiere` varchar(30) NOT NULL,
  PRIMARY KEY (`personne_ptr_id`),
  CONSTRAINT `professeurs_professe_personne_ptr_id_508d94e9_fk_eleves_pe` FOREIGN KEY (`personne_ptr_id`) REFERENCES `eleves_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs_professeur`
--

LOCK TABLES `professeurs_professeur` WRITE;
/*!40000 ALTER TABLE `professeurs_professeur` DISABLE KEYS */;
INSERT INTO `professeurs_professeur` VALUES (4,150000,'PHILOSOPHIE');
/*!40000 ALTER TABLE `professeurs_professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeurs_professeurclasse`
--

DROP TABLE IF EXISTS `professeurs_professeurclasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeurs_professeurclasse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anneeScolaire_id` bigint(20) NOT NULL,
  `classe_id` bigint(20) NOT NULL,
  `professeur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professeurs_professe_anneeScolaire_id_f29f3857_fk_eleves_an` (`anneeScolaire_id`),
  KEY `professeurs_professe_classe_id_9f91c41a_fk_classes_c` (`classe_id`),
  KEY `professeurs_professe_professeur_id_77ac1fd7_fk_professeu` (`professeur_id`),
  CONSTRAINT `professeurs_professe_anneeScolaire_id_f29f3857_fk_eleves_an` FOREIGN KEY (`anneeScolaire_id`) REFERENCES `eleves_anneescolaire` (`id`),
  CONSTRAINT `professeurs_professe_classe_id_9f91c41a_fk_classes_c` FOREIGN KEY (`classe_id`) REFERENCES `classes_classe` (`id`),
  CONSTRAINT `professeurs_professe_professeur_id_77ac1fd7_fk_professeu` FOREIGN KEY (`professeur_id`) REFERENCES `professeurs_professeur` (`personne_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs_professeurclasse`
--

LOCK TABLES `professeurs_professeurclasse` WRITE;
/*!40000 ALTER TABLE `professeurs_professeurclasse` DISABLE KEYS */;
INSERT INTO `professeurs_professeurclasse` VALUES (1,1,2,4);
/*!40000 ALTER TABLE `professeurs_professeurclasse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 12:20:16
