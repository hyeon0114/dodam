-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dodam
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy` (
  `allergy` int NOT NULL,
  `allName` varchar(10) NOT NULL,
  PRIMARY KEY (`allergy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
INSERT INTO `allergy` VALUES (0,'없음'),(1,'알류'),(2,'우유'),(3,'메밀'),(4,'땅콩'),(5,'호두'),(6,'잣'),(7,'대두'),(8,'밀'),(9,'고등어'),(10,'게'),(11,'새우'),(12,'오징어'),(13,'조개류'),(14,'돼지고기'),(15,'닭고기'),(16,'쇠고기'),(17,'복숭아'),(18,'토마토'),(19,'아황산염');
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allgoods`
--

DROP TABLE IF EXISTS `allgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allgoods` (
  `prdNo` varchar(50) NOT NULL,
  `allergy` varchar(50) DEFAULT NULL,
  `subPrd` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allgoods`
--

LOCK TABLES `allgoods` WRITE;
/*!40000 ALTER TABLE `allgoods` DISABLE KEYS */;
INSERT INTO `allgoods` VALUES ('k_1','8','1'),('k_2','1','2'),('k_2','7','2'),('k_3','2','3'),('k_3','7','3'),('k_3','8','3'),('k_3','11','3'),('k_3','15','3'),('k_3','16','3'),('k_4','2','4'),('k_4','7','4'),('k_4','8','4'),('k_4','9','4'),('k_4','10','4'),('k_4','11','4'),('k_4','13','4'),('k_4','16','4'),('k_5','7','5'),('k_5','8','5'),('k_5','19','5'),('k_6','1','7'),('k_6','8','7'),('k_6','11','7'),('k_6','13','7'),('j_1','7','1'),('j_1','8','1'),('j_1','11','1'),('j_1','12','1'),('j_4','1','7'),('j_4','2','7'),('j_4','8','7'),('j_4','11','7'),('j_4','13','7'),('j_4','14','7'),('j_4','16','7'),('j_4','18','7'),('j_4','19','7'),('j_5','3','8'),('j_5','7','8'),('j_5','9','8'),('c_1','7','14'),('c_1','8','14'),('c_1','15','14'),('c_1','16','14'),('c_2','2','3'),('c_2','7','3'),('c_2','8','3'),('c_2','13','3'),('c_2','14','3'),('c_2','15','3'),('c_2','16','3'),('c_3','8','7'),('c_3','13','7'),('c_3','14','7'),('c_3','15','7'),('a_2','7','2'),('a_3','1','11'),('a_3','2','11'),('a_3','7','11'),('a_3','8','11'),('a_3','13','11'),('a_3','14','11'),('a_3','15','11'),('a_4','2','18'),('a_4','7','18'),('a_4','8','18'),('a_4','16','18'),('a_5','2','18'),('a_5','7','18'),('a_5','8','18'),('a_5','15','18'),('a_5','16','18'),('d_1','2','1'),('d_1','7','1'),('d_2','7','2'),('d_3','2','4'),('d_3','7','4'),('d_3','8','4'),('d_4','1','5'),('d_4','2','5'),('d_4','8','5'),('d_5','1','8'),('d_5','2','8'),('d_5','7','8'),('a_1','2','1'),('a_1','8','1'),('j_6','7','9'),('j_6','14','9'),('j_7','1','10'),('j_7','2','10'),('j_7','4','10'),('j_7','7','10'),('j_7','8','10'),('j_7','14','10'),('j_7','15','10'),('j_7','16','10'),('j_8','1','11'),('j_8','7','11'),('j_8','8','11'),('j_8','15','11'),('j_9','2','13'),('j_9','7','13'),('j_9','8','13'),('c_5','7','12'),('c_5','8','12'),('c_6','7','15'),('c_6','8','15'),('c_6','14','15'),('c_7','8','19'),('c_7','13','19'),('c_7','14','19'),('a_7','0','14'),('d_6','1','6'),('d_6','2','6'),('d_6','5','6'),('d_6','7','6'),('d_6','8','6'),('d_7','7','6'),('d_7','8','6'),('d_8','0','17'),('j_2','7','2'),('j_2','8','2'),('j_2','14','2'),('j_2','15','2'),('j_2','16','2'),('j_2','18','2'),('j_3','2','3'),('j_3','7','3'),('j_3','8','3'),('a_6','13','11'),('c_4','1','8'),('c_4','2','8'),('c_4','7','8'),('c_4','11','8'),('c_4','14','8'),('c_4','15','8'),('c_4','16','8'),('j_10','1','15'),('j_10','7','15'),('j_10','8','15'),('k_7','2','8'),('k_7','7','8'),('k_7','10','8'),('k_7','11','8'),('k_7','12','8'),('k_7','13','8'),('k_8','7','16'),('k_8','8','16'),('k_8','12','16'),('j_11','7','16'),('j_11','8','16'),('j_12','7','18'),('j_12','8','18');
/*!40000 ALTER TABLE `allgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `idx` int NOT NULL,
  `memId` varchar(100) DEFAULT NULL,
  `prdNo` char(10) DEFAULT NULL,
  `no` int DEFAULT NULL,
  `subject` char(50) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `content` text,
  `ymd` char(30) DEFAULT NULL,
  `readcount` int DEFAULT NULL,
  `pwd` char(20) DEFAULT NULL,
  `masterid` int DEFAULT NULL,
  `replynum` int DEFAULT NULL,
  `step` int DEFAULT NULL,
  `type` char(4) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'dodam','a_1',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',1,0,0,'revi'),(2,'dodam','a_2',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',1,'1234',2,0,0,'revi'),(3,'dodam','a_3',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',1,'1234',3,0,0,'revi'),(4,'dodam','a_4',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',4,0,0,'revi'),(5,'dodam','a_5',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',1,'1234',5,0,0,'revi'),(6,'dodam','a_6',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',6,0,0,'revi'),(7,'dodam','a_7',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',7,0,0,'revi'),(8,'dodam','c_1',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',8,0,0,'revi'),(9,'dodam','c_2',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',9,0,0,'revi'),(10,'dodam','c_3',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',2,'1234',10,0,0,'revi'),(11,'dodam','c_4',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',11,0,0,'revi'),(12,'dodam','c_5',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',12,0,0,'revi'),(13,'dodam','c_6',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',13,0,0,'revi'),(14,'dodam','c_7',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',14,0,0,'revi'),(15,'dodam','d_1',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',15,0,0,'revi'),(16,'dodam','d_2',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',16,0,0,'revi'),(17,'dodam','d_3',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',17,0,0,'revi'),(18,'dodam','d_4',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',18,0,0,'revi'),(19,'dodam','d_5',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',19,0,0,'revi'),(20,'dodam','d_6',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',20,0,0,'revi'),(21,'dodam','d_7',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',21,0,0,'revi'),(22,'dodam','d_8',1,'너무 맛있어요','김세현','dodam@gmail.com','너무 맛있습니다.','2023. 5. 15 오후 6:39:59',0,'1234',22,0,0,'revi'),(51,'dodam','a_1',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',1,0,0,'qna'),(52,'dodam','a_2',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',1,'1234',2,0,0,'qna'),(53,'dodam','a_3',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',3,0,0,'qna'),(54,'dodam','a_4',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',4,0,0,'qna'),(55,'dodam','a_5',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',1,'1234',5,0,0,'qna'),(56,'dodam','a_6',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',6,0,0,'qna'),(57,'dodam','a_7',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',7,0,0,'qna'),(58,'dodam','c_1',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',8,0,0,'qna'),(59,'dodam','c_2',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',9,0,0,'qna'),(60,'dodam','c_3',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',1,'1234',10,0,0,'qna'),(61,'dodam','c_4',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',11,0,0,'qna'),(62,'dodam','c_5',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',12,0,0,'qna'),(63,'dodam','c_6',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',13,0,0,'qna'),(64,'dodam','c_7',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',14,0,0,'qna'),(65,'dodam','d_1',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',15,0,0,'qna'),(66,'dodam','d_2',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',16,0,0,'qna'),(67,'dodam','d_3',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',17,0,0,'qna'),(68,'dodam','d_4',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',18,0,0,'qna'),(69,'dodam','d_5',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',19,0,0,'qna'),(70,'dodam','d_6',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',20,0,0,'qna'),(71,'dodam','d_7',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',21,0,0,'qna'),(72,'dodam','d_8',1,'재입고 문의','김세현','dodam@gmail.com','언제 재입고 되나요?','2023. 5. 15 오후 6:39:59',0,'1234',22,0,0,'qna'),(100,'dodam','oneqna',1,'배송문의','김세현','slkdjfe@gmail.com','배송 언제쯤 시작하나요?','2023. 5. 16 오후 5:49:32',NULL,'1234',100,0,0,'oqna'),(101,'dodam','oneqna',2,'환불 요청','조현경','efkwl@gmail.com','환불 요청합니다.','2023. 5. 16 오후 6:04:14',NULL,'1234',101,0,0,'oqna');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ctNo` char(40) DEFAULT NULL,
  `prdNo` varchar(50) DEFAULT NULL,
  `ctQty` int DEFAULT NULL,
  `memId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `ctgType` char(15) NOT NULL,
  `prdNo` varchar(50) NOT NULL,
  `prdName` varchar(20) NOT NULL,
  `prdPrice` int NOT NULL,
  `prdStock` int NOT NULL,
  `prdAccrue` int NOT NULL DEFAULT '0',
  `prdEx` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('a','a_1','바나나 팬케이크',3980,500,0,'#알류_대신 #바나나 #양식'),('a','a_2','트러플 크림 리조또',10800,500,0,'#우유_대신 #두유 #양식'),('a','a_3','비건 쉬림프 파스타',8100,500,0,'#새우_대신 #브림프 #완두콩 #곤약뿌리 #양식'),('a','a_4','콤비네이션 브리또',3950,500,0,'#토마토_대신 #비트 #당근 #양식'),('a','a_5','노마토 파스타',9900,500,0,'#토마토_대신 #Nomato #양식'),('a','a_6','굴 알 아히요',12600,500,0,'#새우_대신 #굴 #양식'),('a','a_7','메로 스테이크',7850,500,0,'#돼지고기_대신 #흰살_생선  #메로 #양식'),('c','c_1','담백한 짜장 볶음밥',3250,500,0,'#돼지고기_대신 #콩기름 #두부 #중식'),('c','c_2','짜장면',4600,500,0,'#메밀_대체식품 #밀 #중식'),('c','c_3','어향가지 덮밥',5500,500,0,'#대두_대신 #고추기름 #중식'),('c','c_4','옥수수 온면',5200,500,0,'#밀_대신 #옥수수면 #중식'),('c','c_5','표고버섯 탕수',9850,500,0,'#오징어_대신 #표고버섯 #중식'),('c','c_6','마파두부 덮밥',5500,500,0,'#닭고기_대신 #두부 #중식'),('c','c_7','돼지고기&청경채 볶음',8800,500,0,'#아황산염_대신 #돼지고기 #중식'),('d','d_1','두부 젤라또',10000,500,0,'#알류_대신 #두부 #디저트'),('d','d_2','그릭 요거트',3500,500,0,'#우유_대신 #두유 #디저트'),('d','d_3','아몬드 버터 샌드위치',2300,500,0,'#땅콩_대신 #아몬드 #디저트'),('d','d_4','밤 휘낭시에',3500,500,0,'#호두_대신 #밤 #디저트'),('d','d_5','춘천 감자빵',3200,500,0,'#밀_대신 #쌀가루 #디저트'),('d','d_6','호두파이',18000,500,0,'#잣_대신 #호두 #디저트'),('d','d_7','아몬드 그레놀라',9280,500,0,'#잣_대신 #견과류 #현미 #디저트'),('d','d_8','키위쨈',4350,500,0,'#복숭아_대신 #키위 #디저트'),('j','j_1','오코노미야끼',6500,500,0,'#알류_대신 #두부 #일식'),('j','j_10','생선카츠',12500,500,0,'#닭고기_대신 #생선 #일식'),('j','j_11','두부 튀김',6500,500,0,'#쇠고기_대신 #두부 #일식'),('j','j_12','단호박 튀김',5600,500,0,'#토마토_대신 #단호박 #일식'),('j','j_2','치킨 커리',7500,500,0,'#우유_대신 #두유 #일식'),('j','j_3','곤약 소바',4250,500,0,'#메밀_대신 #곤약 #일식'),('j','j_4','야키소바',7900,500,0,'#대두_대신 #밀 #일식'),('j','j_5','메밀 소바',4450,500,0,'#밀_대신 #메밀 #일식'),('j','j_6','돼지고기 생강구이',8750,500,0,'#고등어_대신 #돼지고기 #일식'),('j','j_7','오야꼬동',5280,500,0,'#게_대신 #닭고기 #달걀 #일식'),('j','j_8','닭가슴살 튀김',8900,500,0,'#새우_대신 #닭고기 #일식'),('k','j_9','키츠네 유부우동',6300,500,0,'#조개류_대신 #유부 #일식'),('k','k_1','애호박 전',3200,500,0,'#알류_대신 #단호박_전분 #한식'),('k','k_2','계란말이',5800,500,0,'#우유_대신 #계란 #한식'),('k','k_3','도토리 막국수',3500,500,0,'#메밀_대신 #도토리 #한식'),('k','k_4','고등어 조림',7500,500,0,'#땅콩_대신 #고등어 #한식'),('k','k_5','간장 연근 조림',4300,500,0,'#호두_대신 #연근 #한식'),('k','k_6','새우 볶음밥',3400,500,0,'#대두_대신 #쌀 #새우 #한식'),('k','k_7','감자 수제비',6500,500,0,'#밀_대신 #감자_전분 #한식'),('k','k_8','매콤 오징어 볶음',8700,500,0,'#쇠고기_대신 #오징어 #한식');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `prdNo` varchar(50) NOT NULL,
  `serS` double NOT NULL DEFAULT '0',
  `Tser` double NOT NULL DEFAULT '0',
  `cal` double NOT NULL DEFAULT '0',
  `car` double NOT NULL DEFAULT '0',
  `sug` double NOT NULL DEFAULT '0',
  `pro` double NOT NULL DEFAULT '0',
  `tFat` double NOT NULL DEFAULT '0',
  `satFat` double NOT NULL DEFAULT '0',
  `tranFat` double NOT NULL DEFAULT '0',
  `chol` double NOT NULL DEFAULT '0',
  `sod` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`prdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('a_1',198,198,523,77,33,11,19,12,0.5,140,670),('a_2',413,413,739,88,5,14,37,15,0.6,42,739),('a_3',320,320,993,87,14.6,18,64,31,1.1,188,1058),('a_4',170,170,351,47,4,16,11,5,0,26,640),('a_5',341,341,210,15,5,20,8.7,1.3,0,0,320),('a_6',100,300,325,9,0,7,29,5,0.2,49,376),('a_7',200,500,133,0,0,18.16,6.17,1.17,0,70,60),('c_1',230,230,400,18.5,0,2,2,0.37,0,0,290),('c_2',380,380,626,55.5,24.5,13.5,3.95,1.6,0,3.5,1481),('c_3',280,280,262,29,13,11,11,3,0,28,1199),('c_4',168.5,168.5,315,65,6,8,2.7,0.5,0,0,1960),('c_5',100,1000,215,28.07,2.81,4.71,10,1.65,0,0,331),('c_6',350,350,369.29,27.62,5.57,19.43,20.13,4.06,0,14,2110.75),('c_7',130,130,122.33,4.85,2.84,20.59,3.1,1.09,0,56.53,155.13),('d_1',100,474,205,22,17,3,12,4.6,0,83,50),('d_2',100,100,109,7,0,13,4,0.5,0,0,68),('d_3',80,80,310,33,11,5,18,7,0.5,15,240),('d_4',35,35,175,18,13,3,10,6,0.2,15,73),('d_5',120,120,295,44,3,6,10,6,0,20,230),('d_6',1000,750,345,49,33,8,13,8,0.5,280,85),('d_7',200,200,798,89,31,27,40,2.1,0,0,202),('d_8',100,235,49.3,61,4.4,1,0,0,0,0,0),('j_1',350,350,525,61.31,3.44,20.66,21.45,5.11,0,183,831),('j_10',100,1200,345,24,3,6,1.2,0.5,0,35,410),('j_11',100,400,230,21,1,6,14,203,0.5,0,350),('j_12',100,1000,146,11.3,6.8,3.2,9.1,4.3,0,71,24),('j_2',160,160,120,19,5,4,3,1.3,0.5,12,690),('j_3',280,280,80,18,8,2,0,0,0,0,1390),('j_4',439,439,345,28.97,3.16,20.09,17.15,2.98,0,39,863),('j_5',474,474,410,85,3.6,14,1.7,0.5,0,0,798),('j_6',280,280,430,15,8,22,31,15,0,82,1221),('j_7',450,450,647,116.46,11,24.59,5.9,1.71,0,122,1369),('j_8',100,220,240,17,2,14,13,2.2,0.5,30,570),('j_9',212,212,345,87,5,10,3.6,1.1,0,0,1730),('k_1',150,150,182.9,10.1,3.4,6.53,12.93,1.99,0.12,113.98,335.53),('k_2',100,190,193.49,1.45,0,17.21,13.21,3.33,0.08,339.85,449.07),('k_3',297,297,640,140,25,13,2.1,0,0,0,2160),('k_4',100,550,141.01,4.1,3.39,11.25,8.84,2.14,0.05,30.05,389.57),('k_5',50,170,87.19,14.71,1.39,1.34,2.55,0.32,0.01,0,330.58),('k_6',230,230,375,69,2.5,9,7,0.9,0,62.5,650),('k_7',184,184,500,18.1,1,2,0.28,0,0,0.83,193.3),('k_8',200,300,256,14.86,3.85,19.69,13.04,2,0.07,218.36,619.61);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecart`
--

DROP TABLE IF EXISTS `likecart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecart` (
  `ctNo` char(40) DEFAULT NULL,
  `prdNo` varchar(50) DEFAULT NULL,
  `memId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecart`
--

LOCK TABLES `likecart` WRITE;
/*!40000 ALTER TABLE `likecart` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `managerId` char(8) NOT NULL,
  `managerPwd` char(8) NOT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('dodam','1234');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memall`
--

DROP TABLE IF EXISTS `memall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memall` (
  `memId` varchar(20) NOT NULL,
  `allergy` char(2) NOT NULL,
  `allChk` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memall`
--

LOCK TABLES `memall` WRITE;
/*!40000 ALTER TABLE `memall` DISABLE KEYS */;
INSERT INTO `memall` VALUES ('dodam','1','1'),('dodam','3','1'),('dodam','4','1');
/*!40000 ALTER TABLE `memall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memId` varchar(20) NOT NULL,
  `memPwd` varchar(20) NOT NULL,
  `memName` varchar(20) NOT NULL,
  `memEmail` varchar(50) DEFAULT NULL,
  `memAdr` varchar(50) NOT NULL,
  `memPhone` varchar(15) DEFAULT NULL,
  `memSex` char(2) DEFAULT NULL,
  `memPoint` int DEFAULT '0',
  `percent` double DEFAULT '0',
  PRIMARY KEY (`memId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('dodam','1234','김세현','dodam@gmail.com','서울시 강서구 양천로 585 금지아파트 142동 11호','010-3252-5542','여',7881,0.1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `Nono` varchar(10) NOT NULL,
  `Noctg` varchar(10) DEFAULT NULL,
  `NoTitle` varchar(100) DEFAULT NULL,
  `Nocontent` varchar(16000) DEFAULT NULL,
  `Nodate` date DEFAULT NULL,
  `Noname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES ('1','no',' [안내] 5월 배송 휴무 일정 안내','안녕하세요. 도담도담입니다.<br>\n2023년 5월 배송 휴무 일정에 대해 안내 드립니다.<br>\n고객님의 양해 부탁드리며, 아래의 일정을 확인하시고 이용에 불편함이 없으시기를 바랍니다.<br>\n<br>\n<br>\n일반택배 배송 휴무<br>\n1. 어린이날 : 2023. 05. 05(금) ~ 2023. 05.07(일) 배송 휴무<br>\n2. 부처님 오신 날 : 2023. 05. 27(토) ~ 2023. 05. 29(월) 배송 휴무<br><br>\n\n5월 배송 휴무 일정을 다시 한 번 안내 드립니다. <br>\n확인 후 이용에 불편함이 없으시기를 바라며 앞으로도 고객님을 먼저 생각하는 도담도담이 되겠습니다.<br><br>\n\n감사합니다.<br>\n도담도담 드림.<br>','2023-05-16','김세현'),('2','no',' [안내] 상품 구매 시 <도담 적립금> 적림 안내','<도담 적립금>은 구매하신 전체 상품 금액의 0.1%가 적립됩니다.','2023-05-16','조현경');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderinfo` (
  `ordNo` char(10) NOT NULL,
  `memId` char(10) DEFAULT NULL,
  `ordDate` char(30) DEFAULT NULL,
  `ordReceiver` char(30) DEFAULT NULL,
  `ordRcvAdr` varchar(50) DEFAULT NULL,
  `ordRcvPhone` char(20) DEFAULT NULL,
  `ordPay` char(20) DEFAULT NULL,
  `ordBank` char(30) NOT NULL DEFAULT '카드결제',
  `ordCardNo` char(30) NOT NULL DEFAULT '무통장입금',
  `ordCardPass` char(30) NOT NULL DEFAULT '무통장입금',
  `delivery` char(10) NOT NULL DEFAULT '상품 준비중',
  PRIMARY KEY (`ordNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `ordNo` varchar(10) DEFAULT NULL,
  `prdNo` varchar(10) DEFAULT NULL,
  `ordQty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qno` varchar(10) NOT NULL,
  `qctg` varchar(10) DEFAULT NULL,
  `qTitle` varchar(100) DEFAULT NULL,
  `qcontent` varchar(16000) DEFAULT NULL,
  `qdate` date DEFAULT NULL,
  `qname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`qno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES ('1','qna','[회원] 아이디, 비밀번호를 잊어버렸습니다.','아이디, 비밀번호 찾기 안내<br>\n\n- 아래 경로를 통해 아이디 및 비밀번호 찾기가 가능합니다. <br><br>\n\n(PC) 도담도담 홈 상단 [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]<br><br>\n\n[참고]<br>\n\n- 가입시 기재한 주소가 기억나지 않으시거나 오류가 발생하는 경우 1:1 문의 바랍니다.<br>\n\n- 상담 시에는 고개님의 개인정보보호를 위해 기존에 사용하시돈 비밀번호는 안내가 불가하며, 개인정보 확인 후 임시비밀번호를 발급해드립니다.<br>','2023-04-11','김세현'),('2','qna','[적립금]','주문 결제 : 상품 주문 시 결제 내역 확인 후 당일 지급 됩니다.<br><br>\n\n\n[참고]<br>\n\n<도담 적립금>은 1원 단위부터 주문서에서 사용 가능 합니다.<br>','2023-04-29','조현경'),('3','qna','[상품 문의] 주문한 상품은 언제쯤 도착하나요?','상품 주문 후 평균 2일 내로 고객님께 배송해 드립니다. <br><br>\n\n[참고]<br>\n\n회사 및 택배사의 사정에 따라 배송 기간이 변동될 수 있습니다.<br>','2023-05-16','김세현');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temcart`
--

DROP TABLE IF EXISTS `temcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temcart` (
  `ctNo` char(40) DEFAULT NULL,
  `prdNo` varchar(50) DEFAULT NULL,
  `ctQty` int DEFAULT NULL,
  `memId` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temcart`
--

LOCK TABLES `temcart` WRITE;
/*!40000 ALTER TABLE `temcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `temcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 15:45:28
