-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: flowershop
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'quasi'),(2,'iste'),(3,'aliquid'),(4,'voluptas'),(5,'rem'),(6,'officiis'),(7,'voluptatem'),(8,'sed'),(9,'vero'),(10,'fugiat'),(11,'modi'),(12,'laborum'),(13,'similique'),(14,'ab'),(15,'officia'),(16,'et'),(17,'dolore'),(18,'maiores'),(19,'nulla'),(20,'sit'),(21,'eveniet'),(22,'numquam'),(23,'ut'),(24,'vel'),(25,'corrupti'),(26,'et'),(27,'deleniti'),(28,'fuga'),(29,'rerum'),(30,'non');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `id_delivery` int NOT NULL AUTO_INCREMENT,
  `delivery_datetime` datetime NOT NULL,
  `Providers_id_provider` int NOT NULL,
  `Warehouses_id_warehouse` int NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `fk_Deliveries_Providers_idx` (`Providers_id_provider`),
  KEY `fk_Deliveries_Warehouses1_idx` (`Warehouses_id_warehouse`),
  CONSTRAINT `fk_Deliveries_Providers` FOREIGN KEY (`Providers_id_provider`) REFERENCES `providers` (`id_provider`),
  CONSTRAINT `fk_Deliveries_Warehouses1` FOREIGN KEY (`Warehouses_id_warehouse`) REFERENCES `warehouses` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'2022-06-01 11:33:41',9,4),(2,'2009-07-09 01:38:02',4,2),(3,'1990-05-10 03:13:37',4,6),(4,'1999-10-21 17:55:35',5,2),(5,'2022-11-20 04:09:49',3,1),(6,'2009-04-21 00:04:26',9,3),(7,'2006-01-14 03:11:59',5,7),(8,'1989-02-04 13:29:49',1,2),(9,'1985-04-19 06:53:04',10,1),(10,'2021-06-01 15:52:00',1,7),(11,'2002-04-25 10:51:04',6,1),(12,'2015-12-09 13:03:51',7,3),(13,'2009-04-28 21:05:04',7,4),(14,'1970-11-27 08:38:07',7,1),(15,'2011-06-17 03:18:47',8,7),(16,'2012-02-18 04:53:02',6,7),(17,'1995-03-17 12:37:34',5,1),(18,'2021-03-02 19:42:52',10,7),(19,'1981-07-26 13:26:12',4,4),(20,'2016-08-16 14:40:04',9,5),(21,'1995-12-07 02:12:22',8,2),(22,'1991-10-24 01:02:27',5,4),(23,'1973-11-13 04:20:23',2,4),(24,'1989-02-16 03:56:30',3,7),(25,'1978-01-09 08:41:03',7,4),(26,'1979-03-26 09:50:12',2,3),(27,'1989-07-08 23:38:57',4,3),(28,'2017-07-22 16:14:02',8,7),(29,'1998-09-03 10:42:29',5,1),(30,'1985-08-03 16:17:18',4,5),(31,'2022-11-10 23:24:03',4,4),(32,'2017-08-01 02:14:44',7,1),(33,'2018-12-24 09:34:08',3,3),(34,'2018-11-08 05:56:31',2,2),(35,'1973-02-10 01:27:22',3,6),(36,'2004-01-27 17:26:55',5,7),(37,'2014-03-06 19:34:26',10,3),(38,'1994-07-01 12:22:57',9,2),(39,'2006-10-02 18:53:28',1,4),(40,'1995-12-10 16:25:34',5,3),(41,'1977-10-20 19:52:05',2,2),(42,'2019-07-23 19:45:23',5,1),(43,'2015-07-21 13:09:04',8,7),(44,'1977-05-05 22:31:15',5,3),(45,'2008-12-20 00:00:22',1,4),(46,'1974-01-30 17:50:07',6,1),(47,'2013-02-11 04:20:16',6,1),(48,'1984-09-26 10:33:48',3,3),(49,'1982-05-16 13:49:17',2,6),(50,'1985-03-18 22:11:34',10,5),(51,'1994-04-12 22:16:09',3,4),(52,'2004-12-18 06:15:23',9,2),(53,'1986-02-27 19:40:36',4,6),(54,'1997-07-12 21:58:50',8,6),(55,'2003-09-16 21:41:21',10,5),(56,'1973-08-26 10:43:26',7,5),(57,'1994-10-02 12:31:10',5,7),(58,'2022-09-21 23:50:18',5,2),(59,'1987-11-07 14:53:53',1,5),(60,'1992-08-04 02:06:48',10,7),(61,'1976-02-27 17:21:50',6,3),(62,'1998-10-13 13:06:03',2,2),(63,'2018-08-10 03:43:36',7,6),(64,'2002-02-09 05:53:50',8,2),(65,'1993-05-12 12:17:51',4,6),(66,'1989-11-02 06:30:00',2,5),(67,'2009-07-16 06:50:06',8,5),(68,'1998-10-04 21:37:46',2,5),(69,'1972-08-29 01:39:27',5,5),(70,'2014-01-02 08:46:58',7,3);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ms. Margot Ledner','924 Lemke Island Apt. 160\nLuettgenburgh, CA 84450-0677','89188144213','non','1979-11-28',57230),(2,'Liliane Corkery','82549 Stokes Haven\nNorth Rocio, HI 24455','89403616114','odio','2012-05-08',65232),(3,'Dr. Jamal Daniel II','7716 Gerhold Brooks\nEast Bethelfort, WV 75964-5227','89832715288','eveniet','2004-05-05',32325),(4,'Janice Bergnaum','9772 Malika Radial\nNew Chelsieside, ME 44516','89146864037','quas','2015-07-23',59693),(5,'Jeffry McDermott','70873 Weber Fall Apt. 366\nPort Garnettside, LA 73777','89720255561','nisi','1983-02-25',39250),(6,'Thora Ebert','4581 Raquel Falls Suite 760\nWest Erwinbury, MT 19851','89614838461','aut','1994-06-03',40353),(7,'Adeline Fritsch','87869 Brooke Lakes\nBeatricechester, WY 01470-6237','89121179653','minus','1979-06-04',29558),(8,'Modesta Stroman','3150 Hintz Grove\nWest Nevaport, IL 37292-1082','89891856286','veniam','1998-10-25',35047),(9,'Tianna Gusikowski','443 Karson Plaza\nNorth Leilanitown, SD 07861-8348','89022120524','iusto','1981-06-21',69170),(10,'Sheldon Gleason','7460 Beier Key Suite 060\nSouth Naomi, NV 12142','89277350739','velit','2000-02-29',53580),(11,'Hellen Schmidt','4629 Loma Crescent Apt. 565\nJazminbury, CT 09787','89929445688','iste','1974-08-24',27321),(12,'Prof. Lucious Bashirian III','8469 Blanche Alley\nCyrusport, AK 44195','89076712408','nulla','2000-08-10',39913),(13,'Elfrieda Moore V','014 Harvey Street Suite 565\nNew Kristianside, WV 33692','89333578673','doloremque','1972-10-23',53887),(14,'Dallin Kuhn','9763 Richie Meadows Suite 310\nNicolasberg, AK 94235','89422386960','saepe','1973-12-07',50785),(15,'Karlee Bogan','44227 Madisyn Fort Apt. 612\nEast Annaburgh, SD 47046','89464485946','dicta','1987-12-18',39569),(16,'Julian Wintheiser','342 Bradtke Radial Suite 886\nLake Nonastad, SC 83537-9502','89435005224','perferendis','1978-09-10',54375),(17,'Aubree Strosin','58348 Senger Pines Suite 490\nClaudieport, OH 93750','89436522025','quis','1991-09-23',37402),(18,'Prof. Isidro Greenfelder','346 Arch Shoals Apt. 886\nOliverberg, GA 80033-9300','89809449711','architecto','1995-05-03',32139),(19,'Sandrine Reynolds II','684 Kelly Shoal\nDickinsonside, TN 10610','89221568072','omnis','1976-12-19',75651),(20,'Cale Boehm','72072 Marjory Via\nPort Daishatown, KS 57435','89959610722','dicta','1977-02-23',62996),(21,'Mr. Lexus Turcotte Jr.','940 Richie Crescent Apt. 778\nHebermouth, DC 09518-8870','89243144915','voluptatibus','1989-02-04',75693),(22,'Obie Gutmann','51273 Anahi Unions Apt. 015\nGutmannmouth, DE 21284','89721065641','eveniet','2015-04-11',50306),(23,'Mitchel Lindgren','6812 Kris Tunnel\nWeissnatside, RI 39394-6349','89095077461','laudantium','1976-06-29',51552),(24,'Dr. Wyman Wilderman PhD','3870 Paolo Glen\nSouth Neldamouth, VA 00106-8862','89978337752','et','1985-05-11',41071),(25,'Prof. Frederic Funk','06622 Langworth Junction\nEast Charlottetown, WY 76719','89419539912','quae','2020-11-28',41800),(26,'Milo Goldner IV','95654 Mason Plaza\nGiovannyshire, AZ 23488','89233732501','at','1987-12-18',53893),(27,'Prof. Leanne Skiles','4249 Vivianne Mountains\nNew Rolandofurt, VT 54452','89764118131','nesciunt','2021-09-14',43456),(28,'Ezra Pfeffer','10720 Kreiger Islands Suite 870\nBergstromshire, ID 64347','89684281829','ut','2020-04-17',64047),(29,'Daniella Abshire III','567 Haley Haven\nNorth Ike, WY 73783-4152','89914330724','animi','2011-08-16',28581),(30,'Mr. Vincenzo O\'Connell','4184 Collins Expressway\nTownestad, IA 70889','89833108191','excepturi','1999-04-06',32709);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `sum_price` float NOT NULL,
  `address` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_datetime` datetime NOT NULL,
  `amount` int NOT NULL,
  `status` tinyint NOT NULL,
  `Users_id_user` int NOT NULL,
  `Warehouses_id_warehouse` int NOT NULL,
  `Shops_id_shop` int NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_Orders_Users1_idx` (`Users_id_user`),
  KEY `fk_Orders_Warehouses1_idx` (`Warehouses_id_warehouse`),
  KEY `fk_Orders_Shops1_idx` (`Shops_id_shop`),
  CONSTRAINT `fk_Orders_Shops1` FOREIGN KEY (`Shops_id_shop`) REFERENCES `shops` (`id_shop`),
  CONSTRAINT `fk_Orders_Users1` FOREIGN KEY (`Users_id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `fk_Orders_Warehouses1` FOREIGN KEY (`Warehouses_id_warehouse`) REFERENCES `warehouses` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,183.734,'040 Osinski Overpass Suite 888\nJacyntheville, MD 93170-3989','1984-08-17 23:02:16',31,0,8,1,8),(2,99.2352,'497 Yundt Islands\nBeckerfurt, GA 57073-7375','1974-02-27 15:44:05',45,1,47,3,12),(3,25.2569,'5874 Shakira Cove Suite 354\nNew Stephenhaven, ID 98615-9719','1996-08-15 18:15:28',29,0,17,6,3),(4,1493120,'905 Delta Via Apt. 658\nTellyfort, MO 66489','1982-01-05 20:52:49',3,0,46,3,9),(5,889.477,'780 Sam Freeway\nStarkhaven, ME 11067-4725','1979-01-01 13:35:04',38,1,40,1,13),(6,91.78,'751 Jairo Lake Apt. 353\nPort Annabellefurt, IL 97319','1974-08-01 02:13:45',12,1,16,3,12),(7,662480,'101 Annetta Burgs\nYasmeenberg, FL 99482','1985-02-17 14:57:39',29,0,13,6,2),(8,352.251,'907 Fritsch Drive Apt. 680\nSkyemouth, NE 60493','2015-01-18 09:45:04',25,0,22,5,12),(9,96.8612,'470 Hauck Motorway\nAddieside, MO 81206-5727','2014-03-02 15:55:45',21,0,1,2,13),(10,67831300,'83305 O\'Keefe Neck\nBergebury, KY 64468-1626','2015-05-09 03:22:48',40,0,36,5,12),(11,99.3112,'28979 Konopelski Streets Suite 619\nWelchton, FL 39358','1981-05-02 04:50:21',15,0,10,2,8),(12,511.572,'034 Alfred Creek Apt. 479\nNew Abigail, ID 82550','2006-03-30 16:11:05',13,0,7,7,7),(13,2360930,'1843 Mia Points Apt. 994\nSouth Sigmundburgh, MI 90235-7337','2000-01-26 06:25:09',48,1,40,3,11),(14,92.1853,'7719 Hackett Stream\nSouth Valentinhaven, KY 78051-2503','2013-09-28 19:10:13',3,1,33,3,5),(15,171972,'41889 Nicolette Motorway Suite 470\nEast Mauricioburgh, AZ 32389-0708','1991-04-21 09:45:41',10,0,33,7,14),(16,21.4943,'8099 Elna Squares Apt. 154\nPort Ramonaland, MN 66102-2063','2015-08-10 23:10:10',40,1,35,1,11),(17,430.972,'9223 Ullrich Fork\nAlicefurt, CO 63724-3409','1975-10-01 15:50:18',18,0,23,5,14),(18,2100.26,'80873 Alexandrine Stravenue Suite 432\nJanaeberg, UT 83279-1312','2018-05-23 07:25:27',12,0,44,7,8),(19,34131200,'5211 Tevin Coves Apt. 096\nPort Tyree, AL 77484','2004-04-12 08:06:01',41,1,2,3,2),(20,478.68,'89988 O\'Hara Plain\nNehaside, DC 96931','1987-04-08 05:48:03',39,1,39,5,7),(21,127500000,'0068 Joanne Shoals\nCorwinborough, DE 41730-8679','1981-09-29 10:53:20',43,0,8,3,8),(22,26957100,'3176 Stanton Manor Suite 753\nPort Jaylanmouth, AR 05388','1972-04-22 02:11:48',50,1,22,6,12),(23,105666,'055 Uriel Squares\nPowlowskistad, KY 59486','1978-07-21 19:00:04',4,0,24,7,2),(24,5525360,'6543 Citlalli Lodge Apt. 366\nPort Santa, LA 55907-7218','2016-05-23 10:00:22',43,1,43,5,6),(25,1044540,'14551 Veum Walks Suite 507\nCormierville, LA 38290','2007-01-11 13:13:12',5,0,23,5,7),(26,97.8655,'3237 Bahringer Lakes\nNew Devanhaven, SC 06553','2004-11-25 21:03:35',20,1,21,4,10),(27,56.6114,'93355 Cristobal Turnpike\nNew Danland, WY 86154-4952','1986-01-25 14:46:03',2,1,41,3,15),(28,85.2025,'909 Khalid Flat Suite 899\nBinsview, IN 22217','2003-05-15 15:39:05',44,1,42,4,1),(29,507953,'03087 Skyla Lane\nSchmidtstad, NH 52741','2009-03-13 19:38:50',30,0,40,5,14),(30,54.8636,'2483 Janessa Dam\nEast Ubaldoton, NM 50594','1985-09-16 05:11:13',42,1,11,4,5),(31,474214,'7801 Bernier Brooks\nZitamouth, TX 10346','1988-08-13 03:11:58',30,0,23,6,3),(32,177.212,'16246 Tremblay Squares Apt. 666\nPort Novella, ME 82261','1986-11-18 01:13:26',20,1,34,1,12),(33,24.1963,'95582 Rusty Squares\nPort Alvisville, AR 75808','2005-01-02 09:03:47',50,1,13,5,12),(34,77.8224,'6773 Leffler Way\nNorth Fredaton, GA 63309-6795','2010-06-12 14:01:44',44,1,2,1,9),(35,48.2723,'5601 Ephraim Hill Suite 573\nLake Elvie, NE 57777-5403','1986-03-11 23:50:58',22,1,25,3,6),(36,3079690,'012 Eugene Ferry\nPort Justynberg, CT 86792-5584','1973-10-07 04:06:45',38,1,5,7,1),(37,37629000,'28633 Clair Summit\nNew Bo, MD 76099','2017-12-10 21:58:24',29,0,35,5,6),(38,74.9338,'782 Citlalli Avenue\nTerrystad, LA 98353','2014-02-08 15:49:03',14,0,8,7,15),(39,4654910,'4981 Monte Camp\nJeanstad, FL 96812','1998-04-06 01:36:08',37,1,25,7,4),(40,2964.18,'4118 Everett Mountain\nWest Kaelynstad, MA 35639-6249','2008-07-14 08:41:46',37,1,20,5,2),(41,4193580,'6445 Cletus Creek Apt. 508\nLake Marietta, OH 14814-6012','2002-11-26 12:37:10',27,1,35,7,13),(42,2939.56,'111 Ledner Spur Apt. 599\nLake Burniceton, IN 43643-8307','2009-05-09 06:15:39',10,1,40,6,7),(43,527.676,'87208 Tony Roads Apt. 408\nDavishaven, AK 97175','1986-02-27 17:06:20',29,0,7,6,8),(44,144.277,'662 Abe Springs\nPort Jarrett, IL 70751-6526','1998-09-06 00:48:24',34,0,28,7,2),(45,84.7162,'287 Dallin Inlet Apt. 630\nLehnershire, NE 85610','1979-12-01 10:32:59',17,1,1,5,7),(46,14733000,'6553 Botsford Shoal\nEast Lavonside, TN 75754','2005-08-08 08:01:37',39,1,41,4,4),(47,51.5071,'28148 Meggie Square Apt. 728\nNorth Catalinamouth, MN 86159-2453','1995-12-25 04:15:07',46,0,28,1,5),(48,3.85258,'0814 Fahey Ford\nMurrayborough, WV 84479','1971-06-08 23:07:37',30,1,39,6,5),(49,181.367,'667 Bergstrom Divide Suite 336\nIzabellabury, MT 27677','1987-04-01 16:31:51',30,0,23,4,8),(50,74.8492,'011 Toy Dale\nWolftown, CO 44754','1987-03-01 10:19:01',38,1,10,3,13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `expiration_date` datetime NOT NULL,
  `Categories_id_category` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_Products_Categories1_idx` (`Categories_id_category`),
  CONSTRAINT `fk_Products_Categories1` FOREIGN KEY (`Categories_id_category`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'incidunt',1493,'2022-04-02 09:20:51',2),(2,'vero',603,'1970-12-17 07:51:59',15),(3,'odit',1210,'1991-09-09 21:22:20',18),(4,'possimus',1333,'1975-03-15 14:36:46',15),(5,'enim',885,'1974-04-30 13:01:54',5),(6,'ut',802,'2015-07-22 07:15:15',2),(7,'sunt',310,'2003-08-26 00:04:08',27),(8,'vel',1142,'2016-08-06 03:29:58',28),(9,'voluptas',480,'2005-09-21 03:05:19',8),(10,'ut',361,'1971-02-22 02:39:42',20),(11,'sit',1395,'2014-02-12 09:46:52',15),(12,'quis',726,'2021-06-17 03:01:20',14),(13,'sed',817,'1985-11-11 09:42:44',15),(14,'eaque',313,'1978-03-11 17:29:52',29),(15,'animi',636,'1973-03-15 16:26:52',29),(16,'eligendi',746,'2003-08-19 20:37:10',19),(17,'nisi',439,'1991-11-14 17:18:00',5),(18,'incidunt',246,'2013-10-09 00:05:25',19),(19,'deleniti',877,'1999-12-10 08:52:10',2),(20,'at',834,'2006-02-21 13:31:18',5),(21,'vel',478,'2016-07-02 18:40:25',15),(22,'iusto',161,'1997-10-19 10:46:15',29),(23,'modi',1083,'2019-03-29 00:14:46',13),(24,'eos',842,'1993-02-22 06:59:23',18),(25,'quo',728,'1979-10-22 00:28:57',18),(26,'repudiandae',155,'2006-12-15 23:44:51',12),(27,'beatae',174,'2019-02-07 12:23:06',21),(28,'repellat',1221,'1989-07-16 12:26:59',11),(29,'placeat',1412,'1973-10-22 06:39:33',21),(30,'minima',1280,'1971-10-11 22:56:06',8),(31,'modi',1266,'1996-03-29 05:32:37',29),(32,'dicta',644,'1984-07-23 03:14:05',5),(33,'voluptas',1387,'2022-09-02 05:26:24',21),(34,'odit',255,'2016-01-09 17:57:47',8),(35,'omnis',1136,'2002-05-08 18:59:56',1),(36,'vel',1228,'2016-03-10 08:46:25',10),(37,'accusamus',1122,'2017-11-01 11:19:22',21),(38,'repudiandae',754,'1986-05-25 21:47:43',4),(39,'quia',833,'2005-03-14 13:28:29',19),(40,'est',468,'1979-05-25 10:48:51',4),(41,'dolorem',309,'2004-10-13 22:04:03',19),(42,'deleniti',1455,'2011-03-28 04:30:36',19),(43,'nam',390,'2005-02-10 07:51:45',22),(44,'exercitationem',1108,'1995-01-31 17:48:36',23),(45,'voluptas',1062,'1976-02-20 23:07:17',28),(46,'neque',1438,'1984-04-03 04:34:42',2),(47,'accusamus',871,'2007-08-28 02:05:50',23),(48,'impedit',948,'1989-09-19 17:03:00',11),(49,'voluptatem',158,'2012-03-28 07:15:59',8),(50,'id',488,'2009-12-29 02:49:40',15),(51,'aliquam',882,'2000-11-14 10:47:06',12),(52,'consequatur',1378,'2018-06-04 17:21:33',1),(53,'officia',405,'1980-12-09 23:31:53',30),(54,'quod',536,'1986-11-30 18:18:13',26),(55,'suscipit',317,'2003-12-15 07:21:03',28),(56,'qui',1070,'2022-10-09 03:18:20',18),(57,'magni',921,'1996-06-26 22:31:33',2),(58,'maiores',308,'1991-04-23 17:40:36',9),(59,'earum',1478,'1979-01-25 16:08:00',29),(60,'maxime',1267,'2013-07-05 20:23:28',29);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id_provider` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_provider`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Jerde Group','96646 Haven Groves Apt. 761\nBrandynbury, TN 70299-8734','89256847335'),(2,'Conn-Armstrong','85334 Beier Glen Suite 338\nNorth Quinnview, IA 52642','89661863057'),(3,'Prosacco-Fay','05570 Marks Tunnel\nKreigerborough, RI 03371-0079','89742717016'),(4,'Hahn LLC','3137 Sylvia Mills Apt. 367\nBrennanville, NJ 96259','89419766491'),(5,'Pagac, Johnston and West','6067 Mayer Junctions\nRickmouth, DE 89224-5919','89547440284'),(6,'Jones Group','860 Wendy Squares\nNew Ernestinaberg, FL 17625-6998','89307265077'),(7,'Strosin Inc','58357 Candida Fort\nNorth Kayaside, IN 97188-2499','89725111473'),(8,'Schowalter Inc','245 Susie Trafficway Suite 634\nClaudieborough, KS 29923-3053','89416566059'),(9,'Kuhic, Wuckert and Kunze','0354 Tierra Knolls Suite 878\nJosianefurt, AL 57101-2279','89255495318'),(10,'Wilderman, Feest and O\'Kon','09045 Kemmer Mission Suite 461\nNorth Dorthafort, DE 39476-1507','89947702735');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id_shop` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Employees_id_employee` int NOT NULL,
  PRIMARY KEY (`id_shop`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_Shops_Employees1_idx` (`Employees_id_employee`),
  CONSTRAINT `fk_Shops_Employees1` FOREIGN KEY (`Employees_id_employee`) REFERENCES `employees` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Dibbert Inc','81330 Corkery Oval Apt. 310\nLindstad, UT 36300','89953284989',14),(2,'Huel, Harber and Franecki','30707 Sally Branch\nNew Rosemary, IN 37471-8368','89433136179',5),(3,'Lind-Reynolds','528 Kunze Squares Suite 355\nVolkmanport, CO 36703','89576374685',15),(4,'Littel, Sawayn and Hermann','46628 Farrell Knoll Suite 542\nMadilynhaven, AL 04536','89691949838',6),(5,'Dach-Padberg','167 Sauer Orchard\nMicheleton, TX 53676-0885','89170193538',25),(6,'Wiza-Rohan','86042 Raynor Stravenue\nMargaretteport, DE 81015','89743635608',30),(7,'Goodwin-Marks','0100 Candice Forks\nHalvorsonland, PA 60112-0306','89476646817',7),(8,'Wiegand-Walker','070 Savanna Divide\nSelinaville, OK 43100-2385','89893294275',9),(9,'Gusikowski-Bartoletti','3437 Larkin Freeway\nNew Maxime, NM 09732-8013','89195614742',23),(10,'Volkman-Schulist','517 Spencer Flat\nNew Karlieview, AK 63886-9216','89812150238',24),(11,'Dickens, Metz and Schultz','94808 Maxwell Avenue\nLake Henriette, CT 32029','89831633849',4),(12,'O\'Conner-Waters','514 Reinger Wall\nTabithaville, NH 99051-9244','89382617101',30),(13,'Thompson, Ullrich and Turcotte','7792 Torphy Extensions\nNorth Brennonstad, MT 52770-7060','89016858615',29),(14,'Howell, Wyman and Corkery','69283 Gorczany Vista Suite 195\nWest Lilianatown, VT 84769','89018350410',10),(15,'Osinski-Rosenbaum','1137 Schaden Lane\nEast Marciaton, NM 50179-2489','89426806388',7);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `Orders_id_order` int NOT NULL,
  PRIMARY KEY (`id_status`,`Orders_id_order`),
  KEY `fk_Statuses_Orders1_idx` (`Orders_id_order`),
  CONSTRAINT `fk_Statuses_Orders1` FOREIGN KEY (`Orders_id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,3),(31,3),(3,4),(8,5),(13,6),(32,6),(15,8),(38,10),(19,11),(11,12),(22,12),(28,12),(40,14),(29,15),(36,15),(42,15),(14,16),(41,16),(43,17),(24,19),(5,21),(20,21),(16,22),(6,24),(37,24),(10,26),(17,26),(30,28),(44,28),(21,30),(27,30),(4,31),(12,32),(18,33),(33,33),(2,34),(7,34),(50,35),(26,36),(23,38),(9,39),(35,42),(47,42),(45,46),(46,46),(39,47),(48,47),(34,49),(49,49),(25,50);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mackenzie Klein','b35f0188a955970d6d2f8d6a28bb79b695a8254e','89783390407'),(2,'Jayson Gulgowski','a82f30e2b36f9a83a1f3eeb3a04cef5536a21738','89351690995'),(3,'Dr. Kaia Feil','cc7b8a70cf646accfd738c01d76956358ec377c6','89470389059'),(4,'Elda Kulas','b6a379f1fe393013916e337ff053f2e07c753748','89017507200'),(5,'Mrs. Ines Morar','29eb2b27203432a492abadbefb477df8226048ae','89448094165'),(6,'Dr. Andy Hauck V','9b31414236d17d870adff7bf87dce38a272dbbc3','89756092493'),(7,'Miss Abbey Hansen','f12e098ab3ca8f2ff8add5e7c866347b95bdab69','89089329709'),(8,'Watson Donnelly','218746deca3c22061281955e08a1c1c454be576e','89515909708'),(9,'Dr. Herbert Simonis V','81c7115820ddbe0bd05fa86a0cdee0b44aa5485a','89832637506'),(10,'Dr. Dejon Greenfelder I','54e67953600a030bc74c7d7251771cb79c4f67e6','89634815474'),(11,'Dr. Cyrus Simonis DVM','5cc36704f5d209529b743998c57bc3f291eb3127','89624284017'),(12,'Ulices Gutmann','976aecb5cac6b0e6d8fd8bbfb4abac1f17341e7a','89956529801'),(13,'Royce Ziemann','235c4f57aeeaca725da6385dce2f36f803f959c8','89996679666'),(14,'Norval Mante','f5ceeee36797c5764cdb0b309f47d34ca6f45dfb','89102413267'),(15,'Philip Schuster','b6b7909cfe3201fa5ada5dc9f14238d57f7f520e','89844179398'),(16,'Maurice Cassin','8833aa3365859693a1636ec931bb4a16be1057b8','89004465643'),(17,'Margarette Wunsch IV','f51416126dab46d28eedcb477941c80ca477a017','89152311013'),(18,'Brisa Renner V','22a9af75da08b5bd81aefb91ed87fbb25125a448','89006529280'),(19,'Jocelyn Kreiger','650cefc84fc6be56c9b2168e63d066fad984f1fe','89549103863'),(20,'Candice Reichel','42ed2cfc40430e4cdd81d53e57c200d5809dded6','89073288701'),(21,'Donnie Macejkovic','d8b446ee36100334b53ec3ad9c6b220f5e2d8228','89324744551'),(22,'Sylvia Ullrich PhD','06398e95294ff1e86dea39315ce56bd7cf76c9dc','89418066956'),(23,'Dr. Sammie Cremin PhD','d274673d50801a0aed639ff672cc7b033031605c','89045134179'),(24,'Rachael VonRueden','3d9505428ec86a828802b13493819c96050994cd','89246839242'),(25,'Jadon Feest DDS','dbebaed6272a03914a8f61916696c68c4f36ec0d','89138052072'),(26,'Tyrique Harris I','a56a5a4e7130ea024751842ad1ebe3cdb7a3f984','89230794780'),(27,'Elbert Grady','6ea9de780af86b75ca462fc29a7e002dc3ed25ec','89793474370'),(28,'Ms. Chyna Kassulke','bb327ae740fc0d01dee4ddc682e4e29444360215','89101865084'),(29,'Dolores Zieme','5dbe30c462f42decf24eea4aa126719ccf432a41','89743390913'),(30,'Candace D\'Amore','e4a4cdfec1057b878b477259189e7bf2791ef469','89079843648'),(31,'Willis Rice','002d88fd244d644d657d6d51f6e1b29c43d3b4b7','89524180999'),(32,'Moses Cummerata III','fe4dc9c43f1664a86b7fb295e95dbf7b0459a620','89397130707'),(33,'Etha Friesen V','c3cb60fd09f021fb877f688a0a261a7b45b57154','89613400108'),(34,'Prof. Carissa Tromp I','b10bc08789a3ea04bdae79422ec81b27056f40d5','89317339756'),(35,'Ms. Ashley Hansen DDS','2208e9bb1412417b548e3d91ff20e7e99d210571','89381893830'),(36,'Dr. Darlene Farrell MD','4c8abb05647e20387e1abe3981dfd2bf99f74512','89658306802'),(37,'Marion Champlin','1f836140bc4afd8170e65be1d16f3b271c0e6c35','89218569137'),(38,'Josiane Tremblay','573e202f9db3b4adfe52d6d0a453e81b0c893fd4','89882092419'),(39,'Ms. Marisol Koelpin','40cb8724db8a502d6dc4136a980b711bcbb583cc','89835013251'),(40,'Shany Adams','d758aeb29542091a61b31fbae4932d28df60c502','89718803483'),(41,'Virgil Hodkiewicz','d2780f3818958dee57a5c646eb3f2a6c5f9346d5','89143426165'),(42,'Prof. Cynthia Morar III','9877731233344ad31155cd4f0e222ffae221d579','89673597315'),(43,'Raleigh Heathcote II','8605996da94b2cd6466fce7de6f2960987f3b7f2','89209853138'),(44,'Felicia Bednar','2cf5b979b475311c7e1c09c1e2bb62bebe7eb0d7','89979747948'),(45,'Miss Retha Kuhn','3a58dba5615e7b0f7df55a901d8a80a50100bb0e','89841094097'),(46,'Mac Rempel DDS','2d803dfa8def9d8e8f7c6d75fcf894dcdea58732','89034394664'),(47,'Krystel Kreiger','b5605352c4e1b4a71e02ab409192ed6478ee7f36','89544501315'),(48,'Lucie Treutel','f5fbadcc3e8542b8e2e47f2dfe70ac448def151c','89451643607'),(49,'Dr. Yoshiko Vandervort','0cb6e2f9e17acdd74a476ff422a3aee5024e1694','89028299968'),(50,'Tyrell Wunsch','1c30bfccb1e8d6959ee06b4177c76d52b7483204','89094552826');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id_warehouse` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `Products_id_product` int NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  KEY `fk_Warehouses_Products1_idx` (`Products_id_product`),
  CONSTRAINT `fk_Warehouses_Products1` FOREIGN KEY (`Products_id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,0,54),(2,54,56),(3,52,55),(4,7,38),(5,27,53),(6,5,17),(7,76,49);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-30 17:17:06
