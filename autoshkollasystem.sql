-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: autoshkollasystem
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT 'anonymous',
  `surname` varchar(45) DEFAULT 'anonymous',
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_feedback_instructor_id_idx` (`instructor_id`),
  CONSTRAINT `fk_feedback_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,3,'Ermira','Bytyqi','Best of all the time','2024-02-19 18:44:39'),(2,1,'Albanita ','Beqiri','Highly recommended!','2024-02-19 18:44:39'),(3,2,'anonymous','anonymous','I gained valuable skills and confidence.','2024-02-19 18:44:39');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email_iindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Kujtim','Krasniqi','kkrasniqi@gmail.com','01569952','fsadjfuh485','2024-02-19 17:00:49'),(2,'Armend','Durmishi','adurmishi@gmail.com','04527245','ghdfh42','2024-02-19 17:00:49'),(3,'Jehona','Lumi','jehona@gmail.com','03846569','jehonA121!','2024-02-19 17:02:18');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int DEFAULT NULL,
  `lessons_date` date NOT NULL,
  `lesson_number` int NOT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lessons_instructor_id_idx` (`instructor_id`),
  CONSTRAINT `fk_lessons_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,3,'2024-02-19',15,1),(2,1,'2024-02-20',16,2),(3,2,'2024-02-21',17,3);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `type` enum('Category AM','Category A','Category B','Category C','Category D') DEFAULT 'Category AM',
  `issue_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_licenses_student_id_idx` (`student_id`),
  CONSTRAINT `fk_licenses_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,1,'Category C','2024-02-19','2025-02-19'),(2,2,'Category B','2024-02-22','2025-02-22');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `total` int NOT NULL,
  `status` enum('paid','not paid') DEFAULT 'not paid',
  `payment_method` enum('cash','card') DEFAULT 'cash',
  `isValid` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_student_id_idx` (`student_id`),
  CONSTRAINT `fk_payments_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,200,'paid','cash','YES'),(2,2,135,'paid','card','yes'),(3,3,0,'not paid','cash','NO');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_instructor`
--

DROP TABLE IF EXISTS `student_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_instructor` (
  `student_id` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  KEY `fk_student_instructor_student_id_idx` (`student_id`),
  KEY `fk_student_instructor_instructor_id_idx` (`instructor_id`),
  CONSTRAINT `fk_student_instructor_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_instructor_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_instructor`
--

LOCK TABLES `student_instructor` WRITE;
/*!40000 ALTER TABLE `student_instructor` DISABLE KEYS */;
INSERT INTO `student_instructor` VALUES (1,3),(2,1),(3,2);
/*!40000 ALTER TABLE `student_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_lesson`
--

DROP TABLE IF EXISTS `student_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_lesson` (
  `student_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  KEY `fk_student_lesson_lesson_id_idx` (`lesson_id`),
  KEY `fk_student_lesson_student_id` (`student_id`),
  CONSTRAINT `fk_student_lesson_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_lesson_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_lesson`
--

LOCK TABLES `student_lesson` WRITE;
/*!40000 ALTER TABLE `student_lesson` DISABLE KEYS */;
INSERT INTO `student_lesson` VALUES (1,3),(2,1),(3,2);
/*!40000 ALTER TABLE `student_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `address` text,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Ermira','Cikaqi',19,'Suhareke','eracikaqi@student.uni-pr.edu','04522211Ff','2024-02-19 14:28:09'),(2,'Albin','Gashi',20,'Kosove','ag@gmail.com','255Shgt','2024-02-19 14:28:09'),(3,'Deutsche',' Nome',70,'Suhareke','dnoo@hotmail.com','sda852','2024-02-19 14:28:09');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_availibility`
--

DROP TABLE IF EXISTS `vehicle_availibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_availibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int DEFAULT NULL,
  `model` varchar(75) NOT NULL,
  `registration_number` varchar(25) NOT NULL,
  `is_available` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehicle_availibility_lesson_id_idx` (`lesson_id`),
  CONSTRAINT `fk_vehicle_availibility_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_availibility`
--

LOCK TABLES `vehicle_availibility` WRITE;
/*!40000 ALTER TABLE `vehicle_availibility` DISABLE KEYS */;
INSERT INTO `vehicle_availibility` VALUES (1,1,'A3','04 958 FM','Yes'),(2,2,'Golf 7','04 524 AG','Yes'),(3,3,'Audi rs7','04 758 FT','No');
/*!40000 ALTER TABLE `vehicle_availibility` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 19:44:09
