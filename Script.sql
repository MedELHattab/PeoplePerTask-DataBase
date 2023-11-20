CREATE DATABASE  IF NOT EXISTS `peoplepertask` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `peoplepertask`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: peoplepertask
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `Categorie_ID` int NOT NULL AUTO_INCREMENT,
  `Categorie_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Categorie_ID`),
  UNIQUE KEY `Categorie_ID` (`Categorie_ID`),
  UNIQUE KEY `Categorie_Name` (`Categorie_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'AI'),(1,'Category1'),(2,'Category2'),(6,'UI'),(3,'UX'),(4,'Web Development');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancers`
--

DROP TABLE IF EXISTS `freelancers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freelancers` (
  `Freelancer_ID` int NOT NULL AUTO_INCREMENT,
  `Freelancer_Name` varchar(50) DEFAULT NULL,
  `Competances` varchar(50) DEFAULT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Freelancer_ID`),
  UNIQUE KEY `Freelancer_ID` (`Freelancer_ID`),
  UNIQUE KEY `Freelancer_Name` (`Freelancer_Name`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `freelancers_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancers`
--

LOCK TABLES `freelancers` WRITE;
/*!40000 ALTER TABLE `freelancers` DISABLE KEYS */;
INSERT INTO `freelancers` VALUES (3,'Freelancer1','Skills for Freelancer1',7),(4,'Freelancer2','Skills for Freelancer2',8),(5,'Mohammed','JEE',7),(6,'Yassir','Phyton',8),(7,'Wissal','UI',8);
/*!40000 ALTER TABLE `freelancers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `Offer_ID` int NOT NULL AUTO_INCREMENT,
  `Amount` int DEFAULT NULL,
  `Deadline` int DEFAULT NULL,
  `Project_ID` int NOT NULL,
  `Freelancer_ID` int NOT NULL,
  PRIMARY KEY (`Offer_ID`),
  UNIQUE KEY `Offer_ID` (`Offer_ID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `Freelancer_ID` (`Freelancer_ID`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `projects` (`Project_ID`),
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`Freelancer_ID`) REFERENCES `freelancers` (`Freelancer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (5,100,20231130,3,3),(6,200,20231215,4,4);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `Project_ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Project_Description` varchar(200) DEFAULT NULL,
  `Categorie_ID` int NOT NULL,
  `SousCategorie_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Project_ID`),
  UNIQUE KEY `Project_ID` (`Project_ID`),
  KEY `Categorie_ID` (`Categorie_ID`),
  KEY `SousCategorie_ID` (`SousCategorie_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`Categorie_ID`) REFERENCES `categories` (`Categorie_ID`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`SousCategorie_ID`) REFERENCES `souscategories` (`SousCategorie_ID`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (3,'Project1','Description for Project1',1,1,7),(4,'Project2','Description for Project2',2,2,8),(5,'peoplepertask','Description for Project1',5,1,7),(6,'SwiftFix','Description for Project2',5,2,8);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souscategories`
--

DROP TABLE IF EXISTS `souscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `souscategories` (
  `SousCategorie_ID` int NOT NULL AUTO_INCREMENT,
  `SousCategorie_Name` varchar(50) DEFAULT NULL,
  `Categorie_ID` int NOT NULL,
  PRIMARY KEY (`SousCategorie_ID`),
  UNIQUE KEY `SousCategorie_ID` (`SousCategorie_ID`),
  KEY `Categorie_ID` (`Categorie_ID`),
  CONSTRAINT `souscategories_ibfk_1` FOREIGN KEY (`Categorie_ID`) REFERENCES `categories` (`Categorie_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souscategories`
--

LOCK TABLES `souscategories` WRITE;
/*!40000 ALTER TABLE `souscategories` DISABLE KEYS */;
INSERT INTO `souscategories` VALUES (1,'Subcategory1',1),(2,'Subcategory2',2);
/*!40000 ALTER TABLE `souscategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `Testimonial_ID` int NOT NULL AUTO_INCREMENT,
  `Comment` varchar(100) DEFAULT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Testimonial_ID`),
  UNIQUE KEY `Testimonial_ID` (`Testimonial_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Very skilled freelancer!',7),(2,'Great work!',8),(3,'very interesting',7),(4,'Good job',8);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) DEFAULT NULL,
  `Hashed_Password` varchar(255) DEFAULT NULL,
  `Email_Address` varchar(100) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_ID` (`User_ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email_Address` (`Email_Address`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'user1','hashed_password_1','user1@example.com',123457890),(8,'user2','hashed_password_2','user2@example.com',987643210);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 15:55:59
