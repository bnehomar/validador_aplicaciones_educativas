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
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id_analisis`),
  KEY `fk_analisis_contenido_usuarios1` (`idusuario`),
  CONSTRAINT `fk_analisis_contenido_usuarios1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_contenido`
--

LOCK TABLES `analisis_contenido` WRITE;
/*!40000 ALTER TABLE `analisis_contenido` DISABLE KEYS */;
INSERT INTO `analisis_contenido` VALUES (268,'2015-07-31','12:25:54',12),(269,'2015-07-31','12:39:53',12),(270,'2015-07-31','12:41:33',12);
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
  `id_formato_archivo` int(11) NOT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `fk_archivo_analisis_contenido1` (`id_analisis`),
  KEY `fk_archivo_formato_archivo1` (`id_formato_archivo`),
  CONSTRAINT `fk_archivo_formato_archivo1` FOREIGN KEY (`id_formato_archivo`) REFERENCES `formato_archivo` (`id_formato_archivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_analisis_contenido1` FOREIGN KEY (`id_analisis`) REFERENCES `analisis_contenido` (`id_analisis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2175 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (2131,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2132,'TDG-53-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2133,'TDG-55-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2134,'TDG-52-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2135,'TDG-56-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2136,'TDG-54-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2137,'con espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',268,7),(2138,'a  rr i ba.png','/usr/share/contenido-educativo/nombres-invalidos',268,15),(2139,'Retrabajo.ppt','/usr/share/contenido-educativo/formatos-invalidos',268,5),(2140,'excel2003.xls','/usr/share/contenido-educativo/formatos-invalidos',268,3),(2141,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',268,2),(2142,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',268,1),(2143,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',268,1),(2144,'excel2010.xlsx','/usr/share/contenido-educativo/formatos-invalidos',268,4),(2145,'powerPoint2010.pptx','/usr/share/contenido-educativo/formatos-invalidos',268,6),(2146,'powerPoint2003.ppt','/usr/share/contenido-educativo/formatos-invalidos',268,5),(2147,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',269,7),(2148,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',269,7),(2149,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',269,15),(2150,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2151,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2152,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2153,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',269,2),(2154,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2155,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',269,1),(2156,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',269,1),(2157,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2158,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2159,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',269,13),(2160,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',269,13),(2161,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',270,7),(2162,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',270,7),(2163,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',270,15),(2164,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2165,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2166,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2167,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',270,2),(2168,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2169,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',270,1),(2170,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',270,1),(2171,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2172,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2173,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',270,13),(2174,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',270,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados`
--

LOCK TABLES `archivos_duplicados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados` VALUES (67,2132,370509,'2c196e660d4948052816b5f4b04741f9'),(68,2133,370509,'2c196e660d4948052816b5f4b04741f9'),(69,2134,370509,'2c196e660d4948052816b5f4b04741f9'),(70,2135,370509,'2c196e660d4948052816b5f4b04741f9'),(71,2136,370509,'2c196e660d4948052816b5f4b04741f9');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados_eliminados`
--

LOCK TABLES `archivos_duplicados_eliminados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados_eliminados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados_eliminados` VALUES (16,67),(17,68),(18,69),(19,70),(20,71);
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
INSERT INTO `formato_archivo` VALUES (1,'doc'),(2,'docx'),(3,'xls'),(4,'xlsx'),(5,'ppt'),(6,'pptx'),(7,'odt'),(8,'avi'),(9,'mp3'),(10,'mpg'),(11,'mpeg'),(12,'mp4'),(13,'ods'),(14,'odp'),(15,'png'),(16,'jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_corregidos`
--

LOCK TABLES `formatos_corregidos` WRITE;
/*!40000 ALTER TABLE `formatos_corregidos` DISABLE KEYS */;
INSERT INTO `formatos_corregidos` VALUES (16,995),(17,996),(18,1000),(19,1001),(20,1002);
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
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_invalidos`
--

LOCK TABLES `formatos_invalidos` WRITE;
/*!40000 ALTER TABLE `formatos_invalidos` DISABLE KEYS */;
INSERT INTO `formatos_invalidos` VALUES (995,2139),(996,2140),(997,2141),(998,2142),(999,2143),(1000,2144),(1001,2145),(1002,2146),(1003,2153),(1004,2155),(1005,2156),(1006,2167),(1007,2169),(1008,2170);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_corregidos`
--

LOCK TABLES `nombres_corregidos` WRITE;
/*!40000 ALTER TABLE `nombres_corregidos` DISABLE KEYS */;
INSERT INTO `nombres_corregidos` VALUES (14,566),(15,567);
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
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_invalidos`
--

LOCK TABLES `nombres_invalidos` WRITE;
/*!40000 ALTER TABLE `nombres_invalidos` DISABLE KEYS */;
INSERT INTO `nombres_invalidos` VALUES (566,2137),(567,2138);
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
  `activo` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (12,'Yoel','Jerez','12797249','123456','S'),(13,'neho','barragan','12387210','123456','N');
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

-- Dump completed on 2015-07-31 14:23:36
