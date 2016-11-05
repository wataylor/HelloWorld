-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: risktrakdb
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `businessunits`
--

DROP TABLE IF EXISTS `businessunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessunits` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `ContactID` char(32) NOT NULL,
  PRIMARY KEY (`UUID`),
  KEY `Users_1` (`ContactID`),
  KEY `mod11` (`ModifiedByID`),
  KEY `cre1` (`CreatedByID`),
  CONSTRAINT `Users_1` FOREIGN KEY (`ContactID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `cre1` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `mod11` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessunits`
--

LOCK TABLES `businessunits` WRITE;
/*!40000 ALTER TABLE `businessunits` DISABLE KEYS */;
INSERT INTO `businessunits` VALUES ('BU001',NULL,'2016-10-14 05:21:30','USR10',NULL,'USR10',NULL,'Title','Description','USR01'),('BU002','BU001','2016-11-05 02:51:19',NULL,NULL,NULL,NULL,'Sub-Unit Title','Sub-Unit Description','USR01');
/*!40000 ALTER TABLE `businessunits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `businessusers`
--

DROP TABLE IF EXISTS `businessusers`;
/*!50001 DROP VIEW IF EXISTS `businessusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `businessusers` AS SELECT
 1 AS `UUID`,
 1 AS `Title`,
 1 AS `Description`,
 1 AS `UMSalutation`,
 1 AS `UMFirstname`,
 1 AS `UMMiddleName`,
 1 AS `UMLastName`,
 1 AS `UMSuffix`,
 1 AS `UMPhone`,
 1 AS `UCSalutation`,
 1 AS `UCFirstname`,
 1 AS `UCMiddleName`,
 1 AS `UCLastName`,
 1 AS `UCSuffix`,
 1 AS `UCPhone`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customuserfields`
--

DROP TABLE IF EXISTS `customuserfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customuserfields` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) NOT NULL,
  `CustomUserFields` varchar(255) DEFAULT NULL,
  `CUFTypes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `creWhoCUF` (`CreatedByID`),
  KEY `modWhoCUF` (`ModifiedByID`),
  CONSTRAINT `creWhoCUF` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoCUF` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuserfields`
--

LOCK TABLES `customuserfields` WRITE;
/*!40000 ALTER TABLE `customuserfields` DISABLE KEYS */;
INSERT INTO `customuserfields` VALUES ('CUSF001',NULL,'2016-10-15 00:22:05','USR10',NULL,'USR10','PROJ1','Notes','Memo');
/*!40000 ALTER TABLE `customuserfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigationparents`
--

DROP TABLE IF EXISTS `mitigationparents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitigationparents` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RiskID` char(32) DEFAULT NULL,
  `RiskExposureCost` int(11) DEFAULT NULL,
  `RiskExposureSlip` int(11) DEFAULT NULL,
  `RiskExposurePerf` int(11) DEFAULT NULL,
  `MitigationCost` int(11) DEFAULT NULL,
  `MitigationSlip` int(11) DEFAULT NULL,
  `MitigationPerf` int(11) DEFAULT NULL,
  `MitigatedExpCost` int(11) DEFAULT NULL,
  `MitigatedExpSlip` int(11) DEFAULT NULL,
  `MitigatedExpPerf` int(11) DEFAULT NULL,
  `Calculate` int(11) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `proj` (`ProjectID`),
  KEY `parRisk` (`RiskID`),
  KEY `modWho` (`ModifiedByID`),
  KEY `creWho` (`CreatedByID`),
  CONSTRAINT `creWho` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWho` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `parRisk` FOREIGN KEY (`RiskID`) REFERENCES `risks` (`UUID`),
  CONSTRAINT `proj` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigationparents`
--

LOCK TABLES `mitigationparents` WRITE;
/*!40000 ALTER TABLE `mitigationparents` DISABLE KEYS */;
INSERT INTO `mitigationparents` VALUES ('MITPAR001',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK001',5000,15,1250,100,1,50,3100,751,59,1),('MITPAR002',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK002',0,0,0,0,0,0,0,0,0,1),('MITPAR003',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK003',5000,15,500,100,1,50,2600,8,300,1),('MITPAR004',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK004',5000,15,750,100,1,50,3100,451,59,1),('MITPAR005',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK005',0,0,0,100,1,50,3100,451,59,1),('MITPAR006',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK006',5000,15,750,0,0,0,0,0,0,1),('MITPAR007',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK007',0,0,0,0,0,0,0,0,0,1),('MITPAR008',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK008',5000,15,750,2000,4,120,2450,5,188,3),('MITPAR009',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK009',5000,15,750,1000,2,60,3500,377,68,1),('MITPAR010',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK010',5000,15,750,1000,2,60,3500,377,68,1),('MITPAR011',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK011',5000,15,750,1000,2,60,3500,377,68,1),('MITPAR012',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK012',0,0,0,1000,2,60,3500,377,68,1),('MITPAR013',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK013',5000,15,750,1000,2,60,3500,377,68,1),('MITPAR014',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK014',0,0,0,1000,2,60,3500,377,68,1),('MITPAR015',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK016',0,0,0,1000,2,60,3500,377,68,1),('MITPAR016',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK016',4000,12,600,1000,2,60,3000,302,66,1),('MITPAR017',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK017',0,0,0,1000,2,60,1000,2,60,1),('MITPAR018',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK018',0,0,0,1000,2,60,1000,2,60,1),('MITPAR019',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK019',0,0,0,1000,2,60,1000,2,60,1),('MITPAR020',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK020',0,0,0,1000,2,60,1000,2,60,1),('MITPAR021',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK021',0,0,0,0,0,0,0,0,0,1),('MITPAR022',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK022',0,0,0,0,0,0,0,0,0,1),('MITPAR023',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK023',0,0,0,0,0,0,0,0,0,1),('MITPAR024',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK024',0,0,0,0,0,0,0,0,0,1),('MITPAR025',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK025',0,0,0,0,0,0,0,0,0,1),('MITPAR026',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK026',0,0,0,0,0,0,0,0,0,1),('MITPAR027',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK027',0,0,0,0,0,0,0,0,0,1),('MITPAR028',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK028',5000,15,500,1000,2,60,3500,252,68,1),('MITPAR029',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK029',5000,15,750,100,1,50,2600,376,58,1),('MITPAR030',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK030',5000,15,500,100,1,50,2600,8,300,1),('MITPAR031',NULL,'2016-10-14 18:27:19',NULL,NULL,NULL,'PROJ1','RSK031',5000,5,500,100,1,50,2600,4,300,1);
/*!40000 ALTER TABLE `mitigationparents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigations`
--

DROP TABLE IF EXISTS `mitigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitigations` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `MitigationParentID` char(32) DEFAULT NULL,
  `MitigationTitle` varchar(255) DEFAULT NULL,
  `MitigationAction` longtext,
  `Issues` longtext,
  `EnableMitigation` tinyint(1) DEFAULT NULL,
  `Effectiveness` int(11) DEFAULT NULL,
  `CostRiskExposure` int(11) DEFAULT NULL,
  `SlipRiskExposure` int(11) DEFAULT NULL,
  `PerfRiskExposure` int(11) DEFAULT NULL,
  `CostMitigationCost` int(11) DEFAULT NULL,
  `SlipMitigationCost` int(11) DEFAULT NULL,
  `PerfMitigationCost` int(11) DEFAULT NULL,
  `CostMitigatedExposure` int(11) DEFAULT NULL,
  `SlipMitigatedExposure` int(11) DEFAULT NULL,
  `PerfMitigatedExposure` int(11) DEFAULT NULL,
  `CostAllocation` int(11) DEFAULT NULL,
  `AttachedFile` varchar(255) DEFAULT NULL,
  `LeadID` char(32) DEFAULT NULL,
  `AssigneeID` char(32) DEFAULT NULL,
  `AssignedByID` char(32) DEFAULT NULL,
  `AssignedOn` bigint(20) DEFAULT NULL,
  `ActionDate` bigint(20) DEFAULT NULL,
  `MitEffectLeast` int(11) DEFAULT '0',
  `MitEffectProbable` int(11) DEFAULT '0',
  `MitEffectBest` int(11) DEFAULT '0',
  PRIMARY KEY (`UUID`),
  KEY `projm` (`ProjectID`),
  KEY `parMit` (`MitigationParentID`),
  KEY `creWhoM` (`CreatedByID`),
  KEY `modWhoM` (`ModifiedByID`),
  CONSTRAINT `creWhoM` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoM` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `parMit` FOREIGN KEY (`MitigationParentID`) REFERENCES `mitigationparents` (`UUID`),
  CONSTRAINT `projm` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigations`
--

LOCK TABLES `mitigations` WRITE;
/*!40000 ALTER TABLE `mitigations` DISABLE KEYS */;
INSERT INTO `mitigations` VALUES ('MIT001',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR001','Mitigation C','','',1,0,5000,15,1250,100,1,50,3100,10,800,2,NULL,NULL,'USR04','USR03',989812800000,984542400000,40,50,60),('MIT002',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR003','Mitigation F','','',1,2,5000,15,500,100,1,50,2100,7,250,2,NULL,NULL,'USR04','USR07',989812800000,984542400000,40,50,60),('MIT003',NULL,'2016-10-15 02:46:10','USR03',NULL,'USR07','PROJ1','MITPAR008','New Process','','',1,0,5000,15,750,1000,2,60,5500,16,735,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,10,20,30),('MIT004',NULL,'2016-10-15 02:46:10','USR03',NULL,'USR07','PROJ1','MITPAR009','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT005',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR010','Regular Project Reviews','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT006',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR011','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT007',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR012','Regular Project Reviews','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT008',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR013','Regular Project Reviews','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT009',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR014','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT010',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR015','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT011',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR017','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT012',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR018','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT013',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR019','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT014',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR020','New Software','','',1,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT015',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR028','Regular Project Reviews','','',1,1,5000,15,500,1000,2,60,3500,10,310,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT016',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR004','Mitigation A','','',1,0,5000,15,750,100,1,50,3100,10,500,2,NULL,NULL,'USR04','USR03',989812800000,984542400000,40,50,60),('MIT017',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR005','Mitigation B','','',1,0,5000,15,750,100,1,50,3100,10,500,2,NULL,NULL,'USR04','USR03',989812800000,984542400000,40,50,60),('MIT018',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR016','Testing','','',1,1,4000,12,600,1000,2,60,3000,8,360,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,0,50,0),('MIT019',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR029','Hiring','','',1,1,5000,15,750,100,1,50,2600,8,425,2,NULL,NULL,'USR02','USR07',989812800000,984542400000,40,50,60),('MIT020',NULL,'2016-10-15 02:46:10','USR03',NULL,'USR07','PROJ1','MITPAR030','Mitigation D','','',1,1,5000,15,500,100,1,50,2600,4,300,2,NULL,NULL,'USR01','USR03',989812800000,984542400000,40,50,60),('MIT021',NULL,'2016-10-15 02:46:10','USR07',NULL,'USR07','PROJ1','MITPAR031','Mitigation E','','',1,1,5000,5,500,100,1,50,3100,4,350,2,NULL,NULL,'USR04','USR07',989812800000,984542400000,40,50,60),('MIT022',NULL,'2016-10-15 02:46:10','USR03',NULL,'USR07','PROJ1','MITPAR008','New Software','','',0,1,5000,15,750,1000,2,60,3500,10,435,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,40,50,60),('MIT023',NULL,'2016-10-15 02:46:10','USR03',NULL,'USR07','PROJ1','MITPAR008','Regular Project Reviews','','',1,2,5000,15,750,1000,2,60,1500,4,135,2,NULL,NULL,'USR07','USR07',989812800000,984542400000,70,80,90);
/*!40000 ALTER TABLE `mitigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectattributes`
--

DROP TABLE IF EXISTS `projectattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectattributes` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `StatusBar` varchar(255) DEFAULT NULL,
  `CurrencyPrefix` varchar(255) DEFAULT NULL,
  `TimeUnits` varchar(255) DEFAULT NULL,
  `HoursPerDay` int(11) DEFAULT NULL,
  `CurrencyMultiplier` varchar(255) DEFAULT NULL,
  `RatePerHour` int(11) DEFAULT NULL,
  `HoursPerWeek` int(11) DEFAULT NULL,
  `CalendarDaysSlippage` int(11) DEFAULT NULL,
  `Thresholds` varchar(255) DEFAULT NULL,
  `White` int(11) DEFAULT NULL,
  `Green` int(11) DEFAULT NULL,
  `Yellow` int(11) DEFAULT NULL,
  `Red` int(11) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoPAF` (`CreatedByID`),
  KEY `modWhoPAF` (`ModifiedByID`),
  CONSTRAINT `creWhoPAF` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPAF` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectattributes`
--

LOCK TABLES `projectattributes` WRITE;
/*!40000 ALTER TABLE `projectattributes` DISABLE KEYS */;
INSERT INTO `projectattributes` VALUES ('PATTR01',NULL,'2016-10-14 22:40:34',NULL,NULL,NULL,'PROJ1','','$','Days (d)',8,'*1000 (K)',0,40,0,'',25,50,75,100);
/*!40000 ALTER TABLE `projectattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectfields`
--

DROP TABLE IF EXISTS `projectfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectfields` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `Fields` varchar(255) DEFAULT NULL,
  `Types` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoPFe` (`CreatedByID`),
  KEY `modWhoPFe` (`ModifiedByID`),
  CONSTRAINT `creWhoPFe` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPFe` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectfields`
--

LOCK TABLES `projectfields` WRITE;
/*!40000 ALTER TABLE `projectfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectidtoriskid`
--

DROP TABLE IF EXISTS `projectidtoriskid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectidtoriskid` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RiskID` char(32) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoP2R` (`CreatedByID`),
  KEY `modWhoP2R` (`ModifiedByID`),
  CONSTRAINT `creWhoP2R` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoP2R` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectidtoriskid`
--

LOCK TABLES `projectidtoriskid` WRITE;
/*!40000 ALTER TABLE `projectidtoriskid` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectidtoriskid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectriskclass`
--

DROP TABLE IF EXISTS `projectriskclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectriskclass` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) NOT NULL,
  `RiskClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `projectriskclass_ibfk_1` (`ProjectID`),
  KEY `creWhoPRcl` (`CreatedByID`),
  KEY `modWhoPRcl` (`ModifiedByID`),
  CONSTRAINT `creWhoPRcl` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPRcl` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `projectriskclass_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectriskclass`
--

LOCK TABLES `projectriskclass` WRITE;
/*!40000 ALTER TABLE `projectriskclass` DISABLE KEYS */;
INSERT INTO `projectriskclass` VALUES ('PRC001',NULL,'2016-10-14 22:44:31',NULL,NULL,NULL,'PROJ1','Low'),('PRC002',NULL,'2016-10-14 22:44:31',NULL,NULL,NULL,'PROJ1','Medium'),('PRC003',NULL,'2016-10-14 22:44:31',NULL,NULL,NULL,'PROJ1','High');
/*!40000 ALTER TABLE `projectriskclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectriskstatus`
--

DROP TABLE IF EXISTS `projectriskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectriskstatus` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RiskStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoPRst` (`CreatedByID`),
  KEY `modWhoPRst` (`ModifiedByID`),
  CONSTRAINT `creWhoPRst` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPRst` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectriskstatus`
--

LOCK TABLES `projectriskstatus` WRITE;
/*!40000 ALTER TABLE `projectriskstatus` DISABLE KEYS */;
INSERT INTO `projectriskstatus` VALUES ('PRS01',NULL,'2016-10-14 22:45:08',NULL,NULL,NULL,'PROJ1','Open'),('PRS02',NULL,'2016-10-14 22:45:08',NULL,NULL,NULL,'PROJ1','Closed'),('PRS03',NULL,'2016-10-14 22:45:08',NULL,NULL,NULL,'PROJ1','Watch');
/*!40000 ALTER TABLE `projectriskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectrisktypes`
--

DROP TABLE IF EXISTS `projectrisktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectrisktypes` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RiskTypes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoPRty` (`CreatedByID`),
  KEY `modWhoPRty` (`ModifiedByID`),
  CONSTRAINT `creWhoPRty` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPRty` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectrisktypes`
--

LOCK TABLES `projectrisktypes` WRITE;
/*!40000 ALTER TABLE `projectrisktypes` DISABLE KEYS */;
INSERT INTO `projectrisktypes` VALUES ('PRT01',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Engineering'),('PRT02',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Safety'),('PRT03',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Environmental'),('PRT04',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Human Resources'),('PRT05',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Technical'),('PRT06',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Schedule'),('PRT07',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Cost'),('PRT08',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Performance'),('PRT09',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Programmatic'),('PRT10',NULL,'2016-10-14 22:45:54',NULL,NULL,NULL,'PROJ1','Political');
/*!40000 ALTER TABLE `projectrisktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectrootcauses`
--

DROP TABLE IF EXISTS `projectrootcauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectrootcauses` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RootCauses` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `creWhoPRoot` (`CreatedByID`),
  KEY `modWhoPRoot` (`ModifiedByID`),
  CONSTRAINT `creWhoPRoot` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoPRoot` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectrootcauses`
--

LOCK TABLES `projectrootcauses` WRITE;
/*!40000 ALTER TABLE `projectrootcauses` DISABLE KEYS */;
INSERT INTO `projectrootcauses` VALUES ('ROOT01',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Poor Requirements'),('ROOT02',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','No Sponsor'),('ROOT03',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Inadequate Budget'),('ROOT04',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Technical Expertise'),('ROOT05',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Not Enough Time'),('ROOT06',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Personnel'),('ROOT07',NULL,'2016-10-14 22:46:51',NULL,NULL,NULL,'PROJ1','Changing Scope');
/*!40000 ALTER TABLE `projectrootcauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `ProjectName` varchar(255) DEFAULT NULL,
  `ProjectDescription` longtext,
  `ProjectManagerID` char(32) DEFAULT NULL,
  `ProjectLeadID` char(32) DEFAULT NULL,
  `Objectives` longtext,
  `Assets` longtext,
  `ProjectCostTotal` int(11) DEFAULT NULL,
  `ProjectDurationTotal` int(11) DEFAULT NULL,
  `ProjectPerformanceTotal` int(11) DEFAULT NULL,
  `ProjectRCostTotal` int(11) DEFAULT NULL,
  `ProjectRDurationTotal` int(11) DEFAULT NULL,
  `ProjectRPerformanceTotal` int(11) DEFAULT NULL,
  `ProjectRTCostTotal` int(11) DEFAULT NULL,
  `ProjectRTDurationTotal` int(11) DEFAULT NULL,
  `ProjectRTPerformanceTotal` int(11) DEFAULT NULL,
  `ProjectTotalStart` bigint(20) DEFAULT NULL,
  `ProjectTotalStop` bigint(20) DEFAULT NULL,
  `ProjectReserveStart` bigint(20) DEFAULT NULL,
  `ProjectReserveStop` bigint(20) DEFAULT NULL,
  `ProjectRTStart` bigint(20) DEFAULT NULL,
  `ProjectRTStop` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `creWhoP` (`CreatedByID`),
  KEY `modWhoP` (`ModifiedByID`),
  KEY `pMan` (`ProjectManagerID`),
  KEY `pLed` (`ProjectLeadID`),
  CONSTRAINT `creWhoP` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `modWhoP` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `pLed` FOREIGN KEY (`ProjectLeadID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `pMan` FOREIGN KEY (`ProjectManagerID`) REFERENCES `users` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES ('PROJ1',NULL,'2016-10-15 02:43:49',NULL,NULL,NULL,NULL,'Introductory Project','Introductory RiskTrak Project \r\n\r\nDetails:\r\nA business, program or project can be plagued with hundreds of potential risks and problems. To effectively manage risk you must be able to: \r\n\r\n· Manage critical risks before they become unmanageable\r\n· Ensure predictable program/project performance\r\n· Provide effective communication of risks\r\n· Compile historical data of your projects and programs. \r\n\r\nIf you scored poorly on this RiskTrak Introductory interview you need to apply RiskTrak to your Program!\r\n\r\nInterview of Toby J. Trudel on 4/5/2000\r\n\r\n1: Risk Management\r\nYou have serious problems with the risk management of this program. You need to use RiskTrak and establish a system with disciplined procedures that will provide you with the ability to:\r\n\r\n· identify, analyze, and prioritize risk items before they become threats to your successful operations or sources of expensive rework\r\n· establish a balanced and integral strategy for eliminating or reducing the sources of risk\r\n· monitor and control the execution of the chosen strategies\r\n\r\n2: Risk Exposure\r\nYour Risk Exposure is extremely high and requires a RiskTrak mitigation/aversion process of the following fundamental activity:\r\n\r\n· Risk Identification process to identify potential problems and determine risk aversion alternatives. \r\n\r\nWhat can go wrong? The RiskTrak process provides for the comprehensive identification of potential risk items using a structured and consistent method.\r\n\r\n3: Standardized Process\r\nYour Risk Management process is highly unstable. RiskTrak’s effective Risk Management approach provides a proven, repeatable process, with automated tools to create a continuous improvement environment that includes the following fundamental tasks:\r\n\r\n· Risk Identification - locate risks before they become problems and adversely affect the project.\r\n· Risk Analysis - turn the raw risk data into decision making information.\r\n· Risk Planning - turn the risk information into effective decisions and corrective actions.\r\n· Risk Tracking - monitor the status of program risks and actions taken to mitigate those risks.\r\n· Risk Control - correct for deviations from the planned risk actions.\r\n· Risk Reporting - uniform and effective reporting to Team risk management personnel.\r\n· Risk Communication - provides feedback on the current risks among the process elements and within your program organization.\r\n\r\nRiskTrak provides an efficient process to view and document risks in multiple dimensions. RiskTrak is the best means of determining which risks to manage, mitigate and retire in a standardized fashion, while guiding the user through risk reduction and contingency planning.\r\n\r\n4: Communication\r\nProblems are not being communicated to senior management. Problems are not being communicated properly between senior and project level management in a repeatable and uniform fashion. An effective risk management system is one of the best ways to attain and maintain management sponsorship! Management is generally willing to address critical success factors once there is a clear understanding as to what they are. Similarly, project level personnel like to rally around the cause of risk management since they are the ones most directly affected. Effective exchange of risk and risk management information among the projects\' functions at all levels of your organization is central to your risk management process. RiskTrak provides an automated risk management tool that effectively communicates all critical success factors to your project while defining areas of risk with sound mitigation strategies throughout your current organization. RiskTrak also provides the mechanisms to effectively communicate these risks be\r\ntween team members, across projects, and to senior management. RiskTrak provides an excellent means to introduce risk management disciplines into your organization in an automated and effective fashion.\r\n\r\n5: Risk database\r\nYour risk database is unusable it is not complete, or is not based on historical data, and is therefore questionable. A risk management repository is required where \"Lessons Learned\" are analyzed, linked and made available for retrieval and application to current programs using structured query techniques. Our RiskTrak System provides for a disciplined approach to electronically document and retrieve the following risk management data: \r\n\r\n· Explicit statements of project risk plus contexts\r\n· Classification and filtering of risks\r\n· Recommendations of mitigating actions and other actions considered and implemented\r\n· Descriptions of processes for reviewing and tracking the status of; risks, actions taken, and their effects on the project\r\n· Examples of measurements made and used to determine status of the risk management activities\r\n\r\n6: Risk reporting\r\nYour method of reporting risk is ineffective. RiskTrak’s process for reporting risk is as important as analyzing and managing these risks. Management must provide guidelines for reporting risks and determine how risk reporting can be performed under the current infrastructure in the most efficient manner without creating a labor intensive effort. RiskTrak provides a means of producing standardized reports for project teams to review.\r\n','USR01','USR06','Implement standardized end to end processes that will improve business unit effectiveness, end to end process effectiveness and maximize shareholder value.','Define the assets neessary to implement standardized end to end processes.',660000,193,330000,60000,3,30000,600000,190,300000,984542400000,1001217600000,1000958400000,1001217600000,984542400000,1001736000000),('PROJ2',NULL,'2016-10-15 02:43:49',NULL,NULL,NULL,NULL,'Introductory Project','Introductory RiskTrak Project \r\n\r\nDetails:\r\nA business, program or project can be plagued with hundreds of potential risks and problems. To effectively manage risk you must be able to: \r\n\r\n· Manage critical risks before they become unmanageable\r\n· Ensure predictable program/project performance\r\n· Provide effective communication of risks\r\n· Compile historical data of your projects and programs. \r\n\r\nIf you scored poorly on this RiskTrak Introductory interview you need to apply RiskTrak to your Program!\r\n\r\nInterview of Toby J. Trudel on 4/5/2000\r\n\r\n1: Risk Management\r\nYou have serious problems with the risk management of this program. You need to use RiskTrak and establish a system with disciplined procedures that will provide you with the ability to:\r\n\r\n· identify, analyze, and prioritize risk items before they become threats to your successful operations or sources of expensive rework\r\n· establish a balanced and integral strategy for eliminating or reducing the sources of risk\r\n· monitor and control the execution of the chosen strategies\r\n\r\n2: Risk Exposure\r\nYour Risk Exposure is extremely high and requires a RiskTrak mitigation/aversion process of the following fundamental activity:\r\n\r\n· Risk Identification process to identify potential problems and determine risk aversion alternatives. \r\n\r\nWhat can go wrong? The RiskTrak process provides for the comprehensive identification of potential risk items using a structured and consistent method.\r\n\r\n3: Standardized Process\r\nYour Risk Management process is highly unstable. RiskTrak’s effective Risk Management approach provides a proven, repeatable process, with automated tools to create a continuous improvement environment that includes the following fundamental tasks:\r\n\r\n· Risk Identification - locate risks before they become problems and adversely affect the project.\r\n· Risk Analysis - turn the raw risk data into decision making information.\r\n· Risk Planning - turn the risk information into effective decisions and corrective actions.\r\n· Risk Tracking - monitor the status of program risks and actions taken to mitigate those risks.\r\n· Risk Control - correct for deviations from the planned risk actions.\r\n· Risk Reporting - uniform and effective reporting to Team risk management personnel.\r\n· Risk Communication - provides feedback on the current risks among the process elements and within your program organization.\r\n\r\nRiskTrak provides an efficient process to view and document risks in multiple dimensions. RiskTrak is the best means of determining which risks to manage, mitigate and retire in a standardized fashion, while guiding the user through risk reduction and contingency planning.\r\n\r\n4: Communication\r\nProblems are not being communicated to senior management. Problems are not being communicated properly between senior and project level management in a repeatable and uniform fashion. An effective risk management system is one of the best ways to attain and maintain management sponsorship! Management is generally willing to address critical success factors once there is a clear understanding as to what they are. Similarly, project level personnel like to rally around the cause of risk management since they are the ones most directly affected. Effective exchange of risk and risk management information among the projects\' functions at all levels of your organization is central to your risk management process. RiskTrak provides an automated risk management tool that effectively communicates all critical success factors to your project while defining areas of risk with sound mitigation strategies throughout your current organization. RiskTrak also provides the mechanisms to effectively communicate these risks be\r\ntween team members, across projects, and to senior management. RiskTrak provides an excellent means to introduce risk management disciplines into your organization in an automated and effective fashion.\r\n\r\n5: Risk database\r\nYour risk database is unusable it is not complete, or is not based on historical data, and is therefore questionable. A risk management repository is required where \"Lessons Learned\" are analyzed, linked and made available for retrieval and application to current programs using structured query techniques. Our RiskTrak System provides for a disciplined approach to electronically document and retrieve the following risk management data: \r\n\r\n· Explicit statements of project risk plus contexts\r\n· Classification and filtering of risks\r\n· Recommendations of mitigating actions and other actions considered and implemented\r\n· Descriptions of processes for reviewing and tracking the status of; risks, actions taken, and their effects on the project\r\n· Examples of measurements made and used to determine status of the risk management activities\r\n\r\n6: Risk reporting\r\nYour method of reporting risk is ineffective. RiskTrak’s process for reporting risk is as important as analyzing and managing these risks. Management must provide guidelines for reporting risks and determine how risk reporting can be performed under the current infrastructure in the most efficient manner without creating a labor intensive effort. RiskTrak provides a means of producing standardized reports for project teams to review.\r\n','USR01','USR06','Implement standardized end to end processes that will improve business unit effectiveness, end to end process effectiveness and maximize shareholder value.','Define the assets neessary to implement standardized end to end processes.',660000,193,330000,60000,3,30000,600000,190,300000,984542400000,1001217600000,1000958400000,1001217600000,984542400000,1001736000000),('PROJ3',NULL,'2016-10-15 02:43:49',NULL,NULL,NULL,NULL,'Introductory Project','Introductory RiskTrak Project \r\n\r\nDetails:\r\nA business, program or project can be plagued with hundreds of potential risks and problems. To effectively manage risk you must be able to: \r\n\r\n· Manage critical risks before they become unmanageable\r\n· Ensure predictable program/project performance\r\n· Provide effective communication of risks\r\n· Compile historical data of your projects and programs. \r\n\r\nIf you scored poorly on this RiskTrak Introductory interview you need to apply RiskTrak to your Program!\r\n\r\nInterview of Toby J. Trudel on 4/5/2000\r\n\r\n1: Risk Management\r\nYou have serious problems with the risk management of this program. You need to use RiskTrak and establish a system with disciplined procedures that will provide you with the ability to:\r\n\r\n· identify, analyze, and prioritize risk items before they become threats to your successful operations or sources of expensive rework\r\n· establish a balanced and integral strategy for eliminating or reducing the sources of risk\r\n· monitor and control the execution of the chosen strategies\r\n\r\n2: Risk Exposure\r\nYour Risk Exposure is extremely high and requires a RiskTrak mitigation/aversion process of the following fundamental activity:\r\n\r\n· Risk Identification process to identify potential problems and determine risk aversion alternatives. \r\n\r\nWhat can go wrong? The RiskTrak process provides for the comprehensive identification of potential risk items using a structured and consistent method.\r\n\r\n3: Standardized Process\r\nYour Risk Management process is highly unstable. RiskTrak’s effective Risk Management approach provides a proven, repeatable process, with automated tools to create a continuous improvement environment that includes the following fundamental tasks:\r\n\r\n· Risk Identification - locate risks before they become problems and adversely affect the project.\r\n· Risk Analysis - turn the raw risk data into decision making information.\r\n· Risk Planning - turn the risk information into effective decisions and corrective actions.\r\n· Risk Tracking - monitor the status of program risks and actions taken to mitigate those risks.\r\n· Risk Control - correct for deviations from the planned risk actions.\r\n· Risk Reporting - uniform and effective reporting to Team risk management personnel.\r\n· Risk Communication - provides feedback on the current risks among the process elements and within your program organization.\r\n\r\nRiskTrak provides an efficient process to view and document risks in multiple dimensions. RiskTrak is the best means of determining which risks to manage, mitigate and retire in a standardized fashion, while guiding the user through risk reduction and contingency planning.\r\n\r\n4: Communication\r\nProblems are not being communicated to senior management. Problems are not being communicated properly between senior and project level management in a repeatable and uniform fashion. An effective risk management system is one of the best ways to attain and maintain management sponsorship! Management is generally willing to address critical success factors once there is a clear understanding as to what they are. Similarly, project level personnel like to rally around the cause of risk management since they are the ones most directly affected. Effective exchange of risk and risk management information among the projects\' functions at all levels of your organization is central to your risk management process. RiskTrak provides an automated risk management tool that effectively communicates all critical success factors to your project while defining areas of risk with sound mitigation strategies throughout your current organization. RiskTrak also provides the mechanisms to effectively communicate these risks be\r\ntween team members, across projects, and to senior management. RiskTrak provides an excellent means to introduce risk management disciplines into your organization in an automated and effective fashion.\r\n\r\n5: Risk database\r\nYour risk database is unusable it is not complete, or is not based on historical data, and is therefore questionable. A risk management repository is required where \"Lessons Learned\" are analyzed, linked and made available for retrieval and application to current programs using structured query techniques. Our RiskTrak System provides for a disciplined approach to electronically document and retrieve the following risk management data: \r\n\r\n· Explicit statements of project risk plus contexts\r\n· Classification and filtering of risks\r\n· Recommendations of mitigating actions and other actions considered and implemented\r\n· Descriptions of processes for reviewing and tracking the status of; risks, actions taken, and their effects on the project\r\n· Examples of measurements made and used to determine status of the risk management activities\r\n\r\n6: Risk reporting\r\nYour method of reporting risk is ineffective. RiskTrak’s process for reporting risk is as important as analyzing and managing these risks. Management must provide guidelines for reporting risks and determine how risk reporting can be performed under the current infrastructure in the most efficient manner without creating a labor intensive effort. RiskTrak provides a means of producing standardized reports for project teams to review.\r\n','USR01','USR06','Implement standardized end to end processes that will improve business unit effectiveness, end to end process effectiveness and maximize shareholder value.','Define the assets neessary to implement standardized end to end processes.',660000,193,330000,60000,3,30000,600000,190,300000,984542400000,1001217600000,1000958400000,1001217600000,984542400000,1001736000000);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risks`
--

DROP TABLE IF EXISTS `risks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risks` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `ParentID` char(32) DEFAULT NULL,
  `ProjectID` char(32) DEFAULT NULL,
  `RiskTitle` varchar(255) DEFAULT NULL,
  `RiskStatement` longtext,
  `Consequences` longtext,
  `Matrix` int(11) DEFAULT NULL,
  `ProbabilityBullet` int(11) DEFAULT NULL,
  `ProbabilityValue` int(11) DEFAULT NULL,
  `ImpactsCostActualCosts` int(11) DEFAULT '0',
  `ImpactsSlipActualCosts` int(11) DEFAULT NULL,
  `ImpactsPerfActualCosts` int(11) DEFAULT NULL,
  `ImpactsCostRiskExposure` int(11) DEFAULT NULL,
  `ImpactsSlipRiskExposure` int(11) DEFAULT NULL,
  `ImpactsPerfRiskExposure` int(11) DEFAULT NULL,
  `ImpactsCostMitigatedExp` int(11) DEFAULT NULL,
  `ImpactsSlipMitigatedExp` int(11) DEFAULT NULL,
  `ImpactsPerfMitigatedExp` int(11) DEFAULT NULL,
  `RollUpCostActualCosts` int(11) DEFAULT NULL,
  `RollUpSlipActualCosts` int(11) DEFAULT NULL,
  `RollUpPerfActualCosts` int(11) DEFAULT NULL,
  `RollUpCostRiskExposure` int(11) DEFAULT NULL,
  `RollUpSlipRiskExposure` int(11) DEFAULT NULL,
  `RollUpPerfRiskExposure` int(11) DEFAULT NULL,
  `RollUpCostMitigatedExp` int(11) DEFAULT NULL,
  `RollUpSlipMitigatedExp` int(11) DEFAULT NULL,
  `RollUpPerfMitigatedExp` int(11) DEFAULT NULL,
  `CostAllocation` int(11) DEFAULT NULL,
  `AttachedFile` varchar(255) DEFAULT NULL,
  `AssigneeID` char(32) DEFAULT NULL,
  `AssignedByID` char(32) DEFAULT NULL,
  `AssignedOn` bigint(20) DEFAULT NULL,
  `ActionDate` bigint(20) DEFAULT NULL,
  `RiskPhase` varchar(255) DEFAULT NULL,
  `RiskType` varchar(255) DEFAULT NULL,
  `RootCauses` varchar(255) DEFAULT NULL,
  `RiskClass` varchar(255) DEFAULT NULL,
  `RiskStatus` varchar(255) DEFAULT NULL,
  `RiskProbabilityLeast` int(11) DEFAULT NULL,
  `RiskProbabilityProbable` int(11) DEFAULT NULL,
  `RiskProbabilityWorst` int(11) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `cre` (`CreatedByID`),
  KEY `mod` (`ModifiedByID`),
  KEY `pAsg` (`AssigneeID`),
  KEY `pAsgBy` (`AssignedByID`),
  CONSTRAINT `cre` FOREIGN KEY (`CreatedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `mod` FOREIGN KEY (`ModifiedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `pAsg` FOREIGN KEY (`AssigneeID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `pAsgBy` FOREIGN KEY (`AssignedByID`) REFERENCES `users` (`UUID`),
  CONSTRAINT `proj1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risks`
--

LOCK TABLES `risks` WRITE;
/*!40000 ALTER TABLE `risks` DISABLE KEYS */;
INSERT INTO `risks` VALUES ('RSK001',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','RSK028','PROJ1','Management consultation','Management does not consult with people before making decisions that affect their work.','Define the Consequences',0,1,NULL,10000,30,2500,5000,15,1250,3100,10,800,10000,30,2500,5000,15,1250,3100,10,800,NULL,NULL,'USR05','USR07',989812800000,984542400000,'Prototype','Schedule','Technical Expertise','Low','Open',40,50,60),('RSK002',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK028','PROJ1','Mitigation plans','Mitigation plans are not being written, followed-up and reported.\r\n','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR03','USR07',989812800000,989812800000,'Production','Cost','Inadequate Budget','Medium','Open',40,50,60),('RSK003',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','RSK030','PROJ1','Budget','Your budget is significant.','Define the Consequences',0,1,NULL,10000,30,1000,5000,15,500,2600,8,300,10000,30,1000,5000,15,500,2600,4,300,NULL,NULL,'USR01','USR07',989812800000,984542400000,'Production','Technical','Poor Requirements','Low','Closed',40,50,60),('RSK004',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK030','PROJ1','Development','Your development effort scope is large.\r\n','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,3100,10,500,10000,30,1500,5000,15,750,3100,10,500,NULL,NULL,'USR03','USR07',989812800000,989812800000,'Concept','Safety','Technical Expertise','High','Open',40,50,60),('RSK005',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK030','PROJ1','Critical Effort','Your development effort is critical.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Design','Safety','Technical Expertise','Medium','Open',40,50,60),('RSK006',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK030','PROJ1','Product integration','Your product integration risk is significant.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,5000,15,750,10000,30,1500,5000,15,750,5000,15,750,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Test','Environmental','Poor Requirements','Low','Watch',40,50,60),('RSK007',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK030','PROJ1','Organization','Organization will be significantly affected.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,0,0,0,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Concept','Human Resources','No Sponsor','High','Watch',40,50,60),('RSK008',NULL,'2016-10-15 01:32:31','USR03',20010514000000,'USR07','PROJ1','PROJ1','Standardized Process','Your risk management process is highly unstable.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,2450,5,188,50000,150,7500,25000,75,3750,15950,45,2122,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Design','Technical','Personnel','Medium','Open',40,50,60),('RSK009',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK008','PROJ1','Accountability','Your Accountability risk is significant.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,3500,10,435,10000,30,1500,5000,15,750,3500,10,435,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Test','Cost','Changing Scope','Low','Open',40,50,60),('RSK010',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK008','PROJ1','Consistency','Your risk of not getting consistent results is significant.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,5000,15,750,10000,30,1500,5000,15,750,5000,15,750,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Build','Performance','Poor Requirements','High','Watch',40,50,60),('RSK011',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK008','PROJ1','Risk Identification','Risks are not determined through established processes for risk identification, assessment, and mitigation.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,5000,15,750,10000,30,1500,5000,15,750,5000,15,750,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Prototype','Programmatic','Poor Requirements','Medium','Open',40,50,60),('RSK012',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK008','PROJ1','Predictable results','Your risk of not getting predictable results is significant.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Production','Technical','Technical Expertise','Low','Open',40,50,60),('RSK013',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','PROJ1','PROJ1','Communication','Problems are not being communicated to senior management.\r\n','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,3500,10,435,40000,120,6000,19000,57,2850,6500,18,795,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Concept','Technical','Personnel','High','Watch',40,50,60),('RSK014',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK013','PROJ1','Communication vehicle','Reports of problems to upper management are ineffective.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Design','Programmatic','No Sponsor','Medium','Open',40,50,60),('RSK015',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK013','PROJ1','Go/No-Go analysis','You can not perform Go/No-Go analysis at any organizational level.','Define the Consequences',0,0,NULL,10000,30,1500,4000,12,600,3000,8,360,10000,30,1500,4000,12,600,3000,8,360,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Build','Programmatic','Changing Scope','High','Watch',40,50,60),('RSK016',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK013','PROJ1','Across all projects','Methods of communicating problems across all projects is ineffective.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Test','Engineering','Inadequate Budget','Low','Open',40,50,60),('RSK017',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','PROJ1','PROJ1','Risk database','Your risk database is unusable.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,40000,120,6000,20000,60,3000,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Prototype','Engineering','Technical Expertise','Medium','Open',40,50,60),('RSK018',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK017','PROJ1','Project specific risks','People do not input Project specific risks to the database.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Production','Cost','Poor Requirements','Low','Open',40,50,60),('RSK019',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK017','PROJ1','Uniform projects','Program personnel do not input risks uniformly across Projects.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Concept','Programmatic','No Sponsor','High','Watch',40,50,60),('RSK020',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK017','PROJ1','Fully-integrated/networked','Program personnel do not have a fully-integrated/networked method to input Project specific risks.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Design','Programmatic','Poor Requirements','Medium','Open',40,50,60),('RSK021',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','PROJ1','PROJ1','Risk reporting','Your method of reporting risk is ineffective.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,70000,210,10500,35000,105,5250,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Test','Technical','Personnel','Low','Open',40,50,60),('RSK022',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK021','PROJ1','Project reporting','There are no periodic structured project status reports.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,40000,120,6000,20000,60,3000,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Build','Programmatic','Changing Scope','High','Watch',40,50,60),('RSK023',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK021','PROJ1','Program Impacts','People do not report Program Impacts, in a timely manner.\r\n','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Prototype','Programmatic','Inadequate Budget','Medium','Open',40,50,60),('RSK024',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK021','PROJ1','Corporate decision makers','Upper management does not provide timely support of program problems.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Design','Programmatic','No Sponsor','Medium','Open',40,50,60),('RSK025',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK022','PROJ1','Schedule','People don\'t report possible schedule slip','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Production','Schedule','Not Enough Time','Low','Open',40,50,60),('RSK026',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK022','PROJ1','Costs','People don\'t report project cost risk.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Concept','Cost','Inadequate Budget','High','Watch',40,50,60),('RSK027',NULL,'2016-10-15 01:32:31','USR07',20010514000000,'USR07','RSK022','PROJ1','Performance','People don\'t report project performance risk.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,0,0,0,10000,30,1500,5000,15,750,0,0,0,NULL,NULL,'USR07','USR07',989812800000,989812800000,'Test','Technical','Changing Scope','Low','Open',40,50,60),('RSK028',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','PROJ1','PROJ1','Risk Management','You have serious problems with risk management.','Define the Consequences',0,1,NULL,10000,30,1000,5000,15,500,3500,8,300,40000,120,6500,20000,60,3250,8700,22,1400,NULL,NULL,'USR06','USR07',989812800000,984542400000,'Concept','Technical','Technical Expertise','High','Watch',40,50,60),('RSK029',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','RSK028','PROJ1','Risk Management Officer','A full time Risk Management Officer has not been assigned to the Project.','Define the Consequences',0,1,NULL,10000,30,1500,5000,15,750,2600,8,425,10000,30,1500,5000,15,750,2600,8,425,NULL,NULL,'USR05','USR07',989812800000,984542400000,'Design','Schedule','Poor Requirements','Medium','Closed',40,50,60),('RSK030',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','PROJ1','PROJ1','Risk Exposure','Your Risk Exposure is extremely high.','Define the Consequences',0,1,NULL,10000,30,1000,5000,15,500,2600,8,300,70000,210,9000,35000,105,4500,7800,20,900,NULL,NULL,'USR05','USR07',989812800000,984542400000,'Test','Technical','Poor Requirements','High','Open',40,50,60),('RSK031',NULL,'2016-10-15 01:32:31','USR07',20010314000000,'USR07','RSK030','PROJ1','Project/Program','Your Project or Program is important.','Define the Consequences',0,1,NULL,10000,30,1000,5000,15,500,2600,4,300,10000,30,1000,5000,15,500,2600,4,300,NULL,NULL,'USR05','USR07',989812800000,984542400000,'Build','Schedule','Technical Expertise','Medium','Watch',40,50,60);
/*!40000 ALTER TABLE `risks` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UUID` char(32) NOT NULL,
  `OwningBusUnitID` char(32) DEFAULT NULL,
  `Modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedByID` char(32) DEFAULT NULL,
  `Created` bigint(20) DEFAULT NULL,
  `CreatedByID` char(32) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Salutation` varchar(32) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `MiddleName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Suffix` varchar(32) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Permissions` int(11) DEFAULT NULL,
  `EmailAddress` varchar(90) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('USR01',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Ralph Demuth',NULL,'Ralph',NULL,'Demuth',NULL,'',0,NULL,NULL),('USR02',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Isibiel Cohen',NULL,'Isibiel',NULL,'Cohen',NULL,'',0,NULL,NULL),('USR03',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'USER',NULL,NULL,NULL,'USER',NULL,'( 8=3/',2097151,NULL,NULL),('USR04',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Kevin Hevey',NULL,'Kevin',NULL,'Hevey',NULL,'r',2097151,NULL,NULL),('USR05',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Lynne Connolly',NULL,'Lynne',NULL,'Conolly',NULL,'r',2097151,NULL,NULL),('USR06',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'John Beauchamp',NULL,'John',NULL,'Beauchamp',NULL,'r',2097151,NULL,NULL),('USR07',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Charles W. Bosler Jr.',NULL,'Charles','W.','Bosler','Jr.','r',2097151,NULL,NULL),('USR08',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Elizabeth L. Bosler',NULL,'Elizabeth','L.','Bosler',NULL,'\n2',2097151,NULL,NULL),('USR09',NULL,'2016-10-14 22:49:59',NULL,NULL,NULL,'Toby Trudel',NULL,'TOby',NULL,'Trudel',NULL,'r',16352,NULL,NULL),('USR10',NULL,'2016-11-04 23:45:45',NULL,NULL,NULL,'wat','Mr.','William','A.','Taylor','MSEE','r',16352,'wataylor@alum.mit.edu','16037445168');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `businessusers`
--

/*!50001 DROP VIEW IF EXISTS `businessusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `businessusers` AS select `bu`.`UUID` AS `UUID`,`bu`.`Title` AS `Title`,`bu`.`Description` AS `Description`,`um`.`Salutation` AS `UMSalutation`,`um`.`FirstName` AS `UMFirstname`,`um`.`MiddleName` AS `UMMIddleName`,`um`.`LastName` AS `UMLastName`,`um`.`Suffix` AS `UMSuffix`,`um`.`Phone` AS `UMPhone`,`uc`.`Salutation` AS `UCSalutation`,`uc`.`FirstName` AS `UCFirstname`,`uc`.`MiddleName` AS `UCMIddleName`,`uc`.`LastName` AS `UCLastName`,`uc`.`Suffix` AS `UCSuffix`,`uc`.`Phone` AS `UCPhone` from ((`businessunits` `bu` left join `users` `um` on((`bu`.`ModifiedByID` = `um`.`UUID`))) left join `users` `uc` on((`bu`.`ContactID` = `uc`.`UUID`))) */;
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

-- Dump completed on 2016-11-04 19:47:08
