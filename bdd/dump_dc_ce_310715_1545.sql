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
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_contenido`
--

LOCK TABLES `analisis_contenido` WRITE;
/*!40000 ALTER TABLE `analisis_contenido` DISABLE KEYS */;
INSERT INTO `analisis_contenido` VALUES (268,'2015-07-31','12:25:54',12),(269,'2015-07-31','12:39:53',12),(270,'2015-07-31','12:41:33',12),(271,'2015-07-31','14:35:42',13),(272,'2015-07-31','14:41:13',13),(273,'2015-07-31','14:44:53',13),(274,'2015-07-31','14:45:16',13),(275,'2015-07-31','14:50:07',13),(276,'2015-07-31','14:58:29',13),(277,'2015-07-31','15:02:33',13),(278,'2015-07-31','15:04:35',13),(279,'2015-07-31','15:09:47',13),(280,'2015-07-31','15:13:35',13),(281,'2015-07-31','15:15:44',13),(282,'2015-07-31','15:16:56',13),(283,'2015-07-31','15:18:11',13),(284,'2015-07-31','15:21:40',13),(285,'2015-07-31','15:24:52',13),(286,'2015-07-31','15:27:08',13);
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
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (2131,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2132,'TDG-53-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2133,'TDG-55-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2134,'TDG-52-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2135,'TDG-56-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2136,'TDG-54-canchica.odt','/usr/share/contenido-educativo/duplicados',268,7),(2137,'con espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',268,7),(2138,'a  rr i ba.png','/usr/share/contenido-educativo/nombres-invalidos',268,15),(2139,'Retrabajo.ppt','/usr/share/contenido-educativo/formatos-invalidos',268,5),(2140,'excel2003.xls','/usr/share/contenido-educativo/formatos-invalidos',268,3),(2141,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',268,2),(2142,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',268,1),(2143,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',268,1),(2144,'excel2010.xlsx','/usr/share/contenido-educativo/formatos-invalidos',268,4),(2145,'powerPoint2010.pptx','/usr/share/contenido-educativo/formatos-invalidos',268,6),(2146,'powerPoint2003.ppt','/usr/share/contenido-educativo/formatos-invalidos',268,5),(2147,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',269,7),(2148,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',269,7),(2149,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',269,15),(2150,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2151,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2152,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2153,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',269,2),(2154,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2155,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',269,1),(2156,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',269,1),(2157,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',269,14),(2158,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',269,7),(2159,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',269,13),(2160,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',269,13),(2161,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',270,7),(2162,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',270,7),(2163,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',270,15),(2164,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2165,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2166,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2167,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',270,2),(2168,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2169,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',270,1),(2170,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',270,1),(2171,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',270,14),(2172,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',270,7),(2173,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',270,13),(2174,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',270,13),(2175,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',271,7),(2176,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',271,7),(2177,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',271,15),(2178,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',271,7),(2179,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',271,14),(2180,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',271,14),(2181,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',271,2),(2182,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',271,7),(2183,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',271,1),(2184,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',271,1),(2185,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',271,14),(2186,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',271,7),(2187,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',271,13),(2188,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',271,13),(2189,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',272,7),(2190,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',272,7),(2191,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',272,15),(2192,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',272,7),(2193,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',272,14),(2194,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',272,14),(2195,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',272,2),(2196,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',272,7),(2197,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',272,1),(2198,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',272,1),(2199,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',272,14),(2200,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',272,7),(2201,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',272,13),(2202,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',272,13),(2203,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2204,'TDG-53-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2205,'TDG-55-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2206,'TDG-52-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2207,'TDG-56-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2208,'TDG-54-canchica.odt','/usr/share/contenido-educativo/duplicados',273,7),(2209,'con espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',273,7),(2210,'a  rr i ba.png','/usr/share/contenido-educativo/nombres-invalidos',273,15),(2211,'Retrabajo.ppt','/usr/share/contenido-educativo/formatos-invalidos',273,5),(2212,'excel2003.xls','/usr/share/contenido-educativo/formatos-invalidos',273,3),(2213,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',273,2),(2214,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',273,1),(2215,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',273,1),(2216,'excel2010.xlsx','/usr/share/contenido-educativo/formatos-invalidos',273,4),(2217,'powerPoint2010.pptx','/usr/share/contenido-educativo/formatos-invalidos',273,6),(2218,'powerPoint2003.ppt','/usr/share/contenido-educativo/formatos-invalidos',273,5),(2219,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',274,7),(2220,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',274,7),(2221,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',274,15),(2222,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',274,7),(2223,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',274,14),(2224,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',274,14),(2225,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',274,2),(2226,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',274,7),(2227,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',274,1),(2228,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',274,1),(2229,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',274,14),(2230,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',274,7),(2231,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',274,13),(2232,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',274,13),(2233,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',275,7),(2234,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',275,7),(2235,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',275,15),(2236,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',275,7),(2237,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',275,14),(2238,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',275,14),(2239,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',275,2),(2240,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',275,7),(2241,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',275,1),(2242,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',275,1),(2243,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',275,14),(2244,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',275,7),(2245,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',275,13),(2246,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',275,13),(2247,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',276,7),(2248,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',276,7),(2249,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',276,15),(2250,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',276,7),(2251,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',276,14),(2252,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',276,14),(2253,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',276,2),(2254,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',276,7),(2255,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',276,1),(2256,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',276,1),(2257,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',276,14),(2258,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',276,7),(2259,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',276,13),(2260,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',276,13),(2261,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',277,7),(2262,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',277,7),(2263,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',277,15),(2264,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',277,7),(2265,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',277,14),(2266,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',277,14),(2267,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',277,2),(2268,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',277,7),(2269,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',277,1),(2270,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',277,1),(2271,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',277,14),(2272,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',277,7),(2273,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',277,13),(2274,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',277,13),(2275,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',278,7),(2276,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',278,7),(2277,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',278,15),(2278,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',278,7),(2279,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',278,14),(2280,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',278,14),(2281,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',278,2),(2282,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',278,7),(2283,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',278,1),(2284,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',278,1),(2285,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',278,14),(2286,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',278,7),(2287,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',278,13),(2288,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',278,13),(2289,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',279,7),(2290,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',279,7),(2291,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',279,15),(2292,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',279,7),(2293,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',279,14),(2294,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',279,14),(2295,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',279,2),(2296,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',279,7),(2297,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',279,1),(2298,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',279,1),(2299,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',279,14),(2300,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',279,7),(2301,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',279,13),(2302,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',279,13),(2303,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',280,7),(2304,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',280,7),(2305,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',280,15),(2306,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',280,7),(2307,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',280,14),(2308,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',280,14),(2309,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',280,2),(2310,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',280,7),(2311,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',280,1),(2312,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',280,1),(2313,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',280,14),(2314,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',280,7),(2315,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',280,13),(2316,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',280,13),(2317,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',281,7),(2318,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',281,7),(2319,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',281,15),(2320,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',281,7),(2321,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',281,14),(2322,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',281,14),(2323,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',281,2),(2324,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',281,7),(2325,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',281,1),(2326,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',281,1),(2327,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',281,14),(2328,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',281,7),(2329,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',281,13),(2330,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',281,13),(2331,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',282,7),(2332,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',282,7),(2333,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',282,15),(2334,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',282,7),(2335,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',282,14),(2336,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',282,14),(2337,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',282,2),(2338,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',282,7),(2339,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',282,1),(2340,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',282,1),(2341,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',282,14),(2342,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',282,7),(2343,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',282,13),(2344,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',282,13),(2345,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',283,7),(2346,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',283,7),(2347,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',283,15),(2348,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',283,7),(2349,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',283,14),(2350,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',283,14),(2351,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',283,2),(2352,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',283,7),(2353,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',283,1),(2354,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',283,1),(2355,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',283,14),(2356,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',283,7),(2357,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',283,13),(2358,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',283,13),(2359,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',284,7),(2360,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',284,7),(2361,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',284,15),(2362,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',284,7),(2363,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',284,14),(2364,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',284,14),(2365,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',284,2),(2366,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',284,7),(2367,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',284,1),(2368,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',284,1),(2369,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',284,14),(2370,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',284,7),(2371,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',284,13),(2372,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',284,13),(2373,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',285,7),(2374,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',285,7),(2375,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',285,15),(2376,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',285,7),(2377,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',285,14),(2378,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',285,14),(2379,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',285,2),(2380,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',285,7),(2381,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',285,1),(2382,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',285,1),(2383,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',285,14),(2384,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',285,7),(2385,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',285,13),(2386,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',285,13),(2387,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',286,7),(2388,'con-espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',286,7),(2389,'a--rr-i-ba.png','/usr/share/contenido-educativo/nombres-invalidos',286,15),(2390,'gregorina.odt','/usr/share/contenido-educativo/formatos-invalidos',286,7),(2391,'powerPoint2010.odp','/usr/share/contenido-educativo/formatos-invalidos',286,14),(2392,'powerPoint2003.odp','/usr/share/contenido-educativo/formatos-invalidos',286,14),(2393,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',286,2),(2394,'qwe.odt','/usr/share/contenido-educativo/formatos-invalidos',286,7),(2395,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',286,1),(2396,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',286,1),(2397,'Retrabajo.odp','/usr/share/contenido-educativo/formatos-invalidos',286,14),(2398,'curriculum-nehomar.odt','/usr/share/contenido-educativo/formatos-invalidos',286,7),(2399,'excel2010.ods','/usr/share/contenido-educativo/formatos-invalidos',286,13),(2400,'excel2003.ods','/usr/share/contenido-educativo/formatos-invalidos',286,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados`
--

