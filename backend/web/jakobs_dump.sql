-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: jakobs
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB-log

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
-- Table structure for table `accounting_exportformat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_exportformat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Different accounting export types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addressbook`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressbook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Customerid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`),
  KEY `Customerid` (`Customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=155679 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Adminid` int(11) NOT NULL AUTO_INCREMENT,
  `Permission` tinyint(2) NOT NULL COMMENT 'What level permission 1 to 5. 5 is superadmin',
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Name_first` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name_last` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Titleposition` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Sellerid` tinyint(5) NOT NULL,
  `Isdispatch` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Chat_allowed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Chat_updatetime` int(11) NOT NULL,
  `Employeegroup` int(11) NOT NULL,
  `Department` int(11) NOT NULL,
  `Aboutme` text COLLATE utf8_unicode_ci NOT NULL,
  `Protected` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Allow_uploadfiles` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Allow_deletefiles` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Failed_login_attempts` tinyint(3) NOT NULL,
  `Passwdupd_time` int(11) NOT NULL,
  `Prev_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Regtime` int(11) NOT NULL,
  `Updatedtime` int(11) NOT NULL,
  `is_sa` tinyint(4) NOT NULL,
  PRIMARY KEY (`Adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin2departments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin2departments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Departmentid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`,`Departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relates admin users to departments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin2pages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin2pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Pageid` int(11) NOT NULL,
  `Pagename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`,`Pageid`),
  KEY `Pagename` (`Pagename`)
) ENGINE=InnoDB AUTO_INCREMENT=1077 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relation between admin and pages. Used in access control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_allowed_ip`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_allowed_ip` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_chat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_chat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MsgFrom` int(11) NOT NULL,
  `MsgTo` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `Sendtime` int(11) NOT NULL,
  `Readtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `From` (`MsgFrom`,`MsgTo`,`Sendtime`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_employeegroups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_employeegroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `List_priority` tinyint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_login_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_login_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Type` enum('login','logout') COLLATE utf8_unicode_ci NOT NULL,
  `Time` int(11) NOT NULL,
  `Remote_addr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_prefs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_prefs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Dispatch_todayonly` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Timeforward` int(11) NOT NULL,
  `Service_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Vehicle_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Orderlisttype` tinyint(1) NOT NULL,
  `Orderlistsortby` enum('ID','Vehicletype','Servicetype','Ts','Customer','Faddr','FZip','Taddr','TZip') COLLATE utf8_unicode_ci NOT NULL COMMENT 'What to sort orderlist by',
  `Gpsactiveonly` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Only show the drivers that has a active gps pos in the last 2 hours',
  `Pricelistsortby` enum('ID','Vehicletype','Servicetype','Ts','Customer','Faddr','FZip','Taddr','Tzip') COLLATE utf8_unicode_ci NOT NULL,
  `Pricelist_totime` int(11) NOT NULL DEFAULT '123' COMMENT 'Ts to the time we want to se orders',
  `Driverlist_activeonly` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Adminid` (`Adminid`),
  KEY `Orderlisttype` (`Orderlisttype`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores admin preferenses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_uploads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_uploads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Filetype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `Createdtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about uploads by admin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `car_brands`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_brands` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_uploads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_uploads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Filetype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `Createdtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about uploads by admin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts_positiontypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_positiontypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Different contact position types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(4) CHARACTER SET latin1 NOT NULL,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Sortorder` smallint(4) NOT NULL,
  `Active` enum('N','Y') CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_days`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_days` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Days` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Contains the standard credit days to invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Secret_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Customertype` enum('C','P') COLLATE utf8_unicode_ci NOT NULL,
  `CompanyName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address_visit2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `City_visit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Country_visit` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `LatLon_visit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address_post2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `City_post` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Country_post` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `LatLon_post` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Orgnr` int(11) DEFAULT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_group` int(3) NOT NULL,
  `Creditcustomer` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is this a creditcustomer',
  `Credit_days` int(3) NOT NULL,
  `Credit_stop` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Stop customer from ordering Y/N',
  `Notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Gebyr` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Tax` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Autopricing` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_showbrutto` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Show brutto on invoiceline',
  `Req_fakturaref` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Require fakturaref when registering order',
  `Send_daily_pod` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Daily_pod_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Web_show_price` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Web_show_driver` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Std_order_invoice_alone` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'IF standard when registering order should be invoice this order alone or not',
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Added_by` tinyint(3) NOT NULL,
  `Added_time` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CompanyName` (`CompanyName`),
  KEY `Orgnr` (`Orgnr`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_contact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Added_time` int(11) NOT NULL COMMENT 'Unix_timestamp when added',
  `Added_user` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL COMMENT 'ref to table customer ID',
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Usern` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'username to login',
  `Passw` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'password to login',
  `Contact_positiontype` int(11) NOT NULL COMMENT 'Relates to the table contact_positiontypes id',
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customer_ID` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_creditapply`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_creditapply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customerid` int(11) NOT NULL,
  `Contactid` int(11) NOT NULL,
  `Added_by` int(11) NOT NULL COMMENT 'Ref to admin table',
  `Added_time` int(11) NOT NULL,
  `Status` enum('Received','Pending','Approved','Declined') NOT NULL,
  `Notes` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Lastupdatedby` int(11) NOT NULL,
  `Lastupdatetime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customerid` (`Customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_prices`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_prices` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pricelist_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Customer_price` float(11,2) NOT NULL,
  `Customer_discount` float(11,2) NOT NULL,
  `Driver_price` float(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Pricelist_id` (`Pricelist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the customers special prices related to pricelist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_seller_new`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_seller_new` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customerid` int(11) NOT NULL,
  `Sellerid` int(11) NOT NULL,
  `Percent` float(11,2) NOT NULL,
  `Prov_from` int(11) NOT NULL,
  `Prov_to` int(11) NOT NULL,
  `Added_time` int(11) NOT NULL,
  `Added_user` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Prov_from` (`Prov_from`,`Prov_to`),
  KEY `Sellerid` (`Sellerid`),
  KEY `Customerid` (`Customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` tinyint(6) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Orgid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address_visit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Place_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country_visit` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Address_post` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Place_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country_post` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Web` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Email_main` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email_from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bank_account` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bank_swift` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bank_iban` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Next_Invoiceid` int(11) NOT NULL,
  `Acc_exportformat` int(11) NOT NULL COMMENT 'Referes to accsys_format',
  `Acc_exportemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Regtime` int(11) NOT NULL,
  `Updatetime` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driver_deliveredstatus_today`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_deliveredstatus_today` (
  `driverid` int(11) NOT NULL,
  `deliveredcount` int(11) NOT NULL,
  `totalcount` int(11) NOT NULL,
  `updatedtime` int(11) NOT NULL,
  KEY `driverid` (`driverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temp table content generated by cron';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drivers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DrivereksternID` int(11) NOT NULL,
  `CompanyName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DriverName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Vehicle_type` int(11) NOT NULL,
  `Percent` tinyint(2) NOT NULL,
  `Orgnr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Phone1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Carinfo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CarRegnr` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Vat` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is the driver vat registered',
  `Monthly_license` float(11,2) NOT NULL,
  `Accounting_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Internal number for accounting.',
  `Hjelm` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Vest` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Vernesko` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Idkort` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Arbeidstoy` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `ADR` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Takstativ` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Bildekor` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Hengerfeste` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Car_brand` int(11) NOT NULL,
  `Aarsmodell` int(11) NOT NULL,
  `Farge` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Nyttelastkg` double(15,2) NOT NULL,
  `Inv_lengde` double(15,2) NOT NULL,
  `Inv_bredde` double(15,2) NOT NULL,
  `Inv_hoyde` double(15,2) NOT NULL,
  `Start_time` int(11) NOT NULL,
  `End_time` int(11) NOT NULL,
  `Regtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drivers_trekk`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers_trekk` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cancelled` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is this trekk cancelled',
  `Cancelled_by` int(11) NOT NULL COMMENT 'Adminid who cancelled',
  `Cancelled_time` int(11) NOT NULL COMMENT 'TS when this was cancelled',
  `Adminid` int(11) NOT NULL,
  `TS` int(11) NOT NULL,
  `Trekk_time` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Drivername` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Amount` float(11,2) NOT NULL,
  `Type` enum('Forskudd','Diesel','Oppstart','Kontraktbrudd','Arbeidstoy','Diverse') COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Trekk_netto` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Wether to trekk before taxes.',
  `Trekk_list_date` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TS` (`TS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about trekk on drivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_queue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Timestamp_created` int(11) NOT NULL,
  `Subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Message_text` text COLLATE utf8_unicode_ci NOT NULL,
  `To_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Adminid` int(11) NOT NULL,
  `Sendtts` int(11) NOT NULL COMMENT 'Sendt timestamp',
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=24704 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fee`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` float(11,2) NOT NULL,
  `Tax` int(11) NOT NULL COMMENT 'Tax table',
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftcards`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftcards` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Customerid` int(11) DEFAULT NULL,
  `Value` float(11,2) NOT NULL,
  `Used_orderid` int(11) NOT NULL,
  `Issued` int(11) NOT NULL,
  `Issued_by` int(11) NOT NULL,
  `Due` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Code` (`Code`),
  KEY `Customerid` (`Customerid`),
  KEY `Used_orderid` (`Used_orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores gift cards';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goodstypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodstypes` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` tinyint(3) NOT NULL,
  `Customerweb` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Show on customerweb',
  `Active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gps`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Driver` int(11) NOT NULL,
  `Ts` int(11) NOT NULL COMMENT 'Timestamp',
  `Lon` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT 'GPS LONGITUDE',
  `Lat` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT 'GPS LATITUDE',
  `Direction` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Speed` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Altitude` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Battery` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Driver` (`Driver`,`Ts`),
  KEY `Ts` (`Ts`)
) ENGINE=InnoDB AUTO_INCREMENT=33497138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Generated_timestamp` int(11) NOT NULL,
  `Duedate_timestamp` int(11) NOT NULL,
  `Payment_type` enum('Invoice','Cash','Creditcard') COLLATE utf8_unicode_ci NOT NULL,
  `Kid` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_export` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoice_export` (`Invoice_export`),
  KEY `Customer_id` (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_email`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invoiceid` int(11) NOT NULL,
  `Email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Added_time` int(11) NOT NULL,
  `Sendt_time` int(11) NOT NULL,
  `Server_response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoiceid` (`Invoiceid`),
  CONSTRAINT `invoice_email_ibfk_1` FOREIGN KEY (`Invoiceid`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about invoices that should be sendt by em';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_export`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_export` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ts` int(11) NOT NULL COMMENT 'Unix timestamp when created',
  `Adminid` int(11) NOT NULL,
  `Export_system` smallint(5) NOT NULL,
  `Send_to_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Send_ts` int(11) NOT NULL COMMENT 'Unix ts when this is sendt.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_fee`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invoiceid` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` float(11,2) NOT NULL,
  `Taxid` int(11) NOT NULL,
  `Taxpercent` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoiceid` (`Invoiceid`),
  CONSTRAINT `invoice_fee_ibfk_1` FOREIGN KEY (`Invoiceid`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contains the various invoice groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_payments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `method` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `receive_date` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kolli_scan`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kolli_scan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kolliid` int(11) NOT NULL,
  `Addressid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  `Scantype` enum('P','D','C') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Kolliid` (`Kolliid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kreditnota`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kreditnota` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Createdtime` int(11) NOT NULL COMMENT 'timestamp',
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Amount` float(11,2) DEFAULT NULL,
  `Taxid` int(11) NOT NULL,
  `Taxpercent` float(11,2) DEFAULT NULL,
  `Invoiceid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL COMMENT 'What driver is going to be charged',
  `Adminid` int(11) NOT NULL,
  `Invoice_export` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoice` (`Invoiceid`),
  KEY `Driverid` (`Driverid`),
  KEY `Createdtime` (`Createdtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listdataupdated`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listdataupdated` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ListName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_out`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_out` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Method` enum('email','sms') COLLATE utf8_unicode_ci NOT NULL,
  `Added_time` int(11) NOT NULL,
  `Sendtime` int(11) NOT NULL,
  `Sendt_time` int(11) NOT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `Attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Attachmentfilename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Customerid` int(11) NOT NULL,
  `Customer_contact` int(11) NOT NULL,
  `Orderid` int(11) NOT NULL,
  `Addressid` int(11) NOT NULL,
  `Invoiceid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customerid` (`Customerid`),
  KEY `Customer_contact` (`Customer_contact`),
  KEY `Orderid` (`Orderid`),
  KEY `Invoiceid` (`Invoiceid`),
  KEY `Addressid` (`Addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages_pda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_pda` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Createdtime` int(11) NOT NULL,
  `Replytoid` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  `Driver` int(11) NOT NULL,
  `To_adminordriver` enum('a','d') COLLATE utf8_unicode_ci NOT NULL,
  `Messagetext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Pda_downloaded_time` int(11) NOT NULL,
  `Message_readtime` int(11) NOT NULL,
  `Readby` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Admin` (`Admin`),
  KEY `Driver` (`Driver`),
  KEY `Message_readtime` (`Message_readtime`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mycompanyinfo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mycompanyinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Place_visit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country_visit` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Latlon_visit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Zip_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Place_post` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country_post` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Latlon_post` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Orgnr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Bank_account` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `System_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notify_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Receive_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Web` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Iban` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Swift` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Smtp_server` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Smtp_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Smtp_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_invoice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text_welcome` longtext COLLATE utf8_unicode_ci NOT NULL,
  `text_order` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Messagefooter` text COLLATE utf8_unicode_ci NOT NULL,
  `Vat` float(11,2) NOT NULL,
  `CurrencyName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_export_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_export_format` tinyint(5) NOT NULL,
  `Eco_servicetype` int(11) NOT NULL COMMENT 'This is the servicetype that is used for eco jobs',
  `Kjoreliste_pdalisens` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Zones_home` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'This stores the zones that are considered the home zones for the company (used in autopricing)',
  `Orderlistreload` int(11) NOT NULL COMMENT 'miliseconds for waitinglist reload',
  `Driverstatusreload` int(11) NOT NULL,
  `Activeorderlistreload` int(11) NOT NULL,
  `Drivermessagesreload` int(11) NOT NULL,
  `Mapreload` int(11) NOT NULL,
  `Sendorderemail` int(1) NOT NULL,
  `locale` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Map_lat` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Map_lng` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Google_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Stripe_secret_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Stripe_publishable_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Cweb_ordertype` tinyint(4) NOT NULL,
  `Maxkolliweight` float NOT NULL,
  `Timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JwtKey` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all information about the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ocr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trans_no` int(8) DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `sequence` int(6) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `kid` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Operation` enum('Insert','Update','Cancell','Price insert','Price update') COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  `Adminid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_payments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Amount` float(11,2) NOT NULL,
  `Paymethod` int(11) NOT NULL,
  `Payref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `StripeCustomer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Adminid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_prices`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_prices` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float(11,2) NOT NULL,
  `Quantity` float(11,2) NOT NULL,
  `Discount` float(11,2) NOT NULL,
  `Driver_price` float(11,2) NOT NULL,
  `Driver_percent` float(11,2) NOT NULL,
  `Taxid` int(11) NOT NULL COMMENT 'Refer to tax table',
  `Taxpercent` float(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderconfirm_email_queue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderconfirm_email_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Timestamp_created` int(11) NOT NULL,
  `Subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Message_text` text COLLATE utf8_unicode_ci NOT NULL,
  `To_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Sendtts` int(11) NOT NULL COMMENT 'Sendt timestamp',
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`),
  CONSTRAINT `orderconfirm_email_queue_ibfk_1` FOREIGN KEY (`Orderid`) REFERENCES `orders` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parked` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Recurring` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Parent_id` int(11) NOT NULL COMMENT 'If this is a suborder of another order(split)',
  `Trackingid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'RANDOM UNIQUEID',
  `Edi_tracking` bigint(20) NOT NULL,
  `Uniquetime` int(11) NOT NULL COMMENT 'Set timestamp to prevent possible double regs if reload of page',
  `Payment` enum('Invoice','Cash','Creditcard') COLLATE utf8_unicode_ci NOT NULL,
  `Payment_method` int(3) NOT NULL COMMENT 'What payment method on this order. Refers to table payment_methods',
  `Agreed_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Tax` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Finishedprice` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is this order ready to be invoiced',
  `Invoice_id` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Time` int(11) NOT NULL,
  `Readytime` int(11) NOT NULL,
  `Pickup_before` int(11) NOT NULL,
  `Deliver_after` int(11) NOT NULL,
  `Deadlinetime` int(11) NOT NULL,
  `Servicetype` tinyint(4) NOT NULL,
  `Vehicletype` tinyint(4) NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  `Customer_contact` int(11) NOT NULL,
  `Send_pod` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'If to send email with pod to order contact',
  `Added_time` int(11) NOT NULL,
  `Added_by` tinyint(4) NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Cancelled` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Cancelled_time` int(11) NOT NULL,
  `Cancelled_by` tinyint(3) NOT NULL,
  `Completed` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Orderlist_bgcolor` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_alone` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PdaUseScanning` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Lastupdated` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoice_id` (`Invoice_id`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Uniquetime` (`Uniquetime`),
  KEY `Servicetype` (`Servicetype`),
  KEY `Vehicletype` (`Vehicletype`),
  KEY `Readytime` (`Readytime`),
  KEY `Completed` (`Completed`),
  KEY `Trackingid` (`Trackingid`),
  KEY `Edi_tracking` (`Edi_tracking`),
  KEY `Cancelled` (`Cancelled`),
  KEY `Parent_id` (`Parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_addresses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_addresses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `ListingID` tinyint(4) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Type` enum('P','D') COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `Latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Merk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Added` int(11) NOT NULL,
  `Enroute_timestamp` int(11) NOT NULL COMMENT 'Timestamp when user is enroute',
  `Enroute_Latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Arrived_timestamp` int(11) DEFAULT NULL COMMENT 'Timestamp when driver has arrived at location',
  `Arrived_Latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Driver_timestamp` int(11) DEFAULT NULL COMMENT 'Timestamp when driver has either picked up or delivered',
  `Driver_Latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Driver_merk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Lessloss` tinyint(2) NOT NULL,
  `Wait` int(2) NOT NULL,
  `Quantity_delivered` tinyint(4) NOT NULL,
  `Signature_file` longblob NOT NULL,
  `Signature_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Signature_printed` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Signature_req` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `Driver_timestamp` (`Driver_timestamp`),
  KEY `ListingID` (`ListingID`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_kolli`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_kolli` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `PCI` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `F24I` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Frakt24 kolliid',
  `Weight` float(11,2) NOT NULL,
  `Width` float(11,2) NOT NULL,
  `Length` float(11,2) NOT NULL,
  `Height` float(11,2) NOT NULL,
  `Type` enum('pk','pl') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Address_id` (`Orderid`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores kollies connected to order_addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_kolliinfo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_kolliinfo` (
  `Orderid` int(11) NOT NULL,
  `Totweight` float(11,2) NOT NULL,
  `Totdmq` float(11,2) NOT NULL,
  `Totquantity` tinyint(4) NOT NULL,
  `Totwidth` float(11,2) NOT NULL,
  `Totlength` float(11,2) NOT NULL,
  `Totheight` float(11,2) NOT NULL,
  `Totpl` tinyint(4) NOT NULL,
  `Totpk` tinyint(4) NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_notifications`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Notify` enum('bp','ap','bd','ad') COLLATE utf8_unicode_ci NOT NULL,
  `Method` enum('email','sms') COLLATE utf8_unicode_ci NOT NULL,
  `SendTo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Added_time` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Selected notification on order actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_session`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_session` (
  `Orderid` int(11) NOT NULL COMMENT 'Orderid of order edited',
  `Adminid` int(11) NOT NULL COMMENT 'Id of the admin editing order',
  `Edit_ts` int(11) NOT NULL COMMENT 'Unixtimest when this was last edited',
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about who is editing a order. Used to lock the e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordertodriver`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordertodriver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Type` enum('pda','sms','manual','email') COLLATE utf8_unicode_ci NOT NULL,
  `Send_to_drivertime` int(11) NOT NULL COMMENT 'Unix timestamp when sendt to driver.',
  `Alertread` int(11) NOT NULL COMMENT 'Unix_timestamp when alert is read',
  `driver_accepted` int(11) NOT NULL COMMENT 'unix timestamp when driver accepted',
  `driver_rejected` int(11) NOT NULL COMMENT 'unix_timestamp when driver rejected or timeout',
  `Note` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Note about rejected / timeout',
  `Driverid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`),
  KEY `Type` (`Type`),
  KEY `Driverid` (`Driverid`),
  KEY `driver_accepted` (`driver_accepted`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All pages is registered here. Used to set permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_methods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `ID` tinyint(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the different payment methods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pda_connection_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pda_connection_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) NOT NULL COMMENT 'What user has connected',
  `Ipaddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timeconnected` int(11) NOT NULL COMMENT 'UNIX timestamp when connection took place',
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Userid`)
) ENGINE=InnoDB AUTO_INCREMENT=38515420 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores connection info from pda. From script: action_ajax/ge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pda_login_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pda_login_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) NOT NULL,
  `Times` int(11) NOT NULL COMMENT 'Timestamp for login/out',
  `Action` enum('L','O') COLLATE utf8_unicode_ci NOT NULL COMMENT 'L=login, O=logout',
  `Version` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Versionid',
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Userid`)
) ENGINE=InnoDB AUTO_INCREMENT=98808 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pda_order_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pda_order_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Action` enum('tildelt','accepted','rejected','kansellert','trukket','timeout','timeout pda') COLLATE utf8_unicode_ci NOT NULL,
  `Adminid` int(11) DEFAULT NULL COMMENT 'If this is a action done by admin',
  `Notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL COMMENT 'UNIX_TIMESTAMP',
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=926640 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Log all order communcation with pda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricelist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricelist` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float(11,2) NOT NULL,
  `Driver_price` float(11,2) NOT NULL COMMENT 'Stores the driver price if different from standard price',
  `Driver_percent` float(11,2) NOT NULL,
  `Tax` int(11) NOT NULL COMMENT 'Ref to tax table',
  `List_priority` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The main table for prices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recurring_orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurring_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Drivercomtype` enum('pda','manual') NOT NULL,
  `Start_time` int(11) NOT NULL,
  `End_time` int(11) NOT NULL,
  `Pause_from` int(11) NOT NULL,
  `Pause_to` int(11) NOT NULL,
  `Active` enum('Y','N') NOT NULL,
  `Regby` int(11) NOT NULL COMMENT 'Adminid',
  `Regtime` int(11) NOT NULL,
  `Pickupafter_hh` tinyint(2) NOT NULL,
  `Pickupafter_mm` tinyint(2) NOT NULL,
  `Deliverbefore_hh` tinyint(2) NOT NULL,
  `Deliverbefore_mm` tinyint(2) NOT NULL,
  `Deliverafter_hh` tinyint(2) NOT NULL,
  `Deliverafter_mm` tinyint(2) NOT NULL,
  `Mond` tinyint(1) NOT NULL,
  `Tuesd` tinyint(1) NOT NULL,
  `Wedn` tinyint(1) NOT NULL,
  `Thurs` tinyint(1) NOT NULL,
  `Frid` tinyint(1) NOT NULL,
  `Sat` tinyint(1) NOT NULL,
  `Sund` tinyint(1) NOT NULL,
  `Lastupdated` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route_optimized`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_optimized` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Routeid` int(11) NOT NULL,
  `Adminid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route_optimized_addresses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_optimized_addresses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoID` int(11) NOT NULL COMMENT 'Route optimized table id',
  `Addressid` int(11) NOT NULL,
  `Orderid` int(11) NOT NULL,
  `Deliverytime` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the result of routeoptimizing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  `Last_changed` int(11) NOT NULL,
  `Active` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes_drivers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes_drivers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Routeid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Adminid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes_orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Routeid` int(11) NOT NULL,
  `Adminid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sellers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Budget` float(11,2) NOT NULL,
  `Added_time` int(11) NOT NULL,
  `Added_user` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_types` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Deadline_seconds` int(11) NOT NULL,
  `Code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` tinyint(2) NOT NULL,
  `Bgcolor` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Fontcolor` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Customerweb` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Orderbefore_hh` tinyint(2) NOT NULL,
  `Orderbefore_mm` tinyint(2) NOT NULL,
  `Deliverbefore_hh` tinyint(2) NOT NULL,
  `Deliverbefore_mm` tinyint(2) NOT NULL,
  `Deliverbefore_days` tinyint(3) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_types_customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_types_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Service_type_ID` int(11) NOT NULL,
  `Cst_deadline` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customer_id` (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customers service_types deadline';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stripe_customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Contact_id` int(11) NOT NULL,
  `Stripe_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Contact_id` (`Contact_id`),
  KEY `Stripe_id` (`Stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notifications`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Timest` int(11) NOT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Timest` (`Timest`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store notifications made by the system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` float(11,2) NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreditAccountNumber` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TaxClassNo` int(1) NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` tinyint(3) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_types` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Customerweb` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Should this row be visible on customerweb',
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Maxkolliweight` int(11) NOT NULL,
  `Maxtotalweight` int(11) NOT NULL,
  `Maxquantity` smallint(6) NOT NULL,
  `Maxlength` float NOT NULL,
  `Maxheight` smallint(11) NOT NULL,
  `Maxwidth` float NOT NULL,
  `Haslift` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `Maxliftweight` int(11) NOT NULL COMMENT 'Max lift weight in grams',
  `List_priority` tinyint(3) NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawn_orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawn_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Withdrawntime` int(11) NOT NULL,
  `Withdrawnread` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`),
  KEY `Userid` (`Driverid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zip_no`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip_no` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zip` smallint(6) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Zones_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zip` (`Zip`),
  KEY `City` (`City`)
) ENGINE=InnoDB AUTO_INCREMENT=4793 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zone_autopricing`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_autopricing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zone_id` int(11) NOT NULL,
  `Zone_id_2` int(11) NOT NULL,
  `Service_type` int(11) NOT NULL,
  `Vehicle_type` int(11) NOT NULL,
  `Price_id` int(11) NOT NULL,
  `Deadlineminutes` int(11) NOT NULL,
  `Deliverbefore_hh` tinyint(2) NOT NULL,
  `Deliverbefore_mm` tinyint(2) NOT NULL,
  `Deliverbefore_days` tinyint(3) NOT NULL,
  `Availableto_hh` tinyint(2) NOT NULL DEFAULT '23',
  `Availableto_mm` tinyint(2) NOT NULL DEFAULT '59',
  `Monday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Tuesday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Wednesday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Thursday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Friday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Saturday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Sunday` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zone_id` (`Zone_id`),
  KEY `Service_type` (`Service_type`),
  KEY `Vehicle_type` (`Vehicle_type`),
  KEY `Price_id` (`Price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is used to make price combination for every possible ty';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zone_id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the zone',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Zone_id` (`Zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about different zones';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-28 11:30:21
