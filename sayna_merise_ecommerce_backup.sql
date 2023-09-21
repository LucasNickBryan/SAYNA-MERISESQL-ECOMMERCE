-- MariaDB dump 10.19-11.1.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sayna_merise_ecommerce
-- ------------------------------------------------------
-- Server version	11.1.2-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Compactes','Voitures compactes idéales pour la conduite en ville.'),
(2,'SUV','Véhicules utilitaires sportifs pour une conduite tout-terrain.'),
(3,'Berlines','Voitures familiales spacieuses avec un confort accru.'),
(4,'Cabriolets','Voitures décapotables pour des balades décontractées.'),
(5,'Coupés','Voitures à deux portes au design élégant.'),
(6,'Hybrides','Voitures à moteur à essence et électrique pour une efficacité accrue.'),
(7,'Électriques','Voitures entièrement électriques, respectueuses'),
(8,'Sportives','Voitures de sport rapides et performantes.'),
(9,'Véhicules utilitaires','VUS pour le transport de marchandises et de passagers.'),
(10,'Camions','Camions pour le transport de marchandises lourdes.'),
(11,'Véhicules de luxe','Voitures de luxe avec des équipements haut de gamme.'),
(12,'Véhicules classiques','Voitures classiques et vintage pour les collectionneurs.'),
(13,'Minifourgonnettes','Véhicules spacieux pour les familles nombreuses.'),
(14,'Crossovers','Véhicules de type croisement entre SUV et berline.'),
(15,'Voiture 4x4','Véhicules robustes pour une conduite hors route.'),
(16,'Véhicules économiques','Voitures économiques avec une faible consommation de carburant.'),
(17,'Véhicules utilitaires légers','Véhicules utilitaires légers pour un usage professionnel.'),
(18,'Véhicules à transmission intégrale','Voitures avec une transmission intégrale pour une adhérence maximale.'),
(19,'Véhicules à propulsion arrière','Voitures avec une propulsion arrière pour une conduite sportive.');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `state` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`customer_id`),
  KEY `orders_FK_1` (`product_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`category_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'Voiture Compacte A','Description de la voiture compacte A.',20000,10,1),
(2,'Voiture Compacte B','Description de la voiture compacte B.',22000,8,1),
(3,'SUV Tout-Terrain A','Description du SUV tout-terrain A.',35000,12,2),
(4,'SUV Tout-Terrain B','Description du SUV tout-terrain B.',38000,9,2),
(5,'Berline Familiale A','Description de la berline familiale A.',28000,14,3),
(6,'Berline Familiale B','Description de la berline familiale B.',30000,11,3),
(7,'Cabriolet Sportif A','Description du cabriolet sportif A.',45000,6,4),
(8,'Cabriolet Sportif B','Description du cabriolet sportif B.',48000,5,4),
(9,'Coupé Élégant A','Description du coupé élégant A.',38000,8,5),
(10,'Coupé Élégant B','Description du coupé élégant B.',40000,7,5),
(11,'Hybride Économique A','Description de la voiture hybride économique A.',32000,10,6),
(12,'Hybride Économique B','Description de la voiture hybride économique B.',34000,9,6),
(13,'Voiture Électrique A','Description de la voiture électrique A.',38000,6,7),
(14,'Voiture Électrique B','Description de la voiture électrique B.',40000,5,7),
(15,'Voiture de Sport A','Description de la voiture de sport A.',60000,4,8),
(16,'Voiture de Sport B','Description de la voiture de sport B.',65000,3,8),
(17,'VUS Spacieux A','Description du VUS spacieux A.',40000,10,9),
(18,'VUS Spacieux B','Description du VUS spacieux B.',42000,8,9),
(19,'Camion de Livraison A','Description du camion de livraison A.',55000,6,10),
(20,'Camion de Livraison B','Description du camion de livraison B.',58000,5,10),
(21,'Voiture de Luxe A','Description de la voiture de luxe A.',80000,3,11),
(22,'Voiture de Luxe B','Description de la voiture de luxe B.',85000,2,11),
(23,'Voiture Classique A','Description de la voiture classique A.',60000,4,12),
(24,'Voiture Classique B','Description de la voiture classique B.',65000,3,12),
(25,'Minifourgonnette Familiale A','Description de la minifourgonnette familiale A.',32000,10,13),
(26,'Minifourgonnette Familiale B','Description de la minifourgonnette familiale B.',34000,9,13),
(27,'Crossover Polyvalent A','Description du crossover polyvalent A.',42000,7,14),
(28,'Crossover Polyvalent B','Description du crossover polyvalent B.',45000,6,14),
(29,'Véhicule Tout-Terrain A','Description du véhicule tout-terrain A.',38000,8,15),
(30,'Véhicule Tout-Terrain B','Description du véhicule tout-terrain B.',40000,7,15),
(31,'Voiture Économique A','Description de la voiture économique A.',25000,12,16),
(32,'Voiture Économique B','Description de la voiture économique B.',27000,10,16),
(33,'Fourgon Utilitaire Léger A','Description du fourgon utilitaire léger A.',45000,6,17),
(34,'Fourgon Utilitaire Léger B','Description du fourgon utilitaire léger B.',48000,5,17),
(35,'Voiture à Transmission Intégrale A','Description de la voiture à transmission intégrale A.',40000,8,18),
(36,'Voiture à Transmission Intégrale B','Description de la voiture à transmission intégrale B.',42000,7,18),
(37,'Voiture à Propulsion Arrière A','Description de la voiture à propulsion arrière A.',36000,9,19),
(38,'Voiture à Propulsion Arrière B','Description de la voiture à propulsion arrière B.',38000,8,19);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('standard','admin') NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_FK` (`customer_id`),
  CONSTRAINT `users_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-09-21 18:39:38
