-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: professordbv2
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
-- Table structure for table `academic`
--

DROP TABLE IF EXISTS `academic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic` (
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Faculty` varchar(50) DEFAULT NULL,
  `AcademicRankPosition` varchar(50) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  KEY `DepartmentID` (`DepartmentID`),
  KEY `ProgramID` (`ProgramID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `academic_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `academic_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `program` (`ProgramID`),
  CONSTRAINT `academic_ibfk_4` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic`
--

LOCK TABLES `academic` WRITE;
/*!40000 ALTER TABLE `academic` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `PublishedDate` date DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (5,'AI Handbook','2022-12-01','Comprehensive guide to AI','Publisher E','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','978-1-234567-89-0','John Smith');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursestaught`
--

DROP TABLE IF EXISTS `coursestaught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursestaught` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `Course` varchar(255) DEFAULT NULL,
  `Credit` int DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `CouresCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `coursestaught_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursestaught`
--

LOCK TABLES `coursestaught` WRITE;
/*!40000 ALTER TABLE `coursestaught` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursestaught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `Department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (7,'School of International & Interdisciplinary Engineering Programs'),(8,'ภาควิชาวิศวกรรมคอมพิวเตอร์'),(9,'ภาควิชาวิศวกรรมไฟฟ้า'),(10,'ภาควิชาวิศวกรรมอาหาร'),(11,'ภาควิชาวิศวกรรมเกษตร'),(12,'ภาควิชาวิศวกรรมเคมี'),(13,'ภาควิชาวิศวกรรมอุตสาหการ'),(14,'ภาควิชาวิศวกรรมเครื่องกล'),(15,'ภาควิชาวิศวกรรมโยธา'),(16,'ภาควิชาวิศวกรรมการวัดและควบคุม'),(17,'ภาควิชาวิศวกรรมอิเล็กทรอนิกส์'),(18,'ภาควิชาวิศวกรรมชีวการแพทย์'),(19,'ภาควิชาวิศวกรรมโทรคมนาคม'),(20,'ภาควิชาวิศวกรรมหุ่นยนต์และปัญญาประดิษฐ์');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationbackground`
--

DROP TABLE IF EXISTS `educationbackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationbackground` (
  `EducationID` int NOT NULL AUTO_INCREMENT,
  `Year` date DEFAULT NULL,
  `Faculty` varchar(50) DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  `Institute` varchar(255) DEFAULT NULL,
  `Program` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EducationID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `educationbackground_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationbackground`
--

LOCK TABLES `educationbackground` WRITE;
/*!40000 ALTER TABLE `educationbackground` DISABLE KEYS */;
/*!40000 ALTER TABLE `educationbackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `ExperienceID` int NOT NULL AUTO_INCREMENT,
  `Organization` varchar(255) DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ExperienceID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `JournalID` int NOT NULL AUTO_INCREMENT,
  `Topic` varchar(255) DEFAULT NULL,
  `PublishedDate` date DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `AcadDatabase` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `DOI` varchar(255) DEFAULT NULL,
  `Quatile` varchar(255) DEFAULT NULL,
  `AuthorProfessorID` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`JournalID`),
  KEY `TypeID` (`TypeID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `type` (`TypeID`),
  CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otherproject`
--

DROP TABLE IF EXISTS `otherproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otherproject` (
  `OtherProjectID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OtherProjectID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `otherproject_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otherproject`
--

LOCK TABLES `otherproject` WRITE;
/*!40000 ALTER TABLE `otherproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `otherproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceeding`
--

DROP TABLE IF EXISTS `proceeding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceeding` (
  `ProceedingID` int NOT NULL AUTO_INCREMENT,
  `Topic` varchar(255) DEFAULT NULL,
  `PublishedDate` date DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `AcadDatabase` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `DOI` varchar(255) DEFAULT NULL,
  `AuthorProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProceedingID`),
  KEY `TypeID` (`TypeID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `proceeding_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `type` (`TypeID`),
  CONSTRAINT `proceeding_ibfk_2` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceeding`
--

LOCK TABLES `proceeding` WRITE;
/*!40000 ALTER TABLE `proceeding` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceeding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `ProfessorID` varchar(255) NOT NULL,
  `FirstNameTH` varchar(100) DEFAULT NULL,
  `LastNameTH` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `OfficeLocation` varchar(255) DEFAULT NULL,
  `imageID` int DEFAULT NULL,
  `LastNameEng` varchar(100) DEFAULT NULL,
  `FirstNameEng` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProfessorID`),
  CONSTRAINT `professor_chk_1` CHECK ((`Gender` in (_utf8mb4'Female',_utf8mb4'Male')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','สมหญิง','ใจดี','1975-10-20','Female','somying@example.com','0987654321','E12-1010 อาคารเรียนรวม 12 ชั้น',2,'Jaidi','Somying'),('c913583b-5229-4ff3-a38a-81e379ea18ac','สมชาย','ใจดี','1980-05-15','Male','somchai@example.com','0919999991','E12-1009 อาคารเรียนรวม 12 ชั้น',1,'Jaidi','Somchai');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `ProgramID` int NOT NULL AUTO_INCREMENT,
  `TitleName` varchar(50) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `ProgramName` varchar(255) DEFAULT NULL,
  `RevisedYear` date DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `ProjectID` int NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `FundingType` varchar(255) DEFAULT NULL,
  `Funder` varchar(255) DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Budget` int DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researchinteresttopic`
--

DROP TABLE IF EXISTS `researchinteresttopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researchinteresttopic` (
  `InterestID` int NOT NULL AUTO_INCREMENT,
  `Topic` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InterestID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `researchinteresttopic_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchinteresttopic`
--

LOCK TABLES `researchinteresttopic` WRITE;
/*!40000 ALTER TABLE `researchinteresttopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `researchinteresttopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentadvisor`
--

DROP TABLE IF EXISTS `studentadvisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentadvisor` (
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Master` int DEFAULT NULL,
  `Doctor` int DEFAULT NULL,
  `PresentMaster` int DEFAULT NULL,
  `PresentDoctor` int DEFAULT NULL,
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `studentadvisor_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentadvisor`
--

LOCK TABLES `studentadvisor` WRITE;
/*!40000 ALTER TABLE `studentadvisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentadvisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingexperience`
--

DROP TABLE IF EXISTS `trainingexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingexperience` (
  `TrainExpID` int NOT NULL AUTO_INCREMENT,
  `TrainingName` varchar(255) DEFAULT NULL,
  `Organization` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TrainExpID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `trainingexperience_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingexperience`
--

LOCK TABLES `trainingexperience` WRITE;
/*!40000 ALTER TABLE `trainingexperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(20) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `ProfessorID` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2024-02-25 13:52:43
