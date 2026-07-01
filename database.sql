-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: survey
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `programming_languages` varchar(200) DEFAULT NULL,
  `preferred_language` varchar(100) DEFAULT NULL,
  `ide` varchar(100) DEFAULT NULL,
  `satisfaction` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `preferred_time` varchar(50) DEFAULT NULL,
  `suggestions` text,
  `feedback` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,'salman hassan',18,'male','salman2000redmi@gmail.com','python','english','vs code',4,4,'8pm','no','no'),(2,'junaid',23,'Male','salman2000redmi@gmail.com','Python','C++','VS Code',2,3,'Afternoon','','');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'salman2000','salman2000redmi@gmail.com','scrypt:32768:8:1$ad3IZlRtyQGBgSBm$85bd2f84f53cda75cfaec7e9d6542e4e8987f4422faa39f03872c3ad1f6e7bb2d5f5221ff743904659f8afd49538a919bf114d7d58b84d92b6b57ff8fb02fd85'),(4,'f2024065149','f2024065149@umt.edu.pk','scrypt:32768:8:1$zshlcDTKyQf3saTY$3178d9b6e74902bb78f1176442ce5b02039dedf65cf8cd3a22c5c18afc8571265e45a793082e35a5ae1ce61e508e4ecc42759f74d06cfa91ce937c689425e35c'),(5,'f2033','f2024149@umt.edu.pk','scrypt:32768:8:1$r0bF5AcqFYeIQkbR$635d2342d57f2073ae64097a3ef8286201a3899065828d440d5d6f5e76fce6ac6ed0bc8d28840176803b9601ae2093d5843ba46249e5b51a2bfef328446f810d'),(6,'f2024065149@umt.edu.pk','sdasdq@gmail.com','scrypt:32768:8:1$8SZHkmJbe02qUX6T$531177a3eddf79a9369842d31ce11db7049e65af7377f17b353c88bbbce321689cce8d88396fb01fb4fe769202f17c34536dae978fa2cb91b4c6e9b74ba7f5f3'),(7,'salman.hassan','salman.raza@gmail.com','scrypt:32768:8:1$Uvt0gIQ12JiTbN7r$d1ae0ba838adcfc3ab84c27171ce57bec9581848f1841f43cd64ea7dbf09062d94af137296bd9c4cf2306cb1e016108190b4f8226e779b852004bf4f6b05097a');
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

-- Dump completed on 2026-04-27 14:11:00
