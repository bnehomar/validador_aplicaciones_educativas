-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis_contenido`
--

LOCK TABLES `analisis_contenido` WRITE;
/*!40000 ALTER TABLE `analisis_contenido` DISABLE KEYS */;
INSERT INTO `analisis_contenido` VALUES (223,'2015-07-28','15:22:01'),(224,'2015-07-28','15:23:14'),(225,'2015-07-28','15:26:23'),(226,'2015-07-28','15:26:32'),(227,'2015-07-28','15:26:33'),(228,'2015-07-28','15:26:33'),(229,'2015-07-28','15:26:33'),(230,'2015-07-28','15:26:33'),(231,'2015-07-28','15:26:51'),(232,'2015-07-28','15:27:28'),(233,'2015-07-28','15:27:40'),(234,'2015-07-28','15:28:06'),(235,'2015-07-28','15:50:02'),(236,'2015-07-28','16:13:45'),(237,'2015-07-28','16:26:07'),(238,'2015-07-28','16:35:26'),(239,'2015-07-28','16:36:04'),(240,'2015-07-28','16:38:50'),(241,'2015-07-28','16:39:36'),(242,'2015-07-28','16:42:36'),(243,'2015-07-28','16:43:43'),(244,'2015-07-28','16:44:51'),(245,'2015-07-28','16:50:50'),(246,'2015-07-28','16:58:56'),(247,'2015-07-28','17:01:00'),(248,'2015-07-28','17:03:48'),(249,'2015-07-28','17:05:55'),(250,'2015-07-28','17:10:37'),(251,'2015-07-28','17:11:15'),(252,'2015-07-29','08:51:57'),(253,'2015-07-29','08:54:32'),(254,'2015-07-29','09:02:12'),(255,'2015-07-29','12:26:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=1986 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (1782,'con-espacios.odt','/usr/share/contenido-educativo/',223,7),(1783,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',223,2),(1784,'qwe.odt','/usr/share/contenido-educativo/',223,7),(1785,'qwe.doc','/usr/share/contenido-educativo/',223,1),(1786,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',223,7),(1787,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',223,7),(1788,'con-espacios.odt','/usr/share/contenido-educativo/',224,7),(1789,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',224,2),(1790,'qwe.odt','/usr/share/contenido-educativo/',224,7),(1791,'qwe.doc','/usr/share/contenido-educativo/',224,1),(1792,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',224,7),(1793,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',224,7),(1794,'con-espacios.odt','/usr/share/contenido-educativo/',225,7),(1795,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',225,2),(1796,'qwe.odt','/usr/share/contenido-educativo/',225,7),(1797,'qwe.doc','/usr/share/contenido-educativo/',225,1),(1798,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',225,7),(1799,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',225,7),(1800,'con-espacios.odt','/usr/share/contenido-educativo/',226,7),(1801,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',226,2),(1802,'qwe.odt','/usr/share/contenido-educativo/',226,7),(1803,'qwe.doc','/usr/share/contenido-educativo/',226,1),(1804,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',226,7),(1805,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',226,7),(1806,'con-espacios.odt','/usr/share/contenido-educativo/',227,7),(1807,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',227,2),(1808,'qwe.odt','/usr/share/contenido-educativo/',227,7),(1809,'qwe.doc','/usr/share/contenido-educativo/',227,1),(1810,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',227,7),(1811,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',227,7),(1812,'con-espacios.odt','/usr/share/contenido-educativo/',228,7),(1813,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',228,2),(1814,'qwe.odt','/usr/share/contenido-educativo/',228,7),(1815,'qwe.doc','/usr/share/contenido-educativo/',228,1),(1816,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',228,7),(1817,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',228,7),(1818,'con-espacios.odt','/usr/share/contenido-educativo/',229,7),(1819,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',229,2),(1820,'qwe.odt','/usr/share/contenido-educativo/',229,7),(1821,'qwe.doc','/usr/share/contenido-educativo/',229,1),(1822,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',229,7),(1823,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',229,7),(1824,'con-espacios.odt','/usr/share/contenido-educativo/',230,7),(1825,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',230,2),(1826,'qwe.odt','/usr/share/contenido-educativo/',230,7),(1827,'qwe.doc','/usr/share/contenido-educativo/',230,1),(1828,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',230,7),(1829,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',230,7),(1830,'con-espacios.odt','/usr/share/contenido-educativo/',231,7),(1831,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',231,2),(1832,'qwe.odt','/usr/share/contenido-educativo/',231,7),(1833,'qwe.doc','/usr/share/contenido-educativo/',231,1),(1834,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',231,7),(1835,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',231,7),(1836,'con-espacios.odt','/usr/share/contenido-educativo/',232,7),(1837,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',232,2),(1838,'qwe.odt','/usr/share/contenido-educativo/',232,7),(1839,'qwe.doc','/usr/share/contenido-educativo/',232,1),(1840,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',232,7),(1841,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',232,7),(1842,'con-espacios.odt','/usr/share/contenido-educativo/',233,7),(1843,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',233,2),(1844,'qwe.odt','/usr/share/contenido-educativo/',233,7),(1845,'qwe.doc','/usr/share/contenido-educativo/',233,1),(1846,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',233,7),(1847,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',233,7),(1848,'con-espacios.odt','/usr/share/contenido-educativo',234,7),(1849,'curriculum-nehomar.docx','/usr/share/contenido-educativo',234,2),(1850,'qwe.odt','/usr/share/contenido-educativo',234,7),(1851,'qwe.doc','/usr/share/contenido-educativo',234,1),(1852,'TDG-52-canchica.odt','/usr/share/contenido-educativo',234,7),(1853,'curriculum-nehomar.odt','/usr/share/contenido-educativo',234,7),(1854,'con-espacios.odt','/usr/share/contenido-educativo/',235,7),(1855,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',235,2),(1856,'qwe.odt','/usr/share/contenido-educativo/',235,7),(1857,'qwe.doc','/usr/share/contenido-educativo/',235,1),(1858,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',235,7),(1859,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',235,7),(1860,'con-espacios.odt','/usr/share/contenido-educativo/',236,7),(1861,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',236,2),(1862,'qwe.odt','/usr/share/contenido-educativo/',236,7),(1863,'qwe.doc','/usr/share/contenido-educativo/',236,1),(1864,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',236,7),(1865,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',236,7),(1866,'con-espacios.odt','/usr/share/contenido-educativo/',237,7),(1867,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',237,2),(1868,'qwe.odt','/usr/share/contenido-educativo/',237,7),(1869,'qwe.doc','/usr/share/contenido-educativo/',237,1),(1870,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',237,7),(1871,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',237,7),(1872,'con-espacios.odt','/usr/share/contenido-educativo/',238,7),(1873,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',238,2),(1874,'qwe.odt','/usr/share/contenido-educativo/',238,7),(1875,'qwe.doc','/usr/share/contenido-educativo/',238,1),(1876,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',238,7),(1877,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',238,7),(1878,'con-espacios.odt','/usr/share/contenido-educativo/',239,7),(1879,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',239,2),(1880,'qwe.odt','/usr/share/contenido-educativo/',239,7),(1881,'qwe.doc','/usr/share/contenido-educativo/',239,1),(1882,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',239,7),(1883,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',239,7),(1884,'con-espacios.odt','/usr/share/contenido-educativo/',240,7),(1885,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',240,2),(1886,'qwe.odt','/usr/share/contenido-educativo/',240,7),(1887,'qwe.doc','/usr/share/contenido-educativo/',240,1),(1888,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',240,7),(1889,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',240,7),(1890,'con-espacios.odt','/usr/share/contenido-educativo/',241,7),(1891,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',241,2),(1892,'qwe.odt','/usr/share/contenido-educativo/',241,7),(1893,'qwe.doc','/usr/share/contenido-educativo/',241,1),(1894,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',241,7),(1895,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',241,7),(1896,'con-espacios.odt','/usr/share/contenido-educativo/',242,7),(1897,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',242,2),(1898,'qwe.odt','/usr/share/contenido-educativo/',242,7),(1899,'qwe.doc','/usr/share/contenido-educativo/',242,1),(1900,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',242,7),(1901,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',242,7),(1902,'con-espacios.odt','/usr/share/contenido-educativo/',243,7),(1903,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',243,2),(1904,'qwe.odt','/usr/share/contenido-educativo/',243,7),(1905,'qwe.doc','/usr/share/contenido-educativo/',243,1),(1906,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',243,7),(1907,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',243,7),(1908,'con-espacios.odt','/usr/share/contenido-educativo/',244,7),(1909,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',244,2),(1910,'qwe.odt','/usr/share/contenido-educativo/',244,7),(1911,'qwe.doc','/usr/share/contenido-educativo/',244,1),(1912,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',244,7),(1913,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',244,7),(1914,'con-espacios.odt','/usr/share/contenido-educativo/',245,7),(1915,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',245,2),(1916,'qwe.odt','/usr/share/contenido-educativo/',245,7),(1917,'qwe.doc','/usr/share/contenido-educativo/',245,1),(1918,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',245,7),(1919,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',245,7),(1920,'con-espacios.odt','/usr/share/contenido-educativo/',246,7),(1921,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',246,2),(1922,'qwe.odt','/usr/share/contenido-educativo/',246,7),(1923,'qwe.doc','/usr/share/contenido-educativo/',246,1),(1924,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',246,7),(1925,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',246,7),(1926,'con-espacios.odt','/usr/share/contenido-educativo/',247,7),(1927,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',247,2),(1928,'qwe.odt','/usr/share/contenido-educativo/',247,7),(1929,'qwe.doc','/usr/share/contenido-educativo/',247,1),(1930,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',247,7),(1931,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',247,7),(1932,'con-espacios.odt','/usr/share/contenido-educativo/',248,7),(1933,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',248,2),(1934,'qwe.odt','/usr/share/contenido-educativo/',248,7),(1935,'qwe.doc','/usr/share/contenido-educativo/',248,1),(1936,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',248,7),(1937,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',248,7),(1938,'con-espacios.odt','/usr/share/contenido-educativo/',249,7),(1939,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',249,2),(1940,'qwe.odt','/usr/share/contenido-educativo/',249,7),(1941,'qwe.doc','/usr/share/contenido-educativo/',249,1),(1942,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',249,7),(1943,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',249,7),(1944,'con-espacios.odt','/usr/share/contenido-educativo/',250,7),(1945,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',250,2),(1946,'qwe.odt','/usr/share/contenido-educativo/',250,7),(1947,'qwe.doc','/usr/share/contenido-educativo/',250,1),(1948,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',250,7),(1949,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',250,7),(1950,'con-espacios.odt','/usr/share/contenido-educativo/',251,7),(1951,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',251,2),(1952,'qwe.odt','/usr/share/contenido-educativo/',251,7),(1953,'qwe.doc','/usr/share/contenido-educativo/',251,1),(1954,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',251,7),(1955,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',251,7),(1956,'con-espacios.odt','/usr/share/contenido-educativo/',252,7),(1957,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',252,2),(1958,'qwe.odt','/usr/share/contenido-educativo/',252,7),(1959,'qwe.doc','/usr/share/contenido-educativo/',252,1),(1960,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',252,7),(1961,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',252,7),(1962,'con-espacios.odt','/usr/share/contenido-educativo/',253,7),(1963,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',253,2),(1964,'qwe.odt','/usr/share/contenido-educativo/',253,7),(1965,'qwe.doc','/usr/share/contenido-educativo/',253,1),(1966,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',253,7),(1967,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',253,7),(1968,'qwe2.odt','/usr/share/contenido-educativo/',253,7),(1969,'con-espacios.odt','/usr/share/contenido-educativo/',254,7),(1970,'curriculum-nehomar.docx','/usr/share/contenido-educativo/',254,2),(1971,'qwe.odt','/usr/share/contenido-educativo/',254,7),(1972,'qwe.doc','/usr/share/contenido-educativo/',254,1),(1973,'TDG-52-canchica.odt','/usr/share/contenido-educativo/',254,7),(1974,'curriculum-nehomar.odt','/usr/share/contenido-educativo/',254,7),(1975,'a  rr i ba.png','/usr/share/contenido-educativo/nombres-invalidos',255,15),(1976,'con espacios.odt','/usr/share/contenido-educativo/nombres-invalidos',255,7),(1977,'TDG-52-canchica.odt','/usr/share/contenido-educativo/duplicados',255,7),(1978,'TDG-55-canchica .odt','/usr/share/contenido-educativo/duplicados',255,7),(1979,'TDG-53-canchica.odt','/usr/share/contenido-educativo/duplicados',255,7),(1980,'TDG-54-canchica.odt','/usr/share/contenido-educativo/duplicados',255,7),(1981,'TDG-57-canchica.odt','/usr/share/contenido-educativo/duplicados',255,7),(1982,'TDG-56-canchica.odt','/usr/share/contenido-educativo/duplicados',255,7),(1983,'curriculum-nehomar.docx','/usr/share/contenido-educativo/formatos-invalidos',255,2),(1984,'gregorina.doc','/usr/share/contenido-educativo/formatos-invalidos',255,1),(1985,'qwe.doc','/usr/share/contenido-educativo/formatos-invalidos',255,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados`
--

