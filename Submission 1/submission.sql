-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: ShuttleGo
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Table structure for table `Authorities`
--

DROP TABLE IF EXISTS `Authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authorities` (
  `AuthorityID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`AuthorityID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authorities`
--

LOCK TABLES `Authorities` WRITE;
/*!40000 ALTER TABLE `Authorities` DISABLE KEYS */;
INSERT INTO `Authorities` VALUES (1,'Admin One','admin1@example.com','password123'),(2,'Admin Two','admin2@example.com','securepass'),(3,'Support Staff','support@example.com','helpline');
/*!40000 ALTER TABLE `Authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boarding`
--

DROP TABLE IF EXISTS `Boarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boarding` (
  `BookingID` int NOT NULL,
  `JourneyID` int NOT NULL,
  `JourneyDate` date NOT NULL,
  `Boarded` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `JourneyID` (`JourneyID`),
  CONSTRAINT `Boarding_ibfk_1` FOREIGN KEY (`JourneyID`) REFERENCES `Schedule` (`JourneyID`),
  CONSTRAINT `Boarding_ibfk_2` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boarding`
--

LOCK TABLES `Boarding` WRITE;
/*!40000 ALTER TABLE `Boarding` DISABLE KEYS */;
INSERT INTO `Boarding` VALUES (1,1,'2025-03-01',1),(2,2,'2025-03-01',1),(3,3,'2025-03-01',0),(4,4,'2025-03-01',1),(5,5,'2025-03-01',0),(6,6,'2025-03-01',1),(7,7,'2025-03-01',1),(8,8,'2025-03-01',0),(9,9,'2025-03-01',1),(10,10,'2025-03-01',1),(11,1,'2025-03-02',1),(12,2,'2025-03-02',0),(13,3,'2025-03-02',1);
/*!40000 ALTER TABLE `Boarding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `JourneyID` int NOT NULL,
  `UserID` int NOT NULL,
  `Seat` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `JourneyID` (`JourneyID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`JourneyID`) REFERENCES `Schedule` (`JourneyID`),
  CONSTRAINT `Bookings_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `Passenger` (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,1,1,10),(2,2,2,15),(3,3,3,20),(4,4,4,25),(5,5,5,30),(6,6,6,5),(7,7,7,12),(8,8,8,18),(9,9,9,22),(10,10,10,35),(11,1,11,8),(12,2,12,14),(13,3,13,21),(14,4,14,27),(15,5,15,33);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bus`
--

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bus` (
  `BusID` int NOT NULL AUTO_INCREMENT,
  `BusRegistrationNumber` varchar(11) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`BusID`),
  UNIQUE KEY `BusRegistrationNumber` (`BusRegistrationNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
INSERT INTO `Bus` VALUES (1,'GJ05BP1234',50),(2,'GJ05CQ5678',45),(3,'GJ05DR9012',55),(4,'GJ05ES3456',40),(5,'GJ05FT7890',60),(6,'GJ05GU2345',48),(7,'GJ05HV6789',52),(8,'GJ05IW0123',47),(9,'GJ05JX4567',58),(10,'GJ05KY8901',43);
/*!40000 ALTER TABLE `Bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Driver` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `DriverName` varchar(255) NOT NULL,
  `DriverMobileNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (1,'Rajesh Patel','9988776655'),(2,'Amit Sharma','8877665544'),(3,'Suresh Verma','7766554433'),(4,'Deepak Yadav','6655443322'),(5,'Kiran Joshi','5544332211'),(6,'Vikram Singh','9876123450'),(7,'Pooja Reddy','8765098761'),(8,'Arjun Iyer','7654987652'),(9,'Sneha Menon','6543876543'),(10,'Rohit Joshi','5432765434');
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `BusID` int NOT NULL,
  `FeedbackText` text,
  `Rating` int DEFAULT NULL,
  `FeedbackDate` date NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `UserID` (`UserID`),
  KEY `BusID` (`BusID`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Passenger` (`PassengerID`),
  CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`BusID`) REFERENCES `Bus` (`BusID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (1,1,1,'Comfortable ride, but bus was late.',4,'2025-02-28'),(2,2,2,'Excellent service, on time and clean.',5,'2025-02-28'),(3,3,3,'The driver was very helpful.',4,'2025-02-27'),(4,4,4,'Too crowded, need more buses.',3,'2025-02-27'),(5,5,5,'Good experience overall.',4,'2025-02-26'),(6,6,1,'Uncomfortable seats.',2,'2025-02-26'),(7,7,2,'AC was not working.',1,'2025-02-25'),(8,8,3,'Safe and reliable.',5,'2025-02-25'),(9,9,4,'Bus stopped too frequently.',3,'2025-02-24'),(10,10,5,'Pleasant journey.',4,'2025-02-24');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LiveLocation`
--

DROP TABLE IF EXISTS `LiveLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LiveLocation` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `BusID` int NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `LastUpdatedTime` time DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  KEY `BusID` (`BusID`),
  CONSTRAINT `LiveLocation_ibfk_1` FOREIGN KEY (`BusID`) REFERENCES `Bus` (`BusID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LiveLocation`
--

LOCK TABLES `LiveLocation` WRITE;
/*!40000 ALTER TABLE `LiveLocation` DISABLE KEYS */;
INSERT INTO `LiveLocation` VALUES (1,1,23.05,72.58,'07:15:00'),(2,2,23.21,72.64,'08:10:00'),(3,3,23,72.5,'09:20:00'),(4,4,23.1,72.55,'10:15:00'),(5,5,23.15,72.6,'11:25:00'),(6,6,1.05,2.58,'17:15:00'),(7,7,2.21,2.64,'18:10:00'),(8,8,3,2.5,'19:20:00'),(9,9,4.1,2.55,'20:15:00'),(10,10,5.15,2.6,'21:25:00');
/*!40000 ALTER TABLE `LiveLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Members` (
  `Member_ID` decimal(8,0) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Image` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Contact_Number` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
INSERT INTO `Members` VALUES (22110016,'Aditya Mangla','MemberPhotos/Aditya.jpg',21,'aditya.mangla@iitgn.ac.in',9971815304),(22110103,'Jaidev Khalane','MemberPhotos/Jaidev.jpg',20,'jaidev.khalale@iitgn.ac.in',9515630148),(22110197,'Pranav Joshi','MemberPhotos/Pranav.jpg',20,'pranav.joshi@iitgn.ac.in',8698955551),(22110270,'Tapananshu Gandhi','MemberPhotos/Tapananshu.jpg',20,'tapananshu.gandhi@iitgn.ac.in',9303676510),(22110279,'Vannsh Jani','MemberPhotos/Vansh.jpg',22,'vannsh.jani@iitgn.ac.in',9108944400);
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Image` blob,
  `DateOfBirth` date NOT NULL,
  `IITGNEmail` varchar(255) NOT NULL,
  `MobileNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `IITGNEmail` (`IITGNEmail`),
  CONSTRAINT `Passenger_chk_1` CHECK (((`IITGNEmail` like _utf8mb4'%@iitgn.ac.in') and (not((`IITGNEmail` like _utf8mb4'% %')))))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (1,'Alice Sharma',NULL,'2000-05-15','alice.sharma@iitgn.ac.in','9876543210'),(2,'Bob Patel',NULL,'1999-12-01','bob.patel@iitgn.ac.in','8765432109'),(3,'Charlie Singh',NULL,'2001-03-10','charlie.singh@iitgn.ac.in','7654321098'),(4,'David Kumar',NULL,'2000-08-22','david.kumar@iitgn.ac.in','6543210987'),(5,'Eva Reddy',NULL,'2002-01-05','eva.reddy@iitgn.ac.in','5432109876'),(6,'Fiona Iyer',NULL,'1999-07-18','fiona.iyer@iitgn.ac.in','4321098765'),(7,'George Menon',NULL,'2001-11-29','george.menon@iitgn.ac.in','3210987654'),(8,'Hannah Joshi',NULL,'2000-04-03','hannah.joshi@iitgn.ac.in','2109876543'),(9,'Ian Thomas',NULL,'2002-09-14','ian.thomas@iitgn.ac.in','1098765432'),(10,'Julie Wilson',NULL,'1999-06-25','julie.wilson@iitgn.ac.in','9087654321'),(11,'Karan Patel',NULL,'2001-12-12','karan.patel@iitgn.ac.in','8076543210'),(12,'Neha Sharma',NULL,'2000-02-28','neha.sharma@iitgn.ac.in','7065432109'),(13,'Vikram Singh',NULL,'2002-07-04','vikram.singh@iitgn.ac.in','6054321098'),(14,'Priya Kumar',NULL,'1999-09-21','priya.kumar@iitgn.ac.in','5043210987'),(15,'Aryan Reddy',NULL,'2001-05-08','aryan.reddy@iitgn.ac.in','4032109876');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Penalty`
--

DROP TABLE IF EXISTS `Penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Penalty` (
  `PenaltyID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `NumberOfMisses` int NOT NULL,
  `PenaltyAmount` int NOT NULL,
  `PenaltyDate` date DEFAULT NULL,
  PRIMARY KEY (`PenaltyID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Penalty_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Passenger` (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Penalty`
--

LOCK TABLES `Penalty` WRITE;
/*!40000 ALTER TABLE `Penalty` DISABLE KEYS */;
INSERT INTO `Penalty` VALUES (1,1,2,50,'2025-02-25'),(2,3,1,25,'2025-02-25'),(3,5,3,75,'2025-02-25'),(4,7,1,25,'2025-02-26'),(5,9,2,50,'2025-02-26'),(6,11,4,100,'2025-02-26'),(7,2,1,25,'2025-02-27'),(8,4,2,50,'2025-02-27'),(9,6,3,75,'2025-02-27'),(10,8,1,25,'2025-02-28');
/*!40000 ALTER TABLE `Penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReturnCode`
--

DROP TABLE IF EXISTS `ReturnCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReturnCode` (
  `val` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReturnCode`
--

LOCK TABLES `ReturnCode` WRITE;
/*!40000 ALTER TABLE `ReturnCode` DISABLE KEYS */;
INSERT INTO `ReturnCode` VALUES (1);
/*!40000 ALTER TABLE `ReturnCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `RouteID` int NOT NULL,
  `StartLocation` varchar(255) NOT NULL,
  `EndLocation` varchar(255) NOT NULL,
  `IntermediateLocations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES (101,'IITGN','Ahmedabad Airport','Chandkheda, Motera'),(102,'IITGN','Gandhinagar Sector 16','PDPU, Sargasan'),(103,'IITGN','Kalupur Railway Station','Infocity, Naroda'),(104,'IITGN','Vishwakarma Government Engineering College','Sabarmati, RTO Circle'),(105,'IITGN','NID','Paldi, Ashram Road'),(201,'Ahmedabad Airport','IITGN','Motera, Chandkheda'),(202,'Gandhinagar Sector 16','IITGN','Sargasan, PDPU'),(203,'Kalupur Railway Station','IITGN','Naroda, Infocity'),(204,'Vishwakarma Government Engineering College','IITGN','RTO Circle, Sabarmati'),(205,'NID','IITGN','Ashram Road, Paldi');
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedule` (
  `JourneyID` int NOT NULL AUTO_INCREMENT,
  `BusID` int DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  `RouteID` int DEFAULT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `DepartureDay` date NOT NULL,
  PRIMARY KEY (`JourneyID`),
  KEY `BusID` (`BusID`),
  KEY `DriverID` (`DriverID`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`BusID`) REFERENCES `Bus` (`BusID`),
  CONSTRAINT `Schedule_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `Driver` (`DriverID`),
  CONSTRAINT `Schedule_ibfk_3` FOREIGN KEY (`RouteID`) REFERENCES `Route` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
INSERT INTO `Schedule` VALUES (1,1,1,101,'07:00:00','08:30:00','2025-03-01'),(2,2,2,102,'08:00:00','09:00:00','2025-03-01'),(3,3,3,103,'09:00:00','10:30:00','2025-03-01'),(4,4,4,104,'10:00:00','11:00:00','2025-03-01'),(5,5,5,105,'11:00:00','12:30:00','2025-03-01'),(6,6,6,201,'17:00:00','18:30:00','2025-03-01'),(7,7,7,202,'18:00:00','19:00:00','2025-03-01'),(8,8,8,203,'19:00:00','20:30:00','2025-03-01'),(9,9,9,204,'20:00:00','21:00:00','2025-03-01'),(10,10,10,205,'21:00:00','22:30:00','2025-03-01'),(11,1,2,101,'07:30:00','09:00:00','2025-03-02'),(12,2,3,102,'08:30:00','09:30:00','2025-03-02');
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `TicketID` varchar(255) NOT NULL,
  `BookingID` int NOT NULL,
  `Departure_Date` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time DEFAULT NULL,
  `SeatNumber` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TicketID`),
  UNIQUE KEY `BookingID` (`BookingID`),
  CONSTRAINT `Tickets_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES ('TKT001',1,'2025-03-01','07:00:00','08:30:00',10,'2025-02-28 15:38:11'),('TKT002',2,'2025-03-01','08:00:00','09:00:00',15,'2025-02-28 15:38:11'),('TKT003',3,'2025-03-01','09:00:00','10:30:00',20,'2025-02-28 15:38:11'),('TKT004',4,'2025-03-01','10:00:00','11:00:00',25,'2025-02-28 15:38:11'),('TKT005',5,'2025-03-01','11:00:00','12:30:00',30,'2025-02-28 15:38:11'),('TKT006',6,'2025-03-01','17:00:00','18:30:00',5,'2025-02-28 15:38:11'),('TKT007',7,'2025-03-01','18:00:00','19:00:00',12,'2025-02-28 15:38:11'),('TKT008',8,'2025-03-01','19:00:00','20:30:00',18,'2025-02-28 15:38:11'),('TKT009',9,'2025-03-01','20:00:00','21:00:00',22,'2025-02-28 15:38:11'),('TKT010',10,'2025-03-01','21:00:00','22:30:00',35,'2025-02-28 15:38:11'),('TKT011',11,'2025-03-02','07:00:00','08:30:00',8,'2025-02-28 15:38:11'),('TKT012',12,'2025-03-02','08:00:00','09:00:00',14,'2025-02-28 15:38:11');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rn`
--

DROP TABLE IF EXISTS `rn`;
/*!50001 DROP VIEW IF EXISTS `rn`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rn` AS SELECT 
 1 AS `NOW()`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `today`
--

DROP TABLE IF EXISTS `today`;
/*!50001 DROP VIEW IF EXISTS `today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `today` AS SELECT 
 1 AS `DATE(NOW())`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tommorrow`
--

DROP TABLE IF EXISTS `tommorrow`;
/*!50001 DROP VIEW IF EXISTS `tommorrow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tommorrow` AS SELECT 
 1 AS `DATE(NOW()) + INTERVAL 1 DAY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tommorrow_schedule`
--

DROP TABLE IF EXISTS `tommorrow_schedule`;
/*!50001 DROP VIEW IF EXISTS `tommorrow_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tommorrow_schedule` AS SELECT 
 1 AS `JourneyID`,
 1 AS `BusID`,
 1 AS `DriverID`,
 1 AS `RouteID`,
 1 AS `StartTime`,
 1 AS `EndTime`,
 1 AS `DepartureDay`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `rn`
--

/*!50001 DROP VIEW IF EXISTS `rn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rn` AS select now() AS `NOW()` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `today`
--

/*!50001 DROP VIEW IF EXISTS `today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `today` AS select cast(now() as date) AS `DATE(NOW())` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tommorrow`
--

/*!50001 DROP VIEW IF EXISTS `tommorrow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tommorrow` AS select (cast(now() as date) + interval 1 day) AS `DATE(NOW()) + INTERVAL 1 DAY` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tommorrow_schedule`
--

/*!50001 DROP VIEW IF EXISTS `tommorrow_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tommorrow_schedule` AS select `Schedule`.`JourneyID` AS `JourneyID`,`Schedule`.`BusID` AS `BusID`,`Schedule`.`DriverID` AS `DriverID`,`Schedule`.`RouteID` AS `RouteID`,`Schedule`.`StartTime` AS `StartTime`,`Schedule`.`EndTime` AS `EndTime`,`Schedule`.`DepartureDay` AS `DepartureDay` from `Schedule` where (`Schedule`.`DepartureDay` = (select `tommorrow`.`DATE(NOW()) + INTERVAL 1 DAY` from `tommorrow`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 21:11:29
