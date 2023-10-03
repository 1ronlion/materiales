-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for my_shoes
CREATE DATABASE IF NOT EXISTS `my_shoes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `my_shoes`;

-- Dumping structure for table my_shoes.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table my_shoes.brands: ~2 rows (approximately)
INSERT INTO `brands` (`id`, `name`) VALUES
	(1, 'Adidas'),
	(2, 'Nike');

-- Dumping structure for table my_shoes.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__products` (`product_id`),
  CONSTRAINT `FK__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table my_shoes.images: ~6 rows (approximately)
INSERT INTO `images` (`id`, `url`, `product_id`) VALUES
	(1, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c9fdf27c73cc481aa8efacb6002c81bc_9366/Zapatillas_Forum_Mid_Blanco_FY7939_01_standard.jpg', 1),
	(2, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2622b6525fae4d349bb6af9e002ee277_9366/Zapatilla_Forum_Low_Blanco_IF2733_01_standard.jpg', 2),
	(3, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/685c42f4c0f74ab2abe1ae2b00593217_9366/Zapatilla_Pureboost_22_Negro_GZ5173_01_standard.jpg', 3),
	(4, 'https://nikearprod.vtexassets.com/arquivos/ids/440451-1000-1000?v=1773283183&width=1000&height=1000&aspect=true', 4),
	(5, 'https://nikearprod.vtexassets.com/arquivos/ids/155412-1000-1000?v=1773286175&width=1000&height=1000&aspect=true', 5),
	(6, 'https://nikearprod.vtexassets.com/arquivos/ids/438927-800-800?v=638145694853800000&width=800&height=800&aspect=true', 6);

-- Dumping structure for table my_shoes.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_brands` (`brand_id`),
  CONSTRAINT `FK_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table my_shoes.products: ~6 rows (approximately)
INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `brand_id`) VALUES
	(1, 'Adidas Forum Mid', 'La elegancia define a la adidas Forum. Desde que viera la luz en los 80, esta silueta se ha convertido en un icono de la moda urbana. El panel lateral en forma de X y la correa autoadherente mantienen', 130, '2023-06-16 03:00:42', '2023-06-16 03:00:43', 1),
	(2, 'Adidas Forum Low', 'Más que un calzado, es una declaración de estilo. Las adidas Forum llegaron a la escena en el 84 y ganaron seguidores en la cancha y en el mundo de la música. Este par de zapatillas clásicas trae de v', 120, '2023-06-16 03:02:13', '2023-06-16 03:02:15', 1),
	(3, 'Adidas PUREBOOST 22', 'No hacen falta muchas cosas para salir a correr. Un tentempié, tu lista de canciones y esta zapatilla de running adidas. Pureboost es una zapatilla de entrenamiento para carreras cortas. La mediasuela', 130, '2023-06-16 03:31:09', '2023-06-16 03:31:11', 1),
	(4, 'Nike Air Legacy 312', 'El Air Jordan Legacy 312 rinde homenaje al legado de Michael Jordan con este reconocimiento al 312, el código de área de Chicago. El diseño es una combinación moderna de elementos Jordan icónicos.', 140, '2023-06-16 03:35:12', '2023-06-16 03:35:13', 2),
	(5, 'Nike Air Force 1', 'El fulgor sigue vivo en las Nike Air Force 1 \'07, un modelo original de baloncesto que introduce un nuevo giro a sus ya característicos revestimientos con costuras duraderas, sus acabados impecables y', 110, '2023-06-16 03:38:08', '2023-06-16 03:38:08', 2),
	(6, 'Nike Air Max 90 SE', 'Las Nike Air Max 90 vuelven en una versión aún mejor. La amortiguación es más suave y flexible, la unidad Max Air está diseñada para los pies en crecimiento y la forma ofrece más espacio para los dedo', 130, '2023-06-16 05:18:20', '2023-06-16 05:18:21', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
