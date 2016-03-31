-- MySQL dump 10.13  Distrib 5.6.22, for Win64 (x86_64)
--
-- Host: localhost    Database: clothing_store
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contains` (
  `quantity` int(7) NOT NULL,
  `SkuNumber` int(25) NOT NULL,
  `OrderId` int(7) NOT NULL,
  KEY `SkuNumber` (`SkuNumber`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`SkuNumber`) REFERENCES `product` (`SkuNumber`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `placedorder` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `email` char(60) NOT NULL,
  `Fname` char(24) NOT NULL,
  `Lname` char(60) NOT NULL,
  `Password` char(20) NOT NULL,
  `DateOfBirth` char(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerphonenumber`
--

DROP TABLE IF EXISTS `customerphonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerphonenumber` (
  `email` char(60) NOT NULL,
  `PhoneNumber` int(15) NOT NULL,
  KEY `email` (`email`),
  CONSTRAINT `customerphonenumber_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerphonenumber`
--

LOCK TABLES `customerphonenumber` WRITE;
/*!40000 ALTER TABLE `customerphonenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerphonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placedorder`
--

DROP TABLE IF EXISTS `placedorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placedorder` (
  `TrackingNumber` int(7) NOT NULL,
  `OrderId` int(7) NOT NULL,
  `PaymentMethod` text NOT NULL,
  `ShippingAddress` char(160) DEFAULT NULL,
  `BillingAddress` char(160) NOT NULL,
  `email` char(60) NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `email` (`email`),
  CONSTRAINT `placedorder_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customer` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placedorder`
--

LOCK TABLES `placedorder` WRITE;
/*!40000 ALTER TABLE `placedorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `placedorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `SkuNumber` int(25) NOT NULL,
  `Size` char(10) NOT NULL,
  `Gender` char(6) NOT NULL,
  `TypeOfClothing` char(25) NOT NULL,
  `OnHand` char(1) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SkuNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productview`
--

DROP TABLE IF EXISTS `productview`;
/*!50001 DROP VIEW IF EXISTS `productview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `productview` AS SELECT 
 1 AS `SkuNumber`,
 1 AS `Size`,
 1 AS `Gender`,
 1 AS `TypeOfClothing`,
 1 AS `OnHand`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `productview`
--

/*!50001 DROP VIEW IF EXISTS `productview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productview` AS select `product`.`SkuNumber` AS `SkuNumber`,`product`.`Size` AS `Size`,`product`.`Gender` AS `Gender`,`product`.`TypeOfClothing` AS `TypeOfClothing`,`product`.`OnHand` AS `OnHand`,`product`.`Price` AS `Price` from `product` */;
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

-- Dump completed on 2016-03-31 12:30:03
