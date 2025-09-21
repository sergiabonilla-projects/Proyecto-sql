-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_sql
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencias` (
  `id_competencia` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `premio_total` double DEFAULT NULL,
  `tipo_competencia` varchar(50) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_competencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` VALUES (1,'World Championship 2024','2024-10-15','2024-10-20',2500000,'Internacional','Seúl','Corea del Sur'),(2,'European Masters Spring','2024-03-01','2024-03-15',500000,'Internacional','Berlín','Alemania'),(3,'Liga Nacional Primavera','2024-02-01','2024-02-28',150000,'Nacional','Ciudad de México','Ciudad de México'),(4,'Copa Regional Norte','2024-01-15','2024-01-20',75000,'Regional','Monterrey','Monterrey'),(5,'Asian Cup 2024','2024-05-10','2024-05-18',1000000,'Internacional','Tokio','Japón'),(6,'Liga Nacional Verano','2024-06-01','2024-06-30',200000,'Nacional','Guadalajara','Guadalajara'),(7,'Copa Regional Sur','2024-07-05','2024-07-10',80000,'Regional','Puebla','Puebla'),(8,'Masters Championship','2024-08-20','2024-08-25',1500000,'Internacional','Los Ángeles','USA'),(9,'Liga Nacional Otoño','2024-09-01','2024-09-30',180000,'Nacional','Ciudad de México','Ciudad de México'),(10,'Copa Regional Centro','2024-11-10','2024-11-15',70000,'Regional','Querétaro','Querétaro');
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `entrenador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `uq_equipos_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Thunder Wolves','Norte América','2022-01-15','Carlos Mendoza'),(2,'Phoenix Rising','Europa','2021-08-20','Lars Hansen'),(3,'Dragon Force','Asia','2020-12-10','Kim Yong-Su'),(4,'Lightning Bolts','Norte América','2023-03-05','Maria González'),(5,'Steel Panthers','Europa','2022-06-18','Pietro Rossi'),(6,'Cyber Guardians','Asia','2021-11-22','Takeshi Yamamoto'),(7,'Storm Riders','Norte América','2023-01-30','Roberto Silva'),(8,'Ice Wolves','Europa','2022-09-12','Erik Johansson'),(9,'Fire Dragons','Asia','2020-05-08','Li Wei'),(10,'Shadow Hawks','Norte América','2023-05-15','Ana Morales');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_jugador` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  `posicion` varchar(50) DEFAULT NULL,
  `fecha_ingreso_equipo` date DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `fk_jugadores_equipo` (`id_equipo`),
  CONSTRAINT `fk_jugadores_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Alex Thunder',22,'México',1,'ADC','2022-02-01'),(2,'Mike Storm',24,'USA',1,'Support','2022-02-01'),(3,'Carlos Lightning',20,'México',1,'Jungle','2022-04-15'),(4,'Diana Wolf',23,'Canadá',1,'Mid','2022-02-01'),(5,'Sam Bolt',25,'USA',1,'Top','2022-02-01'),(6,'Lars Phoenix',26,'Noruega',2,'ADC','2021-09-01'),(7,'Erik Fire',22,'Suecia',2,'Support','2021-09-01'),(8,'Hans Storm',24,'Dinamarca',2,'Jungle','2022-01-15'),(9,'Astrid Ice',21,'Finlandia',2,'Mid','2021-09-01'),(10,'Magnus Thunder',27,'Noruega',2,'Top','2021-09-01'),(11,'Kim Dragon',23,'Corea del Sur',3,'ADC','2021-01-10'),(12,'Lee Force',25,'Corea del Sur',3,'Support','2021-01-10'),(13,'Park Lightning',22,'Corea del Sur',3,'Jungle','2021-03-20'),(14,'Choi Shadow',24,'Corea del Sur',3,'Mid','2021-01-10'),(15,'Jung Steel',26,'Corea del Sur',3,'Top','2021-01-10'),(16,'Jessica Bolt',20,'USA',4,'ADC','2023-03-20'),(17,'Ryan Flash',22,'Canadá',4,'Support','2023-03-20'),(18,'Tyler Storm',19,'USA',4,'Jungle','2023-05-10'),(19,'Ashley Thunder',21,'México',4,'Mid','2023-03-20'),(20,'Kevin Lightning',23,'USA',4,'Top','2023-03-20'),(21,'Marco Steel',24,'Italia',5,'ADC','2022-07-01'),(22,'Luigi Panther',22,'Italia',5,'Support','2022-07-01'),(23,'Giuseppe Fire',25,'Italia',5,'Jungle','2022-09-15'),(24,'Sofia Ice',20,'España',5,'Mid','2022-07-01'),(25,'Antonio Storm',26,'Italia',5,'Top','2022-07-01'),(26,'Hiroshi Cyber',24,'Japón',6,'ADC','2021-12-01'),(27,'Akira Guardian',23,'Japón',6,'Support','2021-12-01'),(28,'Yuki Shadow',21,'Japón',6,'Jungle','2022-02-20'),(29,'Rei Lightning',22,'Japón',6,'Mid','2021-12-01'),(30,'Kenji Storm',25,'Japón',6,'Top','2021-12-01'),(31,'Pedro Storm',23,'México',7,'ADC','2023-02-15'),(32,'Juan Rider',21,'México',7,'Support','2023-02-15'),(33,'Diego Thunder',24,'Colombia',7,'Jungle','2023-04-10'),(34,'Lucia Fire',20,'Argentina',7,'Mid','2023-02-15'),(35,'Miguel Lightning',22,'México',7,'Top','2023-02-15'),(36,'Olaf Ice',25,'Suecia',8,'ADC','2022-10-01'),(37,'Bjorn Wolf',23,'Noruega',8,'Support','2022-10-01'),(38,'Gunnar Storm',24,'Dinamarca',8,'Jungle','2023-01-15'),(39,'Freya Thunder',21,'Islandia',8,'Mid','2022-10-01'),(40,'Ragnar Lightning',26,'Suecia',8,'Top','2022-10-01'),(41,'Chen Fire',22,'China',9,'ADC','2020-06-01'),(42,'Wang Dragon',24,'China',9,'Support','2020-06-01'),(43,'Liu Thunder',23,'China',9,'Jungle','2020-08-20'),(44,'Zhang Lightning',25,'China',9,'Mid','2020-06-01'),(45,'Zhou Storm',27,'China',9,'Top','2020-06-01'),(46,'Maria Shadow',21,'México',10,'ADC','2023-06-01'),(47,'Carlos Hawk',23,'México',10,'Support','2023-06-01'),(48,'Alejandro Thunder',20,'México',10,'Jungle','2023-07-15'),(49,'SofÃ­a Lightning',22,'Colombia',10,'Mid','2023-06-01'),(50,'Fernando Storm',24,'México',10,'Top','2023-06-01');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participaciones`
