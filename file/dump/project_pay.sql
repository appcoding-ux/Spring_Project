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
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay` (
  `payNum` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `payTotal` int NOT NULL,
  `payMethod` varchar(50) NOT NULL,
  `payComplete` int DEFAULT '0',
  `payDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payNum`),
  KEY `orderId` (`orderId`),
  KEY `email` (`email`),
  CONSTRAINT `FK_orders_TO_pay_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `pay_ibfk_2` FOREIGN KEY (`email`) REFERENCES `orders` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES (1,4,'email15@gmail.com',50000,'creadit card',1,'2023-11-29 07:47:19'),(2,160,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 01:08:32'),(3,161,'email10@gmail.com',125100,'creadit card',0,'2023-12-11 01:23:31'),(4,163,'email10@gmail.com',263300,'creadit card',0,'2023-12-11 01:35:00'),(5,164,'email10@gmail.com',144900,'creadit card',0,'2023-12-11 02:49:10'),(6,165,'email10@gmail.com',97600,'creadit card',0,'2023-12-11 03:31:29'),(7,166,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 03:55:18'),(8,167,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 04:01:43'),(9,168,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 04:15:25'),(10,170,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 04:45:28'),(11,171,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 05:00:44'),(12,172,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 05:19:17'),(13,173,'email10@gmail.com',50300,'creadit card',0,'2023-12-11 05:39:23'),(14,174,'email10@gmail.com',311200,'creadit card',0,'2023-12-11 05:49:04'),(15,175,'email10@gmail.com',266300,'creadit card',0,'2023-12-11 05:50:51'),(16,176,'email10@gmail.com',285300,'creadit card',0,'2023-12-11 05:53:12'),(17,177,'email10@gmail.com',285300,'creadit card',0,'2023-12-11 05:54:04'),(18,179,'user1@admin.com',32800,'creadit card',0,'2023-12-12 08:06:20'),(19,180,'user1@admin.com',32800,'creadit card',0,'2023-12-12 08:16:24'),(20,181,'user1@admin.com',32800,'creadit card',0,'2023-12-12 08:28:56'),(21,182,'user1@admin.com',32800,'creadit card',0,'2023-12-12 08:31:45');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
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
