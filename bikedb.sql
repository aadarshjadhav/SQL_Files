-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bikedb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `mobile_no` bigint NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C101','AVAY','Mittal',9877678907,'Male','av@gmail.com'),('C102','NITIN','Kumar',8977889900,'Male','nitin@gmail.com'),('C103','RUHANI','Dhameja',8099778890,'Female','ru@gmail.com'),('C104','VIRAT','Mittal',7788900879,'Male','virat@gmail.com'),('C105 ','SITA','Devi',900896789,'Female','sita@gmail.com'),('C106','Nakul','Mehta',8800997890,'Male','nakul@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_rating`
--

DROP TABLE IF EXISTS `feedback_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_rating` (
  `rating_id` int NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_rating`
--

LOCK TABLES `feedback_rating` WRITE;
/*!40000 ALTER TABLE `feedback_rating` DISABLE KEYS */;
INSERT INTO `feedback_rating` VALUES (1,'Excellent'),(2,'Good'),(3,'Average'),(4,'Bad'),(5,'Complaint');
/*!40000 ALTER TABLE `feedback_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `model_id` varchar(20) NOT NULL,
  `model_name` varchar(45) NOT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES ('1','Yamaha',50000),('2','Bajaj',75000),('3','Honda',70000),('4','Hero',90000),('5','RoyalEnfield',180000),('6','TVS',85000),('7','BMW',230000);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_mode` (
  `payment_id` int NOT NULL,
  `payment_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_mode`
--

LOCK TABLES `payment_mode` WRITE;
/*!40000 ALTER TABLE `payment_mode` DISABLE KEYS */;
INSERT INTO `payment_mode` VALUES (11,'Online'),(22,'Cash'),(33,'Cheque');
/*!40000 ALTER TABLE `payment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `purchase_id` int NOT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  `model_id` varchar(45) DEFAULT NULL,
  `booking_amount` int DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `rating_id` int DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `cfk1_idx` (`customer_id`),
  KEY `mfk1_idx` (`model_id`),
  KEY `pfk1_idx` (`payment_id`),
  KEY `rfk1_idx` (`rating_id`),
  CONSTRAINT `cfk1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `mfk1` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  CONSTRAINT `pfk1` FOREIGN KEY (`payment_id`) REFERENCES `payment_mode` (`payment_id`),
  CONSTRAINT `rfk1` FOREIGN KEY (`rating_id`) REFERENCES `feedback_rating` (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'C101','2',10000,'2023-09-10',11,4),(2,'C102','1',20000,'2023-01-11',22,4),(3,'C103','4',15000,'2022-10-09',33,2),(4,'C102','5',20000,'2020-11-01',22,1),(5,'C104','3',15000,'2020-09-07',11,4),(6,'C106','1',23000,'2023-10-03',33,NULL),(7,'C103','4',10000,'2020-10-09',22,3),(8,'C106','2',24000,'2022-09-10',33,5),(10,'C101','3',8800,'2023-07-25',33,2);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09  9:11:14
