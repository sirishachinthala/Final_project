-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Name` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Moviename` varchar(30) DEFAULT NULL,
  `Theatre` varchar(30) DEFAULT NULL,
  `Date` varchar(30) DEFAULT NULL,
  `Timing` varchar(30) DEFAULT NULL,
  `Number` int DEFAULT NULL,
  `Seats` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-04','10AM(MORNING-SHOW)',2,'9B,10B'),('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-11','2PM(MATNEE)',2,'12A,13A'),('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-03','10AM(MORNING-SHOW)',2,'8A,9A'),('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-19','10AM(MORNING-SHOW)',2,'8C,9C'),('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-04','10AM(MORNING-SHOW)',2,'6E,7E'),('anusha','anushabaditha1999@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-21','2PM(MATNEE)',3,'8A,9A,10A'),('anusha','anushabaditha1999@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-21','2PM(MATNEE)',1,'8A'),('2334','posieswarnandivada@gmail.com','Veera Simha Reddy','MARUTHI THEATRE','2023-01-21','10AM(MORNING-SHOW)',2,'14C,13D'),('2334','posieswarnandivada@gmail.com','Waltair Veerayya','MARUTHI THEATRE','2023-01-22','2PM(MATNEE)',2,'4B,5B');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `Moviename` varchar(30) DEFAULT NULL,
  `Language` char(20) DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `Imdb` decimal(2,1) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('Waltair Veerayya','Telugu','Waltair Veerayya is a 2023 Indian Telugu-language action comedy film directed by Bobby Kolli and produced by Mythri Movie Makers. The film stars Chiranjeevi as the titular character alongside Ravi Teja, Shruti Haasan, and Catherine Tresa.',7.2,'https://upload.wikimedia.org/wikipedia/en/8/8b/Waltair_Veerayya_poster.jpeg'),('Veera Simha Reddy','Telugu','Veera Simha Reddy is a 2023 Indian Telugu-language action drama written and directed by Gopichand Malineni and produced by Mythri Movie Makers. It stars Nandamuri Balakrishna in a dual role along with Shruti Haasan, Varalaxmi Sarathkumar, Honey Rose, and Duniya Vijay. The film score and soundtrack were composed by S. Thaman.',6.0,'https://static.toiimg.com/thumb/msid-96057461,imgsize-73824,width-800,height-600,resizemode-75/96057461.jpg'),('Varasudu','Telugu','Varasudu is a 2023 Indian Tamil-language action drama film directed by Vamshi Paidipally who co-wrote it with Hari and Ashishor Solomon. Produced jointly by Dil Raju and Sirish under the banner of Sri Venkateswara Creations and PVP Cinema, the film stars Vijay and Rashmika Mandanna. The music is composed by Thaman S, cinematography is handled by Karthik Palani and editing by Praveen K. L.',6.9,'https://www.cinejosh.com/newsimg/newsmainimg/makers-of-vijay-varasudu-come-with-the-new-look_b_2206220538.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_movies`
--

DROP TABLE IF EXISTS `recommended_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_movies` (
  `Moviename` varchar(30) DEFAULT NULL,
  `Language` char(20) DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `Imdb` decimal(2,1) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_movies`
--

LOCK TABLES `recommended_movies` WRITE;
/*!40000 ALTER TABLE `recommended_movies` DISABLE KEYS */;
INSERT INTO `recommended_movies` VALUES ('Veera Simha Reddy','Telugu','Veera Simha Reddy is a 2023 Indian Telugu-language action drama written and directed by Gopichand Malineni and produced by Mythri Movie Makers. It stars Nandamuri Balakrishna in a dual role along with Shruti Haasan, Varalaxmi Sarathkumar, Honey Rose, and Duniya Vijay. The film score and soundtrack were composed by S. Thaman.',6.0,'https://static.toiimg.com/thumb/msid-96057461,imgsize-73824,width-800,height-600,resizemode-75/96057461.jpg'),('Varasudu','Telugu','Varasudu is a 2023 Indian Tamil-language action drama film directed by Vamshi Paidipally who co-wrote it with Hari and Ashishor Solomon. Produced jointly by Dil Raju and Sirish under the banner of Sri Venkateswara Creations and PVP Cinema, the film stars Vijay and Rashmika Mandanna. The music is composed by Thaman S, cinematography is handled by Karthik Palani and editing by Praveen K. L.',6.9,'https://www.cinejosh.com/newsimg/newsmainimg/makers-of-vijay-varasudu-come-with-the-new-look_b_2206220538.jpg');
/*!40000 ALTER TABLE `recommended_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `Name` char(20) DEFAULT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` bigint DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES ('anusha','anushabaditha1999@gmail.com',6304061929,'$2b$12$O835pIG7RgM01q20iUeHLOPtVsy8N4nNcFCc.m/ThhD3euox0nPBm'),('2334','posieswarnandivada@gmail.com',9177806313,'$2b$12$79jhju8gRCo9NJUWP5XXpeLGC1OtSHn.s.lrrM2NmUv7MNaSZPe3K');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21 14:32:47
