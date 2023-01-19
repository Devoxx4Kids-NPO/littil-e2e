-- MariaDB dump 10.19  Distrib 10.6.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: quarkus
-- ------------------------------------------------------
-- Server version	10.6.10-MariaDB-1:10.6.10+maria~ubu2004

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
-- Table structure for table `contact_person`
--

DROP TABLE IF EXISTS `contact_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_person` (
  `contact_person_id` binary(16) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `surname` varchar(255) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` binary(16) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_person`
--

LOCK TABLES `contact_person` WRITE;
/*!40000 ALTER TABLE `contact_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1.0.0','Create Location Entity','SQL','db/migration/V1_0_0__Create_Location_Entity.sql',-156773351,'littil','2022-12-29 21:47:57',19,1),(2,'1.1.0','Add Stored Procedure For Geo Lookup','SQL','db/migration/V1_1_0__Add_Stored_Procedure_For_Geo_Lookup.sql',93910736,'littil','2022-12-29 21:47:57',14,1),(3,'2.0.0','Create User Entity','SQL','db/migration/V2_0_0__Create_User_Entity.sql',850565846,'littil','2022-12-29 21:47:57',40,1),(4,'3.0.0','Create School Entity','SQL','db/migration/V3_0_0__Create_School_Entity.sql',-586981460,'littil','2022-12-29 21:47:57',43,1),(5,'4.0.0','Create Guest Teacher Entity','SQL','db/migration/V4_0_0__Create_Guest_Teacher_Entity.sql',-2011308316,'littil','2022-12-29 21:47:57',42,1),(6,'5.0.0','Create User Setting Entity','SQL','db/migration/V5_0_0__Create_User_Setting_Entity.sql',545125408,'littil','2022-12-29 21:47:57',17,1),(7,'6.0.0','Create Contact Person Entity','SQL','db/migration/V6_0_0__Create_Contact_Person_Entity.sql',1951715069,'littil','2022-12-29 21:47:57',16,1),(8,'6.1.0','Alter School Entity','SQL','db/migration/V6_1_0__Alter_School_Entity.sql',-1185103896,'littil','2022-12-29 21:47:57',40,1),(9,'7.0.0','Alter Location Entity','SQL','db/migration/V7_0_0__Alter_Location_Entity.sql',831070032,'littil','2022-12-29 21:47:57',37,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_teacher`
--

DROP TABLE IF EXISTS `guest_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_teacher` (
  `guest_teacher_id` binary(16) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `location` binary(16) NOT NULL,
  `user` binary(16) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` binary(16) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`guest_teacher_id`),
  KEY `fk_guest_teacher_location` (`location`),
  KEY `fk_guest_teacher_user` (`user`),
  CONSTRAINT `fk_guest_teacher_location` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_guest_teacher_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_teacher`
--

LOCK TABLES `guest_teacher` WRITE;
/*!40000 ALTER TABLE `guest_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_teacher_availability`
--

DROP TABLE IF EXISTS `guest_teacher_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_teacher_availability` (
  `guest_teacher` binary(16) NOT NULL,
  `availability` varchar(255) DEFAULT NULL,
  KEY `guest_teacher` (`guest_teacher`),
  CONSTRAINT `guest_teacher_availability_ibfk_1` FOREIGN KEY (`guest_teacher`) REFERENCES `guest_teacher` (`guest_teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_teacher_availability`
--

LOCK TABLES `guest_teacher_availability` WRITE;
/*!40000 ALTER TABLE `guest_teacher_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_teacher_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` binary(16) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `latitude` mediumint(9) DEFAULT NULL,
  `longitude` mediumint(9) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` binary(16) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `school_id` binary(16) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `location` binary(16) NOT NULL,
  `user` binary(16) NOT NULL,
  `contact_person` binary(16) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` binary(16) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  KEY `fk_school_location` (`location`),
  KEY `fk_school_user` (`user`),
  KEY `fk_school_contact_person` (`contact_person`),
  CONSTRAINT `fk_school_contact_person` FOREIGN KEY (`contact_person`) REFERENCES `contact_person` (`contact_person_id`),
  CONSTRAINT `fk_school_location` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_school_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` binary(16) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` binary(16) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_d0ar1h7wcp7ldy6qg5859sol6` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_setting` (
  `user_id` binary(16) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_setting`
--

LOCK TABLES `user_setting` WRITE;
/*!40000 ALTER TABLE `user_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29 22:06:11
