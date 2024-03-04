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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (5,'AI Handbook','2022-12-01','Comprehensive guide to AI','Publisher E','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','978-1-234567-89-0','John Smith'),(6,'AI Handbook','2022-12-01','Comprehensive guide to AI','Publisher E','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','978-1-234567-89-0','John Smith'),(7,'เจาะลึก AI','2012-12-01','อิทธิพลของ AIในปัจจุบัน','สำนักพิมพ์อ่านแล้วดี','c913583b-5229-4ff3-a38a-81e379ea18ac','978-1-234567-89-0','สมชายใจดี'),(8,'วิยาการเข้ารหัส','1999-04-06','การเข้ารหัสข้อมูล','สำนักพิมพ์วิศวกรรม','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','867-1-123115-38-4','สมหญิง ใจดี'),(12,'test','1975-10-20','test','test','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','test','test'),(13,'test','1975-10-20','test','test','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','test','test'),(14,'test','1975-10-20','test','test','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','test','test');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursestaught`
--

LOCK TABLES `coursestaught` WRITE;
/*!40000 ALTER TABLE `coursestaught` DISABLE KEYS */;
INSERT INTO `coursestaught` VALUES (7,'Introduction to Computer Science',3,'2e76190e-8eb5-49c1-b47f-b66f6a33d2e6',NULL),(8,'Principles of Communication',3,'c913583b-5229-4ff3-a38a-81e379ea18ac',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'School of International & Interdisciplinary Engineering Programs'),(2,'ภาควิชาวิศวกรรมคอมพิวเตอร์'),(3,'ภาควิชาวิศวกรรมไฟฟ้า'),(4,'ภาควิชาวิศวกรรมอาหาร'),(5,'ภาควิชาวิศวกรรมเกษตร'),(6,'ภาควิชาวิศวกรรมเคมี'),(7,'ภาควิชาวิศวกรรมอุตสาหการ'),(8,'ภาควิชาวิศวกรรมเครื่องกล'),(9,'ภาควิชาวิศวกรรมโยธา'),(10,'ภาควิชาวิศวกรรมการวัดและควบคุม'),(11,'ภาควิชาวิศวกรรมอิเล็กทรอนิกส์'),(12,'ภาควิชาวิศวกรรมชีวการแพทย์'),(13,'ภาควิชาวิศวกรรมโทรคมนาคม'),(14,'ภาควิชาวิศวกรรมหุ่นยนต์และปัญญาประดิษฐ์');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationbackground`
--

