-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: quiz_db
-- ------------------------------------------------------
-- Server version	8.0.36-2ubuntu3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add question',6,'add_question'),(22,'Can change question',6,'change_question'),(23,'Can delete question',6,'delete_question'),(24,'Can view question',6,'view_question'),(25,'Can add user',7,'add_quizuser'),(26,'Can change user',7,'change_quizuser'),(27,'Can delete user',7,'delete_quizuser'),(28,'Can view user',7,'view_quizuser'),(29,'Can add answer',8,'add_answer'),(30,'Can change answer',8,'change_answer'),(31,'Can delete answer',8,'delete_answer'),(32,'Can view answer',8,'view_answer'),(33,'Can add quiz',9,'add_quiz'),(34,'Can change quiz',9,'change_quiz'),(35,'Can delete quiz',9,'delete_quiz'),(36,'Can view quiz',9,'view_quiz'),(37,'Can add user quiz attempt',10,'add_userquizattempt'),(38,'Can change user quiz attempt',10,'change_userquizattempt'),(39,'Can delete user quiz attempt',10,'delete_userquizattempt'),(40,'Can view user quiz attempt',10,'view_userquizattempt'),(41,'Can add Token',11,'add_token'),(42,'Can change Token',11,'change_token'),(43,'Can delete Token',11,'delete_token'),(44,'Can view Token',11,'view_token'),(45,'Can add Token',12,'add_tokenproxy'),(46,'Can change Token',12,'change_tokenproxy'),(47,'Can delete Token',12,'delete_tokenproxy'),(48,'Can view Token',12,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_quiz_app_quizuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_app_quizuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('dce1cb5a9242a4a1dbc84a2d41dcb5019d380948','2024-05-08 14:29:05.662486',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_quiz_app_quizuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_quiz_app_quizuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_app_quizuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-08 14:10:24.159796','1','Lesson',1,'[{\"added\": {}}]',9,1),(2,'2024-05-08 14:10:59.831007','1','A is for ____?',1,'[{\"added\": {}}]',6,1),(3,'2024-05-08 14:11:18.438252','1','Anthonia',1,'[{\"added\": {}}]',8,1),(4,'2024-05-08 14:11:32.425976','2','Antenna',1,'[{\"added\": {}}]',8,1),(5,'2024-05-08 14:11:42.474704','3','Apple',1,'[{\"added\": {}}]',8,1),(6,'2024-05-08 14:12:31.767408','2','Django',1,'[{\"added\": {}}]',9,1),(7,'2024-05-08 14:14:09.556595','2','What could modelA.related_name_to_model_B__attr_in',1,'[{\"added\": {}}]',6,1),(8,'2024-05-08 14:14:31.091561','3','Explain ORM',1,'[{\"added\": {}}]',6,1),(9,'2024-05-08 14:16:32.657628','4','model A is using a related name of a foreign key c',1,'[{\"added\": {}}]',8,1),(10,'2024-05-08 14:17:01.279626','5','It is not possible to access attributes in django ',1,'[{\"added\": {}}]',8,1),(11,'2024-05-08 14:17:11.188653','6','I don\'t know',1,'[{\"added\": {}}]',8,1),(12,'2024-05-08 14:24:36.820662','7','Object Relational Mappers are used to abstract dat',1,'[{\"added\": {}}]',8,1),(13,'2024-05-08 14:26:02.840309','8','Other Resources Migration - this tool moves the da',1,'[{\"added\": {}}]',8,1),(14,'2024-05-08 16:35:34.484496','2','Django',2,'[{\"changed\": {\"fields\": [\"Max attempts\"]}}]',9,1),(15,'2024-05-10 04:13:10.691040','1','kings - Django',2,'[{\"changed\": {\"fields\": [\"Attempt count\"]}}]',10,1),(16,'2024-05-10 04:13:22.905478','1','kings - Lesson',2,'[{\"changed\": {\"fields\": [\"Quiz\"]}}]',10,1),(17,'2024-05-10 10:11:51.794854','3','kings - Django',2,'[{\"changed\": {\"fields\": [\"Attempt count\"]}}]',10,1),(18,'2024-05-10 10:27:54.584962','3','kings - Django',2,'[{\"changed\": {\"fields\": [\"Attempt count\"]}}]',10,1),(19,'2024-05-10 11:23:14.274016','3','kings - Django',2,'[{\"changed\": {\"fields\": [\"Attempt count\"]}}]',10,1),(20,'2024-05-10 11:23:35.549474','2','Django',2,'[{\"changed\": {\"fields\": [\"Max attempts\"]}}]',9,1),(21,'2024-05-10 13:14:29.143721','3','kings - Django',2,'[{\"changed\": {\"fields\": [\"Attempt count\"]}}]',10,1),(22,'2024-05-10 14:30:31.745871','3','General Knowledge',1,'[{\"added\": {}}]',9,1),(23,'2024-05-10 14:31:21.930017','4','History',1,'[{\"added\": {}}]',9,1),(24,'2024-05-10 14:32:18.158616','5','Science',1,'[{\"added\": {}}]',9,1),(25,'2024-05-10 14:33:04.459539','6','Literature',1,'[{\"added\": {}}]',9,1),(26,'2024-05-10 14:33:46.834376','4','What is the capital of France?',1,'[{\"added\": {}}]',6,1),(27,'2024-05-10 14:34:29.037219','5','What is the largest ocean on Earth?',1,'[{\"added\": {}}]',6,1),(28,'2024-05-10 14:34:47.179965','6','What is the tallest mountain in the world?',1,'[{\"added\": {}}]',6,1),(29,'2024-05-10 14:35:02.242629','7','What is the chemical symbol for water?',1,'[{\"added\": {}}]',6,1),(30,'2024-05-10 14:35:24.014860','8','How many planets are in our solar system (as of 20',1,'[{\"added\": {}}]',6,1),(31,'2024-05-10 14:35:46.356123','9','In what century did World War II take place?',1,'[{\"added\": {}}]',6,1),(32,'2024-05-10 14:36:02.484393','10','Who was the first president of the United States?',1,'[{\"added\": {}}]',6,1),(33,'2024-05-10 14:36:19.693451','11','What major event marked the end of the Roman Empir',1,'[{\"added\": {}}]',6,1),(34,'2024-05-10 14:36:49.504017','12','What invention revolutionized communication in the',1,'[{\"added\": {}}]',6,1),(35,'2024-05-10 14:37:17.703735','13','What was the main cause of the French Revolution?',1,'[{\"added\": {}}]',6,1),(36,'2024-05-10 14:37:52.121028','14','What is the basic unit of heredity?',1,'[{\"added\": {}}]',6,1),(37,'2024-05-10 14:38:09.596379','15','What theory explains the formation of the solar sy',1,'[{\"added\": {}}]',6,1),(38,'2024-05-10 14:38:30.639051','16','What is the process by which plants convert sunlig',1,'[{\"added\": {}}]',6,1),(39,'2024-05-10 14:38:49.652059','17','What is the study of the Earth and its surrounding',1,'[{\"added\": {}}]',6,1),(40,'2024-05-10 14:39:06.418298','18','What is the name of the force that attracts object',1,'[{\"added\": {}}]',6,1),(41,'2024-05-10 14:39:33.493730','19','Who wrote the novel \"Pride and Prejudice\"?',1,'[{\"added\": {}}]',6,1),(42,'2024-05-10 14:40:00.956542','20','What is the genre of the play \"Hamlet\" by William ',1,'[{\"added\": {}}]',6,1),(43,'2024-05-10 14:40:16.736264','21','What is the main character\'s name in the novel \"To',1,'[{\"added\": {}}]',6,1),(44,'2024-05-10 14:40:34.864895','22','What is the literary device used in the phrase \"th',1,'[{\"added\": {}}]',6,1),(45,'2024-05-10 14:40:50.921592','23','What is the time period in which the novel \"The Gr',1,'[{\"added\": {}}]',6,1),(46,'2024-05-10 14:42:18.171882','9','Paris',1,'[{\"added\": {}}]',8,1),(47,'2024-05-10 14:42:35.570616','10','Nigeria',1,'[{\"added\": {}}]',8,1),(48,'2024-05-10 14:42:48.299733','11','Berlin',1,'[{\"added\": {}}]',8,1),(49,'2024-05-10 14:42:57.451308','12','Rome',1,'[{\"added\": {}}]',8,1),(50,'2024-05-10 14:44:29.977411','13','Atlantic Ocean',1,'[{\"added\": {}}]',8,1),(51,'2024-05-10 14:44:43.738252','14','Pacific Ocean',1,'[{\"added\": {}}]',8,1),(52,'2024-05-10 14:44:58.791127','15','Indian Ocean',1,'[{\"added\": {}}]',8,1),(53,'2024-05-10 14:45:13.173612','16','Arctic Ocean',1,'[{\"added\": {}}]',8,1),(54,'2024-05-10 14:45:34.819047','17','Mount Everest',1,'[{\"added\": {}}]',8,1),(55,'2024-05-10 14:45:46.097522','18','K2',1,'[{\"added\": {}}]',8,1),(56,'2024-05-10 14:45:57.760165','19','Kangchenjunga',1,'[{\"added\": {}}]',8,1),(57,'2024-05-10 14:46:12.079782','20','Kilimanjaro',1,'[{\"added\": {}}]',8,1),(58,'2024-05-10 14:46:29.173094','21','CO2',1,'[{\"added\": {}}]',8,1),(59,'2024-05-10 14:46:41.925346','22','NaCl',1,'[{\"added\": {}}]',8,1),(60,'2024-05-10 14:46:50.982796','23','H2O',1,'[{\"added\": {}}]',8,1),(61,'2024-05-10 14:47:00.475161','24','NH3',1,'[{\"added\": {}}]',8,1),(62,'2024-05-10 14:47:45.740395','25','7',1,'[{\"added\": {}}]',8,1),(63,'2024-05-10 14:47:55.151008','26','8',1,'[{\"added\": {}}]',8,1),(64,'2024-05-10 14:48:05.597732','27','9',1,'[{\"added\": {}}]',8,1),(65,'2024-05-10 14:48:13.346522','28','10',1,'[{\"added\": {}}]',8,1),(66,'2024-05-10 14:48:49.961178','29','18',1,'[{\"added\": {}}]',8,1),(67,'2024-05-10 14:49:06.436644','30','19',1,'[{\"added\": {}}]',8,1),(68,'2024-05-10 14:49:17.537544','31','20',1,'[{\"added\": {}}]',8,1),(69,'2024-05-10 14:49:30.071500','32','21',1,'[{\"added\": {}}]',8,1),(70,'2024-05-10 14:49:46.588363','33','George Washington',1,'[{\"added\": {}}]',8,1),(71,'2024-05-10 14:50:04.391749','34','John Adams',1,'[{\"added\": {}}]',8,1),(72,'2024-05-10 14:50:22.954639','35','Thomas Jefferson',1,'[{\"added\": {}}]',8,1),(73,'2024-05-10 14:50:44.237043','36','Muhammadu Buhari',1,'[{\"added\": {}}]',8,1),(74,'2024-05-10 14:51:06.173455','37','The Fall of Constantinople',1,'[{\"added\": {}}]',8,1),(75,'2024-05-10 14:51:18.089963','38','The Punic Wars',1,'[{\"added\": {}}]',8,1),(76,'2024-05-10 14:51:30.278789','39','The eruption of Mount Vesuvius',1,'[{\"added\": {}}]',8,1),(77,'2024-05-10 14:51:41.130781','40','The assassination of Julius Caesar',1,'[{\"added\": {}}]',8,1),(78,'2024-05-10 14:52:08.922750','41','The printing press',1,'[{\"added\": {}}]',8,1),(79,'2024-05-10 14:52:24.941703','42','The Telegraph',1,'[{\"added\": {}}]',8,1),(80,'2024-05-10 14:52:37.419694','43','The internet',1,'[{\"added\": {}}]',8,1),(81,'2024-05-10 14:52:54.016189','44','The telephone',1,'[{\"added\": {}}]',8,1),(82,'2024-05-10 14:53:08.091828','45','The Industrial Revolution',1,'[{\"added\": {}}]',8,1),(83,'2024-05-10 14:53:20.602823','46','The Enlightenment',1,'[{\"added\": {}}]',8,1),(84,'2024-05-10 14:53:35.734477','47','The Napoleonic Wars',1,'[{\"added\": {}}]',8,1),(85,'2024-05-10 14:53:46.470023','48','The Hundred Years\' War',1,'[{\"added\": {}}]',8,1),(86,'2024-05-10 14:54:28.431699','49','Cell',1,'[{\"added\": {}}]',8,1),(87,'2024-05-10 14:54:43.245476','50','Gene',1,'[{\"added\": {}}]',8,1),(88,'2024-05-10 14:54:54.966509','51','Organ',1,'[{\"added\": {}}]',8,1),(89,'2024-05-10 14:55:03.719499','52','Tissue',1,'[{\"added\": {}}]',8,1),(90,'2024-05-10 14:55:17.464458','53','The Big Bang Theory',1,'[{\"added\": {}}]',8,1),(91,'2024-05-10 14:55:32.215567','54','The Theory of Relativity',1,'[{\"added\": {}}]',8,1),(92,'2024-05-10 14:55:43.403171','55','The Nebular Hypothesis',1,'[{\"added\": {}}]',8,1),(93,'2024-05-10 14:55:54.226536','55','The Nebular Hypothesis',2,'[{\"changed\": {\"fields\": [\"Is correct\"]}}]',8,1),(94,'2024-05-10 14:56:04.787895','56','Quantum Mechanics',1,'[{\"added\": {}}]',8,1),(95,'2024-05-10 14:56:19.430605','57','Photosynthesis',1,'[{\"added\": {}}]',8,1),(96,'2024-05-10 14:56:35.259979','58','Cellular respiration',1,'[{\"added\": {}}]',8,1),(97,'2024-05-10 14:56:45.229003','59','Mitosis',1,'[{\"added\": {}}]',8,1),(98,'2024-05-10 14:56:56.175664','60','Meiosis',1,'[{\"added\": {}}]',8,1),(99,'2024-05-10 14:57:25.931136','61','Geology',1,'[{\"added\": {}}]',8,1),(100,'2024-05-10 14:57:38.798336','62','Astronomy',1,'[{\"added\": {}}]',8,1),(101,'2024-05-10 14:57:49.702792','63','Meteorology',1,'[{\"added\": {}}]',8,1),(102,'2024-05-10 14:57:59.380007','64','Chemistry',1,'[{\"added\": {}}]',8,1),(103,'2024-05-10 14:58:15.073763','65','Electromagnetism',1,'[{\"added\": {}}]',8,1),(104,'2024-05-10 14:58:27.212509','66','Gravity',1,'[{\"added\": {}}]',8,1),(105,'2024-05-10 14:58:38.051519','67','The Strong Nuclear Force',1,'[{\"added\": {}}]',8,1),(106,'2024-05-10 14:58:50.238020','68','The Weak Nuclear Force',1,'[{\"added\": {}}]',8,1),(107,'2024-05-10 14:59:27.909042','69','Jane Austen',1,'[{\"added\": {}}]',8,1),(108,'2024-05-10 14:59:39.415652','70','Adams Smith',1,'[{\"added\": {}}]',8,1),(109,'2024-05-10 14:59:58.765646','71','Johnson Edward',1,'[{\"added\": {}}]',8,1),(110,'2024-05-10 15:00:12.440875','72','Chinua Achebe',1,'[{\"added\": {}}]',8,1),(111,'2024-05-10 15:00:28.485240','73','Comedy',1,'[{\"added\": {}}]',8,1),(112,'2024-05-10 15:00:47.167771','74','Tragedy',1,'[{\"added\": {}}]',8,1),(113,'2024-05-10 15:01:04.955014','75','Historical fiction',1,'[{\"added\": {}}]',8,1),(114,'2024-05-10 15:01:18.362498','76','Scientific fiction',1,'[{\"added\": {}}]',8,1),(115,'2024-05-10 15:02:12.479032','77','Scout Finch',1,'[{\"added\": {}}]',8,1),(116,'2024-05-10 15:02:29.685534','78','Atticus Finch',1,'[{\"added\": {}}]',8,1),(117,'2024-05-10 15:02:39.678229','79','Boo Radley',1,'[{\"added\": {}}]',8,1),(118,'2024-05-10 15:02:51.769110','80','Tom Robinson',1,'[{\"added\": {}}]',8,1),(119,'2024-05-10 15:03:15.944948','81','Simile',1,'[{\"added\": {}}]',8,1),(120,'2024-05-10 15:03:27.434459','82','Metaphor',1,'[{\"added\": {}}]',8,1),(121,'2024-05-10 15:03:40.737922','83','Personification',1,'[{\"added\": {}}]',8,1),(122,'2024-05-10 15:04:06.497575','84','Hyperbole',1,'[{\"added\": {}}]',8,1),(123,'2024-05-10 15:04:34.969628','85','The Victorian Era',1,'[{\"added\": {}}]',8,1),(124,'2024-05-10 15:04:54.257389','86','The Roaring Twenties',1,'[{\"added\": {}}]',8,1),(125,'2024-05-10 15:05:09.282183','87','The Middle Ages',1,'[{\"added\": {}}]',8,1),(126,'2024-05-10 15:05:25.286936','88','The Renaissance',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(11,'authtoken','token'),(12,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(8,'quiz_app','answer'),(6,'quiz_app','question'),(9,'quiz_app','quiz'),(7,'quiz_app','quizuser'),(10,'quiz_app','userquizattempt'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-08 14:05:34.442340'),(2,'contenttypes','0002_remove_content_type_name','2024-05-08 14:05:34.507761'),(3,'auth','0001_initial','2024-05-08 14:05:34.787336'),(4,'auth','0002_alter_permission_name_max_length','2024-05-08 14:05:34.860459'),(5,'auth','0003_alter_user_email_max_length','2024-05-08 14:05:34.867626'),(6,'auth','0004_alter_user_username_opts','2024-05-08 14:05:34.878990'),(7,'auth','0005_alter_user_last_login_null','2024-05-08 14:05:34.893633'),(8,'auth','0006_require_contenttypes_0002','2024-05-08 14:05:34.898970'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-08 14:05:34.916827'),(10,'auth','0008_alter_user_username_max_length','2024-05-08 14:05:34.930950'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-08 14:05:34.941565'),(12,'auth','0010_alter_group_name_max_length','2024-05-08 14:05:34.969006'),(13,'auth','0011_update_proxy_permissions','2024-05-08 14:05:34.984294'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-08 14:05:35.002939'),(15,'quiz_app','0001_initial','2024-05-08 14:05:35.703997'),(16,'admin','0001_initial','2024-05-08 14:05:35.858670'),(17,'admin','0002_logentry_remove_auto_add','2024-05-08 14:05:35.873023'),(18,'admin','0003_logentry_add_action_flag_choices','2024-05-08 14:05:35.902161'),(19,'authtoken','0001_initial','2024-05-08 14:05:35.999713'),(20,'authtoken','0002_auto_20160226_1747','2024-05-08 14:05:36.051955'),(21,'authtoken','0003_tokenproxy','2024-05-08 14:05:36.055965'),(22,'authtoken','0004_alter_tokenproxy_options','2024-05-08 14:05:36.063366'),(23,'sessions','0001_initial','2024-05-08 14:05:36.110840'),(24,'quiz_app','0002_userquizattempt_attempt_count','2024-05-08 15:06:04.573994');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0yjwf1ii4t763j8vo6br9x8dm6kzukxd','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5ANn:rwSLTN_3_fcFoqbSNk_abEZgGZnp1Rvgn0SeaIithek','2024-05-23 20:28:51.998897'),('402mlf0qqxr87flf43tr4x79hxko7zuw','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AJd:CRFVeI-Bn6aF74nvCv91oceTdXuruXC6UDdGor-1Xfk','2024-05-23 20:24:33.792546'),('4avvaes91bnlsna7nvccqs0lfxv4g1nj','.eJxVjMsOwiAQRf-FtSE8Bum4dN9vIANDpWogKe3K-O_apAvd3nPOfYlA21rC1vMSZhYXocXpd4uUHrnugO9Ub02mVtdljnJX5EG7HBvn5_Vw_w4K9fKtXQblbUTlkGDiPJ09GIhJafKAFN2UBkRrCKwHlezAEZCVs2iUZz2I9wfTDTcZ:1s5RFv:6SkJqb7uIQWyXhVWJcdwTQhRSsixq2r__F4clUdSR5s','2024-05-24 14:29:51.741419'),('cac6z8xomwgij96hbixb6ul79b51dazv','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s4iI5:m1N9y3jGS8zc2k94JOq7CfCBO6DtiLXoMzM3kFf1S4E','2024-05-22 14:29:05.665925'),('dr8so5gbyzgkrseoqnljgwf99iu06akv','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s51Gt:ZM1zMsEmh1Hi5uIPmXwPtAHyTbf9-yB9gPOChbZcwvM','2024-05-23 10:45:07.781200'),('fu1o337gw09j91jsvw4n7c6iuiahhvdf','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AMN:sQx-81HvnRMZ797zdywR_UGuhTZCOahtJlrK9vI9emQ','2024-05-23 20:27:23.173320'),('ggtjwsj4cmfkwmceqwmjp1h01luohxpy','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AYV:muW-1RIUSGloUX-ssU16rnAl_--yNy-uKIm3AmpUEF8','2024-05-23 20:39:55.816180'),('gpwhrnheogncvncokiczqffy1e8ibmn5','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5B0Y:BpBHII2eVjzgDKSSoAF5Dk9a0ThqQaewpUR3EBPfVFo','2024-05-23 21:08:54.655449'),('lzgepkevl89rfzxbr2ba3yz644tucppo','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5Aeh:TaFm-kZMkUlHc31fQaAZNvZr69_mrxbI5tOfLyaaxWo','2024-05-23 20:46:19.817596'),('mt7x8kffptsgyx65pvlhfsr2nltmtus3','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AZr:n0_hugNfa5jMuWTwBbtMCZAl6W832FRVUxLV7Ajx9j0','2024-05-23 20:41:19.814495'),('nk4iahpp3shy73i3q9d9gmvq5tac2xgi','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AbR:VlIKbmwx6qB3dWql0XeaQ9LhtthwSdsjz_j8rcyKdF8','2024-05-23 20:42:57.939016'),('vmcgp43n4q79q9gvs0saa1sbgwhwt280','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5ALU:StmaPC_v9SqeUeczDppL1K7Q8dbWQLrwUp61iUQXUMk','2024-05-23 20:26:28.795199'),('xf3pazgjv4ie4w0fzbkehamm3ecl5uhl','.eJxVjDsOwjAQBe_iGln-O0tJzxms3bWDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM7CiNPvRsiP0naQ79hus-S5rctEclfkQbu8zrk8L4f7d1Cx128NqHUoFAtYrdl6jEppcmO2PjhvCSEojiYwDMAuwmgskDLFkGFHgxXvD8ZDNw4:1s5AcV:jXugP55ekqKtF_lGkUUr1olbEzwZEXzlB7cUcorAHPk','2024-05-23 20:44:03.723628');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_answer`
--

DROP TABLE IF EXISTS `quiz_app_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_app_answer_question_id_7db89087_fk_quiz_app_question_id` (`question_id`),
  CONSTRAINT `quiz_app_answer_question_id_7db89087_fk_quiz_app_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_app_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_answer`
--

LOCK TABLES `quiz_app_answer` WRITE;
/*!40000 ALTER TABLE `quiz_app_answer` DISABLE KEYS */;
INSERT INTO `quiz_app_answer` VALUES (1,'Anthonia',0,1),(2,'Antenna',0,1),(3,'Apple',1,1),(4,'model A is using a related name of a foreign key constrain to access the attributes of the primary key of model B. This is possible with django orm',1,2),(5,'It is not possible to access attributes in django this way',0,2),(6,'I don\'t know',0,2),(7,'Object Relational Mappers are used to abstract database queries in such a way that the programmer interacts with them like codes instead of database syntaxes. It maps a programming language codes to corresponding database statement.',1,3),(8,'Other Resources Migration - this tool moves the database querying process into a programming language in such a way that the database itself becomes part of the language make one resource out of both',0,3),(9,'Paris',1,4),(10,'Nigeria',0,4),(11,'Berlin',0,4),(12,'Rome',0,4),(13,'Atlantic Ocean',0,5),(14,'Pacific Ocean',1,5),(15,'Indian Ocean',0,5),(16,'Arctic Ocean',0,5),(17,'Mount Everest',1,6),(18,'K2',0,6),(19,'Kangchenjunga',0,6),(20,'Kilimanjaro',0,6),(21,'CO2',0,7),(22,'NaCl',0,7),(23,'H2O',0,7),(24,'NH3',0,7),(25,'7',0,8),(26,'8',1,8),(27,'9',0,8),(28,'10',0,8),(29,'18',0,9),(30,'19',0,9),(31,'20',1,9),(32,'21',0,9),(33,'George Washington',1,10),(34,'John Adams',0,10),(35,'Thomas Jefferson',0,10),(36,'Muhammadu Buhari',0,10),(37,'The Fall of Constantinople',1,11),(38,'The Punic Wars',0,11),(39,'The eruption of Mount Vesuvius',0,11),(40,'The assassination of Julius Caesar',0,11),(41,'The printing press',0,12),(42,'The Telegraph',1,12),(43,'The internet',0,12),(44,'The telephone',0,12),(45,'The Industrial Revolution',0,13),(46,'The Enlightenment',0,13),(47,'The Napoleonic Wars',0,13),(48,'The Hundred Years\' War',0,13),(49,'Cell',0,14),(50,'Gene',1,14),(51,'Organ',0,14),(52,'Tissue',0,14),(53,'The Big Bang Theory',0,15),(54,'The Theory of Relativity',0,15),(55,'The Nebular Hypothesis',1,15),(56,'Quantum Mechanics',0,15),(57,'Photosynthesis',1,16),(58,'Cellular respiration',0,16),(59,'Mitosis',0,16),(60,'Meiosis',0,16),(61,'Geology',1,17),(62,'Astronomy',0,17),(63,'Meteorology',0,17),(64,'Chemistry',0,17),(65,'Electromagnetism',0,18),(66,'Gravity',1,18),(67,'The Strong Nuclear Force',0,18),(68,'The Weak Nuclear Force',0,18),(69,'Jane Austen',1,19),(70,'Adams Smith',0,19),(71,'Johnson Edward',0,19),(72,'Chinua Achebe',0,19),(73,'Comedy',0,20),(74,'Tragedy',1,20),(75,'Historical fiction',0,20),(76,'Scientific fiction',0,20),(77,'Scout Finch',1,21),(78,'Atticus Finch',0,21),(79,'Boo Radley',0,21),(80,'Tom Robinson',0,21),(81,'Simile',0,22),(82,'Metaphor',1,22),(83,'Personification',0,22),(84,'Hyperbole',0,22),(85,'The Victorian Era',0,23),(86,'The Roaring Twenties',1,23),(87,'The Middle Ages',0,23),(88,'The Renaissance',0,23);
/*!40000 ALTER TABLE `quiz_app_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_question`
--

DROP TABLE IF EXISTS `quiz_app_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `question_type` varchar(20) NOT NULL,
  `points` int unsigned NOT NULL,
  `last_displayed` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quiz_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_app_question_quiz_id_ad89c241_fk_quiz_app_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_app_question_quiz_id_ad89c241_fk_quiz_app_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_app_quiz` (`id`),
  CONSTRAINT `quiz_app_question_chk_1` CHECK ((`points` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_question`
--

LOCK TABLES `quiz_app_question` WRITE;
/*!40000 ALTER TABLE `quiz_app_question` DISABLE KEYS */;
INSERT INTO `quiz_app_question` VALUES (1,'A is for ____?','MCQ',100,NULL,'2024-05-08 14:10:59.829147','2024-05-08 14:10:59.829210',1),(2,'What could modelA.related_name_to_model_B__attr_in_model_B mean?','MCQ',50,'2024-05-10 10:19:42.663112','2024-05-08 14:14:09.554877','2024-05-08 14:14:09.554923',2),(3,'Explain ORM','MCQ',50,'2024-05-10 10:19:42.663112','2024-05-08 14:14:31.090590','2024-05-08 14:14:31.090640',2),(4,'What is the capital of France?','MCQ',20,NULL,'2024-05-10 14:33:46.830915','2024-05-10 14:33:46.830976',3),(5,'What is the largest ocean on Earth?','MCQ',20,NULL,'2024-05-10 14:34:29.035852','2024-05-10 14:34:29.035886',3),(6,'What is the tallest mountain in the world?','MCQ',20,NULL,'2024-05-10 14:34:47.178221','2024-05-10 14:34:47.178268',3),(7,'What is the chemical symbol for water?','MCQ',20,NULL,'2024-05-10 14:35:02.241269','2024-05-10 14:35:02.241299',3),(8,'How many planets are in our solar system (as of 2024)?','MCQ',20,NULL,'2024-05-10 14:35:24.013159','2024-05-10 14:35:24.013195',3),(9,'In what century did World War II take place?','MCQ',15,NULL,'2024-05-10 14:35:46.354592','2024-05-10 14:35:46.354620',4),(10,'Who was the first president of the United States?','MCQ',15,NULL,'2024-05-10 14:36:02.481763','2024-05-10 14:36:02.481878',4),(11,'What major event marked the end of the Roman Empire?','MCQ',25,NULL,'2024-05-10 14:36:19.692406','2024-05-10 14:36:19.692447',4),(12,'What invention revolutionized communication in the 19th century?','MCQ',20,NULL,'2024-05-10 14:36:49.502648','2024-05-10 14:36:49.502675',4),(13,'What was the main cause of the French Revolution?','MCQ',25,NULL,'2024-05-10 14:37:17.701639','2024-05-10 14:37:17.701684',4),(14,'What is the basic unit of heredity?','MCQ',15,NULL,'2024-05-10 14:37:52.119282','2024-05-10 14:37:52.119312',5),(15,'What theory explains the formation of the solar system?','MCQ',15,NULL,'2024-05-10 14:38:09.594341','2024-05-10 14:38:09.594377',5),(16,'What is the process by which plants convert sunlight into energy?','MCQ',25,NULL,'2024-05-10 14:38:30.637535','2024-05-10 14:38:30.637565',5),(17,'What is the study of the Earth and its surrounding environment?','MCQ',25,NULL,'2024-05-10 14:38:49.650697','2024-05-10 14:38:49.650731',5),(18,'What is the name of the force that attracts objects with mass towards each other?','MCQ',20,NULL,'2024-05-10 14:39:06.416498','2024-05-10 14:39:06.416548',5),(19,'Who wrote the novel \"Pride and Prejudice\"?','MCQ',20,NULL,'2024-05-10 14:39:33.492427','2024-05-10 14:39:33.492455',6),(20,'What is the genre of the play \"Hamlet\" by William Shakespeare?','MCQ',30,NULL,'2024-05-10 14:40:00.953866','2024-05-10 14:40:00.953911',6),(21,'What is the main character\'s name in the novel \"To Kill a Mockingbird\"?','MCQ',15,NULL,'2024-05-10 14:40:16.735251','2024-05-10 14:40:16.735281',6),(22,'What is the literary device used in the phrase \"the lonely road\"?','MCQ',20,NULL,'2024-05-10 14:40:34.861941','2024-05-10 14:40:34.862004',6),(23,'What is the time period in which the novel \"The Great Gatsby\" takes place?','MCQ',15,NULL,'2024-05-10 14:40:50.919558','2024-05-10 14:40:50.919591',6);
/*!40000 ALTER TABLE `quiz_app_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_quiz`
--

DROP TABLE IF EXISTS `quiz_app_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_quiz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `total_questions` int unsigned NOT NULL,
  `total_score` int unsigned NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `time_limit` int unsigned NOT NULL,
  `max_attempts` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `quiz_app_quiz_author_id_849915b1_fk_quiz_app_quizuser_id` (`author_id`),
  CONSTRAINT `quiz_app_quiz_author_id_849915b1_fk_quiz_app_quizuser_id` FOREIGN KEY (`author_id`) REFERENCES `quiz_app_quizuser` (`id`),
  CONSTRAINT `quiz_app_quiz_chk_1` CHECK ((`total_questions` >= 0)),
  CONSTRAINT `quiz_app_quiz_chk_2` CHECK ((`total_score` >= 0)),
  CONSTRAINT `quiz_app_quiz_chk_3` CHECK ((`time_limit` >= 0)),
  CONSTRAINT `quiz_app_quiz_chk_4` CHECK ((`max_attempts` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_quiz`
--

LOCK TABLES `quiz_app_quiz` WRITE;
/*!40000 ALTER TABLE `quiz_app_quiz` DISABLE KEYS */;
INSERT INTO `quiz_app_quiz` VALUES (1,'Lesson','Lessson',1,100,'Easy',0,1,'2024-05-08 14:10:24.157752','2024-05-08 14:10:24.157825',1),(2,'Django','Test of true ORM',2,100,'Easy',10,20,'2024-05-08 14:12:31.765218','2024-05-10 11:23:35.547581',1),(3,'General Knowledge','General Knowledge Quiz',5,100,'Easy',10,3,'2024-05-10 14:30:31.743096','2024-05-10 14:30:31.743134',1),(4,'History','Historical Events Quiz',5,100,'Medium',15,2,'2024-05-10 14:31:21.927985','2024-05-10 14:31:21.928083',1),(5,'Science','Science and biological knowledge test',5,100,'Medium',15,5,'2024-05-10 14:32:18.155796','2024-05-10 14:32:18.155856',1),(6,'Literature','Literature, Poetry and Use of language',5,100,'Hard',20,2,'2024-05-10 14:33:04.457963','2024-05-10 14:33:04.457996',1);
/*!40000 ALTER TABLE `quiz_app_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_quizuser`
--

DROP TABLE IF EXISTS `quiz_app_quizuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_quizuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `total_score` int unsigned NOT NULL,
  `highest_score` int unsigned NOT NULL,
  `total_quizzes_taken` int unsigned NOT NULL,
  `average_score` double NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `quiz_app_quizuser_chk_1` CHECK ((`total_score` >= 0)),
  CONSTRAINT `quiz_app_quizuser_chk_2` CHECK ((`highest_score` >= 0)),
  CONSTRAINT `quiz_app_quizuser_chk_3` CHECK ((`total_quizzes_taken` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_quizuser`
--

LOCK TABLES `quiz_app_quizuser` WRITE;
/*!40000 ALTER TABLE `quiz_app_quizuser` DISABLE KEYS */;
INSERT INTO `quiz_app_quizuser` VALUES (1,'pbkdf2_sha256$720000$NhUDiIB6J72e9oOmmrhRHG$FSeu1mlZTDDZS/v/Ax7XlpPbqIRpv2ddvhcBnjEFBmc=','2024-05-10 14:29:51.736037','kingsley','','','',1,1,'2024-05-08 14:09:48.782948',0,0,0,0,1),(2,'pbkdf2_sha256$720000$pA45Tb6RdLRr3tQRdHqabp$lTry7AegwU+gD32ponh/SyMW+Js7CFAtlmWdLXLier0=','2024-05-09 21:08:54.649081','kings','Jimmy','chime','jim@example.com',0,1,'2024-05-08 14:28:44.702040',0,100,39,0,0);
/*!40000 ALTER TABLE `quiz_app_quizuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_quizuser_groups`
--

DROP TABLE IF EXISTS `quiz_app_quizuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_quizuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_app_quizuser_groups_quizuser_id_group_id_da69b2f6_uniq` (`quizuser_id`,`group_id`),
  KEY `quiz_app_quizuser_groups_group_id_2f73561b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `quiz_app_quizuser_gr_quizuser_id_a76856c4_fk_quiz_app_` FOREIGN KEY (`quizuser_id`) REFERENCES `quiz_app_quizuser` (`id`),
  CONSTRAINT `quiz_app_quizuser_groups_group_id_2f73561b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_quizuser_groups`
--

LOCK TABLES `quiz_app_quizuser_groups` WRITE;
/*!40000 ALTER TABLE `quiz_app_quizuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_app_quizuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_quizuser_user_permissions`
--

DROP TABLE IF EXISTS `quiz_app_quizuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_quizuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_app_quizuser_user_p_quizuser_id_permission_i_9535e4d2_uniq` (`quizuser_id`,`permission_id`),
  KEY `quiz_app_quizuser_us_permission_id_5c19d5f3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `quiz_app_quizuser_us_permission_id_5c19d5f3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `quiz_app_quizuser_us_quizuser_id_f3624893_fk_quiz_app_` FOREIGN KEY (`quizuser_id`) REFERENCES `quiz_app_quizuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_quizuser_user_permissions`
--

LOCK TABLES `quiz_app_quizuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `quiz_app_quizuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_app_quizuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_app_userquizattempt`
--

DROP TABLE IF EXISTS `quiz_app_userquizattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_app_userquizattempt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` int unsigned NOT NULL,
  `total_questions` int unsigned NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quiz_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `attempt_count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_app_userquizattempt_quiz_id_b410ff14_fk_quiz_app_quiz_id` (`quiz_id`),
  KEY `quiz_app_userquizatt_user_id_a644bba5_fk_quiz_app_` (`user_id`),
  CONSTRAINT `quiz_app_userquizatt_user_id_a644bba5_fk_quiz_app_` FOREIGN KEY (`user_id`) REFERENCES `quiz_app_quizuser` (`id`),
  CONSTRAINT `quiz_app_userquizattempt_quiz_id_b410ff14_fk_quiz_app_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_app_quiz` (`id`),
  CONSTRAINT `quiz_app_userquizattempt_chk_1` CHECK ((`score` >= 0)),
  CONSTRAINT `quiz_app_userquizattempt_chk_2` CHECK ((`total_questions` >= 0)),
  CONSTRAINT `quiz_app_userquizattempt_chk_3` CHECK ((`attempt_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_app_userquizattempt`
--

LOCK TABLES `quiz_app_userquizattempt` WRITE;
/*!40000 ALTER TABLE `quiz_app_userquizattempt` DISABLE KEYS */;
INSERT INTO `quiz_app_userquizattempt` VALUES (1,100,1,1,'2024-05-08 14:34:36.782171','2024-05-10 12:28:40.297950',1,2,1),(2,0,0,0,'2024-05-08 15:52:07.666051','2024-05-08 15:52:07.666240',2,1,0),(3,50,2,1,'2024-05-10 04:14:18.292208','2024-05-10 14:27:09.149684',2,2,2);
/*!40000 ALTER TABLE `quiz_app_userquizattempt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-10 16:09:11
