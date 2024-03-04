-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: professordb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `academicdetails`
--

DROP TABLE IF EXISTS `academicdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academicdetails` (
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `FacultyCollege` varchar(50) DEFAULT NULL,
  `AcademicRankPosition` varchar(50) DEFAULT NULL,
  `CoursesTaught` varchar(255) DEFAULT NULL,
  `ResearchAreasInterests` varchar(255) DEFAULT NULL,
  `EducationBackground` text,
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `academicdetails_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academicdetails`
--

LOCK TABLES `academicdetails` WRITE;
/*!40000 ALTER TABLE `academicdetails` DISABLE KEYS */;
INSERT INTO `academicdetails` VALUES ('a37ef366-5456-4c11-bb89-99442d3d0ac0','Computer Science','Engineering','Professor','Introduction to Programming','Machine Learning','Ph.D. in Computer Science, XYZ University, 2010'),('97f1bc9c-d1f2-403e-a461-6bd25d09d05d','Physics','Science','Associate Professor','Quantum Mechanics','Particle Physics','Ph.D. in Physics, ABC University, 2008'),('6a0d87cc-b37c-40f3-aa46-1fb987d7e39b','Chemistry','Science','Professor','Organic Chemistry','Chemical Kinetics','Ph.D. in Chemistry, LMN University, 2005');
/*!40000 ALTER TABLE `academicdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `imagesID` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`imagesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `ProfessorID` varchar(255) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `OfficeLocation` varchar(100) DEFAULT NULL,
  `imagesID` int DEFAULT NULL,
  PRIMARY KEY (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES ('5641554f-9cfc-4850-a647-896fd7ea0177','Kuson','Ta','1990-01-01','F','kuson@gmail.com','0919804277','Ladkrabang',NULL),('6a0d87cc-b37c-40f3-aa46-1fb987d7e39b','Robert','Johnson','1978-08-20','M','robert.johnson@email.com','5556667777','Office 303',3),('97f1bc9c-d1f2-403e-a461-6bd25d09d05d','Jane','Smith','1985-05-15','F','jane.smith@email.com','9876543210','Office 202',2),('a37ef366-5456-4c11-bb89-99442d3d0ac0','John','Doe','1990-01-01','M','john.doe@email.com','1234567890','Office 101',1);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researchpublications`
--

DROP TABLE IF EXISTS `researchpublications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researchpublications` (
  `ProfessorID` varchar(255) DEFAULT NULL,
  `PublishedPapers` text,
  `ResearchProjects` text,
  `ConferencePresentations` text,
  `Patents` text,
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `researchpublications_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchpublications`
--

LOCK TABLES `researchpublications` WRITE;
/*!40000 ALTER TABLE `researchpublications` DISABLE KEYS */;
INSERT INTO `researchpublications` VALUES ('a37ef366-5456-4c11-bb89-99442d3d0ac0','Paper 1 Title','Project A','Conference Presentation X','Patent Y'),('97f1bc9c-d1f2-403e-a461-6bd25d09d05d','Paper X Title','Project B','Conference Presentation Y','Patent Z'),('6a0d87cc-b37c-40f3-aa46-1fb987d7e39b','Paper Y Title','Project C','Conference Presentation Z','Patent W');
/*!40000 ALTER TABLE `researchpublications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachingadvising`
--

DROP TABLE IF EXISTS `teachingadvising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachingadvising` (
  `ProfessorID` varchar(255) DEFAULT NULL,
  `CoursesTaught` text,
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `teachingadvising_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachingadvising`
--

LOCK TABLES `teachingadvising` WRITE;
/*!40000 ALTER TABLE `teachingadvising` DISABLE KEYS */;
INSERT INTO `teachingadvising` VALUES ('a37ef366-5456-4c11-bb89-99442d3d0ac0','Database Systems, Artificial Intelligence'),('97f1bc9c-d1f2-403e-a461-6bd25d09d05d','Modern Physics, Advanced Quantum Mechanics'),('6a0d87cc-b37c-40f3-aa46-1fb987d7e39b','Organic Chemistry, Physical Chemistry');
/*!40000 ALTER TABLE `teachingadvising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin` (
  `UserID` int NOT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 21:32:14