--

DROP TABLE IF EXISTS `participaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participaciones` (
  `id_participacion` int NOT NULL,
  `id_competencia` int NOT NULL,
  `id_equipo` int NOT NULL,
  `posicion_final` int DEFAULT NULL,
  `puntos_obtenidos` int DEFAULT NULL,
  `partidas_jugadas` int DEFAULT NULL,
  `partidas_ganadas` int DEFAULT NULL,
  PRIMARY KEY (`id_participacion`),
  UNIQUE KEY `uq_comp_equipo` (`id_competencia`,`id_equipo`),
  KEY `fk_part_eq` (`id_equipo`),
  CONSTRAINT `fk_part_comp` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id_competencia`),
  CONSTRAINT `fk_part_eq` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participaciones`
--

LOCK TABLES `participaciones` WRITE;
/*!40000 ALTER TABLE `participaciones` DISABLE KEYS */;
INSERT INTO `participaciones` VALUES (1,1,3,1,2500,15,13),(2,1,2,2,2000,15,11),(3,1,1,3,1500,15,10),(4,1,9,4,1200,15,9),(5,1,6,5,1000,15,8),(6,1,5,6,800,15,7),(7,1,8,7,600,15,6),(8,1,4,8,400,15,5),(9,2,2,1,1500,12,10),(10,2,5,2,1200,12,9),(11,2,8,3,1000,12,8),(12,2,1,4,800,12,7),(13,2,3,5,600,12,6),(14,2,6,6,400,12,5),(15,3,1,1,800,10,8),(16,3,4,2,600,10,7),(17,3,7,3,500,10,6),(18,3,10,4,400,10,5),(19,4,1,1,400,8,7),(20,4,4,2,300,8,6),(21,4,7,3,250,8,5),(22,4,10,4,200,8,4),(23,5,3,1,2000,14,12),(24,5,6,2,1600,14,11),(25,5,9,3,1200,14,10),(26,5,2,4,1000,14,9),(27,5,8,5,800,14,8),(28,5,5,6,600,14,7),(29,6,1,1,900,11,9),(30,6,4,2,700,11,8),(31,6,7,3,600,11,7),(32,6,10,4,500,11,6),(33,7,4,1,450,9,8),(34,7,1,2,350,9,7),(35,7,7,3,300,9,6),(36,7,10,4,250,9,5),(37,8,3,1,2200,16,14),(38,8,9,2,1800,16,13),(39,8,2,3,1400,16,12),(40,8,6,4,1200,16,11),(41,8,1,5,1000,16,10),(42,8,5,6,800,16,9),(43,8,8,7,600,16,8),(44,8,4,8,400,16,7),(45,9,1,1,850,12,10),(46,9,4,2,650,12,9),(47,9,7,3,550,12,8),(48,9,10,4,450,12,7),(49,10,1,1,350,7,6),(50,10,4,2,250,7,5);
/*!40000 ALTER TABLE `participaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-17  0:47:44
