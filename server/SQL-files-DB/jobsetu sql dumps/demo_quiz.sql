-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `jobid` varchar(10) NOT NULL,
  `questions` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES ('ascoreqx','[{\"A1\": \"a\", \"A2\": \"b\", \"A3\": \"c\", \"A4\": \"d\", \"valid\": \"d\", \"Question\": \"dsddsdsd ? what say?\"}, {\"A1\": \"dsdsds\", \"A2\": \"ans2\", \"A3\": \"Ans3\", \"A4\": \"hansaStark\", \"valid\": \"ans2\", \"Question\": \"dsddsdsd ? what say?\"}]'),('ascorewx','[{\"A1\": \"a\", \"A2\": \"b\", \"A3\": \"c\", \"A4\": \"d\", \"valid\": \"a\", \"Question\": \"dsddsdsd ? what say?\"}, {\"A1\": \"dsdsds\", \"A2\": \"ans2\", \"A3\": \"Ans3\", \"A4\": \"hansaStark\", \"valid\": \"hansaStark\", \"Question\": \"dsddsdsd ? what say?\"}]'),('p9wJJcve','[{\"A\": {\"1\": \"raj\", \"2\": \"vikas\", \"3\": \"sanket\", \"4\": \"chinmay\", \"valid\": \"1\"}, \"Q\": \"what is your name?\"}]'),('MSQWeLc9','[{\"A\": {\"1\": \"sdsd\", \"2\": \"sdsd\", \"3\": \"sdsdd\", \"4\": \"sdsd\", \"valid\": \"3\"}, \"Q\": \"ssd\"}]'),('IUiWR7T1','[{\"A\": {\"1\": \"sds\", \"2\": \"sdss\", \"3\": \"dsd\", \"4\": \"sdsdsd\", \"valid\": \"2\"}, \"Q\": \"dsddsd?\"}]'),('lPVgEZey','[{\"A\": {\"1\": \"sdsdsd\", \"2\": \"sdsd\", \"3\": \"dsdsd\", \"4\": \"sdsd\", \"valid\": \"4\"}, \"Q\": \"sdsdsd\"}]');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 16:58:55
