-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: epmm_database2
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add personne',9,'add_personne'),(34,'Can change personne',9,'change_personne'),(35,'Can delete personne',9,'delete_personne'),(36,'Can view personne',9,'view_personne'),(37,'Can add eleve',10,'add_eleve'),(38,'Can change eleve',10,'change_eleve'),(39,'Can delete eleve',10,'delete_eleve'),(40,'Can view eleve',10,'view_eleve'),(41,'Can add tuteur',11,'add_tuteur'),(42,'Can change tuteur',11,'change_tuteur'),(43,'Can delete tuteur',11,'delete_tuteur'),(44,'Can view tuteur',11,'view_tuteur'),(45,'Can add eleve classe',12,'add_eleveclasse'),(46,'Can change eleve classe',12,'change_eleveclasse'),(47,'Can delete eleve classe',12,'delete_eleveclasse'),(48,'Can view eleve classe',12,'view_eleveclasse'),(49,'Can add indice',13,'add_indice'),(50,'Can change indice',13,'change_indice'),(51,'Can delete indice',13,'delete_indice'),(52,'Can view indice',13,'view_indice'),(53,'Can add niveau',14,'add_niveau'),(54,'Can change niveau',14,'change_niveau'),(55,'Can delete niveau',14,'delete_niveau'),(56,'Can view niveau',14,'view_niveau'),(57,'Can add serie',15,'add_serie'),(58,'Can change serie',15,'change_serie'),(59,'Can delete serie',15,'delete_serie'),(60,'Can view serie',15,'view_serie'),(61,'Can add classe',16,'add_classe'),(62,'Can change classe',16,'change_classe'),(63,'Can delete classe',16,'delete_classe'),(64,'Can view classe',16,'view_classe'),(65,'Can add annee scolaire',17,'add_anneescolaire'),(66,'Can change annee scolaire',17,'change_anneescolaire'),(67,'Can delete annee scolaire',17,'delete_anneescolaire'),(68,'Can view annee scolaire',17,'view_anneescolaire'),(69,'Can add annee classe',18,'add_anneeclasse'),(70,'Can change annee classe',18,'change_anneeclasse'),(71,'Can delete annee classe',18,'delete_anneeclasse'),(72,'Can view annee classe',18,'view_anneeclasse'),(73,'Can add professeur',19,'add_professeur'),(74,'Can change professeur',19,'change_professeur'),(75,'Can delete professeur',19,'delete_professeur'),(76,'Can view professeur',19,'view_professeur'),(77,'Can add type de paiement',20,'add_typedepaiement'),(78,'Can change type de paiement',20,'change_typedepaiement'),(79,'Can delete type de paiement',20,'delete_typedepaiement'),(80,'Can view type de paiement',20,'view_typedepaiement'),(81,'Can add paiement',21,'add_paiement'),(82,'Can change paiement',21,'change_paiement'),(83,'Can delete paiement',21,'delete_paiement'),(84,'Can view paiement',21,'view_paiement');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_anneeclasse`
--

DROP TABLE IF EXISTS `classes_anneeclasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_anneeclasse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annee_id` bigint(20) NOT NULL,
  `classe_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_anneeclasse_annee_id_ae08b49e_fk_classes_a` (`annee_id`),
  KEY `classes_anneeclasse_classe_id_a7b9fd47_fk_classes_classe_id` (`classe_id`),
  CONSTRAINT `classes_anneeclasse_annee_id_ae08b49e_fk_classes_a` FOREIGN KEY (`annee_id`) REFERENCES `classes_anneescolaire` (`id`),
  CONSTRAINT `classes_anneeclasse_classe_id_a7b9fd47_fk_classes_classe_id` FOREIGN KEY (`classe_id`) REFERENCES `classes_classe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_anneeclasse`
--

