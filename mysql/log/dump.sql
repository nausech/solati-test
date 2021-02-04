-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: heartonline
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` int(11) NOT NULL DEFAULT '0',
  `duration_minutes` int(11) NOT NULL DEFAULT '60',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_streaming` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friendly_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_coordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `guests_limit` int(11) NOT NULL DEFAULT '0',
  `type_activity_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mode_id` int(10) unsigned DEFAULT NULL,
  `pic_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_event_id_foreign` (`event_id`),
  KEY `activities_country_id_foreign` (`country_id`),
  KEY `activities_city_id_foreign` (`city_id`),
  KEY `activities_type_activity_id_foreign` (`type_activity_id`),
  CONSTRAINT `activities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `activities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `activities_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `activities_type_activity_id_foreign` FOREIGN KEY (`type_activity_id`) REFERENCES `type_activities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,3,'Docker en el desarrollo','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',0,60,'2020-09-03 05:00:00','2020-09-03 06:00:00','event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,120,2,'2020-08-28 21:59:41','2020-08-28 21:59:41',2,'event_banner_sdfsdfsdfsdfsdfsdf_manzana0.png'),(2,3,'Ventajas del uso de contenedores','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',0,60,'2020-08-28 06:00:00','2020-08-28 07:00:00','event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,120,2,'2020-08-28 21:59:41','2020-08-28 21:59:41',2,'event_banner_sdfsdfsdfsdfsdfsdf_manzana0.png'),(4,2,'Hacking para empresas','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',0,60,'2020-08-28 05:00:00','2020-08-28 06:00:00','event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,120,2,'2020-08-28 21:59:41','2020-08-28 21:59:41',2,'event_banner_sdfsdfsdfsdfsdfsdf_manzana0.png'),(5,4,'Yoga Intro','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',20000,60,'2020-08-31 15:00:00','2020-08-31 16:00:00','event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,200,2,'2020-08-31 19:41:05','2020-08-31 19:41:05',2,'event_banner_Yoga Intro_durazno3.png'),(6,4,'Yoga y relajación','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',20000,60,'2020-09-02 16:00:00','2020-09-02 17:00:00','event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,200,2,'2020-08-31 19:42:01','2020-08-31 19:42:01',2,'event_banner_Yoga y relajación_durazno4.png'),(7,5,'UCI 2020','UCI y Unidad coronaria',20000,60,'2020-09-03 09:00:00','2020-09-03 10:00:00','event_background_UCI 2020_sonic-real-imagen-pelicula5.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,200,2,'2020-09-02 13:57:54','2020-09-02 13:57:54',2,'event_banner_UCI 2020_sonic-real-imagen-pelicula5.jpg'),(8,5,'UNIDAD CORONARIA 2020','UCI y Unidad coronaria',20000,60,'2020-09-03 10:00:00','2020-09-03 11:00:00','event_background_UNIDAD CORONARIA 2020_sonic-real-imagen-pelicula6.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,200,2,'2020-09-02 13:58:41','2020-09-02 13:58:41',2,'event_banner_UNIDAD CORONARIA 2020_sonic-real-imagen-pelicula6.jpg'),(9,6,'Actividad test inv','asdasasdasdasdasd',20000,60,'2020-10-04 10:12:00','2020-10-04 11:12:00','event_background_Actividad test inv_sonic-real-imagen-pelicula7.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,120,2,'2020-09-02 14:12:26','2020-09-02 14:12:26',2,'event_banner_Actividad test inv_sonic-real-imagen-pelicula7.jpg'),(10,6,'Actividad test inv22','asdasasdasdasdasd',20000,60,'2020-09-08 10:12:00','2020-09-08 11:12:00','event_background_Actividad test inv22_sonic-real-imagen-pelicula8.jpg','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,120,2,'2020-09-02 14:12:56','2020-09-02 14:12:56',2,'event_banner_Actividad test inv22_sonic-real-imagen-pelicula8.jpg'),(11,10,'Hackton tars','Esta es una actiaidad e dprwfasd',10000,60,'2020-09-07 05:23:00','2020-09-07 06:23:00','event_background_Hackton tars_41UHHCF2omL9._AC_SY400_','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,50,2,'2020-09-04 21:23:41','2020-09-04 21:23:41',NULL,'event_banner_Hackton tars_41UHHCF2omL9._AC_SY400_'),(12,10,'Call of duty','Esta es una actiaidad call of duty',10000,60,'2020-09-08 05:23:00','2020-09-08 06:23:00','event_background_Call of duty_41UHHCF2omL10._AC_SY400_','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,50,2,'2020-09-04 21:24:36','2020-09-04 21:24:36',NULL,'event_banner_Call of duty_41UHHCF2omL10._AC_SY400_'),(13,11,'Actividad test','Test de la descripción',20000,60,'2020-09-07 07:11:00','2020-09-07 08:11:00','event_background_Actividad test_banner-yoga11.ebd28c48','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wHDVX2E8nLY\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','text','asasdasddas','321321','aasdasd',1,1,100,2,'2020-09-04 22:11:40','2020-09-04 22:11:40',NULL,'event_banner_Actividad test_banner-yoga11.ebd28c48');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_chats`
--

DROP TABLE IF EXISTS `activity_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_chats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_chats_activity_id_foreign` (`activity_id`),
  KEY `activity_chats_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_chats_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `activity_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_chats`
--

LOCK TABLES `activity_chats` WRITE;
/*!40000 ALTER TABLE `activity_chats` DISABLE KEYS */;
INSERT INTO `activity_chats` VALUES (2,'Holaaaa',4,2,NULL,NULL);
/*!40000 ALTER TABLE `activity_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_speakers`
--

DROP TABLE IF EXISTS `activity_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_speakers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) unsigned NOT NULL,
  `speaker_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_speakers_activity_id_foreign` (`activity_id`),
  KEY `activity_speakers_speaker_id_foreign` (`speaker_id`),
  CONSTRAINT `activity_speakers_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `activity_speakers_speaker_id_foreign` FOREIGN KEY (`speaker_id`) REFERENCES `speakers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_speakers`
--

LOCK TABLES `activity_speakers` WRITE;
/*!40000 ALTER TABLE `activity_speakers` DISABLE KEYS */;
INSERT INTO `activity_speakers` VALUES (1,1,1,'2020-08-28 21:59:42','2020-08-28 21:59:42'),(2,1,2,'2020-08-31 19:41:05','2020-08-31 19:41:05'),(3,2,1,'2020-08-31 19:42:01','2020-08-31 19:42:01'),(4,7,1,'2020-09-02 13:57:55','2020-09-02 13:57:55'),(5,7,2,'2020-09-02 13:57:55','2020-09-02 13:57:55'),(6,8,2,'2020-09-02 13:58:42','2020-09-02 13:58:42'),(7,8,1,'2020-09-02 13:58:42','2020-09-02 13:58:42'),(8,9,2,'2020-09-02 14:12:26','2020-09-02 14:12:26'),(9,10,2,'2020-09-02 14:12:56','2020-09-02 14:12:56'),(10,11,3,'2020-09-04 21:23:42','2020-09-04 21:23:42'),(11,12,2,'2020-09-04 21:24:36','2020-09-04 21:24:36'),(12,13,2,'2020-09-04 22:11:41','2020-09-04 22:11:41');
/*!40000 ALTER TABLE `activity_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_markets`
--

DROP TABLE IF EXISTS `business_markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_markets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speaker_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friendly_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_coordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guests_limit` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principal_color` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_meeting` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_markets`
--

