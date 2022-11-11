-- MariaDB dump 10.19  Distrib 10.6.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: quarkus
-- ------------------------------------------------------
-- Server version	10.6.10-MariaDB-1:10.6.10+maria~ubu2004

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
INSERT INTO `flyway_schema_history` VALUES (1,'1.0.0','Create Location Entity','SQL','db/migration/V1_0_0__Create_Location_Entity.sql',-156773351,'quarkus','2022-11-09 19:09:29',4,1),(2,'1.1.0','Add Stored Procedure For Geo Lookup','SQL','db/migration/V1_1_0__Add_Stored_Procedure_For_Geo_Lookup.sql',93910736,'quarkus','2022-11-09 19:09:30',4,1),(3,'2.0.0','Create User Entity','SQL','db/migration/V2_0_0__Create_User_Entity.sql',-1434982504,'quarkus','2022-11-09 19:09:30',5,1),(4,'3.0.0','Create School Entity','SQL','db/migration/V3_0_0__Create_School_Entity.sql',-586981460,'quarkus','2022-11-09 19:09:30',3,1),(5,'4.0.0','Create Guest Teacher Entity','SQL','db/migration/V4_0_0__Create_Guest_Teacher_Entity.sql',-2011308316,'quarkus','2022-11-09 19:09:30',6,1),(6,'5.0.0','Create User Setting Entity','SQL','db/migration/V5_0_0__Create_User_Setting_Entity.sql',-337692797,'quarkus','2022-11-09 19:09:30',3,1),(7,'6.0.0','Create Contact Person Entity','SQL','db/migration/V6_0_0__Create_Contact_Person_Entity.sql',1951715069,'quarkus','2022-11-09 19:09:30',3,1),(8,'6.1.0','Alter School Entity','SQL','db/migration/V6_1_0__Alter_School_Entity.sql',-1185103896,'quarkus','2022-11-09 19:09:30',6,1),(9,'7.0.0','Alter Location Entity','SQL','db/migration/V7_0_0__Alter_Location_Entity.sql',831070032,'quarkus','2022-11-09 19:09:30',7,1);
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
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `uc_user_email_address` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('\è|\ÚHš˜A§‰»ž\æ$A\ÈL','AUTH0','auth0|62fd3224f76949850e9eb264','info@littil.org',NULL,NULL,NULL,NULL);
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

