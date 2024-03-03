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
-- Table structure for table `detailcart`
--

DROP TABLE IF EXISTS `detailcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailcart` (
  `detCartNum` int NOT NULL AUTO_INCREMENT,
  `itemNum` int NOT NULL,
  `cartItemCnt` int DEFAULT '1',
  `cartNum` int NOT NULL,
  `size` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`detCartNum`),
  KEY `cartNum` (`cartNum`),
  KEY `FK_item_TO_detailCart_1` (`itemNum`),
  CONSTRAINT `FK_cart_TO_detailCart_1` FOREIGN KEY (`cartNum`) REFERENCES `cart` (`cartNum`),
  CONSTRAINT `FK_item_TO_detailCart_1` FOREIGN KEY (`itemNum`) REFERENCES `item` (`itemNum`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailcart`
--

LOCK TABLES `detailcart` WRITE;
/*!40000 ALTER TABLE `detailcart` DISABLE KEYS */;
INSERT INTO `detailcart` VALUES (42,111,5,1,'L'),(46,1,18,1,'S'),(47,1311,3,5,'L'),(48,13,2,5,'M'),(52,110,2,5,'S'),(53,14,17,5,'S');
/*!40000 ALTER TABLE `detailcart` ENABLE KEYS */;
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
