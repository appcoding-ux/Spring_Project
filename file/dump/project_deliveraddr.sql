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
-- Table structure for table `deliveraddr`
--

DROP TABLE IF EXISTS `deliveraddr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveraddr` (
  `AddrNum` int NOT NULL AUTO_INCREMENT,
  `AddrName` varchar(50) DEFAULT '기본배송지',
  `postcode` int NOT NULL,
  `roadAddress` varchar(200) DEFAULT NULL,
  `detailAddr` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `defaultWhether` int DEFAULT '0',
  PRIMARY KEY (`AddrNum`),
  KEY `FK_customer_TO_deliverAddr_1` (`email`),
  CONSTRAINT `FK_customer_TO_deliverAddr_1` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveraddr`
--

LOCK TABLES `deliveraddr` WRITE;
/*!40000 ALTER TABLE `deliveraddr` DISABLE KEYS */;
INSERT INTO `deliveraddr` VALUES (1,'기본배송지',16537,'경기도 수원시 영통구 인계로 239','101동 101호','email14@gmail.com',1),(2,'기본배송지',16537,'경기도 수원시 영통구 인계로 239','101동 105호','email15@gmail.com',1),(3,'우리집',19999,'경기도 수원시 인계동','에스팝타워 101동 111호','email15@gmail.com',0),(4,'우리집',19999,'경기도 수원시 인계동','에스팝타워 101동 111호','email15@gmail.com',0),(5,'기본배송지',17552,'경기 안성시 공도읍 서동대로 4079','107-1406','oppayoj@naver.com',1),(6,'기본배송지',17552,'경기 안성시 공도읍 서동대로 4079','111-604','bbackhyeon@gmail.com',1),(8,'기본배송지',17777,'경기도 성남시 성남동 성남아파트','102동 808호','email10@gmail.com',1),(9,'남의 집',15555,'강원도 속초시 감자동 감자아파트','102동 808호','email10@gmail.com',0),(10,'기본배송지',17552,'경기 안성시 공도읍 서동대로 4079','107동 1406호','user1@admin.com',1),(13,'기본배송지',16685,'경기 수원시 영통구 덕영대로 1462-14','105동','aj8072@naver.com',1),(16,'기본배송지',17552,'경기 안성시 공도읍 서동대로 4079','107-1406','iy398884@gmail.com',1);
/*!40000 ALTER TABLE `deliveraddr` ENABLE KEYS */;
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