LOCK TABLES `classes_anneeclasse` WRITE;
/*!40000 ALTER TABLE `classes_anneeclasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_anneeclasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_anneescolaire`
--

DROP TABLE IF EXISTS `classes_anneescolaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_anneescolaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anneeDebut` int(11) NOT NULL,
  `anneeFin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_anneescolaire`
--

LOCK TABLES `classes_anneescolaire` WRITE;
/*!40000 ALTER TABLE `classes_anneescolaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_anneescolaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_anneescolaire_classes`
--

DROP TABLE IF EXISTS `classes_anneescolaire_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_anneescolaire_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anneescolaire_id` bigint(20) NOT NULL,
  `classe_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classes_anneescolaire_cl_anneescolaire_id_classe__3618587f_uniq` (`anneescolaire_id`,`classe_id`),
  KEY `classes_anneescolair_classe_id_780ff128_fk_classes_c` (`classe_id`),
  CONSTRAINT `classes_anneescolair_anneescolaire_id_9e1df2fa_fk_classes_a` FOREIGN KEY (`anneescolaire_id`) REFERENCES `classes_anneescolaire` (`id`),
  CONSTRAINT `classes_anneescolair_classe_id_780ff128_fk_classes_c` FOREIGN KEY (`classe_id`) REFERENCES `classes_classe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_anneescolaire_classes`
--

LOCK TABLES `classes_anneescolaire_classes` WRITE;
/*!40000 ALTER TABLE `classes_anneescolaire_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_anneescolaire_classes` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_classe`
--

LOCK TABLES `classes_classe` WRITE;
/*!40000 ALTER TABLE `classes_classe` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_indice`
--

LOCK TABLES `classes_indice` WRITE;
/*!40000 ALTER TABLE `classes_indice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_niveau`
--

LOCK TABLES `classes_niveau` WRITE;
/*!40000 ALTER TABLE `classes_niveau` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_serie`
--

LOCK TABLES `classes_serie` WRITE;
/*!40000 ALTER TABLE `classes_serie` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(18,'classes','anneeclasse'),(17,'classes','anneescolaire'),(16,'classes','classe'),(13,'classes','indice'),(14,'classes','niveau'),(15,'classes','serie'),(5,'contenttypes','contenttype'),(10,'eleves','eleve'),(12,'eleves','eleveclasse'),(9,'eleves','personne'),(11,'eleves','tuteur'),(21,'paiements','paiement'),(20,'paiements','typedepaiement'),(19,'professeurs','professeur'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-29 00:08:03.943285'),(2,'auth','0001_initial','2021-07-29 00:08:11.530506'),(3,'admin','0001_initial','2021-07-29 00:08:13.441412'),(4,'admin','0002_logentry_remove_auto_add','2021-07-29 00:08:13.513427'),(5,'admin','0003_logentry_add_action_flag_choices','2021-07-29 00:08:13.601461'),(6,'contenttypes','0002_remove_content_type_name','2021-07-29 00:08:14.652626'),(7,'auth','0002_alter_permission_name_max_length','2021-07-29 00:08:15.419375'),(8,'auth','0003_alter_user_email_max_length','2021-07-29 00:08:15.609903'),(9,'auth','0004_alter_user_username_opts','2021-07-29 00:08:15.665021'),(10,'auth','0005_alter_user_last_login_null','2021-07-29 00:08:16.185185'),(11,'auth','0006_require_contenttypes_0002','2021-07-29 00:08:16.225186'),(12,'auth','0007_alter_validators_add_error_messages','2021-07-29 00:08:16.305217'),(13,'auth','0008_alter_user_username_max_length','2021-07-29 00:08:16.440517'),(14,'auth','0009_alter_user_last_name_max_length','2021-07-29 00:08:16.722958'),(15,'auth','0010_alter_group_name_max_length','2021-07-29 00:08:16.882512'),(16,'auth','0011_update_proxy_permissions','2021-07-29 00:08:16.922520'),(17,'auth','0012_alter_user_first_name_max_length','2021-07-29 00:08:17.034513'),(18,'authtoken','0001_initial','2021-07-29 00:08:18.149270'),(19,'authtoken','0002_auto_20160226_1747','2021-07-29 00:08:18.221272'),(20,'authtoken','0003_tokenproxy','2021-07-29 00:08:18.255348'),(21,'classes','0001_initial','2021-07-29 00:08:28.574657'),(22,'classes','0002_alter_anneescolaire_classes','2021-07-29 00:08:28.719908'),(23,'eleves','0001_initial','2021-07-29 00:08:37.199649'),(24,'eleves','0002_alter_eleve_classes','2021-07-29 00:08:37.247652'),(25,'eleves','0003_alter_eleve_classes','2021-07-29 00:08:37.311652'),(26,'paiements','0001_initial','2021-07-29 00:08:40.267478'),(27,'professeurs','0001_initial','2021-07-29 00:08:44.151848'),(28,'sessions','0001_initial','2021-07-29 00:08:44.702106');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `eleves_eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_eleve_classes`
--

DROP TABLE IF EXISTS `eleves_eleve_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_eleve_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eleve_id` bigint(20) NOT NULL,
  `anneeclasse_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eleves_eleve_classes_eleve_id_anneeclasse_id_e1a569fa_uniq` (`eleve_id`,`anneeclasse_id`),
  KEY `eleves_eleve_classes_anneeclasse_id_b91eed8b_fk_classes_a` (`anneeclasse_id`),
  CONSTRAINT `eleves_eleve_classes_anneeclasse_id_b91eed8b_fk_classes_a` FOREIGN KEY (`anneeclasse_id`) REFERENCES `classes_anneeclasse` (`id`),
  CONSTRAINT `eleves_eleve_classes_eleve_id_3331d7a9_fk_eleves_el` FOREIGN KEY (`eleve_id`) REFERENCES `eleves_eleve` (`personne_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_eleve_classes`
--

LOCK TABLES `eleves_eleve_classes` WRITE;
/*!40000 ALTER TABLE `eleves_eleve_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `eleves_eleve_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves_eleveclasse`
--

DROP TABLE IF EXISTS `eleves_eleveclasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves_eleveclasse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classe_id` bigint(20) NOT NULL,
  `eleve_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eleves_eleveclasse_classe_id_b5bcecfc_fk_classes_anneeclasse_id` (`classe_id`),
  KEY `eleves_eleveclasse_eleve_id_708bb9ae_fk_eleves_el` (`eleve_id`),
  CONSTRAINT `eleves_eleveclasse_classe_id_b5bcecfc_fk_classes_anneeclasse_id` FOREIGN KEY (`classe_id`) REFERENCES `classes_anneeclasse` (`id`),
  CONSTRAINT `eleves_eleveclasse_eleve_id_708bb9ae_fk_eleves_el` FOREIGN KEY (`eleve_id`) REFERENCES `eleves_eleve` (`personne_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_eleveclasse`
--

LOCK TABLES `eleves_eleveclasse` WRITE;
/*!40000 ALTER TABLE `eleves_eleveclasse` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_personne`
--

LOCK TABLES `eleves_personne` WRITE;
/*!40000 ALTER TABLE `eleves_personne` DISABLE KEYS */;
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
  `parent` tinyint(1) NOT NULL,
  PRIMARY KEY (`personne_ptr_id`),
  CONSTRAINT `eleves_tuteur_personne_ptr_id_64bd0622_fk_eleves_personne_id` FOREIGN KEY (`personne_ptr_id`) REFERENCES `eleves_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves_tuteur`