LOCK TABLES `archivos_duplicados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados` VALUES (67,2132,370509,'2c196e660d4948052816b5f4b04741f9'),(68,2133,370509,'2c196e660d4948052816b5f4b04741f9'),(69,2134,370509,'2c196e660d4948052816b5f4b04741f9'),(70,2135,370509,'2c196e660d4948052816b5f4b04741f9'),(71,2136,370509,'2c196e660d4948052816b5f4b04741f9'),(72,2204,370509,'2c196e660d4948052816b5f4b04741f9'),(73,2205,370509,'2c196e660d4948052816b5f4b04741f9'),(74,2206,370509,'2c196e660d4948052816b5f4b04741f9'),(75,2207,370509,'2c196e660d4948052816b5f4b04741f9'),(76,2208,370509,'2c196e660d4948052816b5f4b04741f9');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados_eliminados`
--

LOCK TABLES `archivos_duplicados_eliminados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados_eliminados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados_eliminados` VALUES (16,67),(17,68),(18,69),(19,70),(20,71),(21,72),(22,73),(23,74),(24,75),(25,76);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_corregidos`
--

LOCK TABLES `formatos_corregidos` WRITE;
/*!40000 ALTER TABLE `formatos_corregidos` DISABLE KEYS */;
INSERT INTO `formatos_corregidos` VALUES (16,995),(17,996),(18,1000),(19,1001),(20,1002),(21,1015),(22,1016),(23,1020),(24,1021),(25,1022);
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
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_invalidos`
--

LOCK TABLES `formatos_invalidos` WRITE;
/*!40000 ALTER TABLE `formatos_invalidos` DISABLE KEYS */;
INSERT INTO `formatos_invalidos` VALUES (995,2139),(996,2140),(997,2141),(998,2142),(999,2143),(1000,2144),(1001,2145),(1002,2146),(1003,2153),(1004,2155),(1005,2156),(1006,2167),(1007,2169),(1008,2170),(1009,2181),(1010,2183),(1011,2184),(1012,2195),(1013,2197),(1014,2198),(1015,2211),(1016,2212),(1017,2213),(1018,2214),(1019,2215),(1020,2216),(1021,2217),(1022,2218),(1023,2225),(1024,2227),(1025,2228),(1026,2239),(1027,2241),(1028,2242),(1029,2253),(1030,2255),(1031,2256),(1032,2267),(1033,2269),(1034,2270),(1035,2281),(1036,2283),(1037,2284),(1038,2295),(1039,2297),(1040,2298),(1041,2309),(1042,2311),(1043,2312),(1044,2323),(1045,2325),(1046,2326),(1047,2337),(1048,2339),(1049,2340),(1050,2351),(1051,2353),(1052,2354),(1053,2365),(1054,2367),(1055,2368),(1056,2379),(1057,2381),(1058,2382),(1059,2393),(1060,2395),(1061,2396);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_corregidos`
--

LOCK TABLES `nombres_corregidos` WRITE;
/*!40000 ALTER TABLE `nombres_corregidos` DISABLE KEYS */;
INSERT INTO `nombres_corregidos` VALUES (14,566),(15,567),(16,568),(17,569);
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
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_invalidos`
--

LOCK TABLES `nombres_invalidos` WRITE;
/*!40000 ALTER TABLE `nombres_invalidos` DISABLE KEYS */;
INSERT INTO `nombres_invalidos` VALUES (566,2137),(567,2138),(568,2209),(569,2210);
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
INSERT INTO `usuarios` VALUES (12,'Yoel','Jerez','12797249','123456','S'),(13,'neho','barragan','12387210','123456','S');
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

-- Dump completed on 2015-07-31 15:45:37