--
-- Dumping routines for database 'quarkus'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `GCDist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`quarkus`@`%` FUNCTION `GCDist`(_lat1 DOUBLE, -- Scaled Degrees north for one point
    _lon1 DOUBLE, -- Scaled Degrees west for one point
    _lat2 DOUBLE, -- other point
    _lon2 DOUBLE
) RETURNS double
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    -- Hardcoded constant:
    DECLARE _deg2rad DOUBLE DEFAULT PI() / 1800000; -- For scaled by 1e4 to MEDIUMINT
    DECLARE _rlat1 DOUBLE DEFAULT _deg2rad * _lat1;
    DECLARE _rlat2 DOUBLE DEFAULT _deg2rad * _lat2;
    -- compute as if earth's radius = 1.0
    DECLARE _rlond DOUBLE DEFAULT _deg2rad * (_lon1 - _lon2);
    DECLARE _m DOUBLE DEFAULT COS(_rlat2);
    DECLARE _x DOUBLE DEFAULT COS(_rlat1) - _m * COS(_rlond);
    DECLARE _y DOUBLE DEFAULT _m * SIN(_rlond);
    DECLARE _z DOUBLE DEFAULT SIN(_rlat1) - SIN(_rlat2);
    DECLARE _n DOUBLE DEFAULT SQRT(
                    _x * _x +
                    _y * _y +
                    _z * _z);
    RETURN 2 * ASIN(_n / 2) / _deg2rad; -- again--scaled degrees
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindNearest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`quarkus`@`%` PROCEDURE `FindNearest`(
    IN _my_lat DOUBLE, -- Latitude of me [-90..90] (not scaled)
    IN _my_lon DOUBLE, -- Longitude [-180..180]
    IN _START_dist DOUBLE, -- Starting estimate of how far to search: miles or km
    IN _max_dist DOUBLE, -- Limit how far to search: miles or km
    IN _limit INT, -- How many items to try to get
    IN _condition VARCHAR(1111) -- will be ANDed in a WHERE clause
)
    DETERMINISTIC
BEGIN
    -- lat and lng are in degrees -90..+90 and -180..+180
    -- All computations done in Latitude degrees.
    -- Thing to tailor
    --   *location* -- the table
    --   Scaling of lat, lon; here using *10000 in MEDIUMINT
    --   Table name
    --   miles versus km.

    -- Hardcoded constant:
    DECLARE _deg2rad DOUBLE DEFAULT PI() / 1800000;
    -- For scaled by 1e4 to MEDIUMINT

    -- Cannot use params in PREPARE, so switch to @variables:
    -- Hardcoded constant:
    SET @my_lat := _my_lat * 10000,
        @my_lon := _my_lon * 10000,
        @deg2dist := 0.0111325, -- 69.172 for miles; 111.325 for km  *** (mi vs km)
        @start_deg := _start_dist / @deg2dist, -- Start with this radius first (eg, 15 miles)
        @max_deg := _max_dist / @deg2dist,
        @cutoff := @max_deg / SQRT(2), -- (slightly pessimistic)
        @dlat := @start_deg, -- note: must stay positive
        @lon2lat := COS(_deg2rad * @my_lat),
        @iterations := 0;
    -- just debugging

    -- Loop through, expanding search
    --   Search a 'square', repeat with bigger square until find enough rows
    --   If the inital probe found _limit rows, then probably the first
    --   iteration here will find the desired data.
    -- Hardcoded table name:
    -- This is the "first SELECT":
    SET @sql = CONCAT(
            "SELECT COUNT(*) INTO @near_ct
                FROM location
                WHERE latitude    BETWEEN @my_lat - @dlat
                                 AND @my_lat + @dlat   -- PARTITION Pruning and bounding box
                  AND longitude    BETWEEN @my_lon - @dlon
                                 AND @my_lon + @dlon   -- first part of PK
                  AND ", _condition);
    PREPARE _sql FROM @sql;
    MainLoop:
    LOOP
        SET @iterations := @iterations + 1;
        -- The main probe: Search a 'square'
        SET @dlon := ABS(@dlat / @lon2lat);
        -- good enough for now  -- note: must stay positive
        -- Hardcoded constants:
        SET @dlon := IF(ABS(@my_lat) + @dlat >= 900000, 3600001, @dlon); -- near a Pole
        EXECUTE _sql;
        IF (@near_ct >= _limit OR -- Found enough
            @dlat >= @cutoff) THEN -- Give up (too far)
            LEAVE MainLoop;
        END IF;
        -- Expand 'square':
        SET @dlat := LEAST(2 * @dlat, @cutoff); -- Double the radius to search
    END LOOP MainLoop;
    DEALLOCATE PREPARE _sql;

    -- Out of loop because found _limit items, or going too far.
    -- Expand range by about 1.4 (but not past _max_dist),
    -- then fetch details on nearest 10.

    -- Hardcoded constant:
    SET @dlat := IF(@dlat >= @max_deg OR @dlon >= 1800000,
                    @max_deg,
                    GCDist(ABS(@my_lat), @my_lon,
                           ABS(@my_lat) - @dlat, @my_lon - @dlon));
    -- ABS: go toward equator to find farthest corner (also avoids poles)
    -- Dateline: not a problem (see GCDist code)

    -- Reach for longitude line at right angle:
    -- sin(dlon)*cos(lat) = sin(dlat)
    -- Hardcoded constant:
    SET @dlon := IFNULL(ASIN(SIN(_deg2rad * @dlat) /
                             COS(_deg2rad * @my_lat))
                            / _deg2rad -- precise
        , 3600001);
    -- must be too near a pole

    -- This is the "last SELECT":
    -- Hardcoded constants:
    IF (ABS(@my_lon) + @dlon < 1800000 OR -- Usual case - not crossing dateline
        ABS(@my_lat) + @dlat < 900000) THEN -- crossing pole, so dateline not an issue
    -- Hardcoded table name:
        SET @sql = CONCAT(
                "SELECT *,
                        @deg2dist * GCDist(@my_lat, @my_lon, latitude, longitude) AS dist
                    FROM location
                    WHERE latitude BETWEEN @my_lat - @dlat
                                  AND @my_lat + @dlat   -- PARTITION Pruning and bounding box
                      AND longitude BETWEEN @my_lon - @dlon
                                  AND @my_lon + @dlon   -- first part of PK
                      AND ", _condition, "
                HAVING dist <= ", _max_dist, "
                ORDER BY dist
                LIMIT ", _limit
            );
    ELSE
        -- Hardcoded constants and table name:
        -- Circle crosses dateline, do two SELECTs, one for each side
        SET @west_lon := IF(@my_lon < 0, @my_lon, @my_lon - 3600000);
        SET @east_lon := @west_lon + 3600000;
        -- One of those will be beyond +/- 180; this gets points beyond the dateline
        SET @sql = CONCAT(
                "( SELECT *,
                        @deg2dist * GCDist(@my_lat, @west_lon, latitude, longitude) AS dist
                    FROM location
                    WHERE latitude BETWEEN @my_lat - @dlat
                                  AND @my_lat + @dlat   -- PARTITION Pruning and bounding box
                      AND longitude BETWEEN @west_lon - @dlon
                                  AND @west_lon + @dlon   -- first part of PK
                      AND ", _condition, "
                HAVING dist <= ", _max_dist, " )
            UNION ALL
            ( SELECT *,
                    @deg2dist * GCDist(@my_lat, @east_lon, latitude, longitude) AS dist
                FROM location
                WHERE latitude BETWEEN @my_lat - @dlat
                              AND @my_lat + @dlat   -- PARTITION Pruning and bounding box
                  AND longitude BETWEEN @east_lon - @dlon
                              AND @east_lon + @dlon   -- first part of PK
                  AND ", _condition, "
                HAVING dist <= ", _max_dist, " )
            ORDER BY dist
            LIMIT ", _limit
            );
    END IF;

    PREPARE _sql FROM @sql;
    EXECUTE _sql;
    DEALLOCATE PREPARE _sql;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 19:15:59
