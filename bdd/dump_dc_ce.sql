-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dc_ce
-- ------------------------------------------------------
-- Server version	5.5.40-0+wheezy1

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
-- Table structure for table `analisis_contenido`
--

DROP TABLE IF EXISTS `analisis_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analisis_contenido` (
  `id_analisis` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_analisis` date NOT NULL,
  `hora_analisis` time NOT NULL,
  PRIMARY KEY (`id_analisis`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_contenido`
--

LOCK TABLES `analisis_contenido` WRITE;
/*!40000 ALTER TABLE `analisis_contenido` DISABLE KEYS */;
INSERT INTO `analisis_contenido` VALUES (197,'2015-07-22','16:34:41'),(198,'2015-07-22','16:36:00');
/*!40000 ALTER TABLE `analisis_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_arch` varchar(45) NOT NULL,
  `ubicacion_arch` varchar(100) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `id_formato_archivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `fk_archivo_analisis_contenido1` (`id_analisis`),
  KEY `fk_archivo_formato_archivo2` (`id_formato_archivo`),
  CONSTRAINT `fk_archivo_analisis_contenido1` FOREIGN KEY (`id_analisis`) REFERENCES `analisis_contenido` (`id_analisis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1630 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (1604,'con espacios 2.odt','/usr/share/contenido-educativo/',197,7),(1605,'gre go ri na.doc','/usr/share/contenido-educativo/',197,1),(1606,'curriculum-nehomar2.docx','/usr/share/contenido-educativo/',197,2),(1607,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',197,2),(1608,'gregorina.doc','/usr/share/contenido-educativo/',197,1),(1609,'qwe.doc','/usr/share/contenido-educativo/',197,1),(1610,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',197,7),(1611,'con espacios.odt','/usr/share/contenido-educativo/',197,7),(1612,'con espacios1.odt','/usr/share/contenido-educativo/prueba2',197,7),(1613,'ejemplo','/usr/share/contenido-educativo/prueba',197,NULL),(1614,'gregorina.doc','/usr/share/contenido-educativo/prueba',197,1),(1615,'ejemplo-1.0.doc','/usr/share/contenido-educativo/prueba',197,1),(1616,'con espacios.odt','/usr/share/contenido-educativo/prueba',197,7),(1617,'con espacios 2.odt','/usr/share/contenido-educativo/',198,7),(1618,'gre go ri na.doc','/usr/share/contenido-educativo/',198,1),(1619,'curriculum-nehomar2.docx','/usr/share/contenido-educativo/',198,2),(1620,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',198,2),(1621,'gregorina.doc','/usr/share/contenido-educativo/',198,1),(1622,'qwe.doc','/usr/share/contenido-educativo/',198,1),(1623,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',198,7),(1624,'con espacios.odt','/usr/share/contenido-educativo/',198,7),(1625,'con espacios1.odt','/usr/share/contenido-educativo/prueba2',198,7),(1626,'ejemplo','/usr/share/contenido-educativo/prueba',198,NULL),(1627,'gregorina.doc','/usr/share/contenido-educativo/prueba',198,1),(1628,'ejemplo-1.0.doc','/usr/share/contenido-educativo/prueba',198,1),(1629,'con espacios.odt','/usr/share/contenido-educativo/prueba',198,7);
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos_duplicados`
--

DROP TABLE IF EXISTS `archivos_duplicados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivos_duplicados` (
  `id_arch_dup` int(11) NOT NULL AUTO_INCREMENT,
  `id_archivo` int(11) NOT NULL,
  `tamano_arch` int(11) NOT NULL,
  `hash_arch` varchar(32) NOT NULL,
  PRIMARY KEY (`id_arch_dup`),
  KEY `fk_archivos_duplicados_archivo2` (`id_archivo`),
  CONSTRAINT `fk_archivos_duplicados_archivo2` FOREIGN KEY (`id_archivo`) REFERENCES `archivo` (`id_archivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados`
--

LOCK TABLES `archivos_duplicados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados` VALUES (33,1612,663943,'0496cc73e254a339a8f194bc9e922945'),(34,1614,352256,'64becc67320d2388aaba553dd180d0b2'),(35,1615,0,'d41d8cd98f00b204e9800998ecf8427e'),(36,1616,663943,'0496cc73e254a339a8f194bc9e922945'),(37,1625,663943,'0496cc73e254a339a8f194bc9e922945'),(38,1627,352256,'64becc67320d2388aaba553dd180d0b2'),(39,1628,0,'d41d8cd98f00b204e9800998ecf8427e'),(40,1629,663943,'0496cc73e254a339a8f194bc9e922945');
/*!40000 ALTER TABLE `archivos_duplicados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos_duplicados_eliminados`
--

DROP TABLE IF EXISTS `archivos_duplicados_eliminados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivos_duplicados_eliminados` (
  `id_dup_elim` int(11) NOT NULL AUTO_INCREMENT,
  `id_arch_dup` int(11) NOT NULL,
  PRIMARY KEY (`id_dup_elim`),
  KEY `fk_archivos_duplicados_eliminados_archivos_duplicados1` (`id_arch_dup`),
  CONSTRAINT `fk_archivos_duplicados_eliminados_archivos_duplicados1` FOREIGN KEY (`id_arch_dup`) REFERENCES `archivos_duplicados` (`id_arch_dup`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados_eliminados`
--

LOCK TABLES `archivos_duplicados_eliminados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados_eliminados` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivos_duplicados_eliminados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato_archivo`
--

DROP TABLE IF EXISTS `formato_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato_archivo` (
  `id_formato_archivo` int(11) NOT NULL,
  `decrip_form_arch` varchar(4) NOT NULL,
  PRIMARY KEY (`id_formato_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato_archivo`
--

LOCK TABLES `formato_archivo` WRITE;
/*!40000 ALTER TABLE `formato_archivo` DISABLE KEYS */;
INSERT INTO `formato_archivo` VALUES (1,'doc'),(2,'docx'),(3,'xls'),(4,'xlsx'),(5,'ppt'),(6,'pptx'),(7,'odt'),(8,'avi'),(9,'mp3'),(10,'mpg'),(11,'mpeg'),(12,'mp4'),(13,'ods'),(14,'odp');
/*!40000 ALTER TABLE `formato_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatos_corregidos`
--

DROP TABLE IF EXISTS `formatos_corregidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatos_corregidos` (
  `id_form_correg` int(11) NOT NULL AUTO_INCREMENT,
  `id_form_inval` int(11) NOT NULL,
  PRIMARY KEY (`id_form_correg`),
  KEY `fk_formatos_corregidos_formatos_invalidos1` (`id_form_inval`),
  CONSTRAINT `fk_formatos_corregidos_formatos_invalidos1` FOREIGN KEY (`id_form_inval`) REFERENCES `formatos_invalidos` (`id_form_inval`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_corregidos`
--

LOCK TABLES `formatos_corregidos` WRITE;
/*!40000 ALTER TABLE `formatos_corregidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `formatos_corregidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatos_invalidos`
--

DROP TABLE IF EXISTS `formatos_invalidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatos_invalidos` (
  `id_form_inval` int(11) NOT NULL AUTO_INCREMENT,
  `id_archivo` int(11) NOT NULL,
  PRIMARY KEY (`id_form_inval`),
  KEY `fk_formatos_invalidos_archivo1` (`id_archivo`),
  CONSTRAINT `fk_formatos_invalidos_archivo1` FOREIGN KEY (`id_archivo`) REFERENCES `archivo` (`id_archivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=821 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_invalidos`
--

LOCK TABLES `formatos_invalidos` WRITE;
/*!40000 ALTER TABLE `formatos_invalidos` DISABLE KEYS */;
INSERT INTO `formatos_invalidos` VALUES (807,1605),(808,1606),(809,1607),(810,1608),(811,1609),(812,1614),(813,1615),(814,1618),(815,1619),(816,1620),(817,1621),(818,1622),(819,1627),(820,1628);
/*!40000 ALTER TABLE `formatos_invalidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nombres_corregidos`
--

DROP TABLE IF EXISTS `nombres_corregidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nombres_corregidos` (
  `id_arch_correg` int(11) NOT NULL AUTO_INCREMENT,
  `id_nomb_inval` int(11) NOT NULL,
  PRIMARY KEY (`id_arch_correg`),
  KEY `fk_nombres_invalidos_corregidos_nombres_invalidos1` (`id_nomb_inval`),
  CONSTRAINT `fk_nombres_invalidos_corregidos_nombres_invalidos1` FOREIGN KEY (`id_nomb_inval`) REFERENCES `nombres_invalidos` (`id_nomb_inval`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_corregidos`
--

LOCK TABLES `nombres_corregidos` WRITE;
/*!40000 ALTER TABLE `nombres_corregidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nombres_corregidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nombres_invalidos`
--

DROP TABLE IF EXISTS `nombres_invalidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nombres_invalidos` (
  `id_nomb_inval` int(11) NOT NULL AUTO_INCREMENT,
  `id_archivo` int(11) NOT NULL,
  PRIMARY KEY (`id_nomb_inval`),
  KEY `fk_nombres_invalidos_archivo1` (`id_archivo`),
  CONSTRAINT `fk_nombres_invalidos_archivo1` FOREIGN KEY (`id_archivo`) REFERENCES `archivo` (`id_archivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_invalidos`
--

LOCK TABLES `nombres_invalidos` WRITE;
/*!40000 ALTER TABLE `nombres_invalidos` DISABLE KEYS */;
INSERT INTO `nombres_invalidos` VALUES (533,1604),(534,1605),(535,1611),(536,1612),(537,1616),(538,1617),(539,1618),(540,1624),(541,1625),(542,1629);
/*!40000 ALTER TABLE `nombres_invalidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cedula` varchar(8) NOT NULL,
  `clave` varchar(8) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (8,'f','f','12','f'),(9,'fd','g','12','f'),(10,'gf','gfd','4','5');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-23 16:48:52