LOCK TABLES `business_markets` WRITE;
/*!40000 ALTER TABLE `business_markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_markets_rel_users`
--

DROP TABLE IF EXISTS `business_markets_rel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_markets_rel_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `business_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_markets_rel_users_user_id_foreign` (`user_id`),
  KEY `business_markets_rel_users_business_id_foreign` (`business_id`),
  CONSTRAINT `business_markets_rel_users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business_markets` (`id`),
  CONSTRAINT `business_markets_rel_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_markets_rel_users`
--

LOCK TABLES `business_markets_rel_users` WRITE;
/*!40000 ALTER TABLE `business_markets_rel_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_markets_rel_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_department_id_foreign` (`department_id`),
  CONSTRAINT `cities_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Bogota',NULL,NULL,1,2);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_coordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`),
  KEY `companies_city_id_foreign` (`city_id`),
  CONSTRAINT `companies_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Tars','Tars','tars@tars.dev','12345',NULL,'1345','12345',NULL,NULL,1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Colombia','2020-08-28 21:34:35','2020-08-28 21:34:35');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_registers`
--

DROP TABLE IF EXISTS `data_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_registers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_registers_register_id_foreign` (`register_id`),
  KEY `data_registers_user_id_foreign` (`user_id`),
  CONSTRAINT `data_registers_register_id_foreign` FOREIGN KEY (`register_id`) REFERENCES `register_events` (`id`),
  CONSTRAINT `data_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_registers`
--

LOCK TABLES `data_registers` WRITE;
/*!40000 ALTER TABLE `data_registers` DISABLE KEYS */;
INSERT INTO `data_registers` VALUES (1,16,9,'24','2020-09-04 21:00:48','2020-09-04 21:00:48'),(2,17,9,'desarrollador','2020-09-04 21:00:48','2020-09-04 21:00:48'),(3,15,9,'90','2020-09-04 21:00:48','2020-09-04 21:00:48'),(4,14,9,'Bueno','2020-09-04 21:00:48','2020-09-04 21:00:48'),(5,17,11,'Desarrollador','2020-09-04 21:10:35','2020-09-04 21:10:35'),(6,16,11,'24','2020-09-04 21:10:35','2020-09-04 21:10:35'),(7,15,11,'90','2020-09-04 21:10:35','2020-09-04 21:10:35'),(8,14,11,'Bueno','2020-09-04 21:10:35','2020-09-04 21:10:35'),(9,17,22,'Desarrolladore','2020-09-09 14:33:44','2020-09-09 14:33:44'),(10,15,22,'60','2020-09-09 14:33:44','2020-09-09 14:33:44'),(11,16,22,'24','2020-09-09 14:33:44','2020-09-09 14:33:44'),(12,16,23,'24','2020-09-09 14:41:12','2020-09-09 14:41:12'),(13,17,23,'Desarrollador','2020-09-09 14:41:12','2020-09-09 14:41:12'),(14,15,23,'60','2020-09-09 14:41:12','2020-09-09 14:41:12');
/*!40000 ALTER TABLE `data_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_country_id_foreign` (`country_id`),
  CONSTRAINT `department_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Cundinamarca',21,1,NULL,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'activity',1,'SP3_GrammarReference_activity_1_0.pdf','2020-08-31 14:54:55','2020-08-31 14:54:55','Docker Intro','local'),(2,'activity',1,'h1n1_activity_1_1.docx','2020-08-31 14:55:18','2020-08-31 14:55:18','Docker developers','local'),(3,'activity',1,'Grammar--Vocabulary-First-and-First-for-Schools-irregular-verbs_activity_1_2.pdf','2020-08-31 14:57:58','2020-08-31 14:57:58','Reflexiones','local'),(4,'activity',1,'Diagrama eventmovil_activity_1_3.xlsx','2020-08-31 14:58:14','2020-08-31 14:58:14','Teorias','local'),(5,'activity',1,'41UHHCF2omL_activity_1_4._AC_SY400_','2020-08-31 15:35:01','2020-08-31 15:35:01','Imagen','local'),(6,'activity',5,'nestle_activity_5_5.odt','2020-08-31 19:42:43','2020-08-31 19:42:43','Yoga Intro','local'),(7,'activity',5,'logo-new-arcade_activity_5_6.png','2020-08-31 19:43:03','2020-08-31 19:43:03','Yoga basic','local'),(8,'activity',5,'47415919_23850869_activity_5_7.jpg','2020-08-31 19:43:22','2020-08-31 19:43:22','Yogalma','local'),(9,'activity',5,'images___23.png','2020-08-31 19:44:27','2020-09-07 23:16:51','Conclusión','local'),(10,'hall',5,'trineo_hall_5_10.jpg','2020-09-01 13:50:21','2020-09-01 15:51:19','Salón silveres','local'),(11,'hall',6,'Captura de pantalla de 2020-08-18 21-32-51_hall_6_10.png','2020-09-01 19:11:30','2020-09-01 19:11:30','Sala bronce','local'),(12,'activity',11,'Captura de pantalla de 2020-06-11 14-54-24_activity_11_11.png','2020-09-04 21:24:56','2020-09-04 21:24:56','Material','local'),(13,'activity',11,'Captura de pantalla de 2020-06-28 12-14-58_activity_11_12.png','2020-09-04 21:25:48','2020-09-04 21:25:48','Imagen','local'),(14,'hall',7,'banner-yoga_hall_7_13.ebd28c48','2020-09-04 21:29:36','2020-09-04 21:29:36','VIP','local'),(15,'activity',13,'banner-yoga_activity_13_14.ebd28c48','2020-09-04 22:12:06','2020-09-04 22:12:06','Imagen','local'),(16,'hall',8,'banner-yoga_hall_8_15.ebd28c48','2020-09-04 22:19:03','2020-09-04 22:19:03','VIP','local'),(17,'hall',9,'images_hall_9_16.png','2020-09-07 19:53:14','2020-09-07 19:53:14','Sala Vip','local'),(18,'hall',10,'41UHHCF2omL_hall_10_17._AC_SY400_','2020-09-07 19:53:54','2020-09-07 19:53:54','Sala Intro','local'),(19,'hall',11,'persona_hall_11_18.jpeg','2020-09-07 19:54:48','2020-09-07 19:54:48','Sala Relax','local'),(20,'hall',12,'persona_hall_12_19.jpeg','2020-09-07 20:44:32','2020-09-07 20:44:32','Sala relax','local'),(21,'hall',13,'persona_hall_13_20.jpeg','2020-09-07 20:47:48','2020-09-07 20:47:48','Sala relax','local'),(22,'hall',14,'persona_hall_14_21.jpeg','2020-09-07 20:52:45','2020-09-07 20:52:45','Sala relax','local'),(23,'hall',15,'images_hall_15_22.png','2020-09-07 21:09:17','2020-09-07 21:09:17','Docker salon','local');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_invitations`
--

DROP TABLE IF EXISTS `event_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `activities` json NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_invitations_event_id_foreign` (`event_id`),
  CONSTRAINT `event_invitations_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_invitations`
--

LOCK TABLES `event_invitations` WRITE;
/*!40000 ALTER TABLE `event_invitations` DISABLE KEYS */;
INSERT INTO `event_invitations` VALUES (1,3,'[1]','cristian.narvaez@tars.dev',3,'2020-08-28 22:00:20','2020-09-02 19:59:46','Mejor nombres'),(2,4,'[5]','cristian.narvaez@tars.dev',10,'2020-08-31 19:48:51','2020-08-31 19:48:51','Camilo Narvaez'),(3,10,'[11, 12]','jose.saldana@tars.dev',2,'2020-09-04 21:28:42','2020-09-04 21:28:42','Jose Javier Saldaña'),(4,11,'[13]','cristian.narvaez@tars.dev',2,'2020-09-04 22:12:43','2020-09-04 22:12:43','Camilo Narvaez');
/*!40000 ALTER TABLE `event_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `friendly_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pic_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_city_id_foreign` (`city_id`),
  KEY `events_company_id_foreign` (`company_id`),
  CONSTRAINT `events_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,'hackaton 2020','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',1,'2020-08-29 05:57:00','2020-10-29 06:57:00','event_logo_hackaton 2020_platano0.png','asasdasddas',60,1,'2020-08-28 21:56:52','2020-08-28 21:56:52','event_banner_hackaton 2020_manzana0.png','event_background_hackaton 2020_sandia0.png','#ea1414','#181818',NULL),(3,'Docker 2020','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',1,'2020-08-28 05:59:00','2020-08-28 05:59:00','logo-new-arcade_activity_5_6.png','asasdasddas',60,1,'2020-08-28 21:58:54','2020-09-02 03:52:23','event_banner_Aactividad test_Captura de pantalla de 2020-06-04 17-20-394.png','event_background_sdasdasdasd_sandia1.png','#ffffff','#0793cf',NULL),(4,'Yoga para el alma','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',1,'2020-08-31 15:00:00','2020-09-05 15:00:00','yoga-logo.png','asasdasddas',60,1,'2020-08-31 19:40:06','2020-09-07 22:19:08','event_banner_Test de evento_rick-and-morty-season-3-episode-9-the-abcs-of-beth7.png','yoga_bg.jpeg','#1c0c21','#9e3dff','#f7f7f7'),(5,'UCI y Unidad coronaria','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',1,'2020-09-02 09:00:00','2020-09-05 09:00:00','event_logo_UCI y Unidad coronaria_03.png','asasdasddas',60,1,'2020-09-02 13:56:28','2020-09-02 13:56:28','event_banner_UCI y Unidad coronaria_sonic-real-imagen-pelicula3.jpg','event_background_UCI y Unidad coronaria_rick-and-morty-season-3-episode-9-the-abcs-of-beth3.png','#da2766','#000000',NULL),(6,'Aactividad test','Una tradicional disciplina física y mental que se originó en la India. El yoga enfatiza la meditación y la liberación y su texto principal es el Yoga sutra (400 d.C.).1​ La palabra se asocia con prácticas de meditación en el hinduismo, el budismo y el jainismo.',1,'2020-09-02 18:00:00','2020-09-10 10:11:00','event_logo_Aactividad test_logo-new-arcade4.png','asasdasddas',60,1,'2020-09-02 14:11:10','2020-09-02 14:11:10','event_banner_Aactividad test_Captura de pantalla de 2020-06-04 17-20-394.png','event_background_Aactividad test_rick-and-morty-season-3-episode-9-the-abcs-of-beth4.png','#f38912','#000000',NULL),(7,'Evento de prueba','It is not our differences that divide us. It is our inability to recognize, accept, and celebrate those differences. - Audre Lorde',1,'2020-09-03 12:00:00','2020-09-11 13:00:00','event_logo_Evento de prueba_0rappi5.png','asasdasddas',60,1,'2020-09-04 01:46:31','2020-09-04 01:46:31','event_banner_Evento de prueba_persona5.jpeg','event_background_Evento de prueba_rick-and-morty-season-3-episode-9-the-abcs-of-beth5.png','#9e0f4a','#080808',NULL),(8,'Eventoaddasdasd','asdasdasddasddddddddddddddddddd',1,'2020-09-03 01:51:00','2020-09-17 09:51:00','event_logo_Eventoaddasdasd_0rappi6.png','asasdasddas',60,1,'2020-09-04 01:50:55','2020-09-04 01:50:55','event_banner_Eventoaddasdasd_htop6.png','event_background_Eventoaddasdasd_rick-and-morty-season-3-episode-9-the-abcs-of-beth6.png','#dd2e87','#020202',NULL),(9,'Test de evento','eytsttetasdt astdastd astd astd atsd atsd',1,'2020-09-04 06:00:00','2020-09-25 01:37:00','event_logo_Test de evento_41UHHCF2omL7._AC_SY400_','asasdasddas',60,1,'2020-09-04 14:37:00','2020-09-04 14:37:00','event_banner_Test de evento_rick-and-morty-season-3-episode-9-the-abcs-of-beth7.png','event_background_Test de evento_rick-and-morty-season-3-episode-9-the-abcs-of-beth7.png','#d53232','#a79999',NULL),(10,'Evento tars 2020','Este es un nevento de de ttetsasd',1,'2020-09-04 06:00:00','2020-09-11 06:00:00','event_logo_Evento tars 2020_logo-new-arcade8.png','asasdasddas',60,1,'2020-09-04 21:20:20','2020-09-04 21:20:20','event_banner_Evento tars 2020_rick-and-morty-season-3-episode-9-the-abcs-of-beth8.png','event_background_Evento tars 2020_persona8.jpeg','#db1212','#000000',NULL),(11,'Evento Heart','Descripción del evento',1,'2020-09-07 06:00:00','2020-09-11 06:09:00','event_logo_Evento Heart_41UHHCF2omL9._AC_SY400_','asasdasddas',60,1,'2020-09-04 22:09:08','2020-09-04 22:09:08','event_banner_Evento Heart_Captura de pantalla de 2020-08-18 21-32-519.png','event_background_Evento Heart_rick-and-morty-season-3-episode-9-the-abcs-of-beth9.png','#d91010','#0c0c0c',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_activities`
--

DROP TABLE IF EXISTS `guest_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `payed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guest_activities_guest_id_foreign` (`guest_id`),
  KEY `guest_activities_activity_id_foreign` (`activity_id`),
  CONSTRAINT `guest_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `guest_activities_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_activities`
--

LOCK TABLES `guest_activities` WRITE;
/*!40000 ALTER TABLE `guest_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_business_markets`
--

DROP TABLE IF EXISTS `guest_business_markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_business_markets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` bigint(20) unsigned NOT NULL,
  `business_market_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guest_business_markets_guest_id_foreign` (`guest_id`),
  KEY `guest_business_markets_business_market_id_foreign` (`business_market_id`),
  CONSTRAINT `guest_business_markets_business_market_id_foreign` FOREIGN KEY (`business_market_id`) REFERENCES `business_markets` (`id`),
  CONSTRAINT `guest_business_markets_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_business_markets`
--

LOCK TABLES `guest_business_markets` WRITE;
/*!40000 ALTER TABLE `guest_business_markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_business_markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guests_email_unique` (`email`),
  UNIQUE KEY `guests_nit_unique` (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habeas_data`
--

DROP TABLE IF EXISTS `habeas_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habeas_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'down',
  `event_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `habeas_data_event_id_foreign` (`event_id`),
  CONSTRAINT `habeas_data_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habeas_data`
--

LOCK TABLES `habeas_data` WRITE;
/*!40000 ALTER TABLE `habeas_data` DISABLE KEYS */;
INSERT INTO `habeas_data` VALUES (1,'file','Grammar--Vocabulary-First-and-First-for-Schools-irregular-verbs___0.pdf','down',2,'2020-09-01 21:06:33','2020-09-01 21:06:33'),(2,'file','Captura de pantalla de 2020-06-28 12-14-58___1.png','down',8,'2020-09-04 01:51:14','2020-09-04 01:51:14'),(3,'file','Grammar--Vocabulary-First-and-First-for-Schools-irregular-verbs_activity_1_2.pdf','down',4,'2020-09-04 18:56:47','2020-09-04 18:56:47'),(4,'text','Hola mundo','down',10,'2020-09-04 21:21:12','2020-09-04 21:21:12'),(5,'text','Hola munda','down',11,'2020-09-04 22:09:35','2020-09-04 22:09:35');
/*!40000 ALTER TABLE `habeas_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habeas_data_users`
--

DROP TABLE IF EXISTS `habeas_data_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habeas_data_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `habeas_data_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `habeas_data_users_user_id_foreign` (`user_id`),
  KEY `habeas_data_users_habeas_data_id_foreign` (`habeas_data_id`),
  CONSTRAINT `habeas_data_users_habeas_data_id_foreign` FOREIGN KEY (`habeas_data_id`) REFERENCES `habeas_data` (`id`),
  CONSTRAINT `habeas_data_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habeas_data_users`
--

LOCK TABLES `habeas_data_users` WRITE;
/*!40000 ALTER TABLE `habeas_data_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `habeas_data_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activities` json NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `halls_creator_id_foreign` (`creator_id`),
  KEY `halls_event_id_foreign` (`event_id`),
  CONSTRAINT `halls_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `halls_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (15,'Docker salon','dfssdfsdfdfdfs','[2, 1]',2,'2020-09-07 21:09:16','2020-09-07 21:09:16',3,'sala_banner_hall_images1.png'),(17,'Sala VIP','Sala VIP full access','[5, 6]',2,'2020-09-07 23:36:31','2020-09-07 23:41:47',4,'sala_banner_hall_images1.png'),(18,'Sala Relax','Sala yoga y relajación','[6]',2,'2020-09-07 23:37:14','2020-09-07 23:37:14',4,'sala_banner_hall_persona2.jpeg'),(19,'Sala intro','Sala de introducción al yoga','[5]',2,'2020-09-07 23:38:02','2020-09-07 23:38:02',4,'sala_banner_hall_41UHHCF2omL3.png');
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_rel_users`
--

DROP TABLE IF EXISTS `meeting_rel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_rel_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `meeting_id` bigint(20) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `acceptance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_rel_users_user_id_foreign` (`user_id`),
  KEY `meeting_rel_users_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `meeting_rel_users_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  CONSTRAINT `meeting_rel_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_rel_users`
--

LOCK TABLES `meeting_rel_users` WRITE;
/*!40000 ALTER TABLE `meeting_rel_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_rel_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `creator_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_creator_id_foreign` (`creator_id`),
  CONSTRAINT `meetings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(5,'2016_06_01_000004_create_oauth_clients_table',1),(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(7,'2019_08_19_000000_create_failed_jobs_table',1),(8,'2020_07_20_024230_create_permission_tables',1),(9,'2020_07_24_183702_create_countries_table',1),(10,'2020_07_24_184102_create_cities_table',1),(11,'2020_07_24_184552_create_companies_table',1),(12,'2020_07_24_185430_create_events_table',1),(13,'2020_07_27_143653_create_type_activities_table',1),(14,'2020_07_27_143654_create_activities_table',1),(15,'2020_07_27_211005_update_users_table',1),(16,'2020_07_28_191126_create_guest_table',1),(17,'2020_07_28_192133_create_guest_activities_table',1),(18,'2020_07_28_201222_create_business_market_table',1),(19,'2020_07_28_201630_create_guest_business_market_table',1),(20,'2020_07_29_152645_create_event_invitations_table',1),(21,'2020_07_29_211408_create_documents_table',1),(22,'2020_08_03_165850_create_url_invitations_table',1),(23,'2020_08_10_220916_create_speakers_table',1),(24,'2020_08_12_202639_create_activity_speakers_table',1),(25,'2020_08_14_165124_create_mode_activities_table',1),(26,'2020_08_14_170334_update_activities_table',1),(27,'2020_08_18_194426_create_type_questions_table',1),(28,'2020_08_18_194427_create_poll_questions_table',1),(29,'2020_08_18_195117_create_poll_answers_table',1),(30,'2020_08_19_195414_update_documents_name_table',1),(31,'2020_08_20_115803_remove_fields_business_market',1),(32,'2020_08_20_144129_remove_fields_rels_business_market',1),(33,'2020_08_20_154706_create_field_mode_business_market',1),(34,'2020_08_20_204630_update_events_imgs_table',1),(35,'2020_08_21_204517_update_activities_imgs_table',1),(36,'2020_08_22_171700_create_products_table',1),(37,'2020_08_24_185303_create_business_markets_rel_users_table',1),(38,'2020_08_25_151529_create_meetings_table',1),(39,'2020_08_25_162353_create_meeting_rel_users_table',1),(40,'2020_08_25_201250_update_business_markets',1),(41,'2020_08_26_161746_update_business_markets_2',1),(42,'2020_08_26_195141_update_companies',1),(43,'2020_08_26_200124_create_departments',1),(44,'2020_08_26_201516_update_cities',1),(45,'2020_08_26_211008_update_cities_2',1),(46,'2020_08_26_215155_update_cities_3',1),(47,'2020_08_27_000927_update_company',1),(48,'2020_08_27_000932_update_company_2',1),(49,'2020_08_27_021652_update_product',1),(50,'2020_08_27_190748_update_event_invitation_table',1),(51,'2020_08_27_203106_update_product_2',1),(52,'2020_08_28_202938_update_users_phone_table',1),(55,'2020_08_31_213135_create_halls_table',2),(56,'2020_08_31_103603_update_user',3),(57,'2020_08_31_111044_update_user_2',3),(58,'2020_09_01_163400_create_habeas_data_table',3),(59,'2020_09_01_165715_create_habeas_data_users_table',3),(66,'2020_09_03_154945_create_register_event_table',4),(67,'2020_09_03_155516_create_data_registers_table',4),(68,'2020_09_04_020605_create_tickets_table',5),(69,'2020_09_07_152731_update_events_third_color_table',6),(71,'2020_09_07_201617_update_halls_event_table',7),(72,'2020_09_07_210346_update_halls_pic_table',8),(73,'0000_00_00_000000_create_websockets_statistics_entries_table',9),(74,'2020_09_14_150239_create_activity_chats_table',10),(75,'2020_09_03_212544_update__b_m_rel_users',11),(76,'2020_09_07_163432_update_business_market',11),(77,'2020_09_13_120944_update_questions',11),(78,'2020_09_14_112128_create_probes_table',11),(79,'2020_09_14_113529_create_probe_answers_table',11),(80,'2020_09_14_135227_rename_probe_questions',11);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_activities`
--

DROP TABLE IF EXISTS `mode_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_activities`
--

LOCK TABLES `mode_activities` WRITE;
/*!40000 ALTER TABLE `mode_activities` DISABLE KEYS */;
INSERT INTO `mode_activities` VALUES (1,'Presencial',1,NULL,NULL),(2,'Virtual',1,NULL,NULL);
/*!40000 ALTER TABLE `mode_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(2,'App\\User',2),(3,'App\\User',3),(3,'App\\User',4),(3,'App\\User',6),(3,'App\\User',7),(3,'App\\User',8),(3,'App\\User',9),(3,'App\\User',11),(3,'App\\User',12),(3,'App\\User',13),(3,'App\\User',14),(3,'App\\User',16),(3,'App\\User',18),(3,'App\\User',20),(3,'App\\User',21),(3,'App\\User',22),(3,'App\\User',23);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('00b8df160a78ceb7775b19adc5e74d7b4c3ead6811c482f7d2b0aacd9e2402f6d2360cf8dea4ee6b',2,1,'MyApp','[]',0,'2020-09-03 20:10:53','2020-09-03 20:10:53','2021-09-03 20:10:53'),('05472ab748f93202243b42fe5c362b1cce1d2038c3352ee8dd5d6cbf7843750c647db768a60eb331',11,1,'MyApp','[]',0,'2020-09-07 16:10:11','2020-09-07 16:10:11','2021-09-07 16:10:11'),('12c4efc0c12a97ec90b229f6e5125f2d239e84bda113a6450a6dd268869bdcf2efd39d1eb5bfbb6e',2,1,'MyApp','[]',0,'2020-09-01 21:56:09','2020-09-01 21:56:09','2021-09-01 21:56:09'),('1485407a916ce6000d498e0e778899f35c2827d39f263138a55c1f3b072d6a6fb9d13c73d534d8cd',2,1,'MyApp','[]',0,'2020-09-02 13:48:00','2020-09-02 13:48:00','2021-09-02 13:48:00'),('1570d17bb7ddb57b79989177320eb59934650c07b5a51dec013694f96d87944ee0f92e8092bec2ed',3,1,'MyApp','[]',0,'2020-09-14 15:08:47','2020-09-14 15:08:47','2021-09-14 15:08:47'),('16c24151a4bb2558bf8ca0eba987e754705ff8f45ea71be18257110f413e2b7634f51720c0bf467f',22,1,'MyApp','[]',0,'2020-09-09 14:34:03','2020-09-09 14:34:03','2021-09-09 14:34:03'),('1d974e2ace591ee865fd5eaf0077e190e30aad9a8bf03e03e50b9bee95415f74fb73c45cc7e79e16',4,1,'MyApp','[]',0,'2020-09-07 16:09:49','2020-09-07 16:09:49','2021-09-07 16:09:49'),('1eede690dfb9f7880b0c01ccf8eab5d3633647d7cfcb68904450adce1d38a4b4fda9c026e2c634ef',3,1,'MyApp','[]',0,'2020-09-07 15:06:09','2020-09-07 15:06:09','2021-09-07 15:06:09'),('2064553f6075d2659fa27151da30904d5b3828526b0738f6afee470dd26f995cc28561db457b39d0',6,1,'MyApp','[]',0,'2020-09-04 01:57:30','2020-09-04 01:57:30','2021-09-04 01:57:30'),('21c223c39b877341a60453d2c6337777cf9c6b1b1d1013324fa74ece95cc9d9ede8c7261cab67378',23,1,'MyApp','[]',0,'2020-09-09 14:55:24','2020-09-09 14:55:24','2021-09-09 14:55:24'),('2430a42512c97901bd60b6638deba2c590092253b6a8d23604c5917554b788a8471c41547d27d65c',6,1,'MyApp','[]',0,'2020-09-01 21:44:31','2020-09-01 21:44:31','2021-09-01 21:44:31'),('261c9413bbaede5639c938d8dfe63c25d9940b3911b7c0a5477c1a5c24e47ac8cee6c0e6309f4ae1',4,1,'MyApp','[]',0,'2020-09-07 21:08:09','2020-09-07 21:08:09','2021-09-07 21:08:09'),('27d3da7fe1e53ae1dead080d38bce485561f5b82b4d1253532294f0008bf8ad5ad38aca7dcc9ff76',6,1,'MyApp','[]',0,'2020-09-14 13:33:29','2020-09-14 13:33:29','2021-09-14 13:33:29'),('286e12374be4f9b52236cd79565d6b235fd6eff631f22e12d0497f266c8c3ed1682cdd9730874f87',2,1,'MyApp','[]',0,'2020-09-07 19:40:03','2020-09-07 19:40:03','2021-09-07 19:40:03'),('2da861043754946a8dc93bacda408e19af0bfe7378ca609abc0b23f3e27a5e93f2e677fff9293eb7',6,1,'MyApp','[]',0,'2020-09-07 16:10:31','2020-09-07 16:10:31','2021-09-07 16:10:31'),('3029b6aadf084c32972c445158a902c8bd5331308b21fff060b8cb17eb29ef1682c8e7e63f88905d',6,1,'MyApp','[]',0,'2020-08-30 17:16:09','2020-08-30 17:16:09','2021-08-30 17:16:09'),('30abe930bcd9ea8c1fd36d0f40acfbf471c90da76abfc9aa54a13a3ee084eef936d62ec9863bb2b7',2,1,'MyApp','[]',0,'2020-09-02 19:26:05','2020-09-02 19:26:05','2021-09-02 19:26:05'),('355b228118f5c2a079e634b349e47c5747266fee734489aefe13e149502a10435cfac8c319b57bc4',2,1,'MyApp','[]',0,'2020-08-31 19:34:55','2020-08-31 19:34:55','2021-08-31 19:34:55'),('363e926993bb1ba1dfa8f427717314a6c5485ec6a2cb2e719fcc0a4b5b36920e34e40319ffb8b55c',6,1,'MyApp','[]',0,'2020-09-02 20:04:09','2020-09-02 20:04:09','2021-09-02 20:04:09'),('386447706167abf80778e4fd9bc5eb15a3c9bb92f699b00e51e7819f8815f1ac125283a81ca0c4db',6,1,'MyApp','[]',0,'2020-09-09 13:06:45','2020-09-09 13:06:45','2021-09-09 13:06:45'),('397a6be866daae089a51d396b4120a2d32007bd84793a54142b143a2544d1faedd814faa6a77300d',6,1,'MyApp','[]',0,'2020-09-04 14:27:19','2020-09-04 14:27:19','2021-09-04 14:27:19'),('397c6518cbe5212105bfde559b68b37d41aa9cbc8aabd13a5d29c5e51b67c8c6161cbf8a5f8338bc',6,1,'MyApp','[]',0,'2020-09-03 14:43:50','2020-09-03 14:43:50','2021-09-03 14:43:50'),('403b859c56f2f1df5baa45ec6df45efc5074b56e206f37f5376c7153303954778b1f8cdf55b86f7d',2,1,'MyApp','[]',0,'2020-09-13 17:08:00','2020-09-13 17:08:00','2021-09-13 17:08:00'),('414c209a13461b7ceaedf0e10bbb4f6588c9c7914f9ec200dac646a2494f2855d1d16326f5f3b47e',13,1,'MyApp','[]',0,'2020-09-04 22:25:59','2020-09-04 22:25:59','2021-09-04 22:25:59'),('41a5e9207fc3a459c5146c0a9b9f4872acfde7b12dc6352201e190f8f76d7cca504e6f37bea6d67d',23,1,'MyApp','[]',0,'2020-09-09 15:26:35','2020-09-09 15:26:35','2021-09-09 15:26:35'),('41f19f27844aa518bb843806e9dc5437a7f9a769647fe9a66043158210618dec8611bbb0541b32f9',2,1,'MyApp','[]',0,'2020-08-30 18:38:33','2020-08-30 18:38:33','2021-08-30 18:38:33'),('42b1c74ae0171080593a7be55017de5c755558e4708f4f56fa764c34c618ecc22fc46ab112933b2d',6,1,'MyApp','[]',0,'2020-08-29 20:50:41','2020-08-29 20:50:41','2021-08-29 20:50:41'),('447ff41999ddc868da5ac8c3c05b00786f84bcd679ecce821fd9903ed3f6c0d998598d21955c0dfe',23,1,'MyApp','[]',0,'2020-09-09 14:41:48','2020-09-09 14:41:48','2021-09-09 14:41:48'),('4551fd0df1fa32146d87f0cbdaa6adb39b4de014ef5badcb91264b9b10c28ddc8ef3cf1410d50ddc',2,1,'MyApp','[]',0,'2020-08-31 14:47:59','2020-08-31 14:47:59','2021-08-31 14:47:59'),('5618de9e062bb68ff2786ae8de84462d78a76a6bee3e3489db71b82bdadae359d494c8779a4d15cf',4,1,'MyApp','[]',0,'2020-09-07 21:07:55','2020-09-07 21:07:55','2021-09-07 21:07:55'),('58a7129728b96f9af337bd6bd8a95d1915190f467cd4c26ebc48fcb7a61da97b8e232254c055f3d4',11,1,'MyApp','[]',0,'2020-09-04 21:15:56','2020-09-04 21:15:56','2021-09-04 21:15:56'),('60f72f9f8d17ed5dda36bf080c390013480bfb80019772462fe0efb7a843de3f82b0887c883829f1',2,1,'MyApp','[]',0,'2020-09-14 15:09:04','2020-09-14 15:09:04','2021-09-14 15:09:04'),('651012d3a59db36074edc7b8a6931e8e105d4eb44dd91f12ea51be95c516f3446e3bc7c539923e5b',6,1,'MyApp','[]',0,'2020-09-02 15:43:02','2020-09-02 15:43:02','2021-09-02 15:43:02'),('6bfd8dadb8331eb9b758328068e4dba4dfba3c0d0d58a8e42b0b6f3a4471d93705a818c0a943076d',2,1,'MyApp','[]',0,'2020-09-07 15:03:51','2020-09-07 15:03:51','2021-09-07 15:03:51'),('6cffc40a3fda373e3f6d69420ff0d64f139b4c2506ead35b04771e334d5affded5a304bb769029e0',2,1,'MyApp','[]',0,'2020-09-01 21:47:00','2020-09-01 21:47:00','2021-09-01 21:47:00'),('6e1d337dba65e12370f8da8b4b974d147cee99793d394e848b8d539a1e421f0b6ff48293699a761d',6,1,'MyApp','[]',0,'2020-09-02 15:35:17','2020-09-02 15:35:17','2021-09-02 15:35:17'),('710bce6e15c4b36442c426c18c8dbcb993e7b6d1ee40022f8322979baaae5710381311ac705c24c2',11,1,'MyApp','[]',0,'2020-09-04 21:14:37','2020-09-04 21:14:37','2021-09-04 21:14:37'),('73eeb1f9ec53b617bac1082392eca6fb04bfc8069fc58163b891e4764870e95cb571838f7fd20e23',2,1,'MyApp','[]',0,'2020-09-13 16:53:11','2020-09-13 16:53:11','2021-09-13 16:53:11'),('74e2e9a99de8baaaa23bfe955468f2dd46f7fb32a926704343f393d37268a1657b6824ce3e52e305',3,1,'MyApp','[]',0,'2020-08-28 21:41:20','2020-08-28 21:41:20','2021-08-28 21:41:20'),('7967ec8e5ef20f043a24ca0bf033d071598eee3d888c5af56217157f1dfe92b0ae995a3ea18d31ef',2,1,'MyApp','[]',0,'2020-09-08 21:44:44','2020-09-08 21:44:44','2021-09-08 21:44:44'),('81cc6bbea455925e61ca95cec3f3ac82acaad670ac977021cfdea9c65efd46cdbfc9451fb3e42498',7,1,'MyApp','[]',0,'2020-08-30 16:04:25','2020-08-30 16:04:25','2021-08-30 16:04:25'),('83500a9f9ac38716f6cca5af3e41e84d0a2411ead73a7d2f3af8d6f69138097ba2c859a6880804ba',6,1,'MyApp','[]',0,'2020-09-03 20:36:32','2020-09-03 20:36:32','2021-09-03 20:36:32'),('84230da8850c27fdcf7c7a018c13cbb70b5abc38418c1a39d45618c465d5a8a4676e824bdcd29cd5',23,1,'MyApp','[]',0,'2020-09-09 16:16:35','2020-09-09 16:16:35','2021-09-09 16:16:35'),('8743cb621ab2ecb0609be881ed2e211aa3276c56e2511722d1795c94be8f31ffe9a7988e5386aa41',6,1,'MyApp','[]',0,'2020-08-31 19:51:15','2020-08-31 19:51:15','2021-08-31 19:51:15'),('8d8a301f5117e93eb7f3d22f5e95e44cdd9f3654840618bf6756e1fb24f7b3152371df6b62fa6958',2,1,'MyApp','[]',0,'2020-09-03 14:43:34','2020-09-03 14:43:34','2021-09-03 14:43:34'),('93e15caf31459fdcbbaad720fc764803ef68da2f2e06658fd086247328e770ca6719c11ebd765cb0',6,1,'MyApp','[]',0,'2020-09-02 01:47:52','2020-09-02 01:47:52','2021-09-02 01:47:52'),('95bde2acfe99faeb8c34890b1d54a1e489d0d34aa0e2c2429d304be55060f6d824b552331c9e9978',2,1,'MyApp','[]',0,'2020-08-28 21:41:42','2020-08-28 21:41:42','2021-08-28 21:41:42'),('96cc563ecbb3efd9248543af2780a0b33ee4477764e7c0a22e7dfc2d909b96ef7f1be091d43f4fc4',6,1,'MyApp','[]',0,'2020-09-01 21:47:47','2020-09-01 21:47:47','2021-09-01 21:47:47'),('97d1dbdb5a0f18359ba9632bf6a330483e9e3231f12c9979f93cd60180af9295198b171b016092d5',3,1,'MyApp','[]',0,'2020-09-04 21:17:23','2020-09-04 21:17:23','2021-09-04 21:17:23'),('986164324d7c64d9ba640fa1d3ba69a071e54c6fd2f73eff25d1bdef645be076307c1a1eb5616da3',2,1,'MyApp','[]',0,'2020-08-31 21:15:37','2020-08-31 21:15:37','2021-08-31 21:15:37'),('9efe9947f1a6909fc21c5560658236a9ca7381b0eda5b8bb76afdc9900000c5ec5904b349d46299a',12,1,'MyApp','[]',0,'2020-09-04 21:36:31','2020-09-04 21:36:31','2021-09-04 21:36:31'),('ae4f34da36eb039d720fe284cfaf9a54c5dd874d93375d32b4209033d53602713696bc7c704e784f',6,1,'MyApp','[]',0,'2020-09-08 13:52:02','2020-09-08 13:52:02','2021-09-08 13:52:02'),('af298383dc77b8ce2cf999ce1330785ee84af9375603bf588e23fedcb8d72f1ba8fa3e8c1ed0f2b9',2,1,'MyApp','[]',0,'2020-09-07 15:36:44','2020-09-07 15:36:44','2021-09-07 15:36:44'),('b6f0ff8bc09e8f924ddfff80b69a6703f1bd92d6bd76223c0b5516e39b32e320cb0db015dae0276d',2,1,'MyApp','[]',0,'2020-09-07 20:34:18','2020-09-07 20:34:18','2021-09-07 20:34:18'),('befc77285805f87b733f99d7a28f1030957e53e06cc6035661d606e3b9db0e7238ddbd1dda5037a5',2,1,'MyApp','[]',0,'2020-09-09 13:35:52','2020-09-09 13:35:52','2021-09-09 13:35:52'),('c1eb3c5acaf58a904ae85ae4307f825627dbc30a4f472bee5bab2112b89864324f49b40c6fa141fe',6,1,'MyApp','[]',0,'2020-09-13 19:42:46','2020-09-13 19:42:46','2021-09-13 19:42:46'),('c6c05dafdd74635fa88513453ce686966cc199d1faebfe2cff7c5df184ed87ba92793dbd52c09eda',2,1,'MyApp','[]',0,'2020-09-02 16:17:55','2020-09-02 16:17:55','2021-09-02 16:17:55'),('c780cae1c5985d48f900fea1be538804e1c72426d8257950e22900dc04ead5ce1d129de83fa5ac4b',6,1,'MyApp','[]',0,'2020-09-01 19:17:47','2020-09-01 19:17:47','2021-09-01 19:17:47'),('c984c8b960c7852faf7aa8fb7340113ff143f12863be89f3a3697c5abafc2d2c0cc1792a6565974a',8,1,'MyApp','[]',0,'2020-08-31 20:06:03','2020-08-31 20:06:03','2021-08-31 20:06:03'),('ceb4fa2afde17bc2628c9b81b3285ff9004d6e1d70493cbead9c945b6c1902e0bb29e1963208eca7',2,1,'MyApp','[]',0,'2020-09-13 18:47:32','2020-09-13 18:47:32','2021-09-13 18:47:32'),('cf38461668c2caddbf72ea7dffa005e7784c88bada6de26ac81ac3d0ab846086d605676177782cb6',2,1,'MyApp','[]',0,'2020-09-02 03:39:25','2020-09-02 03:39:25','2021-09-02 03:39:25'),('d034aa21220e7a4972f5642af2682dcf6ab2606c6cdba08d64490ccbbe686c09fa7cb2c62bf94188',2,1,'MyApp','[]',0,'2020-09-04 18:56:23','2020-09-04 18:56:23','2021-09-04 18:56:23'),('d8e445c0d56151675027d771c747091ccee7c85f4b8c236d1fef50debb823294be77a3e1842ebce5',6,1,'MyApp','[]',0,'2020-09-07 21:08:22','2020-09-07 21:08:22','2021-09-07 21:08:22'),('d8fa327e9dbbbb4b7cabf94091815ba8e9c3ab42c559d055cd9f6d9e88ddb6d2c7282e0a09cb4c9a',6,1,'MyApp','[]',0,'2020-08-30 18:39:40','2020-08-30 18:39:40','2021-08-30 18:39:40'),('da8b544c38e1b23d4dcea03169a48e8d5d1839ecc01ce756f8533f96e9b02b734553dc0db6998572',11,1,'MyApp','[]',0,'2020-09-07 15:06:31','2020-09-07 15:06:31','2021-09-07 15:06:31'),('dd49aaf5d5e3655b7421c0d2115fd87274e675b8090f266be72b1eb5972a28e1ec951c89db0f76e9',2,1,'MyApp','[]',0,'2020-09-07 22:31:05','2020-09-07 22:31:05','2021-09-07 22:31:05'),('dfed729e74cdfc118ddd375805635cc5b7279c91dffe4520c7d9654ce3a6d8884d7b0d21504b6eae',2,1,'MyApp','[]',0,'2020-09-03 16:08:26','2020-09-03 16:08:26','2021-09-03 16:08:26'),('e778038cf9f6b55cbc292d1f7a18ecc229c9d257643ca45e081e4d0fb72c8886d01efaef1f585680',11,1,'MyApp','[]',0,'2020-09-04 21:14:44','2020-09-04 21:14:44','2021-09-04 21:14:44'),('e9d13c4e01b9ad9f08695ed37ddb1426069febb867ca9f8e96156a5b2c8793c490bf972d2eb6355d',6,1,'MyApp','[]',0,'2020-09-14 15:12:12','2020-09-14 15:12:12','2021-09-14 15:12:12'),('ecbc8e4e297d93ebd8568beb9f0f4f35708946e7bc43b7166b5e63c2632380a5d7670c8438eb7c53',2,1,'MyApp','[]',0,'2020-09-01 19:30:03','2020-09-01 19:30:03','2021-09-01 19:30:03'),('f2b8baa36fee67a5c48ee85158cd82d2afb53c848700db678148709b09e21b34ca01b5465191badd',2,1,'MyApp','[]',0,'2020-09-03 22:21:02','2020-09-03 22:21:02','2021-09-03 22:21:02'),('f9aa914ab91560bc4a75f9740a2aac017f431e1d59a3ea98e39ab8cd23337c8670eff3d5861acac6',11,1,'MyApp','[]',0,'2020-09-04 21:10:48','2020-09-04 21:10:48','2021-09-04 21:10:48'),('fbd5cae8728a91c6ebdc521a2485376e842c19713872ed0b16512119bc2f7042ac06a98d687a5105',2,1,'MyApp','[]',0,'2020-09-04 21:14:09','2020-09-04 21:14:09','2021-09-04 21:14:09');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','x2xUZSyq8Yd3vb007cC1ePbnPW4vvu9dTLAsfgcq',NULL,'http://localhost',1,0,0,'2020-08-28 21:41:11','2020-08-28 21:41:11');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-08-28 21:41:11','2020-08-28 21:41:11');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'users.index','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(2,'users.show','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(3,'users.destroy','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(4,'users.update','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(5,'roles.index','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(6,'roles.show','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(7,'roles.destroy','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(8,'roles.update','web','2020-08-28 21:34:12','2020-08-28 21:34:12'),(9,'permission.index','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(10,'permission.show','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(11,'permission.destroy','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(12,'permission.update','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(13,'events.index','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(14,'events.store','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(15,'events.show','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(16,'events.destroy','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(17,'events.update','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(18,'activities.index','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(19,'activities.show','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(20,'activities.store','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(21,'activities.destroy','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(22,'activities.update','web','2020-08-28 21:34:13','2020-08-28 21:34:13'),(23,'businessMarket.index','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(24,'businessMarket.show','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(25,'businessMarket.store','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(26,'businessMarket.destroy','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(27,'businessMarket.update','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(28,'eventInvitations.index','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(29,'eventInvitations.show','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(30,'eventInvitations.store','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(31,'eventInvitations.destroy','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(32,'eventInvitations.update','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(33,'documents.index','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(34,'documents.show','web','2020-08-28 21:34:14','2020-08-28 21:34:14'),(35,'documents.store','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(36,'documents.destroy','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(37,'documents.update','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(38,'urlInvitations.index','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(39,'urlInvitations.show','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(40,'urlInvitations.store','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(41,'urlInvitations.destroy','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(42,'urlInvitations.update','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(43,'guests.index','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(44,'guests.show','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(45,'guests.store','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(46,'guests.destroy','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(47,'guests.update','web','2020-08-28 21:34:15','2020-08-28 21:34:15'),(48,'typesActivities.index','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(49,'typesActivities.show','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(50,'typesActivities.store','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(51,'typesActivities.destroy','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(52,'typesActivities.update','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(53,'activitySpeakers.index','web','2020-08-28 21:34:16','2020-08-28 21:34:16'),(54,'activitySpeakers.show','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(55,'activitySpeakers.store','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(56,'activitySpeakers.destroy','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(57,'activitySpeakers.update','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(58,'speakers.index','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(59,'speakers.show','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(60,'speakers.store','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(61,'speakers.destroy','web','2020-08-28 21:34:17','2020-08-28 21:34:17'),(62,'speakers.update','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(63,'modeActivities.index','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(64,'modeActivities.show','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(65,'modeActivities.store','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(66,'modeActivities.destroy','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(67,'modeActivities.update','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(68,'pollQuestions.index','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(69,'pollQuestions.show','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(70,'pollQuestions.store','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(71,'pollQuestions.destroy','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(72,'pollQuestions.update','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(73,'pollAnswers.index','web','2020-08-28 21:34:18','2020-08-28 21:34:18'),(74,'pollAnswers.show','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(75,'pollAnswers.store','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(76,'pollAnswers.destroy','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(77,'pollAnswers.update','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(78,'typeQuestions.index','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(79,'typeQuestions.show','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(80,'typeQuestions.store','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(81,'typeQuestions.destroy','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(82,'typeQuestions.update','web','2020-08-28 21:34:19','2020-08-28 21:34:19'),(83,'halls.index','web','2020-08-31 22:41:08','2020-08-31 22:41:08'),(84,'halls.show','web','2020-08-31 22:41:08','2020-08-31 22:41:08'),(85,'halls.store','web','2020-08-31 22:41:08','2020-08-31 22:41:08'),(86,'halls.update','web','2020-08-31 22:41:08','2020-08-31 22:41:08'),(87,'halls.destroy','web','2020-08-31 22:41:08','2020-08-31 22:41:08'),(88,'habeasData.index','web','2020-09-01 19:52:22','2020-09-01 19:52:22'),(89,'habeasData.show','web','2020-09-01 19:52:22','2020-09-01 19:52:22'),(90,'habeasData.store','web','2020-09-01 19:52:23','2020-09-01 19:52:23'),(91,'habeasData.update','web','2020-09-01 19:52:23','2020-09-01 19:52:23'),(92,'habeasData.destroy','web','2020-09-01 19:52:23','2020-09-01 19:52:23'),(93,'registerEvent.index','web','2020-09-03 19:33:07','2020-09-03 19:33:07'),(94,'registerEvent.show','web','2020-09-03 19:33:07','2020-09-03 19:33:07'),(95,'registerEvent.store','web','2020-09-03 19:33:07','2020-09-03 19:33:07'),(96,'registerEvent.update','web','2020-09-03 19:33:08','2020-09-03 19:33:08'),(97,'registerEvent.destroy','web','2020-09-03 19:33:08','2020-09-03 19:33:08'),(98,'tickets.index','web','2020-09-04 02:35:46','2020-09-04 02:35:46'),(99,'tickets.show','web','2020-09-04 02:35:47','2020-09-04 02:35:47'),(100,'tickets.store','web','2020-09-04 02:35:47','2020-09-04 02:35:47'),(101,'tickets.update','web','2020-09-04 02:35:47','2020-09-04 02:35:47'),(102,'tickets.destroy','web','2020-09-04 02:35:47','2020-09-04 02:35:47'),(103,'dataRegisters.index','web','2020-09-04 20:38:40','2020-09-04 20:38:40'),(104,'dataRegisters.show','web','2020-09-04 20:38:40','2020-09-04 20:38:40'),(105,'dataRegisters.store','web','2020-09-04 20:38:40','2020-09-04 20:38:40'),(106,'dataRegisters.update','web','2020-09-04 20:38:40','2020-09-04 20:38:40'),(107,'dataRegisters.destroy','web','2020-09-04 20:38:41','2020-09-04 20:38:41'),(108,'activityChat.index','web','2020-09-14 15:33:45','2020-09-14 15:33:45'),(109,'activityChat.show','web','2020-09-14 15:33:45','2020-09-14 15:33:45'),(110,'activityChat.store','web','2020-09-14 15:33:46','2020-09-14 15:33:46'),(111,'activityChat.update','web','2020-09-14 15:33:46','2020-09-14 15:33:46'),(112,'activityChat.destroy','web','2020-09-14 15:33:46','2020-09-14 15:33:46');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `poll_question_id` bigint(20) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_answers_event_id_foreign` (`event_id`),
  KEY `poll_answers_poll_question_id_foreign` (`poll_question_id`),
  KEY `poll_answers_user_id_foreign` (`user_id`),
  CONSTRAINT `poll_answers_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `poll_answers_poll_question_id_foreign` FOREIGN KEY (`poll_question_id`) REFERENCES `poll_questions` (`id`),
  CONSTRAINT `poll_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answers`
--

LOCK TABLES `poll_answers` WRITE;
/*!40000 ALTER TABLE `poll_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_questions`
--

DROP TABLE IF EXISTS `poll_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `type_question_id` bigint(20) unsigned NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `required_poll` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_questions_event_id_foreign` (`event_id`),
  KEY `poll_questions_type_question_id_foreign` (`type_question_id`),
  CONSTRAINT `poll_questions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `poll_questions_type_question_id_foreign` FOREIGN KEY (`type_question_id`) REFERENCES `type_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_questions`
--

LOCK TABLES `poll_questions` WRITE;
/*!40000 ALTER TABLE `poll_questions` DISABLE KEYS */;
INSERT INTO `poll_questions` VALUES (1,10,'Cual es tu edad?','[]',NULL,NULL,2,0,0,'2020-09-04 21:44:03','2020-09-04 21:44:03',1);
/*!40000 ALTER TABLE `poll_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `probe_answers`
--

DROP TABLE IF EXISTS `probe_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `probe_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) unsigned NOT NULL,
  `probe_id` bigint(20) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `probe_answers_activity_id_foreign` (`activity_id`),
  KEY `probe_answers_probe_id_foreign` (`probe_id`),
  KEY `probe_answers_user_id_foreign` (`user_id`),
  CONSTRAINT `probe_answers_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `probe_answers_probe_id_foreign` FOREIGN KEY (`probe_id`) REFERENCES `probes` (`id`),
  CONSTRAINT `probe_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probe_answers`
--

LOCK TABLES `probe_answers` WRITE;
/*!40000 ALTER TABLE `probe_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `probe_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `probes`
--

DROP TABLE IF EXISTS `probes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `probes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  `position` int(11) DEFAULT NULL,
  `type_question_id` bigint(20) unsigned NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `required_probe` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `probes_activity_id_foreign` (`activity_id`),
  KEY `probes_type_question_id_foreign` (`type_question_id`),
  CONSTRAINT `probes_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `probes_type_question_id_foreign` FOREIGN KEY (`type_question_id`) REFERENCES `type_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probes`
--

LOCK TABLES `probes` WRITE;
/*!40000 ALTER TABLE `probes` DISABLE KEYS */;
/*!40000 ALTER TABLE `probes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'App\\Company',
  `model_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pic` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_events`
--

DROP TABLE IF EXISTS `register_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` json DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `event_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `register_events_event_id_foreign` (`event_id`),
  CONSTRAINT `register_events_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_events`
--

LOCK TABLES `register_events` WRITE;
/*!40000 ALTER TABLE `register_events` DISABLE KEYS */;
INSERT INTO `register_events` VALUES (8,'Nombre','text','\"\"',1,8,'2020-09-04 01:51:30','2020-09-04 01:51:30'),(9,'Identificación','text','\"\\\"\\\"\"',1,8,'2020-09-04 01:51:45','2020-09-04 01:51:45'),(10,'edad','select','\"1,2,3\"',1,8,'2020-09-04 01:52:19','2020-09-04 01:52:19'),(11,'Hola','text','\"\"',1,8,'2020-09-04 01:52:59','2020-09-04 01:52:59'),(12,'Nombre','text','\"\"',1,9,'2020-09-04 14:37:27','2020-09-04 14:37:27'),(13,'Edad','select','\"1,2,3\"',1,9,'2020-09-04 14:37:42','2020-09-04 14:37:42'),(14,'Estado físico','select','\"Excelente,Bueno,Malo\"',1,4,'2020-09-04 15:44:28','2020-09-04 15:44:28'),(15,'Min. de actividad fisicica al día','number','\"\"',1,4,'2020-09-04 15:45:28','2020-09-04 15:45:28'),(16,'Edad','number','\"\\\"\\\"\"',1,4,'2020-09-04 15:45:42','2020-09-04 15:45:42'),(17,'Ocupación','text','\"\\\"\\\\\\\"\\\\\\\"\\\"\"',1,4,'2020-09-04 15:45:53','2020-09-04 15:45:53'),(18,'Edad','number','\"\"',1,10,'2020-09-04 21:21:22','2020-09-04 21:21:22'),(19,'Cargo','text','\"\\\"\\\"\"',1,10,'2020-09-04 21:21:31','2020-09-04 21:21:31'),(20,'Estado de animo','select','\"Alegre,Triste\"',1,10,'2020-09-04 21:34:20','2020-09-04 21:34:20'),(21,'Edad','number','\"\"',1,11,'2020-09-04 22:09:52','2020-09-04 22:09:52'),(22,'Estado de animo','select','\"Feliz,triste\"',1,11,'2020-09-04 22:10:14','2020-09-04 22:10:14');
/*!40000 ALTER TABLE `register_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),(98,2),(99,2),(100,2),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(13,3),(15,3),(18,3),(19,3),(23,3),(24,3),(28,3),(29,3),(33,3),(34,3),(42,3),(44,3),(45,3),(47,3),(48,3),(49,3),(53,3),(54,3),(58,3),(59,3),(63,3),(64,3),(68,3),(69,3),(73,3),(74,3),(75,3),(78,3),(79,3),(83,3),(84,3),(88,3),(89,3),(93,3),(94,3),(98,3),(99,3),(103,3),(104,3),(108,3),(109,3),(110,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super admin','web','2020-08-28 21:34:11','2020-08-28 21:34:11'),(2,'admin','web','2020-08-28 21:34:11','2020-08-28 21:34:11'),(3,'guest','web','2020-08-28 21:34:11','2020-08-28 21:34:11');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speakers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speakers`
--

LOCK TABLES `speakers` WRITE;
/*!40000 ALTER TABLE `speakers` DISABLE KEYS */;
INSERT INTO `speakers` VALUES (1,'Camilo Useche','asdasdasdasdasdasd','manzana_speaker_Camilo Useche_0.png','2020-08-28 21:59:35','2020-08-28 21:59:35'),(2,'Jose Saldaña','asdasdasdasdasdasd','manzana_speaker_Camilo Useche_0.png','2020-08-28 21:59:35','2020-08-28 21:59:35'),(3,'Paula Hoyos','HOla yoy paula','41UHHCF2omL_speaker_Paula Hoyos_2._AC_SY400_','2020-09-04 21:23:32','2020-09-04 21:23:32');
/*!40000 ALTER TABLE `speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activities` json NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_event_id_foreign` (`event_id`),
  CONSTRAINT `tickets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (2,'Golden','Ticket full access','[5, 6]',4,40000,'2020-09-04 03:54:08','2020-09-04 14:16:13'),(3,'VIP','Ticket vip','[12, 11]',10,50000,'2020-09-04 21:30:36','2020-09-04 21:30:36'),(4,'Silver ticket','Pase medio','[11]',10,25000,'2020-09-04 21:31:11','2020-09-04 21:31:11'),(5,'Vip','Ticket vip','[13]',11,20000,'2020-09-04 22:18:30','2020-09-04 22:18:30'),(6,'Relax','Ticket para acceder a la sala relax','[6]',4,20000,'2020-09-07 21:21:25','2020-09-07 21:21:25'),(7,'Intro yoga','Ticker para acceder yoga intro','[5]',4,15000,'2020-09-07 21:21:58','2020-09-07 21:21:58');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_activities`
--

DROP TABLE IF EXISTS `type_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_activities`
--

LOCK TABLES `type_activities` WRITE;
/*!40000 ALTER TABLE `type_activities` DISABLE KEYS */;
INSERT INTO `type_activities` VALUES (1,'Abierta',1,NULL,NULL),(2,'Privada',1,NULL,NULL);
/*!40000 ALTER TABLE `type_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_questions`
--

DROP TABLE IF EXISTS `type_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_questions`
--

LOCK TABLES `type_questions` WRITE;
/*!40000 ALTER TABLE `type_questions` DISABLE KEYS */;
INSERT INTO `type_questions` VALUES (1,'Texto',1,NULL,NULL),(2,'Número',1,NULL,NULL),(3,'Selección',1,NULL,NULL);
/*!40000 ALTER TABLE `type_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_invitations`
--

DROP TABLE IF EXISTS `url_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `invitation_id` bigint(20) unsigned NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_invitations_user_id_foreign` (`user_id`),
  KEY `url_invitations_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `url_invitations_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `event_invitations` (`id`),
  CONSTRAINT `url_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_invitations`
--

LOCK TABLES `url_invitations` WRITE;
/*!40000 ALTER TABLE `url_invitations` DISABLE KEYS */;
INSERT INTO `url_invitations` VALUES (1,'Url','4uTX4',6,1,1,'2020-08-28 22:00:21','2020-08-29 20:50:21'),(2,'Url','wqoqi',7,1,1,'2020-08-28 22:00:21','2020-08-30 16:03:59'),(3,'Url','GFZW8',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(4,'Url','e4PEP',8,2,1,'2020-08-31 19:48:51','2020-08-31 20:05:37'),(5,'Url','01Ezv',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(6,'Url','yUl8b',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(7,'Url','RpKy5',23,2,1,'2020-08-31 19:48:51','2020-09-09 14:41:13'),(8,'Url','ktAYz',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(9,'Url','VXQAU',13,2,1,'2020-08-31 19:48:51','2020-09-04 22:25:49'),(10,'Url','5qZ8U',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(11,'Url','i3EM5',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(12,'Url','toDRO',NULL,2,0,'2020-08-31 19:48:51','2020-08-31 19:48:51'),(13,'Url','Cppbn',NULL,3,0,'2020-09-04 21:28:42','2020-09-04 21:36:18'),(14,'Url','cJmbY',NULL,3,0,'2020-09-04 21:28:42','2020-09-04 21:28:42'),(15,'Url','MUthg',NULL,4,0,'2020-09-04 22:12:44','2020-09-04 22:12:44'),(16,'Url','GQ02D',NULL,4,0,'2020-09-04 22:12:44','2020-09-04 22:12:44');
/*!40000 ALTER TABLE `url_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_city_id_foreign` (`city_id`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Administrador','alejandro.cepeda@tars.dev',NULL,'$2y$10$eyR.LQTCBDsDcELNGqnVXuRDfhPEKlund7I966QmZvT.FcwiEUSJO',NULL,'2020-08-28 21:34:11','2020-08-28 21:34:11',1,'3134325874','Cepda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Admin','cristian@tars.dev',NULL,'$2y$10$VQS/UfeX3vmN81m9ZpfsZOXdF3l0tb0Vw/tK1sQs75A/xxPDJT5Mq','F6DmopUgjj3sm9rMjBXfvrjDkYCO698wHYJE0W96OmUIVO2h4F7y40niiAkm','2020-08-28 21:34:12','2020-08-28 21:34:12',1,'3134325874','Useche',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Invitado','cristian.narvaez@tars.dev',NULL,'$2y$10$n8wvepoewsVLXKDL3GCvoeDTqbpcO.1OiBOf91bJ9FvAExtAU89GS','qnIyWpstpbdw14g6nzbMfsAxrkz7kSww5HxvAkhua2rj400J3zjFji2k3Ozr','2020-08-28 21:34:12','2020-08-28 21:34:12',1,'3134325874','Narvaez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Cristian Camilo','camilo.narv13@gmail.com',NULL,'$2y$10$l0/TCSnEIgQKCprFWM0ToOg82PLmY8QVgBTe66ZeG9C3OxtNLWpQi','lZKXsOZCW0t85YvZHqbY17eaHBqfArF60WOT6ouACds2NBXO2xjx5ld30Q92','2020-08-29 20:28:31','2020-08-29 20:28:31',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Cristian Camilo','camilo.narv14@gmail.com',NULL,'$2y$10$84ykraf02YuDe6o.UtHIBedMnRqS22QBwZxsVl3c6u9ZEvRgJ6bdK','rjv7GGoFNmxSkgq3uMypUITDEJaeKm2Yw98GrNcNNstMubG3zmTzPeckwa83','2020-08-29 20:50:21','2020-08-29 20:50:21',NULL,'3134329248','Narvaez U','4888107',NULL,NULL,'Masculino',NULL,'Developer senior',NULL,NULL,NULL,NULL),(7,'Cristian Camilo','camilo.narv15@gmail.com',NULL,'$2y$10$yOJ/paXbAFiei6JeMBVi4eg5Tby67kCwMfRQp.1vV3b00kWc.0O4u','A1fg701E5T4Pk6KkKXSvHeDLQUGiNSMoXgzDWlosTtrYSTATjGmQRtZKdreS','2020-08-30 16:03:59','2020-08-30 16:03:59',NULL,'3134329248','Narvaez U','4888107',NULL,NULL,'Masculino',NULL,'Developer senior',NULL,NULL,NULL,NULL),(8,'Cristian Camilo','camilo@gmail.com',NULL,'$2y$10$GwWzWgeSpEa4bj7MEnftCORu6TBXYZt514gjzCbPHhc/fH24sRJfK','pR2vaXhBXjWXPnmRQaUNyABPRSuenmU4crlZA8GPw1ItOYGxcJTkPFqn12mA','2020-08-31 20:05:36','2020-08-31 20:05:36',NULL,'3134329248','Narvaez U','4888107',NULL,NULL,'Masculino',NULL,'Developer senior',NULL,NULL,NULL,NULL),(9,'Cristian Camilo','camilo.narv@gmail.com',NULL,'$2y$10$HgTpGy69ht5t/1Nts4OSJ.gReeohLRCC8CQwpHv7on9KrG0B6mqIy',NULL,'2020-09-04 21:00:47','2020-09-04 21:00:47',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Cristian Camilo','camilo.narv1@gmail.com',NULL,'$2y$10$kDkD5w.ZczYprIwOBzrmK.d8G1QlGX4cg9Q1AfHDFRY04KROXfNBe','rw0aeJX5MwKT0mcRaalqSNDmaD75LmfhQSRwaZTKda9FXpn3FhW0JqoTfCuG','2020-09-04 21:10:34','2020-09-04 21:10:34',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Cristian Camilo','camilo.narv3@gmail.com',NULL,'$2y$10$N1LdPiRvNjrvie5zRN8MS.74c5lKRbOV.tzbDIkHJ0MePaMRADncu','DdriBcEuKQq87sn4oaNH5LCH3dlgiXjlSvcSASs7qN4rXml6o5mCk50Kx3mR','2020-09-04 21:36:17','2020-09-04 21:36:17',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Cristian Camilo','camilo.narv4@gmail.com',NULL,'$2y$10$NwndoENpjpSsxJFEoF.TkOV3co6QkZ2cC/hdecY9xEHwqqlqp9dQm','meh5FAniv7EaAmTwiqD4KQc3NPh3IsFi5sIRjCYet2W87XGmV0NUJ45wfYao','2020-09-04 22:25:48','2020-09-04 22:25:48',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'Cristian Camilo','example@gmail.com',NULL,'$2y$10$0/wdCDqEK5cSRGxF4HIfs.8caxw7kbCJrApPIkOwHPn8T0gOFE6fy','UnUk0ywhY411a00O82MUOYnzfxN7G5YRNcA6Hv1kiloSwOEmGuBVeqlhm9zQ','2020-09-09 14:33:44','2020-09-09 14:33:44',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Juan Camilo','example2@gmail.com',NULL,'$2y$10$Xp04Fq/JnfCvimif.OV7iOmLRnO0ytboWdah1O5m/NxuNz45sDaWi','FtwZo4tqRxDSpmaI4RFcQcLlFw6T2niaw5mSJUBB6LKSxpa0E2OJIXZRbSdY','2020-09-09 14:41:11','2020-09-09 14:41:11',NULL,'3134329248','Narvaez U',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-14 19:35:18
