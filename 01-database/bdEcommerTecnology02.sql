CREATE DATABASE  IF NOT EXISTS `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `railway`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: switchyard.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `prefijo_categoria` varchar(10) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Laptops',NULL,'LAP'),(2,'Smartphones',NULL,'PHN'),(3,'Audio',NULL,'AUD'),(4,'Monitores',NULL,'MON'),(5,'Almacenamiento',NULL,'ALM'),(20,'PRUEBA','prueba','prueba'),(21,'PRUEBA','prueba','prueba'),(22,'PRUEBA','prueba','prueba'),(23,'PRUEBA','prueba','prueba'),(25,'PC de escritorio2','PC de escritorio2',''),(26,'PC de escritorio3','PC de escritorio3','');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_carrito` (
  `id_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_carrito` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_carrito` (`id_carrito`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden` (
  `id_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_orden` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_orden` (`id_orden`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especificaciones_producto`
--

DROP TABLE IF EXISTS `especificaciones_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especificaciones_producto` (
  `id_especificacion` bigint NOT NULL AUTO_INCREMENT,
  `id_producto` bigint NOT NULL,
  `atriuto` varchar(50) DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_especificacion`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `especificaciones_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especificaciones_producto`
--

LOCK TABLES `especificaciones_producto` WRITE;
/*!40000 ALTER TABLE `especificaciones_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `especificaciones_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre_estado_UNIQUE` (`nombre_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
INSERT INTO `estado_usuario` VALUES (1,'ACTIVO','Usuario con acceso habilitado'),(2,'INACTIVO','Usuario deshabitado temporalmente');
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `id_imagen` bigint NOT NULL AUTO_INCREMENT,
  `url_imagen` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `id_entidad` bigint NOT NULL,
  `s3key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_imagen`),
  KEY `imagen_tipoidx_entidad` (`id_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (15,'https://ecommerce-productos.s3.amazonaws.com/cbff2b1e-8f3d-4eeb-9a4b-e016e296320a_03_audio.png','CATEGORIA',3,'cbff2b1e-8f3d-4eeb-9a4b-e016e296320a_03_audio.png'),(16,'https://ecommerce-productos.s3.amazonaws.com/285ca0b6-5f4d-4e18-8a1d-138302bc427d_04_monitors.png','CATEGORIA',4,'285ca0b6-5f4d-4e18-8a1d-138302bc427d_04_monitors.png'),(17,'https://ecommerce-productos.s3.amazonaws.com/cbeecc19-3139-498e-85fa-a782d732376b_05_almacenamiento.png','CATEGORIA',5,'cbeecc19-3139-498e-85fa-a782d732376b_05_almacenamiento.png'),(19,'https://ecommerce-productos.s3.amazonaws.com/50e94688-93c5-4aa1-af88-80fced5870e4_02_samsung.png','MARCA',2,'50e94688-93c5-4aa1-af88-80fced5870e4_02_samsung.png'),(20,'https://ecommerce-productos.s3.amazonaws.com/3cf3ea8e-0e83-4560-895e-f57ddbfcfc00_03_sony.png','MARCA',3,'3cf3ea8e-0e83-4560-895e-f57ddbfcfc00_03_sony.png'),(21,'https://ecommerce-productos.s3.amazonaws.com/21e06289-6007-4e9f-9a96-f5ee4c7ec13b_04_logitech.png','MARCA',4,'21e06289-6007-4e9f-9a96-f5ee4c7ec13b_04_logitech.png'),(22,'https://ecommerce-productos.s3.amazonaws.com/85c15825-0899-402e-ae88-406c28829597_05_western digital.png','MARCA',5,'85c15825-0899-402e-ae88-406c28829597_05_western digital.png'),(28,'https://ecommerce-productos.s3.amazonaws.com/d7afd1ef-b056-42e6-98ac-0fa112fffd83_487436510_1069703311844101_592405004370108220_n.jpg','USUARIO',4,'d7afd1ef-b056-42e6-98ac-0fa112fffd83_487436510_1069703311844101_592405004370108220_n.jpg'),(39,'https://ecommerce-productos.s3.amazonaws.com/f1ed9423-1eee-4313-84c5-89228aae2d09_518461993_18510370042002406_3655203270879353791_n.jpg','USUARIO',58,'f1ed9423-1eee-4313-84c5-89228aae2d09_518461993_18510370042002406_3655203270879353791_n.jpg'),(40,'https://ecommerce-productos.s3.amazonaws.com/d91cdd51-e3cc-45d3-bc19-354764fe309d_IMG_20240916_212910.jpg','USUARIO',59,'d91cdd51-e3cc-45d3-bc19-354764fe309d_IMG_20240916_212910.jpg'),(41,'https://ecommerce-productos.s3.amazonaws.com/5bae2063-fb48-466a-accc-89bf9b350d20_sjvulzwfclpuqmvl9qxj.webp','PRODUCTO',55,'5bae2063-fb48-466a-accc-89bf9b350d20_sjvulzwfclpuqmvl9qxj.webp'),(42,'https://ecommerce-productos.s3.amazonaws.com/0dcca964-f912-485e-ad4c-99bd155bffd2_br0kld5oivwhhgejwwux.webp','PRODUCTO',60,'0dcca964-f912-485e-ad4c-99bd155bffd2_br0kld5oivwhhgejwwux.webp'),(43,'https://ecommerce-productos.s3.amazonaws.com/f5714bb8-0988-44c4-bc14-cba192719202_sjvulzwfclpuqmvl9qxj.webp','PRODUCTO',60,'f5714bb8-0988-44c4-bc14-cba192719202_sjvulzwfclpuqmvl9qxj.webp'),(44,'https://ecommerce-productos.s3.amazonaws.com/459b8c2b-3a6f-4887-9cc2-a7dbb9cd769f_05-pcs.jpg','CATEGORIA',7,'459b8c2b-3a6f-4887-9cc2-a7dbb9cd769f_05-pcs.jpg'),(45,'https://ecommerce-productos.s3.amazonaws.com/0eaacd56-e8dd-4623-b88a-e795cb99fdab_05-pcs.jpg','CATEGORIA',16,'0eaacd56-e8dd-4623-b88a-e795cb99fdab_05-pcs.jpg'),(46,'https://ecommerce-productos.s3.amazonaws.com/57617847-de6d-4a23-86a7-c1369f54db64_01_laptops.png','CATEGORIA',18,'57617847-de6d-4a23-86a7-c1369f54db64_01_laptops.png'),(47,'https://ecommerce-productos.s3.amazonaws.com/c6827406-1065-4276-9fff-9d4fa782f988_01_laptops.png','MARCA',6,'c6827406-1065-4276-9fff-9d4fa782f988_01_laptops.png'),(48,'https://ecommerce-productos.s3.amazonaws.com/041fad3b-44ad-4ff4-83de-9cf5758f6a70_01_laptops.png','MARCA',7,'041fad3b-44ad-4ff4-83de-9cf5758f6a70_01_laptops.png'),(49,'https://ecommerce-productos.s3.amazonaws.com/8b8cf37a-ab06-4fbf-848b-361c313801ad_01_laptops.png','MARCA',8,'8b8cf37a-ab06-4fbf-848b-361c313801ad_01_laptops.png'),(50,'https://ecommerce-productos.s3.amazonaws.com/9e7c6ba4-a84c-4dea-bafb-51212de4c223_487502429_638883435440547_8337006912826174393_n.jpg','CATEGORIA',19,'9e7c6ba4-a84c-4dea-bafb-51212de4c223_487502429_638883435440547_8337006912826174393_n.jpg'),(51,'https://ecommerce-productos.s3.amazonaws.com/d1ade1c0-5fc1-4603-bebe-6c3dbe1814c1_26.jpg','PRODUCTO',64,'d1ade1c0-5fc1-4603-bebe-6c3dbe1814c1_26.jpg'),(52,'https://ecommerce-productos.s3.amazonaws.com/8dbb0128-b077-47da-886c-e59fa950d2cc_05-pcs.png','PRODUCTO',65,'8dbb0128-b077-47da-886c-e59fa950d2cc_05-pcs.png'),(53,'https://ecommerce-productos.s3.amazonaws.com/4e4e430f-b15c-49c8-8e7d-f54fbf22c4d9_G2IW7sMXcAAho72.jpg','PRODUCTO',66,'4e4e430f-b15c-49c8-8e7d-f54fbf22c4d9_G2IW7sMXcAAho72.jpg'),(54,'https://ecommerce-productos.s3.amazonaws.com/0fbe803e-5abf-40d3-b1c6-ebfafe962416_G2IW7sMXcAAho72.jpg','CATEGORIA',20,'0fbe803e-5abf-40d3-b1c6-ebfafe962416_G2IW7sMXcAAho72.jpg'),(55,'https://ecommerce-productos.s3.amazonaws.com/3aacf55c-a96e-401a-b27d-224a5c85c4fb_G2IW5uZWIAAYaY4.jpg','PRODUCTO',67,'3aacf55c-a96e-401a-b27d-224a5c85c4fb_G2IW5uZWIAAYaY4.jpg'),(56,'https://ecommerce-productos.s3.amazonaws.com/cf8adff4-1f1c-4d2f-a63a-27b8ac8a90ad_G2IW5uZWIAAYaY4.jpg','PRODUCTO',68,'cf8adff4-1f1c-4d2f-a63a-27b8ac8a90ad_G2IW5uZWIAAYaY4.jpg'),(57,'https://ecommerce-productos.s3.amazonaws.com/6600f721-b17f-4f6b-9854-f95c07ac6338_G2IW7sMXcAAho72.jpg','PRODUCTO',69,'6600f721-b17f-4f6b-9854-f95c07ac6338_G2IW7sMXcAAho72.jpg'),(58,'https://ecommerce-productos.s3.amazonaws.com/3d25ff32-5bdb-4bcc-a7ef-0b8ba792243c_G2IW7sMXcAAho72.jpg','PRODUCTO',70,'3d25ff32-5bdb-4bcc-a7ef-0b8ba792243c_G2IW7sMXcAAho72.jpg'),(59,'https://ecommerce-productos.s3.amazonaws.com/546c7b7f-72b3-4916-9855-0d9effd6f922_G2IW7sMXcAAho72.jpg','PRODUCTO',71,'546c7b7f-72b3-4916-9855-0d9effd6f922_G2IW7sMXcAAho72.jpg'),(60,'https://ecommerce-productos.s3.amazonaws.com/c67230d2-f641-4ea6-91fc-6de4712aa39b_G2IW7sMXcAAho72.jpg','CATEGORIA',21,'c67230d2-f641-4ea6-91fc-6de4712aa39b_G2IW7sMXcAAho72.jpg'),(61,'https://ecommerce-productos.s3.amazonaws.com/6f2a02a2-caf2-41e0-8945-02d0d3a080f2_G2IW7sMXcAAho72.jpg','CATEGORIA',22,'6f2a02a2-caf2-41e0-8945-02d0d3a080f2_G2IW7sMXcAAho72.jpg'),(62,'https://ecommerce-productos.s3.amazonaws.com/d4a88efb-30d1-4031-992e-df59b105c17a_G2IW5uZWIAAYaY4.jpg','MARCA',9,'d4a88efb-30d1-4031-992e-df59b105c17a_G2IW5uZWIAAYaY4.jpg'),(63,'https://ecommerce-productos.s3.amazonaws.com/752ede8a-f75a-4791-9213-854a65fa5534_videoframe_5710png.png','CATEGORIA',23,'752ede8a-f75a-4791-9213-854a65fa5534_videoframe_5710png.png'),(64,'https://ecommerce-productos.s3.amazonaws.com/e72993b2-9dd4-4a04-aed7-a78d2047fa40_videoframe_5710png.png','PRODUCTO',72,'e72993b2-9dd4-4a04-aed7-a78d2047fa40_videoframe_5710png.png'),(65,'https://ecommerce-productos.s3.amazonaws.com/026b166d-0522-4737-9664-6b3f05eec9b7_540593637_18527803297000993_1077849239927976157_n.jpg','PRODUCTO',73,'026b166d-0522-4737-9664-6b3f05eec9b7_540593637_18527803297000993_1077849239927976157_n.jpg'),(66,'https://ecommerce-productos.s3.amazonaws.com/0bb2563c-d958-4a71-8770-ddef842079d3_588293923_18430363561108548_191358992808602267_n.jpg','PRODUCTO',74,'0bb2563c-d958-4a71-8770-ddef842079d3_588293923_18430363561108548_191358992808602267_n.jpg'),(67,'https://ecommerce-productos.s3.amazonaws.com/86a422f8-db79-4dc6-b9f4-19ea46ca51ea_588293923_18430363561108548_191358992808602267_n.jpg','PRODUCTO',75,'86a422f8-db79-4dc6-b9f4-19ea46ca51ea_588293923_18430363561108548_191358992808602267_n.jpg'),(68,'https://ecommerce-productos.s3.amazonaws.com/eaeaf640-5d7a-4303-8764-bb0df547d95f_555450380_10162243613086569_6950647135077380809_n (1).jpg','PRODUCTO',77,'eaeaf640-5d7a-4303-8764-bb0df547d95f_555450380_10162243613086569_6950647135077380809_n (1).jpg'),(72,'https://ecommerce-productos.s3.amazonaws.com/84b432bc-798e-4e26-b60d-094e386d2af5_Chromebook 514.webp','PRODUCTO',1,'84b432bc-798e-4e26-b60d-094e386d2af5_Chromebook 514.webp'),(75,'https://ecommerce-productos.s3.amazonaws.com/4a726304-f3e8-4dcb-90ab-d86a10645c4d_png-clipart-ipad-4-apple-logo-desktop-apple-heart-computer-thumbnail.png','MARCA',1,'4a726304-f3e8-4dcb-90ab-d86a10645c4d_png-clipart-ipad-4-apple-logo-desktop-apple-heart-computer-thumbnail.png'),(76,'https://ecommerce-productos.s3.amazonaws.com/086b1570-dfed-4fa3-bfa6-09d2a277ea8f_Laptops.webp','CATEGORIA',1,'086b1570-dfed-4fa3-bfa6-09d2a277ea8f_Laptops.webp'),(77,'https://ecommerce-productos.s3.amazonaws.com/1df670fb-aa1c-49fc-855b-c3dae9376a95_Almacenamiento.webp','PRODUCTO',85,'1df670fb-aa1c-49fc-855b-c3dae9376a95_Almacenamiento.webp'),(78,'https://ecommerce-productos.s3.amazonaws.com/9888b645-747f-43a5-9df3-37e2a1a43ef0_Almacenamiento.webp','PRODUCTO',86,'9888b645-747f-43a5-9df3-37e2a1a43ef0_Almacenamiento.webp'),(82,'https://ecommerce-productos.s3.amazonaws.com/30155ac0-4641-40e3-8473-fa857edcc701_shopping.webp','CATEGORIA',2,'30155ac0-4641-40e3-8473-fa857edcc701_shopping.webp'),(84,'https://ecommerce-productos.s3.amazonaws.com/6557af68-2557-4b6c-8d89-341d449b3fc3_image.webp','PRODUCTO',5,'6557af68-2557-4b6c-8d89-341d449b3fc3_image.webp'),(91,'https://ecommerce-productos.s3.amazonaws.com/33d23197-6f16-43bc-8e85-254cfb887ae4_161545-1200-auto.png','PRODUCTO',13,'33d23197-6f16-43bc-8e85-254cfb887ae4_161545-1200-auto.png'),(92,'https://ecommerce-productos.s3.amazonaws.com/e0147ba8-ad39-4991-baca-ba32db198441_co-galaxy-s24-s928-sm-s928bzkiltc-539324987-800x533.webp','PRODUCTO',7,'e0147ba8-ad39-4991-baca-ba32db198441_co-galaxy-s24-s928-sm-s928bzkiltc-539324987-800x533.webp'),(93,'https://ecommerce-productos.s3.amazonaws.com/0414d777-c4dc-4207-8502-7c7f8005556e_c040a43d6d969ef8b7db26f3f41baf92.avif','PRODUCTO',18,'0414d777-c4dc-4207-8502-7c7f8005556e_c040a43d6d969ef8b7db26f3f41baf92.avif'),(94,'https://ecommerce-productos.s3.amazonaws.com/6733526b-8ef8-422d-9a36-14a2ee4e8e60_D_NQ_NP_2X_940859-MLA93082493742_092025-F.webp','PRODUCTO',6,'6733526b-8ef8-422d-9a36-14a2ee4e8e60_D_NQ_NP_2X_940859-MLA93082493742_092025-F.webp'),(95,'https://ecommerce-productos.s3.amazonaws.com/33d7cf29-6a05-4d34-b804-8301b7aa157e_D_NQ_NP_2X_720631-MCO85068422771_052025-F.webp','PRODUCTO',24,'33d7cf29-6a05-4d34-b804-8301b7aa157e_D_NQ_NP_2X_720631-MCO85068422771_052025-F.webp'),(96,'https://ecommerce-productos.s3.amazonaws.com/abb5ac21-b086-451e-a784-9a69d120440e_Apple-WWDC22-MacBook-Air-hero-220606_big.jpg.large.jpg','PRODUCTO',54,'abb5ac21-b086-451e-a784-9a69d120440e_Apple-WWDC22-MacBook-Air-hero-220606_big.jpg.large.jpg'),(97,'https://ecommerce-productos.s3.amazonaws.com/2eb6d379-9d41-4135-9691-7bdb07d8691a_SAMSUNG-57-Odyssey-Neo-G9-Dual-4K-UHD-Quantum-Mini-LED-240Hz-1ms-HDR-1000-Curved-Gaming-Monitor_91389b3b-6d99-46dc-8f7c-f6174047b02a.22c53d90c73e6cf4b39fc343fff944ce.webp','PRODUCTO',17,'2eb6d379-9d41-4135-9691-7bdb07d8691a_SAMSUNG-57-Odyssey-Neo-G9-Dual-4K-UHD-Quantum-Mini-LED-240Hz-1ms-HDR-1000-Curved-Gaming-Monitor_91389b3b-6d99-46dc-8f7c-f6174047b02a.22c53d90c73e6cf4b39fc343fff944ce.webp'),(101,'https://ecommerce-productos.s3.amazonaws.com/ae64d9ab-e9dd-4637-983d-94d05b82f59a_image.webp','PRODUCTO',2,'ae64d9ab-e9dd-4637-983d-94d05b82f59a_image.webp'),(102,'https://ecommerce-productos.s3.amazonaws.com/08f55ccd-483c-4e75-bdf0-5ae5a99c6a6f_02_samsung.png','CATEGORIA',25,'08f55ccd-483c-4e75-bdf0-5ae5a99c6a6f_02_samsung.png'),(103,'https://ecommerce-productos.s3.amazonaws.com/a26c7345-c43c-4105-980f-0da959273083_02_samsung.png','CATEGORIA',26,'a26c7345-c43c-4105-980f-0da959273083_02_samsung.png');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` bigint NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(100) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Apple',NULL),(2,'Samsung',NULL),(3,'Sony',NULL),(4,'Logitech',NULL),(5,'Western Digital',NULL),(6,'prueba','prueba'),(7,'prueba','prueba'),(8,'prueba','prueba'),(9,'prueba','57');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_inventario`
--

DROP TABLE IF EXISTS `movimiento_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_inventario` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `tipo_movimiento` varchar(20) NOT NULL,
  `cantidad` bigint NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `fecha_movimiento` datetime NOT NULL,
  `id_producto` bigint DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `movimiento_ibfk_1_idx` (`id_producto`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_inventario`
--

LOCK TABLES `movimiento_inventario` WRITE;
/*!40000 ALTER TABLE `movimiento_inventario` DISABLE KEYS */;
INSERT INTO `movimiento_inventario` VALUES (1,'1',1,'1','2025-03-20 18:14:22',1),(2,'ENTRADA',10,'Stock inicial de producto','2025-10-07 02:27:45',NULL),(3,'ENTRADA',10,'Se agrega producto','2025-10-08 00:51:08',2),(4,'ENTRADA',10,'Se agrega producto','2025-10-08 00:51:39',2),(5,'ENTRADA',10,'Se agrega producto','2025-10-08 00:58:39',2),(6,'ENTRADA',10,'Se agrega producto','2025-10-08 00:59:01',2),(7,'ENTRADA',10,'Se agrega producto','2025-10-08 01:08:08',2),(8,'ENTRADA',10,'Se agrega producto','2025-10-08 01:09:14',2),(9,'SALIDA',10,'Se DESPACHAN producto','2025-10-08 01:17:21',2),(10,'SALIDA',40,'Se DESPACHAN producto','2025-10-08 01:17:50',2),(11,'ENTRADA',40,'Se DESPACHAN producto','2025-10-08 23:23:01',1),(12,'ENTRADA',2000,'212121','2025-10-08 23:46:41',1),(13,'ENTRADA',522222,'212121','2025-10-09 01:16:02',1),(14,'ENTRADA',20,'ninguna','2025-10-09 01:18:22',1),(15,'ENTRADA',2222,'3','2025-10-09 01:19:18',1),(16,'ENTRADA',20000,'212121','2025-10-09 01:21:41',1),(17,'SALIDA',546500,'SALIDA','2025-10-09 01:22:13',1),(18,'ENTRADA',40,'Se DESPACHAN producto','2025-10-10 13:42:10',1),(19,'ENTRADA',555,'gyyttyty','2025-10-13 19:56:41',1),(20,'ENTRADA',100,'N/A','2025-12-16 19:56:31',4),(21,'ENTRADA',20000000,'212121','2025-12-30 14:33:38',1),(22,'ENTRADA',10,'212121','2025-12-30 16:29:59',5),(23,'ENTRADA',100,'212121','2025-12-30 16:43:51',5),(24,'ENTRADA',1,'ninguna','2025-12-30 17:21:25',5);
/*!40000 ALTER TABLE `movimiento_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id_orden` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint NOT NULL,
  `fecha_orden` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` bigint NOT NULL AUTO_INCREMENT,
  `nombres_persona` varchar(100) NOT NULL,
  `apellidos_persona` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_secundario` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2,'Susana','Montero Beltrán','CC','51606729','1970-08-15','Femenino','3104567890','susana.mp@gmail.com','Calle 20 #15-30','Bogotá','Colombia'),(3,'Erika Andrea','Ramírez Torres','CC','1034567891','1990-05-22','Femenino','3119876543','erika.rt@hotmail.com','Carrera 12 #40-25','Bogotá','Colombia'),(4,'Vanessa','García López','CC','1045678912','1995-11-10','Femenino','3121234567','vanessa.gl@yahoo.com','Av. Principal #100-50','Bogotá','Colombia'),(6,'Erika Andrea ','Rivera Suarez','CC','80211478','1985-09-05','Femenino','3004187895','eika.ing@gmail.com','calle 84 buis sur numero 48 36 este','Bogota','Colombia'),(7,'Camilo','Montero Beltran','CC','1022934607','1987-06-30','M','3004731629','hior_templariohotmail.com','KR 8 NO 81 B 28 SUR, Bogotá, Localidad de Usme.','Bogotá','Colombia'),(8,'erika','rivera','CC','1022934607','1654-12-12','F','3195323206','hior_templariohotmail.com','Dirección: KR 8 NO 81 B 28 SUR, Bogotá, Localidad de Usme.','Bogotá, Bogotá D.C., Colombia','Colombia');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` bigint NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `codigo_producto` varchar(50) DEFAULT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `precio` decimal(15,2) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `id_categoria` bigint NOT NULL,
  `id_marca` bigint NOT NULL,
  `stock` bigint NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto_UNIQUE` (`codigo_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_marca` (`id_marca`),
  KEY `producto_ibfk_3_idx` (`id_producto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'MacBook Air M2','PROD-LAP-202507-0001','Laptop ultraligera 13.6\"',5599000.00,'2025-03-20 18:14:22','2025-12-30 14:33:38',1,1,20000599),(2,'Galaxy Book3 Pro','PROD-LAP-202507-0002','Laptop AMOLED 16\" 120Hz',5899000.00,'2025-03-20 18:14:22','2025-12-11 19:01:50',1,2,10),(3,'VAIO SX14','PROD-LAP-202507-0003','Laptop empresarial 14\"',7299000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',1,3,0),(4,'ThinkPad X1 Carbon','PROD-LAP-202507-0004','Laptop militar certificada',8999000.00,'2025-03-20 18:14:22','2025-12-16 19:56:31',1,2,100),(5,'Chromebook 514','PROD-LAP-202507-0005','Laptop educativa',1899000.00,'2025-03-20 18:14:22','2025-12-30 17:21:26',1,4,111),(6,'iPhone 15 Pro','PROD-PHN-202507-0001','Cámara 48MP 5x zoom',7999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',2,1,0),(7,'Galaxy S24 Ultra','PROD-PHN-202507-0002','S-Pen integrado',8999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',2,2,0),(8,'Xperia 1 VI','PROD-PHN-202507-0003','Pantalla 4K 21:9',6499000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',2,3,0),(9,'Pixel 8 Pro','PROD-PHN-202507-0004','Google Tensor G3',5999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',2,4,0),(10,'ROG Phone 7','PROD-PHN-202507-0005','Pantalla 165Hz',7599000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',2,2,0),(12,'WH-1000XM5','PROD-AUD-202507-0002','Audífonos premium Sony',1899000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',3,3,0),(13,'Galaxy Buds2 Pro','PROD-AUD-202507-0003','Sonido 360 Hi-Res',899000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',3,2,0),(14,'Zone Vibe 100','PROD-AUD-202507-0004','Audífonos oficina',499000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',3,4,0),(15,'SoundLink Flex','PROD-AUD-202507-0005','Parlante portátil Bose',799000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',3,3,0),(16,'Studio Display','PROD-MON-202507-0001','5K Retina 27\"',12999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',4,1,0),(17,'Odyssey Neo G9','PROD-MON-202507-0002','Super ultra-wide 49\"',19999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',4,2,0),(18,'InZone M9','PROD-MON-202507-0003','4K 144Hz gaming',8999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',4,3,0),(19,'UltraSharp U3223QE','PROD-MON-202507-0004','4K IPS Black',6999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',4,4,0),(20,'ProArt PA32UCX','PROD-MON-202507-0005','Monitor para creativos',29999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',4,5,0),(21,'SSD T7 Shield','PROD-ALM-202507-0001','2TB USB 3.2',899000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',5,2,0),(22,'WD My Passport','PROD-ALM-202507-0002','Disco 5TB USB-C',599000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',5,5,0),(23,'SanDisk Extreme','PROD-ALM-202507-0003','MicroSD 1TB 160MB/s',399000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',5,4,0),(24,'LaCie Rugged','PROD-ALM-202507-0004','Disco 4TB IP67',799000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',5,3,0),(25,'X5 Thunderbolt','PROD-ALM-202507-0005','SSD NVMe 4TB',1999000.00,'2025-03-20 18:14:22','2025-03-20 18:14:22',5,1,0),(54,'MacBook Air M2','PROD-LAP-202507-00033','Laptop ultraligera 13.6\"',5499000.00,'2025-10-03 18:04:59','2025-10-03 18:04:59',1,1,0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMIN'),(3,'SOPORTE'),(2,'USER');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `id_rol` int NOT NULL,
  `id_persona` bigint DEFAULT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  KEY `usuario_ibfk_1_idx` (`id_rol`),
  KEY `usuario_ibfk_2_idx` (`id_persona`) /*!80000 INVISIBLE */,
  KEY `usuario_ibfk_3_idx` (`id_estado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado_usuario` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (59,'Camilo','Hior_Templario@hotmail.com','$2a$10$CoDeauzijCqJ8Y/69zNdO.kVI7WvpkIagmxwhHURcKXd5HSdopt4u','2025-10-03 03:19:30',1,7,1),(60,'Erika','kika@hotmail.com','$2a$10$wPxhYo.L1LLdTHQ4xYjlR.MZMg19mqIcr9DQTD5jy.cRGDJLne5N2','2025-12-23 16:03:55',1,8,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-26 15:26:44
