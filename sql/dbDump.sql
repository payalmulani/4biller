-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: appbill
-- ------------------------------------------------------
-- Server version	5.4.1-beta-community-log

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
-- Current Database: `appbill`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `appbill` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `appbill`;

--
-- Table structure for table `billitem`
--

DROP TABLE IF EXISTS `billitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billitem` (
  `INVOICEID` bigint(16) DEFAULT NULL,
  `ITEMID` bigint(16) DEFAULT NULL,
  `QUANTITY` double(16,0) DEFAULT NULL,
  `RATE` double(16,2) DEFAULT NULL,
  `AMOUNT` double(26,2) DEFAULT NULL,
  `billitemno` bigint(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billitemno`),
  KEY `FKBILLITEMID` (`ITEMID`),
  KEY `FKBILLITEMINVOICEID` (`INVOICEID`),
  CONSTRAINT `FKBILLITEMID` FOREIGN KEY (`ITEMID`) REFERENCES `itemm` (`itemId`),
  CONSTRAINT `FKBILLITEMINVOICEID` FOREIGN KEY (`INVOICEID`) REFERENCES `clientbillt` (`INVOICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billitem`
--

LOCK TABLES `billitem` WRITE;
/*!40000 ALTER TABLE `billitem` DISABLE KEYS */;
INSERT INTO `billitem` VALUES (3,1,1,111.00,111.00,4);
/*!40000 ALTER TABLE `billitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientbillt`
--

DROP TABLE IF EXISTS `clientbillt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientbillt` (
  `INVOICEID` bigint(16) NOT NULL DEFAULT '0',
  `CLIENTID` bigint(16) DEFAULT NULL,
  `BILLDATE` date DEFAULT NULL,
  `AMOUNT` double(16,2) DEFAULT NULL,
  `STAX` double(16,2) DEFAULT NULL,
  `NETAMOUNT` double(16,2) DEFAULT NULL,
  `MODIFIEDBY` varchar(16) DEFAULT NULL,
  `MODIFIEDON` date DEFAULT NULL,
  `CREATEDBY` varchar(16) DEFAULT NULL,
  `CREATEDON` date DEFAULT NULL,
  PRIMARY KEY (`INVOICEID`),
  KEY `FKClientBillTClientId` (`CLIENTID`),
  CONSTRAINT `FKClientBillTClientId` FOREIGN KEY (`CLIENTID`) REFERENCES `clients` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientbillt`
--

LOCK TABLES `clientbillt` WRITE;
/*!40000 ALTER TABLE `clientbillt` DISABLE KEYS */;
INSERT INTO `clientbillt` VALUES (3,1,'2012-06-26',111.00,0.00,111.00,'','2012-06-26','','2012-06-26');
/*!40000 ALTER TABLE `clientbillt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `clientId` bigint(20) NOT NULL,
  `ClientName` varchar(32) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ContactNo` bigint(20) DEFAULT NULL,
  `WebSite` varchar(32) DEFAULT NULL,
  `Email` varchar(32) DEFAULT NULL,
  `Status` varchar(1) DEFAULT NULL,
  `ModifiedBy` varchar(16) DEFAULT NULL,
  `ModifiedOn` date DEFAULT NULL,
  `CreatedBy` varchar(16) DEFAULT NULL,
  `CreatedOn` date DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'GR','AHMEDABAD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemm`
--

DROP TABLE IF EXISTS `itemm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemm` (
  `itemId` bigint(16) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemm`
--

LOCK TABLES `itemm` WRITE;
/*!40000 ALTER TABLE `itemm` DISABLE KEYS */;
INSERT INTO `itemm` VALUES (1,'SAMSUNG 2012','1000'),(2,'Nokia','');
/*!40000 ALTER TABLE `itemm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportm`
--

DROP TABLE IF EXISTS `reportm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportm` (
  `REPORTID` bigint(16) NOT NULL DEFAULT '0',
  `TITLE` varchar(32) DEFAULT NULL,
  `FILENAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`REPORTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportm`
--

LOCK TABLES `reportm` WRITE;
/*!40000 ALTER TABLE `reportm` DISABLE KEYS */;
INSERT INTO `reportm` VALUES (1,'Bill','bill.jasper');
/*!40000 ALTER TABLE `reportm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserName` varchar(16) DEFAULT NULL,
  `UserPass` varchar(32) DEFAULT NULL,
  `ActiveStatus` varchar(1) DEFAULT NULL,
  `ModifiedBy` varchar(16) DEFAULT NULL,
  `ModifiedOn` date DEFAULT NULL,
  `CreatedBy` varchar(16) DEFAULT NULL,
  `CreatedOn` date DEFAULT NULL,
  `userid` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('','','A',NULL,NULL,NULL,NULL,1);
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

-- Dump completed on 2012-06-26 15:15:08
