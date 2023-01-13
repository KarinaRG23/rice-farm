-- MariaDB dump 10.19  Distrib 10.9.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: FarmRice
-- ------------------------------------------------------
-- Server version	10.9.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `datecreated` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datecreated` datetime DEFAULT NULL,
  `dispositivo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `pedidoid` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `productoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpiofpbnsavkvfhx2ky7moagbo` (`pedidoid`),
  KEY `FKme3n8r1ng5778qnxam0gb4h6k` (`productoid`),
  CONSTRAINT `FKme3n8r1ng5778qnxam0gb4h6k` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `FKpiofpbnsavkvfhx2ky7moagbo` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_temp`
--

DROP TABLE IF EXISTS `detalle_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `personaid` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `productoid` int(11) DEFAULT NULL,
  `transccionid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgl9a8gymouvahlxr2hrrgoej` (`productoid`),
  CONSTRAINT `FKgl9a8gymouvahlxr2hrrgoej` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_temp`
--

LOCK TABLES `detalle_temp` WRITE;
/*!40000 ALTER TABLE `detalle_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `productoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk4c99ta5hr77v7n9i8bmfgah4` (`productoid`),
  CONSTRAINT `FKk4c99ta5hr77v7n9i8bmfgah4` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES
(1,'dashboard',1,'dashboard'),
(2,'usuarios del sistema',1,'usuarios');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `costo_envio` double DEFAULT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `personaid` int(11) DEFAULT NULL,
  `referenciacobro` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tipopagoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `FKrehrlos2ynfqsa98o9jsqd7a2` (`personaid`),
  KEY `FKrdd228rjbyew90kmyur9ub1ld` (`tipopagoid`),
  CONSTRAINT `FKrdd228rjbyew90kmyur9ub1ld` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`),
  CONSTRAINT `FKrehrlos2ynfqsa98o9jsqd7a2` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES
(1,300,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,3,'cada 15 dias','1',2),
(2,300,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(3,300,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(4,300,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(5,150,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(6,150,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(7,150,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(8,150,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2),
(9,150,'Duran','2023-01-19 00:00:00',NULL,'-2.22323','-79.5656565',1000,1,'cada 15 dias','1',2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `d` int(11) DEFAULT NULL,
  `moduloid` int(11) DEFAULT NULL,
  `r` int(11) DEFAULT NULL,
  `rolid` int(11) DEFAULT NULL,
  `u` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpermiso`),
  KEY `FKail6ddyj6p55lcfj5voy1rcjy` (`moduloid`),
  KEY `FKi8lhrf7qm6p3qhcw6sefhgp1o` (`rolid`),
  CONSTRAINT `FKail6ddyj6p55lcfj5voy1rcjy` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`),
  CONSTRAINT `FKi8lhrf7qm6p3qhcw6sefhgp1o` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES
(1,1,1,1,1,1,1),
(2,1,2,1,1,1,1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `direccionfiscal` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `nombrefiscal` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `rolid` int(11) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `telefono` varchar(256) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `UK_bfxfxg15pmy0c1imvi6ucoeem` (`email`),
  KEY `FK3u0wp1oldy8ijdve9wjw4olfu` (`rolid`),
  CONSTRAINT `FK3u0wp1oldy8ijdve9wjw4olfu` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES
(1,'mero',NULL,'mi casa pues','admin@admin.com','0918237451',NULL,'las tejas','marlon','admin123',1,NULL,1,'09863951028',NULL),
(2,'hernandez leon',NULL,'Salitre','cheo@gmail.com','0254879856',NULL,'Salitre','jose manuel','elcheo',1,NULL,1,'09863951028',NULL),
(3,'Arce Arce',NULL,'Duran','danny@gmail.com','0978633212',NULL,'Duran','Edwin Daniel','danny123',1,NULL,1,'09863951028',NULL),
(4,'Rodriguez',NULL,'Duran','karina@gmail.com','0112548798',NULL,'Duran','Karina',NULL,1,NULL,1,'09863951028',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) DEFAULT NULL,
  `datecreate` datetime DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `FKr85rebjp3a8n6pmu89jghh80g` (`categoriaid`),
  CONSTRAINT `FKr85rebjp3a8n6pmu89jghh80g` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reembolso`
--

DROP TABLE IF EXISTS `reembolso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reembolso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datoreembolso` varchar(255) DEFAULT NULL,
  `idtransaccion` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `pedidoid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkboee9ybx5a0ejx3upsurvqew` (`pedidoid`),
  CONSTRAINT `FKkboee9ybx5a0ejx3upsurvqew` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reembolso`
--

LOCK TABLES `reembolso` WRITE;
/*!40000 ALTER TABLE `reembolso` DISABLE KEYS */;
/*!40000 ALTER TABLE `reembolso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombrerol` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES
(1,'persona encargada de administrar la web','administrator',1),
(2,'supervisor de tienda','supervisor',1),
(3,'cliente general','cliente',1),
(4,'operador de tienda','vendedor',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopago` (
  `idtipopago` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `tipopago` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtipopago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopago`
--

LOCK TABLES `tipopago` WRITE;
/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
INSERT INTO `tipopago` VALUES
(1,1,'cash'),
(2,1,'nota de debito'),
(3,1,'tarjeta de credito');
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13  3:06:23
