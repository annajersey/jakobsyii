-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2016 at 03:14 PM
-- Server version: 10.0.21-MariaDB-log
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jakobs`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_exportformat`
--

CREATE TABLE `accounting_exportformat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Different accounting export types';

-- --------------------------------------------------------

--
-- Table structure for table `addressbook`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `admin2departments`
--

CREATE TABLE `admin2departments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Departmentid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`,`Departmentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relates admin users to departments';

-- --------------------------------------------------------

--
-- Table structure for table `admin2pages`
--

CREATE TABLE `admin2pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Pageid` int(11) NOT NULL,
  `Pagename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`,`Pageid`),
  KEY `Pagename` (`Pagename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relation between admin and pages. Used in access control';

-- --------------------------------------------------------

--
-- Table structure for table `admin_allowed_ip`
--

CREATE TABLE `admin_allowed_ip` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_chat`
--

CREATE TABLE `admin_chat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MsgFrom` int(11) NOT NULL,
  `MsgTo` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `Sendtime` int(11) NOT NULL,
  `Readtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `From` (`MsgFrom`,`MsgTo`,`Sendtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_dispatch_list`
--

CREATE TABLE `admin_dispatch_list` (
  `Adminid` int(11) NOT NULL,
  `Orderid` int(11) NOT NULL,
  `Added_ts` int(11) NOT NULL,
  KEY `Adminid` (`Adminid`,`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores a list for quick dispatch of several order to driver';

-- --------------------------------------------------------

--
-- Table structure for table `admin_employeegroups`
--

CREATE TABLE `admin_employeegroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `List_priority` tinyint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_log`
--

CREATE TABLE `admin_login_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Type` enum('login','logout') COLLATE utf8_unicode_ci NOT NULL,
  `Time` int(11) NOT NULL,
  `Remote_addr` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `admin_prefs`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores admin preferenses.';

-- --------------------------------------------------------

--
-- Table structure for table `admin_uploads`
--

CREATE TABLE `admin_uploads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Filetype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `Createdtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about uploads by admin';

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_uploads`
--

CREATE TABLE `client_uploads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Adminid` int(11) NOT NULL,
  `Filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Filetype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `Createdtime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Adminid` (`Adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about uploads by admin';

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment` (`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_positiontypes`
--

CREATE TABLE `contacts_positiontypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Different contact position types';

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(4) CHARACTER SET latin1 NOT NULL,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Sortorder` smallint(4) NOT NULL,
  `Active` enum('N','Y') CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit_days`
--

CREATE TABLE `credit_days` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Days` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Contains the standard credit days to invoice';

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_prices`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the customers special prices related to pricelist';

-- --------------------------------------------------------

--
-- Table structure for table `customer_seller_new`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_trekk`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about trekk on drivers';

-- --------------------------------------------------------

--
-- Table structure for table `driver_deliveredstatus_today`
--

CREATE TABLE `driver_deliveredstatus_today` (
  `driverid` int(11) NOT NULL,
  `deliveredcount` int(11) NOT NULL,
  `totalcount` int(11) NOT NULL,
  `updatedtime` int(11) NOT NULL,
  KEY `driverid` (`driverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temp table content generated by cron';

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `fee`
--

CREATE TABLE `fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` float(11,2) NOT NULL,
  `Tax` int(11) NOT NULL COMMENT 'Tax table',
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `giftcards`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores gift cards';

-- --------------------------------------------------------

--
-- Table structure for table `goodstypes`
--

CREATE TABLE `goodstypes` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `List_priority` tinyint(3) NOT NULL,
  `Customerweb` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Show on customerweb',
  `Active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_email`
--

CREATE TABLE `invoice_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invoiceid` int(11) NOT NULL,
  `Email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Added_time` int(11) NOT NULL,
  `Sendt_time` int(11) NOT NULL,
  `Server_response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoiceid` (`Invoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about invoices that should be sendt by em';

-- --------------------------------------------------------

--
-- Table structure for table `invoice_export`
--

CREATE TABLE `invoice_export` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ts` int(11) NOT NULL COMMENT 'Unix timestamp when created',
  `Adminid` int(11) NOT NULL,
  `Export_system` smallint(5) NOT NULL,
  `Send_to_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Send_ts` int(11) NOT NULL COMMENT 'Unix ts when this is sendt.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_fee`
--

CREATE TABLE `invoice_fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Invoiceid` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` float(11,2) NOT NULL,
  `Taxid` int(11) NOT NULL,
  `Taxpercent` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Invoiceid` (`Invoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_group`
--

CREATE TABLE `invoice_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contains the various invoice groups';

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `method` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `receive_date` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kolli_scan`
--

CREATE TABLE `kolli_scan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kolliid` int(11) NOT NULL,
  `Addressid` int(11) NOT NULL,
  `Timest` int(11) NOT NULL,
  `Scantype` enum('P','D','C') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Kolliid` (`Kolliid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kreditnota`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kreditnota_prices`
--

CREATE TABLE `kreditnota_prices` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kreditnotaid` int(11) NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float(11,2) NOT NULL,
  `Quantity` float(11,2) NOT NULL,
  `Taxid` int(11) NOT NULL COMMENT 'Refer to tax table',
  `Taxpercent` float(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Kreditnotaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `listdataupdated`
--

CREATE TABLE `listdataupdated` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ListName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_out`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages_pda`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mycompanyinfo`
--

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
  `Vat` float(11,2) NOT NULL,
  `CurrencyName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_export_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Invoice_export_format` tinyint(5) NOT NULL,
  `Invoice_ordertodriveronly` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
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
  `Notifytext_bp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notifytext_ap` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notifytext_bd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notifytext_ad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JwtKey` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all information about the company';

-- --------------------------------------------------------

--
-- Table structure for table `notifications_queue`
--

CREATE TABLE `notifications_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Method` enum('SMS','EMAIL') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Added time` int(11) NOT NULL,
  `Sendt_time` int(11) NOT NULL,
  `Response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Order notifications queue';

-- --------------------------------------------------------

--
-- Table structure for table `ocr`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `orderconfirm_email_queue`
--

CREATE TABLE `orderconfirm_email_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Timestamp_created` int(11) NOT NULL,
  `Subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Message_text` text COLLATE utf8_unicode_ci NOT NULL,
  `To_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Sendtts` int(11) NOT NULL COMMENT 'Sendt timestamp',
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders_addresses`
--

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
  `Arrived_timestamp` int(11) DEFAULT NULL COMMENT 'Timestamp when driver has arrived at location',
  `Driver_timestamp` int(11) DEFAULT NULL COMMENT 'Timestamp when driver has either picked up or delivered',
  `Driver_merk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Driver_latlon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders_kolli`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `orders_kolliinfo`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `orders_notifications`
--

CREATE TABLE `orders_notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Notify` enum('bp','ap','bd','ad') COLLATE utf8_unicode_ci NOT NULL,
  `Method` enum('email','sms') COLLATE utf8_unicode_ci NOT NULL,
  `SendTo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Added_time` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Selected notification on order actions';

-- --------------------------------------------------------

--
-- Table structure for table `orders_session`
--

CREATE TABLE `orders_session` (
  `Orderid` int(11) NOT NULL COMMENT 'Orderid of order edited',
  `Adminid` int(11) NOT NULL COMMENT 'Id of the admin editing order',
  `Edit_ts` int(11) NOT NULL COMMENT 'Unixtimest when this was last edited',
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about who is editing a order. Used to lock the e';

-- --------------------------------------------------------

--
-- Table structure for table `ordertodriver`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `order_log`
--

CREATE TABLE `order_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Operation` enum('Insert','Update','Cancell','Price insert','Price update') COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  `Adminid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_prices`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All pages is registered here. Used to set permissions';

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `ID` tinyint(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the different payment methods';

-- --------------------------------------------------------

--
-- Table structure for table `pda_connection_log`
--

CREATE TABLE `pda_connection_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) NOT NULL COMMENT 'What user has connected',
  `Ipaddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timeconnected` int(11) NOT NULL COMMENT 'UNIX timestamp when connection took place',
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores connection info from pda. From script: action_ajax/ge';

-- --------------------------------------------------------

--
-- Table structure for table `pda_login_log`
--

CREATE TABLE `pda_login_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) NOT NULL,
  `Times` int(11) NOT NULL COMMENT 'Timestamp for login/out',
  `Action` enum('L','O') COLLATE utf8_unicode_ci NOT NULL COMMENT 'L=login, O=logout',
  `Version` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Versionid',
  PRIMARY KEY (`ID`),
  KEY `Userid` (`Userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pda_order_log`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Log all order communcation with pda';

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The main table for prices';

-- --------------------------------------------------------

--
-- Table structure for table `pricelist_backup`
--

CREATE TABLE `pricelist_backup` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The main table for prices';

-- --------------------------------------------------------

--
-- Table structure for table `price_autoschema`
--

CREATE TABLE `price_autoschema` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `From_postcode` int(11) NOT NULL,
  `To_postcode` int(11) NOT NULL,
  `Service_type` int(11) NOT NULL,
  `Vehicle_type` int(11) NOT NULL,
  `Price_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_orders_addresses`
--

CREATE TABLE `recurring_orders_addresses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `ListingID` tinyint(4) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Type` enum('P','D') COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Zip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Merk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Added` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `ListingID` (`ListingID`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_orders_new`
--

CREATE TABLE `recurring_orders_new` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Uniquetime` int(11) NOT NULL COMMENT 'Set timestamp to prevent possible double regs if reload of page',
  `Tax` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Driver_ID` int(11) NOT NULL COMMENT 'What driver to send order to',
  `Drivercomtype` enum('pda','sms','manual','email') COLLATE utf8_unicode_ci NOT NULL,
  `Ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Service_type` tinyint(4) NOT NULL,
  `Vehicle_type` tinyint(4) NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Customer_contact` int(11) NOT NULL,
  `Send_pod` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL COMMENT 'If to send email with pod to order contact',
  `Added_time` int(11) NOT NULL,
  `Added_by` tinyint(4) NOT NULL,
  `Starttime` int(11) NOT NULL,
  `Endtime` int(11) NOT NULL,
  `Timeonday_hh` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `Timeonday_mm` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `Mand` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Tirsd` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Onsd` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Torsd` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Fred` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Lord` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Sond` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Uniquetime` (`Uniquetime`),
  KEY `Servicetype` (`Service_type`),
  KEY `Vehicletype` (`Vehicle_type`),
  KEY `Starttime` (`Starttime`),
  KEY `Endtime` (`Endtime`),
  KEY `Active` (`Active`),
  KEY `Driver_id` (`Driver_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_order_prices`
--

CREATE TABLE `recurring_order_prices` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float(11,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` float(11,2) NOT NULL,
  `Driver_price` float(11,2) NOT NULL,
  `Driver_percent` float(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_order_tax`
--

CREATE TABLE `recurring_order_tax` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Tax_id` int(11) NOT NULL,
  `Tax_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Tax_percent` float(11,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `service_types_customer`
--

CREATE TABLE `service_types_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Service_type_ID` int(11) NOT NULL,
  `Cst_deadline` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Customer_id` (`Customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customers service_types deadline';

-- --------------------------------------------------------

--
-- Table structure for table `stripe_customer`
--

CREATE TABLE `stripe_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Contact_id` int(11) NOT NULL,
  `Stripe_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Timest` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Contact_id` (`Contact_id`),
  KEY `Stripe_id` (`Stripe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_notifications`
--

CREATE TABLE `system_notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Timest` int(11) NOT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Timest` (`Timest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store notifications made by the system';

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawn_orders`
--

CREATE TABLE `withdrawn_orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Orderid` int(11) NOT NULL,
  `Driverid` int(11) NOT NULL,
  `Withdrawntime` int(11) NOT NULL,
  `Withdrawnread` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orderid` (`Orderid`),
  KEY `Userid` (`Driverid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zip_no`
--

CREATE TABLE `zip_no` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zip` smallint(6) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Zones_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zip` (`Zip`),
  KEY `City` (`City`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zone_id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the zone',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Zone_id` (`Zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about different zones';

-- --------------------------------------------------------

--
-- Table structure for table `zone_autopricing`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is used to make price combination for every possible ty';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_email`
--
ALTER TABLE `invoice_email`
  ADD CONSTRAINT `invoice_email_ibfk_1` FOREIGN KEY (`Invoiceid`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invoice_fee`
--
ALTER TABLE `invoice_fee`
  ADD CONSTRAINT `invoice_fee_ibfk_1` FOREIGN KEY (`Invoiceid`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `orderconfirm_email_queue`
--
ALTER TABLE `orderconfirm_email_queue`
  ADD CONSTRAINT `orderconfirm_email_queue_ibfk_1` FOREIGN KEY (`Orderid`) REFERENCES `orders` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;





INSERT INTO `payment_methods` (`ID`, `Name`) VALUES
(1, 'Invoice'),
(2, 'Cash'),
(3, 'Creditcard-Stripe');


INSERT INTO `pages` (`ID`, `Active`, `Name`) VALUES
(1, 'Y', 'settings'),
(2, 'Y', 'dispatch'),
(3, 'Y', 'print'),
(4, 'Y', 'ordersearch'),
(5, 'Y', 'transportorder_new'),
(6, 'Y', 'transportorder_edit'),
(7, 'Y', 'prices'),
(9, 'Y', 'reports'),
(10, 'Y', 'drivers'),
(11, 'Y', 'users'),
(12, 'Y', 'invoice'),
(14, 'Y', 'myaccount'),
(15, 'Y', 'customer'),
(16, 'Y', 'changelog'),
(17, 'Y', 'order-pricing'),
(18, 'Y', 'orders'),
(19, 'Y', 'generate'),
(20, 'Y', 'testpage'),
(21, 'Y', 'superadmin');


INSERT INTO `drivers` ( `DrivereksternID`, `CompanyName`, `DriverName`, `Vehicle_type`, `Percent`, `Orgnr`, `Address`, `Zip`, `City`, `Country`, `Phone1`, `Phone2`, `Email`, `Carinfo`, `CarRegnr`, `Notes`, `Username`, `Password`, `Active`, `Vat`, `Monthly_license`, `Accounting_number`, `Hjelm`, `Vest`, `Vernesko`, `Idkort`, `Arbeidstoy`, `ADR`, `Takstativ`, `Bildekor`, `Hengerfeste`, `Car_brand`, `Aarsmodell`, `Farge`, `Nyttelastkg`, `Inv_lengde`, `Inv_bredde`, `Inv_hoyde`, `Start_time`, `End_time`, `Regtime`) VALUES
( 1, 'Dummydriver', 'F24 Dummy', 3, 60, '242342342', 'Dummyaddress', '1312', 'Oslo', 'no', '34234234', '13123123', 'test@test.com', 'test', '234234sdfsd', '', 'mk', 'km', 'Y', 'N', 0.00, '', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 3, 0, 'hvit', 0.00, 0.00, 0.00, 0.00, 0, 0, 0);


INSERT INTO `vehicle_types` (`ID`, `Name`, `Icon`, `Customerweb`, `Description`, `Maxkolliweight`, `Maxtotalweight`, `Maxquantity`, `Maxlength`, `Maxheight`, `Maxwidth`, `Haslift`, `Maxliftweight`, `List_priority`, `Active`) VALUES
(1, 'Budbil', 'litenbil.png', 'Y', 'Liten bil. Varene må kunne plasseres i forsetet. Max 20kg / 3 kolli. ', 35, 100, 100, 0, 0, 0, 'N', 0, 0, 'Y'),
(2, 'Liten varebil', 'litenvarebil.png', 'N', '21 – 99 kg (inntil 1.5 m lastelengde)', 35, 100, 10000, 0, 0, 0, 'N', 0, 6, 'N'),
(3, 'Varebil', 'varebil.png', 'Y', '100 – 300 kg. Tilsvarer inntil 30 a-4 esker. (inntil 2.5 m lastelengde) ', 36, 300, 30, 0, 0, 0, 'N', 0, 1, 'Y'),
(4, 'Stor varebil', 'storvare.png', 'Y', '301 - 750 kg. Tilsvarer inntil 50 a-4 esker.  (inntil 4.0 m lastelengde)', 35, 800, 10000, 0, 0, 0, 'N', 0, 2, 'Y'),
(5, 'Lastebil KL1', 'lastebil.png', 'Y', 'Maks 1,80m høyt gods, maks 500 kg pr pall, maks total vekt 1000 kg og maks 4 meter totallengde.', 750, 3500, 10000, 500, 100, 200, 'Y', 750, 3, 'Y'),
(6, 'Lastebil KL2', 'lastebilkl2.png', 'Y', 'Maks 2,50m høyt gods, maks 2000 kg pr pall, maks total vekt 9000 kg og maks 7 meter totallengde.', 1250, 5000, 10000, 0, 0, 0, 'Y', 1250, 4, 'Y'),
(7, 'Sykkelbud', 'sykkel.png', 'N', 'Raskt og miljøvennlig i Oslo sentrum (innen ring 2). Dokumenter inntil a-3 størrelse. Max vekt 4 kg.', 0, 0, 0, 0, 0, 0, 'N', 0, 5, 'N');


INSERT INTO `country` (`ID`, `CountryCode`, `Name`, `Sortorder`, `Active`) VALUES
(1, 'no', 'Norway', 0, 'Y'),
(2, 'se', 'Sweden', 2, 'Y'),
(3, 'dk', 'Denmark', 1, 'Y');




