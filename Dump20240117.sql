-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trade
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Катушки'),(2,'Приманки'),(3,'Амуниция и снаряжение'),(4,'Леска'),(5,'Оснастка');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(100) NOT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Stinger'),(2,'Kuusamo'),(3,'Usami'),(4,'LumiCom'),(5,'Aquatech'),(6,'SevereLand'),(7,'Westin'),(8,'Ultron'),(9,'Balsax'),(10,'Momoi'),(11,'Gamma');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderStatus` text NOT NULL,
  `OrderDate` datetime NOT NULL,
  `OrderDeliveryDate` datetime NOT NULL,
  `OrderPickupPoint` int NOT NULL,
  `OrderUserID` int NOT NULL,
  `OrderPickupCode` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `OrderPickupPoint` (`OrderPickupPoint`),
  KEY `OrderUserID` (`OrderUserID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`OrderPickupPoint`) REFERENCES `pickuppoint` (`PickupPointID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`OrderUserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Новый ','2019-05-20 22:00:00','2025-05-20 22:00:00',18,1,501),(2,'Новый ','2019-05-20 22:00:00','2025-05-20 22:00:00',20,2,502),(3,'Завершен','2021-05-20 22:00:00','2027-05-20 22:00:00',22,3,503),(4,'Новый ','2022-05-20 22:00:00','2028-05-20 22:00:00',24,4,504),(5,'Новый ','2023-05-20 22:00:00','2029-05-20 22:00:00',26,5,505),(6,'Новый ','2024-05-20 22:00:00','2030-05-20 22:00:00',28,6,506),(7,'Новый ','2025-05-20 22:00:00','2031-05-20 22:00:00',30,7,507),(8,'Новый ','2026-05-20 22:00:00','2001-06-20 22:00:00',32,8,508),(9,'Новый ','2027-05-20 22:00:00','2002-06-20 22:00:00',34,9,509),(10,'Завершен','2028-05-20 22:00:00','2003-06-20 22:00:00',36,10,510);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `OrderID` int NOT NULL,
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PickupPointCount` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductArticleNumber`),
  KEY `ProductArticleNumber` (`ProductArticleNumber`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `product` (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickuppoint`
--

DROP TABLE IF EXISTS `pickuppoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickuppoint` (
  `PickupPointID` int NOT NULL AUTO_INCREMENT,
  `PickupPointName` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  PRIMARY KEY (`PickupPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickuppoint`
--

LOCK TABLES `pickuppoint` WRITE;
/*!40000 ALTER TABLE `pickuppoint` DISABLE KEYS */;
INSERT INTO `pickuppoint` VALUES (1,'344288','г. Абакан','ул. Чехова, 1'),(2,'614164','г.Абакан ','ул. Степная, 30'),(3,'394242','г. Абакан','ул. Коммунистическая, 43'),(4,'660540','г. Абакан','ул. Солнечная, 25'),(5,'125837','г. Абакан','ул. Шоссейная, 40'),(6,'125703','г. Абакан','ул. Партизанская, 49'),(7,'625283','г. Абакан','ул. Победы, 46'),(8,'614611','г. Абакан','ул. Молодежная, 50'),(9,'454311','г.Абакан','ул. Новая, 19'),(10,'660007','г.Абакан','ул. Октябрьская, 19'),(11,'603036','г. Абакан','ул. Садовая, 4'),(12,'450983','г.Абакан','ул. Комсомольская, 26'),(13,'394782','г. Абакан','ул. Чехова, 3'),(14,'603002','г. Абакан','ул. Дзержинского, 28'),(15,'450558','г. Абакан','ул. Набережная, 30'),(16,'394060','г.Абакан','ул. Фрунзе, 43'),(17,'410661','г. Абакан','ул. Школьная, 50'),(18,'625590','г. Абакан','ул. Коммунистическая, 20'),(19,'625683','г. Абакан','ул. 8 Марта'),(20,'400562','г. Абакан','ул. Зеленая, 32'),(21,'614510','г. Абакан','ул. Маяковского, 47'),(22,'410542','г. Абакан','ул. Светлая, 46'),(23,'620839','г. Абакан','ул. Цветочная, 8'),(24,'443890','г. Абакан','ул. Коммунистическая, 1'),(25,'603379','г. Абакан','ул. Спортивная, 46'),(26,'603721','г. Абакан','ул. Гоголя, 41'),(27,'410172','г. Абакан','ул. Северная, 13'),(28,'420151','г. Абакан','ул. Вишневая, 32'),(29,'125061','г. Абакан','ул. Подгорная, 8'),(30,'630370','г. Абакан','ул. Шоссейная, 24'),(31,'614753','г. Абакан','ул. Полевая, 35'),(32,'426030','г. Абакан','ул. Маяковского, 44'),(33,'450375','г. Абакан','ул. Клубная, 44'),(34,'625560','г. Абакан','ул. Некрасова, 12'),(35,'630201','г. Абакан','ул. Комсомольская, 17'),(36,'190949','г. Абакан','ул. Мичурина, 26');
/*!40000 ALTER TABLE `pickuppoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postavchik`
--

DROP TABLE IF EXISTS `postavchik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postavchik` (
  `PostavchikID` int NOT NULL AUTO_INCREMENT,
  `PostavchikName` varchar(100) NOT NULL,
  PRIMARY KEY (`PostavchikID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postavchik`
--

LOCK TABLES `postavchik` WRITE;
/*!40000 ALTER TABLE `postavchik` DISABLE KEYS */;
INSERT INTO `postavchik` VALUES (1,'Stinger'),(2,'Kuusamo'),(3,'Usami'),(4,'LumiCom'),(5,'Aquatech'),(6,'SevereLand'),(7,'Westin'),(8,'Ultron'),(9,'Balsax'),(10,'Momoi'),(11,'Gamma');
/*!40000 ALTER TABLE `postavchik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ProductName` text NOT NULL,
  `ProductUnit` text NOT NULL,
  `ProductDescription` text NOT NULL,
  `ProductCategory` int NOT NULL,
  `ProductPhoto` varchar(100) DEFAULT NULL,
  `ProductManufacturer` int NOT NULL,
  `ProductPostavchik` int NOT NULL,
  `ProductCost` decimal(19,3) NOT NULL,
  `ProductMaxDiscountAmount` tinyint DEFAULT NULL,
  `ProductDiscountAmount` tinyint DEFAULT NULL,
  `ProductQuantityInStock` int NOT NULL,
  `ProductStatus` text,
  PRIMARY KEY (`ProductArticleNumber`),
  KEY `ProductCategory` (`ProductCategory`),
  KEY `ProductManufacturer` (`ProductManufacturer`),
  KEY `ProductPostavchik` (`ProductPostavchik`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductCategory`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ProductManufacturer`) REFERENCES `manufacturer` (`ManufacturerID`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`ProductPostavchik`) REFERENCES `postavchik` (`PostavchikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('504KAE','Наконечник','шт.','Kuusamo Tele Kirppu 5-10g',5,NULL,2,2,400.000,10,10,14,NULL),('6Z2TGT','Балансир','шт.','Kuusamo Tasapaino X-PRO',2,'6Z2TGT.jpg',2,2,500.000,9,2,7,NULL),('8JICK8','Леска Gamma Ice ','шт.','Леска Gamma Ice Fluorocarbon',4,NULL,11,11,280.000,11,10,4,NULL),('A0ZBSB','Штаны','шт.','Штаны утепленные Westin W4 2-Layer Bibs',3,NULL,7,7,7450.000,6,3,31,NULL),('B4DS9I','Кормушка','шт.','Кормушка Aquatech малая',5,NULL,5,5,65.000,5,9,6,NULL),('BJJ2XD','Черпак','шт.','Черпак Kuusamo 90мм',3,NULL,2,2,410.000,5,1,28,NULL),('CZ96A8','Кормушка','шт.','Кормушка Aquatech большая',5,NULL,5,5,130.000,9,13,27,NULL),('E6IZV3','Кивок лавсановый','шт.','Кивок лавсановый спортивный Stinger',5,NULL,1,1,500.000,3,8,15,NULL),('EJ9GSG','Катушка','шт.','Катушка Stinger Arctic Char',1,'EJ9GSG.jpg',1,1,520.000,5,2,13,NULL),('JE6VN0','Рукавицы','шт.','Рукавицы SevereLand Snow Visor',3,NULL,6,6,600.000,9,4,1,NULL),('L4Y4MS','Мормышка','шт.','Мормышка LumiCom Дробина с отверстием',2,'L4Y4MS.jpg',4,4,360.000,6,2,25,NULL),('LXB2A9','Мормышка','шт.','Мормышка W LumiCom Капля с ушком ',2,NULL,4,4,900.000,4,5,8,NULL),('M3UEHS','Катушка','шт.','Катушка Stinger Arctic Char Pro',1,'M3UEHS.jpg',1,1,810.000,10,2,27,NULL),('M6XARO','Воблер','шт.','Воблеры Usami Wasabi Vib',2,'M6XARO.jpg',3,3,200.000,3,6,16,NULL),('MGIP6R','Балансир','шт.','Балансир Usami Dansa Pike Special',2,'MGIP6R.jpg',3,3,120.000,5,12,12,NULL),('MVIR2L','Леска Ultron Elite ','шт.','Леска Ultron Elite Platinum Winter 30m',4,NULL,8,8,100.000,10,14,13,NULL),('OACIX8','Шапка-маска ','шт.','Шапка-маска SevereLand Sub Zero',3,NULL,6,6,950.000,9,12,19,NULL),('OQIXDR','Кивок силиконовый','шт.','Кивок силиконовый Stinger',5,NULL,1,1,350.000,6,4,12,NULL),('OU1EGM','Леска  Balsax Ice','шт.','Леска Balsax Ice King',4,NULL,9,9,70.000,5,1,28,NULL),('PCIS4E','Блесна','шт.','Kuusamo Professor 4 50/8',2,'PCIS4E.jpg',2,2,440.000,4,15,30,NULL),('PDLQ16','Кивок рессорный','шт.','Кивки рессорные Stinger Баланс-R',5,NULL,1,1,1200.000,4,12,25,NULL),('PILLFW','Блесна','шт.','Блесна Stinger 305-080',2,'PILLFW.jpg',1,1,300.000,11,10,8,NULL),('Q50897','Ящик зимний','шт.','Ящик зимний Aquatech',3,NULL,5,5,1350.000,10,9,19,NULL),('R25FXL','Леска Momoi Hi-Max ','шт.','Леска Momoi Hi-Max Sky Blue',4,NULL,10,10,80.000,5,6,10,NULL),('R25FXL7','Наконечник','шт.','Шапка-маска SevereLand Sub Zero',3,NULL,2,2,400.000,4,4,4,NULL),('R7N43T','Леска Balsax Ice ','шт.','Леска Balsax Ice Power',4,NULL,9,9,30.000,10,9,3,NULL),('SOIPEQ','Катушка','шт.','Катушка Stinger Arctic Char XP',1,'SOIPEQ.jpg',1,1,600.000,5,5,22,NULL),('UEOGV3','Наконечник','шт.','Kuusamo Tele Kirppu Mormy',5,NULL,2,2,400.000,4,4,15,NULL),('UEOGV4','Блесна','шт.','Леска Momoi Hi-Max Sky Blue',3,NULL,2,2,1000.000,4,4,28,NULL),('V5KORQ','Термобелье','шт.','Термобелье SevereLand DryShield',3,NULL,6,6,1000.000,4,13,16,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Клиент');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserSurname` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserPatronymic` varchar(100) NOT NULL,
  `UserLogin` text NOT NULL,
  `UserPassword` text NOT NULL,
  `UserRole` int NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Морозов','Тимур','Ильич','7efwqtub80i5@outlook.com','2L6KZG',1),(2,'Колпаков','Дмитрий','Вадимович','v718fhbjuq0p@mail.com','uzWC67',1),(3,'Колпакова','Василиса','Романовна','7vnrat4hmcz6@yahoo.com','8ntwUp',1),(4,'Шубина','Анастасия','Вячеславовна','v4mlcsi1bgnk@tutanota.com','YOyhfR',2),(5,'Мартынова','Арина','Михайловна','2yx3tbqv4ndi@outlook.com','RSbvHv',2),(6,'Измайлов','Григорий','Робертович','5bf1xdiq6zup@tutanota.com','rwVDh9',2),(7,'Евдокимова','Ариана','Михайловна','p7rviz42j6bh@outlook.com','LdNyos',3),(8,'Климова','Алиса','Александровна','g5nrmh1axwfl@outlook.com','gynQMT',3),(9,'Куликов','Владислав','Даниилович','5knb4drlf2hj@tutanota.com','AtnDjr',3),(10,'Коротков','Олег','Матвеевич','pk90ratym8bo@yahoo.com','JlFRCZ',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-17  8:06:15