LOCK TABLES `educationbackground` WRITE;
/*!40000 ALTER TABLE `educationbackground` DISABLE KEYS */;
INSERT INTO `educationbackground` VALUES (7,'1999-03-07','วิศวกรรมศาสตร์','ปริญญาตรี','มหาวิทยาลัยพะเยา','วิศวกรรมคอมพิวเตอร์','c913583b-5229-4ff3-a38a-81e379ea18ac'),(8,'1997-04-15','วิทยาศาสตร์','ปริญญาตรี','มหาวิทยาลัยมหิดล','ฟิสิกส์ประยุกต์','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(9,'2035-01-02','Engineering','Bachelor of Science','University A','Computer Engineering','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(10,'2035-01-02','Science','Master of Science','University B','Physics','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (3,'บริษัทโพนทองจำกัดมหาชน','2013-12-31','2019-01-01','ทำงานแผนกวิจัยและพัฒนา','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','Software Engineer'),(4,'บริษัท Geek Gadget','2015-02-03','2019-05-01','ทำงานในแผน Marketing','c913583b-5229-4ff3-a38a-81e379ea18ac','Sale Engineer');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (5,'การใช้วิเคาระห์ความเสียหายของไร่มันสำปะหลังโดยใช้ AI','2023-07-01',2,'ศึกษาการใช้ AI ในการเคาระห์ความเสียหายของไร่มันสำปะหลัง','IEEE','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','นานาชาติ','SJR','http://ai-journal','doi-789','Q1',NULL),(6,'เครื่องวัดความสูงกึ่งอัตโนมัติ','2022-01-15',2,'ออกแบบและสร้างเครื่องมือวัดความสูงแบบกึ่งอัตโนมัติ','ECTI-CARD','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','ชาติ','TCI','http://marketing-journal','doi-101112','Q2',NULL),(8,'tessadasdasdasdt','2023-05-10',1,'test','test','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','test','test','test','tesasdasdasdat','test',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otherproject`
--

LOCK TABLES `otherproject` WRITE;
/*!40000 ALTER TABLE `otherproject` DISABLE KEYS */;
INSERT INTO `otherproject` VALUES (3,'อุปกรณ์บันทึกการเปิดปิดตู้เย็นแบบ IoT','อุปกรณ์ที่สามารถบันทึกข้อมูลการเปิดปิดตู้เย็นลงบน Micro SD Card','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(4,'เครื่องวัดขนาดผลส้มอัตโนมัติ','อุปกรณ์วัดขนาดผลส้มด้วยอิฟราเรดแสดงผลผ่าน Microcontroller','c913583b-5229-4ff3-a38a-81e379ea18ac'),(7,'test','teste','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceeding`
--

LOCK TABLES `proceeding` WRITE;
/*!40000 ALTER TABLE `proceeding` DISABLE KEYS */;
INSERT INTO `proceeding` VALUES (3,'การเก็บข้อมูลผลมะม่วงโดยใช้  RFID','2019-05-10',1,'บันทึกข้อมูลทุเรียนนโดยใช้เทคโนโลยี RFID','KMITL','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','ชาติ','TCI','http://conference-url','doi-123',NULL),(4,'เครื่องวัดรังสีด้วย Peltier Electric','2019-08-20',1,'ใช้ Peltier Electric เพื่อสร้าง Cloud Chamber','KMITL','c913583b-5229-4ff3-a38a-81e379ea18ac','ชาติ','TCI','http://marketing-conference','doi-456',NULL),(5,'1','2023-05-10',2,'asdasd','asdasd','3b6f8ddc-7041-4669-b8cc-035f78d538ba','sadsad','asdsad','dasd','dsad','sdadasd');
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
INSERT INTO `professor` VALUES ('2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','สมหญิง','ใจดี','1975-10-20','Female','somying@example.com','0987654321','E12-1010 อาคารเรียนรวม 12 ชั้น',2,'Jaidi','Somying'),('3b6f8ddc-7041-4669-b8cc-035f78d538ba','กุศล','ต๊ะ','1975-10-20','Male','kusonta4411@gmail,com','0919804288','อาคารเรียนรวม 12 ชั้น',2,'Ta','Kuson'),('c913583b-5229-4ff3-a38a-81e379ea18ac','สมชาย','ใจดี','1980-05-15','Male','somchai@example.com','0919999991','E12-1009 อาคารเรียนรวม 12 ชั้น',1,'Jaidi','Somchai');
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
  `TitleName` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `ProgramName` varchar(255) DEFAULT NULL,
  `RevisedYear` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'วศ .บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมการวัดคุม','2560'),(2,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมการวัดคุม (ต่อเนื่อง)','2563'),(3,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอัตโนมัติ','2560'),(4,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมระบบควบคุม','2559'),(5,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมแมคคาทรอนิกส์','2560'),(6,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเมคคาทรอนิกส์และออโตเมชัน','2563'),(7,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์','2560'),(8,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ต่อเนื่อง)','2560'),(9,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์','2564'),(10,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ต่อเนื่อง)','2564'),(11,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมสารสนเทศ','2560'),(12,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมดนตรีและสื่อประสม','2557'),(13,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมระบบไอโอทีและสารสนเทศ','2565'),(14,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเครื่องกล','2554'),(15,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเครื่องกล','2560'),(16,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเครื่องกล','2565'),(17,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมขนส่งทางราง','2556'),(18,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมขนส่งทางราง','2561'),(19,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมขนส่งทางราง','2566'),(20,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเคมี','2554'),(21,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเคมี','2560'),(22,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเคมี','2563'),(23,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมปิโตรเคมี','2556'),(24,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมปิโตรเคมี','2561'),(25,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมไฟฟ้า','2554'),(26,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมไฟฟ้า','2560'),(27,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมไฟฟ้า','2565'),(28,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมพลังงานไฟฟ้า','2554'),(29,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอุตสาหการ','2554'),(30,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอุตสาหการ','2560'),(31,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอุตสาหการ','2563'),(32,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมออกแบบการผลิตและวัสดุ','2558'),(33,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมการผลิตเชิงบูรณาการ','2566'),(34,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอาหาร','2554'),(35,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอาหาร','2560'),(36,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอาหาร','2564'),(37,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอิเล็กทรอนิกส์','2554'),(38,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอิเล็กทรอนิกส์','2554'),(39,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอิเล็กทรอนิกส์','2563'),(40,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโทรคมนาคม','2554'),(41,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโทรคมนาคม','2560'),(42,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑติ สาขาวิชาวิศวกรรมโทรคมนาคมและโครงข่าย','2563'),(43,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมไฟฟ้าสื่อสารและอิเล็กทรอนิกส์ (ต่อเนื่อง)','2566'),(44,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมไฟฟ้าสื่อสารและเครือข่าย','2566'),(45,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมอวกาศและภูมิสารสนเทศ','2567'),(46,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโยธา','2554'),(47,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโยธา','2560'),(48,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโยธา','2563'),(49,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโยธา (ต่อเนื่อง)','2560'),(50,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมโยธา (ต่อเนื่อง)','2565'),(51,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเกษตร','2554'),(52,'วศ.บ.','วิศวรรมศาสตรบัณฑิต',' วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมเกษตร','2560'),(53,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมระบบอุตสาหกรรมการเกษตร (ต่อเนื่อง)','2560'),(54,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมระบบอุตสาหกรรมการเกษตร (ต่อเนื่อง)','2565'),(55,'วศ.บ.','วิศวรรมศาสตรบัณฑิต','วิศวกรรมศาสตรบัณฑิต วิศวกรรมเกษตรอัจฉริยะ','2563'),(56,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Biomedical Engineering','2560'),(57,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Biomedical Engineering','2563'),(58,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Biomedical Engineering','2565'),(59,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Software Engineering','2560'),(60,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Software Engineering','2565'),(61,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Computer Engineering','2565'),(62,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Mechanical Engineering','2562'),(63,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Mechanical Engineering','2565'),(64,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Chemical Engineering','2560'),(65,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Chemical Engineering','2563'),(66,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Civil Engineering','2560'),(67,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Civil Engineering','2563'),(68,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Engineering Management and Entrepreneurship','2563'),(69,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Industrial Engineering and Digital Management Systems','2562'),(70,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Industrial Engineering and Logistics Management','2563'),(71,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Financial Engineering','2562'),(72,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Computer Innovation Engineering','2560'),(73,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Robotics and Artificial Intelligence Engineering','2561'),(74,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Energy Engineering','2562'),(75,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Energy Engineering','2564'),(76,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Energy Engineering','2565'),(77,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Robotics and Artificial Intelligence Engineering','2563'),(78,'B.Eng.','Bachelor of Engineering','Bachelor of Engineering in Electrical Engineering','2562');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (3,'การศึกษา Stereo Vision เพื่อใช้ในการสร้าง Deep Map','2023-03-01','เพื่อสร้าง Deep Map ใน Multiverse','Project Manager','c913583b-5229-4ff3-a38a-81e379ea18ac','หน่วยงานรัฐบาล','สถาบันอุดมศึกษา','2025-03-01',50000),(4,'การสร้างอุปกรณ์ตรวจจับการสำลักอาหาร','2023-04-15','เพื่อสร้างอุปการณ์ตรวจจับการสำลักอาหารเพื่อผู้ป่วยที่มีภาวะกลืนลำบาก','Project Manager','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','หน่วยงานรัฐบาล','สำนักงานคณะกรรมการวิจัยแห่งชาติ','2024-12-31',100000);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchinteresttopic`
--

LOCK TABLES `researchinteresttopic` WRITE;
/*!40000 ALTER TABLE `researchinteresttopic` DISABLE KEYS */;
INSERT INTO `researchinteresttopic` VALUES (5,'Artificial Intelligence','เทคโนโลยีปัญญาประดิษฐ์','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(6,'Deep Learning','Deep Learning','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(7,'Computer Vision','Computervision Stereo Vision','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6'),(8,'IoT','Internet of things','c913583b-5229-4ff3-a38a-81e379ea18ac'),(9,'Electronics','วงจรอิเล็กทรอนิกส์และเซนเซอร์','c913583b-5229-4ff3-a38a-81e379ea18ac');
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
INSERT INTO `studentadvisor` VALUES ('2e76190e-8eb5-49c1-b47f-b66f6a33d2e6',10,5,5,2),('c913583b-5229-4ff3-a38a-81e379ea18ac',8,3,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingexperience`
--

LOCK TABLES `trainingexperience` WRITE;
/*!40000 ALTER TABLE `trainingexperience` DISABLE KEYS */;
INSERT INTO `trainingexperience` VALUES (5,'การอบรม AI เบื้องต้น','คณะวิศวกรรมศาสตร์ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง','2023-01-15','2023-01-17','2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','http://kmitl-workshop-url'),(6,'การอบรมพื้นฐาน PLC','คณะวิศวกรรมศาสตร์ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง','2023-02-12','2023-02-15','c913583b-5229-4ff3-a38a-81e379ea18ac','http://kmitl-workshop-url');
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
  `TypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'มีผลงานนำเสนอในที่ประชุมวิชาการ/วิชาชีพ ที่สภาวิชาการรับรอง และมีผลงานเรื่องเต็มตีพิมพ์ใน Proceeding'),(2,'Proceeding ตีพิมพ์ในฐานข้อมูล Scopus'),(3,'Reasearch paper/Review article'),(4,'Short  communication/Note');
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
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `ProfessorID` (`ProfessorID`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`ProfessorID`) REFERENCES `professor` (`ProfessorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (5,'2e76190e-8eb5-49c1-b47f-b66f6a33d2e6','admin','$2b$10$9Q1DSCkgoUKFHjV9quXEaOzzUGZpQnyK438gB4r49Fmzmmi6w1Qrq','kuson111@gmail.com','admin');
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

-- Dump completed on 2024-02-28 23:26:50