--

LOCK TABLES `eleves_tuteur` WRITE;
/*!40000 ALTER TABLE `eleves_tuteur` DISABLE KEYS */;
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
  `mois` varchar(12) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `eleve_id` bigint(20) NOT NULL,
  `typeDePaiement_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paiements_paiement_eleve_id_201764d9_fk_eleves_eleveclasse_id` (`eleve_id`),
  KEY `paiements_paiement_typeDePaiement_id_692f40cc_fk_paiements` (`typeDePaiement_id`),
  CONSTRAINT `paiements_paiement_eleve_id_201764d9_fk_eleves_eleveclasse_id` FOREIGN KEY (`eleve_id`) REFERENCES `eleves_eleveclasse` (`id`),
  CONSTRAINT `paiements_paiement_typeDePaiement_id_692f40cc_fk_paiements` FOREIGN KEY (`typeDePaiement_id`) REFERENCES `paiements_typedepaiement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements_paiement`
--

LOCK TABLES `paiements_paiement` WRITE;
/*!40000 ALTER TABLE `paiements_paiement` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements_typedepaiement`
--

LOCK TABLES `paiements_typedepaiement` WRITE;
/*!40000 ALTER TABLE `paiements_typedepaiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paiements_typedepaiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeurs_professeur`
--

DROP TABLE IF EXISTS `professeurs_professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeurs_professeur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `salaire` int(11) NOT NULL,
  `matiere` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs_professeur`
--

LOCK TABLES `professeurs_professeur` WRITE;
/*!40000 ALTER TABLE `professeurs_professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeurs_professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeurs_professeur_classes`
--

DROP TABLE IF EXISTS `professeurs_professeur_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeurs_professeur_classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `professeur_id` bigint(20) NOT NULL,
  `anneeclasse_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `professeurs_professeur_c_professeur_id_anneeclass_bfd35b9e_uniq` (`professeur_id`,`anneeclasse_id`),
  KEY `professeurs_professe_anneeclasse_id_77562847_fk_classes_a` (`anneeclasse_id`),
  CONSTRAINT `professeurs_professe_anneeclasse_id_77562847_fk_classes_a` FOREIGN KEY (`anneeclasse_id`) REFERENCES `classes_anneeclasse` (`id`),
  CONSTRAINT `professeurs_professe_professeur_id_acac6bdd_fk_professeu` FOREIGN KEY (`professeur_id`) REFERENCES `professeurs_professeur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs_professeur_classes`
--

LOCK TABLES `professeurs_professeur_classes` WRITE;
/*!40000 ALTER TABLE `professeurs_professeur_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeurs_professeur_classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29  0:11:22
