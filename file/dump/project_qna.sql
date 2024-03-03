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
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `replyNum` int NOT NULL AUTO_INCREMENT,
  `replyTitle` varchar(50) NOT NULL,
  `replyContent` varchar(1500) NOT NULL,
  `replyImg` varchar(600) DEFAULT NULL,
  `replyPwd` varchar(20) DEFAULT NULL,
  `replyRegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `replyComplete` int DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `replyCategory` varchar(50) DEFAULT NULL,
  `itemNum` int DEFAULT NULL,
  `inquiryNum` int DEFAULT NULL,
  PRIMARY KEY (`replyNum`),
  KEY `email` (`email`),
  KEY `idx_qna_inquiryNum` (`inquiryNum`),
  CONSTRAINT `qna_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'replyTitle51','replyContent51',NULL,'1234','2023-12-01 08:55:05',0,'user51@user.com','입금확인',NULL,NULL),(2,'replyTitle52','replyContent52',NULL,'1234','2023-12-01 08:55:05',0,'user52@user.com','입금확인',NULL,NULL),(3,'replyTitle53','replyContent53',NULL,'1234','2023-12-01 08:55:05',0,'user53@user.com','입금확인',NULL,NULL),(4,'replyTitle54','replyContent54',NULL,'1234','2023-12-01 08:55:05',0,'user54@user.com','입금확인',NULL,NULL),(5,'replyTitle55','replyContent55',NULL,'1234','2023-12-01 08:55:05',0,'user55@user.com','입금확인',NULL,NULL),(6,'replyTitle56','replyContent56',NULL,'1234','2023-12-01 08:55:05',0,'user56@user.com','입금확인',NULL,NULL),(7,'replyTitle57','replyContent57',NULL,'1234','2023-12-01 08:55:05',0,'user57@user.com','입금확인',NULL,NULL),(8,'replyTitle58','replyContent58',NULL,'1234','2023-12-01 08:55:05',0,'user58@user.com','입금확인',NULL,NULL),(9,'replyTitle59','replyContent59',NULL,'1234','2023-12-01 08:55:05',0,'user59@user.com','입금확인',NULL,NULL),(14,'문의합니다','문의합니다다다51',NULL,'1234','2023-12-02 11:27:36',0,'user51@user.com','배송',NULL,NULL),(15,'문의합니다','문의합니다다다52',NULL,'1234','2023-12-02 11:27:36',0,'user52@user.com','배송',NULL,NULL),(16,'문의합니다','문의합니다다다53',NULL,'1234','2023-12-02 11:27:36',0,'user53@user.com','배송',NULL,NULL),(17,'문의합니다','문의합니다다다54',NULL,'1234','2023-12-02 11:27:36',0,'user54@user.com','배송',NULL,NULL),(18,'문의합니다','문의합니다다다55',NULL,'1234','2023-12-02 11:27:36',0,'user55@user.com','배송',NULL,NULL),(19,'문의합니다','문의합니다다다56',NULL,'1234','2023-12-02 11:27:36',0,'user56@user.com','배송',NULL,NULL),(20,'문의합니다','문의합니다다다57',NULL,'1234','2023-12-02 11:27:36',0,'user57@user.com','배송',NULL,NULL),(21,'문의합니다','문의합니다다다58',NULL,'1234','2023-12-02 11:27:36',0,'user58@user.com','배송',NULL,NULL),(22,'문의합니다','문의합니다다다59',NULL,'1234','2023-12-02 11:27:36',0,'user59@user.com','배송',NULL,NULL),(23,'문의합니다','문의합니다다다60',NULL,'1234','2023-12-02 11:27:36',0,'user60@user.com','배송',NULL,NULL),(24,'문의합니다','문의합니다다다61',NULL,'1234','2023-12-02 11:27:36',0,'user61@user.com','배송',NULL,NULL),(25,'문의합니다','문의합니다다다62',NULL,'1234','2023-12-02 11:27:36',0,'user62@user.com','배송',NULL,NULL),(26,'문의합니다','문의합니다다다63',NULL,'1234','2023-12-02 11:27:36',0,'user63@user.com','배송',NULL,NULL),(27,'문의합니다','문의합니다다다64',NULL,'1234','2023-12-02 11:27:36',0,'user64@user.com','배송',NULL,NULL),(28,'문의합니다','문의합니다다다65',NULL,'1234','2023-12-02 11:27:36',0,'user65@user.com','배송',NULL,NULL),(29,'문의합니다','문의합니다다다66',NULL,'1234','2023-12-02 11:27:36',0,'user66@user.com','배송',NULL,NULL),(30,'문의합니다','문의합니다다다67',NULL,'1234','2023-12-02 11:27:36',0,'user67@user.com','배송',NULL,NULL),(31,'문의합니다','문의합니다다다68',NULL,'1234','2023-12-02 11:27:36',0,'user68@user.com','배송',NULL,NULL),(32,'문의합니다','문의합니다다다69',NULL,'1234','2023-12-02 11:27:36',0,'user69@user.com','배송',NULL,NULL),(33,'문의합니다','문의합니다다다70',NULL,'1234','2023-12-02 11:27:36',0,'user70@user.com','배송',NULL,NULL),(34,'문의합니다','문의합니다다다71',NULL,'1234','2023-12-02 11:27:36',0,'user71@user.com','배송',NULL,NULL),(35,'문의합니다','문의합니다다다72',NULL,'1234','2023-12-02 11:27:36',0,'user72@user.com','배송',NULL,NULL),(36,'문의합니다','문의합니다다다73',NULL,'1234','2023-12-02 11:27:36',0,'user73@user.com','배송',NULL,NULL),(37,'문의합니다','문의합니다다다74',NULL,'1234','2023-12-02 11:27:36',0,'user74@user.com','배송',NULL,NULL),(38,'문의합니다','문의합니다다다75',NULL,'1234','2023-12-02 11:27:36',0,'user75@user.com','배송',NULL,NULL),(39,'문의합니다','문의합니다다다76',NULL,'1234','2023-12-02 11:27:36',0,'user76@user.com','배송',NULL,NULL),(40,'문의합니다','문의합니다다다77',NULL,'1234','2023-12-02 11:27:36',0,'user77@user.com','배송',NULL,NULL),(41,'문의합니다','문의합니다다다78',NULL,'1234','2023-12-02 11:27:36',0,'user78@user.com','배송',NULL,NULL),(42,'문의합니다','문의합니다다다79',NULL,'1234','2023-12-02 11:27:36',0,'user79@user.com','배송',NULL,NULL),(43,'문의합니다','문의합니다다다80',NULL,'1234','2023-12-02 11:27:36',0,'user80@user.com','배송',NULL,NULL),(44,'문의합니다','문의합니다다다81',NULL,'1234','2023-12-02 11:27:36',0,'user81@user.com','배송',NULL,NULL),(45,'문의합니다','문의합니다다다82',NULL,'1234','2023-12-02 11:27:36',0,'user82@user.com','배송',NULL,NULL),(46,'문의합니다','문의합니다다다83',NULL,'1234','2023-12-02 11:27:36',0,'user83@user.com','배송',NULL,NULL),(47,'문의합니다','문의합니다다다84',NULL,'1234','2023-12-02 11:27:36',0,'user84@user.com','배송',NULL,NULL),(48,'문의합니다','문의합니다다다85',NULL,'1234','2023-12-02 11:27:36',0,'user85@user.com','배송',NULL,NULL),(49,'문의합니다','문의합니다다다86',NULL,'1234','2023-12-02 11:27:36',0,'user86@user.com','배송',NULL,NULL),(50,'문의합니다','문의합니다다다87',NULL,'1234','2023-12-02 11:27:36',0,'user87@user.com','배송',NULL,NULL),(51,'문의합니다','문의합니다다다88',NULL,'1234','2023-12-02 11:27:36',0,'user88@user.com','배송',NULL,NULL),(52,'문의합니다','문의합니다다다89',NULL,'1234','2023-12-02 11:27:36',0,'user89@user.com','배송',NULL,NULL),(53,'문의합니다','문의합니다다다90',NULL,'1234','2023-12-02 11:27:36',0,'user90@user.com','배송',NULL,NULL),(54,'문의합니다','문의합니다다다91',NULL,'1234','2023-12-02 11:27:36',0,'user91@user.com','배송',NULL,NULL),(55,'문의합니다','문의합니다다다92',NULL,'1234','2023-12-02 11:27:36',0,'user92@user.com','배송',NULL,NULL),(56,'문의합니다','문의합니다다다93',NULL,'1234','2023-12-02 11:27:36',0,'user93@user.com','배송',NULL,NULL),(57,'문의합니다','문의합니다다다94',NULL,'1234','2023-12-02 11:27:36',0,'user94@user.com','배송',NULL,NULL),(58,'문의합니다','문의합니다다다95',NULL,'1234','2023-12-02 11:27:36',0,'user95@user.com','배송',NULL,NULL),(59,'문의합니다','문의합니다다다96',NULL,'1234','2023-12-02 11:27:36',0,'user96@user.com','배송',NULL,NULL),(60,'문의합니다','문의합니다다다97',NULL,'1234','2023-12-02 11:27:36',0,'user97@user.com','배송',NULL,NULL),(61,'문의합니다','문의합니다다다98',NULL,'1234','2023-12-02 11:27:37',0,'user98@user.com','배송',NULL,NULL),(62,'문의합니다','문의합니다다다99',NULL,'1234','2023-12-02 11:27:37',0,'user99@user.com','배송',NULL,NULL),(63,'문의합니다','문의합니다다다100',NULL,'1234','2023-12-02 11:27:37',0,'user100@user.com','배송',NULL,NULL),(176,'문의합니다','문의합니다다다다다','/img/20231207-093412-488-1.jpg','1234','2023-12-07 00:34:12',1,'user1@admin.com','배송',NULL,176),(177,'','재문의합니다다다다다다다다다다',NULL,NULL,'2023-12-07 00:35:22',1,'user1@admin.com',NULL,NULL,176),(183,'','다시 한 번 믿어봐',NULL,NULL,'2023-12-12 01:54:05',1,'user1@admin.com',NULL,NULL,176),(191,'문의합니다','나문희',NULL,'1234','2023-12-12 03:06:12',1,'user1@admin.com','기타',NULL,191),(193,'','재문희희희',NULL,NULL,'2023-12-13 10:55:30',0,'user1@admin.com',NULL,NULL,191),(194,'글쓰기','글쓰기입니다.','/img/20231230-163652-156-1.jpg','1234','2023-12-30 07:36:52',1,'iy398884@gmail.com','기타',0,194);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
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
