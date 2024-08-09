-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vrombo
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  `courseCategory` varchar(255) DEFAULT NULL,
  `courseModul` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Science Class with Sheldon','Science','modul1');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructorId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`instructorId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Doe','doe123','instructor');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_admin`
--

DROP TABLE IF EXISTS `master_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_admin`
--

LOCK TABLES `master_admin` WRITE;
/*!40000 ALTER TABLE `master_admin` DISABLE KEYS */;
INSERT INTO `master_admin` VALUES (1,'admin1','admin123','admin');
/*!40000 ALTER TABLE `master_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `questionId` int NOT NULL,
  `FK_QuizId` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `choice1` varchar(255) DEFAULT NULL,
  `choice2` varchar(255) DEFAULT NULL,
  `choice3` varchar(255) DEFAULT NULL,
  `choice4` varchar(255) DEFAULT NULL,
  `correctAnswer` int NOT NULL,
  `points` int NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `FK1_QuizId_idx` (`FK_QuizId`),
  CONSTRAINT `FK1_QuizId` FOREIGN KEY (`FK_QuizId`) REFERENCES `quiz` (`quizId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quizId` int NOT NULL,
  `FK_CourseId` int NOT NULL,
  `FK_InstructorId` int NOT NULL,
  `quizName` varchar(255) NOT NULL,
  `totalQuestions` int NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`quizId`),
  KEY `FK2_CourseId_idx` (`FK_CourseId`),
  KEY `FK3_InstructorId_idx` (`FK_InstructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee`
--

DROP TABLE IF EXISTS `trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainee` (
  `traineeId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`traineeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee`
--

LOCK TABLES `trainee` WRITE;
/*!40000 ALTER TABLE `trainee` DISABLE KEYS */;
INSERT INTO `trainee` VALUES (1,'John','Trainee A');
/*!40000 ALTER TABLE `trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee_quiz`
--

DROP TABLE IF EXISTS `trainee_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainee_quiz` (
  `traineeQuizId` int NOT NULL,
  `FK_QuestionID` int NOT NULL,
  `FK_QuizId` int NOT NULL,
  `FK_TraineeId` int NOT NULL,
  `answerChoice` int DEFAULT NULL,
  `traineePoints` int DEFAULT NULL,
  PRIMARY KEY (`traineeQuizId`),
  KEY `FK1_QuestionId_idx` (`FK_QuestionID`),
  KEY `FK2_QuizId_idx` (`FK_QuizId`),
  CONSTRAINT `FK1_QuestionId` FOREIGN KEY (`FK_QuestionID`) REFERENCES `question` (`questionId`),
  CONSTRAINT `FK2_QuizId` FOREIGN KEY (`FK_QuizId`) REFERENCES `quiz` (`quizId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee_quiz`
--

LOCK TABLES `trainee_quiz` WRITE;
/*!40000 ALTER TABLE `trainee_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainee_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee_quiz_results`
--

DROP TABLE IF EXISTS `trainee_quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainee_quiz_results` (
  `FK_TraineeQuizId` int NOT NULL,
  `FK_ResultId` int NOT NULL,
  KEY `FK1_TraineeQuizId_idx` (`FK_TraineeQuizId`),
  KEY `FK1_ResultId_idx` (`FK_ResultId`),
  CONSTRAINT `FK1_ResultId` FOREIGN KEY (`FK_ResultId`) REFERENCES `trainee_result` (`resultId`),
  CONSTRAINT `FK1_TraineeQuizId` FOREIGN KEY (`FK_TraineeQuizId`) REFERENCES `trainee_quiz` (`traineeQuizId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee_quiz_results`
--

LOCK TABLES `trainee_quiz_results` WRITE;
/*!40000 ALTER TABLE `trainee_quiz_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainee_quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee_result`
--

DROP TABLE IF EXISTS `trainee_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainee_result` (
  `resultId` int NOT NULL,
  `FK_QuizId` int DEFAULT NULL,
  `FK_TraineeId` int DEFAULT NULL,
  `totalPoints` int DEFAULT NULL,
  PRIMARY KEY (`resultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee_result`
--

LOCK TABLES `trainee_result` WRITE;
/*!40000 ALTER TABLE `trainee_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainee_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 13:52:29