LOCK TABLES `archivos_duplicados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados` VALUES (56,1968,190585,'03ec402a844be40ef79949f217259251'),(57,1978,370509,'2c196e660d4948052816b5f4b04741f9'),(58,1979,370509,'2c196e660d4948052816b5f4b04741f9'),(59,1980,370509,'2c196e660d4948052816b5f4b04741f9'),(60,1981,370509,'2c196e660d4948052816b5f4b04741f9'),(61,1982,370509,'2c196e660d4948052816b5f4b04741f9');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_duplicados_eliminados`
--

LOCK TABLES `archivos_duplicados_eliminados` WRITE;
/*!40000 ALTER TABLE `archivos_duplicados_eliminados` DISABLE KEYS */;
INSERT INTO `archivos_duplicados_eliminados` VALUES (6,56),(7,58),(8,59),(9,60),(10,61);
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
) ENGINE=InnoDB AUTO_INCREMENT=947 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos_invalidos`
--

LOCK TABLES `formatos_invalidos` WRITE;
/*!40000 ALTER TABLE `formatos_invalidos` DISABLE KEYS */;
INSERT INTO `formatos_invalidos` VALUES (880,1783),(881,1785),(882,1789),(883,1791),(884,1795),(885,1797),(886,1801),(887,1803),(888,1807),(889,1809),(890,1813),(891,1815),(892,1819),(893,1821),(894,1825),(895,1827),(896,1831),(897,1833),(898,1837),(899,1839),(900,1843),(901,1845),(902,1849),(903,1851),(904,1855),(905,1857),(906,1861),(907,1863),(908,1867),(909,1869),(910,1873),(911,1875),(912,1879),(913,1881),(914,1885),(915,1887),(916,1891),(917,1893),(918,1897),(919,1899),(920,1903),(921,1905),(922,1909),(923,1911),(924,1915),(925,1917),(926,1921),(927,1923),(928,1927),(929,1929),(930,1933),(931,1935),(932,1939),(933,1941),(934,1945),(935,1947),(936,1951),(937,1953),(938,1957),(939,1959),(940,1963),(941,1965),(942,1970),(943,1972),(944,1983),(945,1984),(946,1985);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_corregidos`
--

LOCK TABLES `nombres_corregidos` WRITE;
/*!40000 ALTER TABLE `nombres_corregidos` DISABLE KEYS */;
INSERT INTO `nombres_corregidos` VALUES (9,561),(10,562),(11,563);
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
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres_invalidos`
--

LOCK TABLES `nombres_invalidos` WRITE;
/*!40000 ALTER TABLE `nombres_invalidos` DISABLE KEYS */;
INSERT INTO `nombres_invalidos` VALUES (561,1975),(562,1976),(563,1978);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (12,'Yoel','Jerez','12797249','123456','N');
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

-- Dump completed on 2015-07-29 13:16:14
