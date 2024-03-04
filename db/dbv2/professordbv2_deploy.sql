CREATE DATABASE  IF NOT EXISTS `professordbv2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `professordbv2`;
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
  `EducationID` int DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `ProgramID` int DEFAULT NULL,
  KEY `EducationID` (`EducationID`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `ProgramID` (`ProgramID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `academic_ibfk_1` FOREIGN KEY (`EducationID`) REFERENCES `educationbackground` (`EducationID`),
  CONSTRAINT `academic_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `academic_ibfk_3` FOREIGN KEY (`ProgramID`) REFERENCES `program` (`ProgramID`),
  CONSTRAINT `academic_ibfk_4` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `educationbackground`
--

DROP TABLE IF EXISTS `educationbackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationbackground` (
  `EducationID` int NOT NULL AUTO_INCREMENT,
  `Year` int DEFAULT NULL,
  `Faculty` varchar(50) DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  `Institute` varchar(255) DEFAULT NULL,
  `Program` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EducationID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `educationbackground_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `ProfessorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `ProgramID` int NOT NULL AUTO_INCREMENT,
  `TitleName` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `ProgramName` varchar(255) DEFAULT NULL,
  `RevisedYear` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-04 15:17:14
