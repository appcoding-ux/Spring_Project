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
-- Table structure for table `itemreply`
--

DROP TABLE IF EXISTS `itemreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemreply` (
  `replyNum` int NOT NULL AUTO_INCREMENT,
  `replyTitle` varchar(50) NOT NULL,
  `replyContent` varchar(300) NOT NULL,
  `starScore` int DEFAULT '5',
  `itemRepRegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `img1` varchar(600) DEFAULT NULL,
  `itemNum` int NOT NULL,
  PRIMARY KEY (`replyNum`),
  KEY `itemNum` (`itemNum`),
  CONSTRAINT `itemreply_ibfk_1` FOREIGN KEY (`itemNum`) REFERENCES `item` (`itemNum`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemreply`
--

LOCK TABLES `itemreply` WRITE;
/*!40000 ALTER TABLE `itemreply` DISABLE KEYS */;
INSERT INTO `itemreply` VALUES (1,'사람 옷이 아니라 말티즈 옷인데요?','안희 이걸 어떻게 입으라고 배송을 보낸거죠?',1,NULL,NULL,2291),(6,'이걸 이 돈주고 판다고?','당장 100000벌 사세요',5,'2023-11-28 08:54:26',NULL,2291),(7,'reply_TEST_title1','내공냠냠1',2,'2023-12-04 05:57:54',NULL,2291),(8,'reply_TEST_title2','내공냠냠2',2,'2023-12-04 05:57:54',NULL,2291),(9,'reply_TEST_title3','내공냠냠3',2,'2023-12-04 05:57:54',NULL,2291),(10,'reply_TEST_title4','내공냠냠4',2,'2023-12-04 05:57:54',NULL,2291),(11,'reply_TEST_title5','내공냠냠5',2,'2023-12-04 05:57:54',NULL,2291),(12,'reply_TEST_title6','내공냠냠6',2,'2023-12-04 05:57:54',NULL,2291),(13,'reply_TEST_title7','내공냠냠7',2,'2023-12-04 05:57:54',NULL,2291),(14,'reply_TEST_title8','내공냠냠8',2,'2023-12-04 05:57:54',NULL,2291),(15,'reply_TEST_title9','내공냠냠9',2,'2023-12-04 05:57:54',NULL,2291),(16,'reply_TEST_title10','내공냠냠10',2,'2023-12-04 05:57:54',NULL,2291),(17,'reply_TEST_title11','내공냠냠11',2,'2023-12-04 05:57:55',NULL,2291),(18,'reply_TEST_title12','내공냠냠12',2,'2023-12-04 05:57:55',NULL,2291),(19,'reply_TEST_title13','내공냠냠13',2,'2023-12-04 05:57:55',NULL,2291),(20,'reply_TEST_title14','내공냠냠14',2,'2023-12-04 05:57:55',NULL,2291),(21,'reply_TEST_title15','내공냠냠15',2,'2023-12-04 05:57:55',NULL,2291),(22,'reply_TEST_title16','내공냠냠16',2,'2023-12-04 05:57:55',NULL,2291),(23,'reply_TEST_title17','내공냠냠17',2,'2023-12-04 05:57:55',NULL,2291),(24,'reply_TEST_title18','내공냠냠18',2,'2023-12-04 05:57:55',NULL,2291),(25,'reply_TEST_title19','내공냠냠19',2,'2023-12-04 05:57:55',NULL,2291),(26,'reply_TEST_title20','내공냠냠20',2,'2023-12-04 05:57:55',NULL,2291),(27,'reply_TEST_title21','내공냠냠21',2,'2023-12-04 05:57:56',NULL,2291),(28,'reply_TEST_title22','내공냠냠22',2,'2023-12-04 05:57:56',NULL,2291),(29,'reply_TEST_title23','내공냠냠23',2,'2023-12-04 05:57:56',NULL,2291),(30,'reply_TEST_title24','내공냠냠24',2,'2023-12-04 05:57:56',NULL,2291),(31,'reply_TEST_title25','내공냠냠25',2,'2023-12-04 05:57:56',NULL,2291),(32,'아 이건 리뷰 테스트다~~','이게 잘 작성 되어야 하는데 ~~~',5,'2023-12-05 06:44:43',NULL,2291),(33,'컴포즈커피입니다','사무실에서 간단하게',1,'2023-12-05 06:50:28',NULL,2291),(34,'가습기 ','좋아용',4,'2023-12-05 06:51:49',NULL,2291),(35,'가습기 ','좋아용',4,'2023-12-05 06:52:36',NULL,2291),(36,'야 종료되고싶냐?','입력하라고',2,'2023-12-05 07:33:47',NULL,2291),(37,'왜 입력안됨','입력하라고 이자식아~~',1,'2023-12-05 07:36:32',NULL,2291),(38,'입력하기 입력입력','하잇 입력데스',2,'2023-12-05 08:04:26',NULL,2291),(39,'테스트','테스트트트ㅡ',2,'2023-12-05 08:06:51',NULL,2291),(40,'리뷰테스트','테스트리뷰',1,'2023-12-05 08:45:27',NULL,2291),(41,'덕을 올려보자','덕덕덕덕 ',2,'2023-12-05 09:02:35','덕.jfif',2291),(42,'비둘기야 밥먹자','구국9999999999999999999999999999999999999999999999999999',3,'2023-12-05 09:44:21','testIMG.jpg',2291),(43,'이번에는 되겠는데','ㄱㄱㄱㄱㄱㄱ',1,'2023-12-06 01:48:00',NULL,2291),(44,'이번에는 되겠는데','ㄱㄱㄱㄱㄱㄱ',1,'2023-12-06 01:48:00','20231206-104801-434-1.jpg',2291),(45,'테스트테스트','테슽흐~~~~~~~~~~~~~~~~~~~~~',2,'2023-12-06 01:57:56',NULL,2291),(46,'테스트테스트','테슽흐~~~~~~~~~~~~~~~~~~~~~',2,'2023-12-06 01:57:56',NULL,2291),(47,'ㅇㄹㅇㄴㄹ','ㅇㄹㅇㄹ',4,'2023-12-06 02:32:41',NULL,2291),(48,'ㅇㄹㅇㄴㄹ','ㅇㄹㅇㄹ',4,'2023-12-06 02:32:41',NULL,2291),(49,'슬래시 테스트','슬래시 슬래스',3,'2023-12-06 02:34:18',NULL,2291),(50,'슬래시 테스트','슬래시 슬래스',3,'2023-12-06 02:34:18',NULL,2291),(51,'dfdf','dafdsf',3,'2023-12-06 02:35:36',NULL,2291),(52,'dfdf','dafdsf',3,'2023-12-06 02:35:36','/img/20231206-113537-714-1.jpg',2291),(53,'리뷰테스트','테스트 2292',2,'2023-12-12 02:54:43',NULL,2292),(54,'리뷰테스트','테스트 2292',2,'2023-12-12 02:54:43',NULL,2292),(55,'나는 리뷰를 하나만 썼는데?','왜 두개가 써질까?\r\n왜 두개가 써질까?\r\n\r\n왜 두개가 써질까?\r\n\r\n',1,'2023-12-12 02:55:22',NULL,2292),(56,'나는 리뷰를 하나만 썼는데?','왜 두개가 써질까?\r\n왜 두개가 써질까?\r\n\r\n왜 두개가 써질까?\r\n\r\n',1,'2023-12-12 02:55:22',NULL,2292),(57,'리뷰가 2번 작성되는지 테스트','이번엔 1번만 들어가라',2,'2023-12-12 02:58:18',NULL,2291),(58,'다른곳에서도 보임?','왜 보임?',5,'2023-12-12 03:05:08',NULL,2291),(59,'itemNum 111','이 리뷰도 다른곳에서 보이나?',1,'2023-12-12 03:20:07',NULL,111),(60,'i m 카 리 나','안녕하세요 카리나입니다.\r\n만나서 반갑고요 에스파 화이팅',5,'2023-12-12 05:40:13','/img/20231212-144015-114-1.jpg',2291);
/*!40000 ALTER TABLE `itemreply` ENABLE KEYS */;
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
