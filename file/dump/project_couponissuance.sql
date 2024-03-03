-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `couponissuance`
--

DROP TABLE IF EXISTS `couponissuance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couponissuance` (
  `issueNum` int NOT NULL AUTO_INCREMENT,
  `issueDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `issueED` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `couponNum` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `orderId` int DEFAULT NULL,
  PRIMARY KEY (`issueNum`),
  KEY `cuponNum` (`couponNum`),
  KEY `email` (`email`),
  CONSTRAINT `couponissuance_ibfk_2` FOREIGN KEY (`email`) REFERENCES `customer` (`email`),
  CONSTRAINT `FK_coupon_TO_CouponIssuance_1` FOREIGN KEY (`couponNum`) REFERENCES `coupon` (`couponNum`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couponissuance`
--

LOCK TABLES `couponissuance` WRITE;
/*!40000 ALTER TABLE `couponissuance` DISABLE KEYS */;
INSERT INTO `couponissuance` VALUES (1,'2023-11-29 03:42:53','2023-12-29 15:00:00',1,'email15@gmail.com',3),(2,'2023-11-29 08:28:16','2023-12-29 15:00:00',2,'email15@gmail.com',NULL),(3,'2023-11-29 08:28:20','2023-12-29 15:00:00',3,'email15@gmail.com',4),(7,'2023-12-06 03:46:36','2024-01-04 15:00:00',1,'bbackhyeon@gmail.com',NULL),(8,'2023-12-06 03:46:36','2024-01-04 15:00:00',2,'bbackhyeon@gmail.com',NULL),(9,'2023-12-06 03:46:36','2024-01-04 15:00:00',3,'bbackhyeon@gmail.com',NULL),(13,'2023-12-06 05:31:58','2024-01-04 15:00:00',1,'email10@gmail.com',167),(14,'2023-12-06 05:32:04','2024-01-04 15:00:00',2,'email10@gmail.com',168),(15,'2023-12-06 05:32:08','2024-01-04 15:00:00',3,'email10@gmail.com',169),(16,'2023-12-06 05:39:02','2023-08-09 15:00:00',3,'email10@gmail.com',NULL),(17,'2023-12-06 05:39:21','2023-12-05 15:00:00',2,'email10@gmail.com',NULL),(18,'2023-12-06 05:45:03','2023-12-04 15:00:00',1,'email10@gmail.com',NULL),(22,'2023-12-11 04:44:40','2023-12-29 15:00:00',1,'email10@gmail.com',171),(23,'2023-12-11 04:44:45','2023-12-29 15:00:00',2,'email10@gmail.com',172),(24,'2023-12-11 04:44:48','2023-12-29 15:00:00',3,'email10@gmail.com',170),(28,'2023-12-12 06:21:44','2024-01-10 15:00:00',1,'aj8072@naver.com',NULL),(29,'2023-12-12 06:21:44','2024-01-10 15:00:00',2,'aj8072@naver.com',NULL),(30,'2023-12-12 06:21:44','2024-01-10 15:00:00',3,'aj8072@naver.com',NULL),(44,'2023-12-13 11:22:48','2024-01-11 15:00:00',1,'user1@admin.com',NULL),(45,'2023-12-13 11:22:48','2024-01-11 15:00:00',2,'user1@admin.com',NULL),(46,'2023-12-13 11:22:48','2024-01-11 15:00:00',3,'user1@admin.com',NULL),(53,'2023-12-30 07:23:10','2024-01-28 15:00:00',1,'iy398884@gmail.com',NULL),(54,'2023-12-30 07:23:10','2024-01-28 15:00:00',2,'iy398884@gmail.com',NULL),(55,'2023-12-30 07:23:10','2024-01-28 15:00:00',3,'iy398884@gmail.com',NULL);
/*!40000 ALTER TABLE `couponissuance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 12:41:09
