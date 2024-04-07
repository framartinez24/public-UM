-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tp_1
CREATE DATABASE IF NOT EXISTS `tp_1` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `tp_1`;

-- Volcando estructura para tabla tp_1.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `saldo_autorizado` varchar(50) NOT NULL DEFAULT 'estandar',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tp_1.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Id_empresa` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `telefono` int(20) NOT NULL,
  `email` varchar(250) DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Id_empresa` (`Id_empresa`),
  CONSTRAINT `Id_empresa` FOREIGN KEY (`Id_empresa`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tp_1.facturacion
CREATE TABLE IF NOT EXISTS `facturacion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Id_venta` int(11) NOT NULL DEFAULT 0,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Id_venta` (`Id_venta`),
  CONSTRAINT `Id_venta` FOREIGN KEY (`Id_venta`) REFERENCES `venta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tp_1.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tp_1.registro_telefonico
CREATE TABLE IF NOT EXISTS `registro_telefonico` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cliente` int(11) NOT NULL DEFAULT 0,
  `motivo` varchar(250) NOT NULL DEFAULT '"sin motivo"',
  `fecha` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Id_clientes` (`Id_cliente`),
  CONSTRAINT `Id_clientes` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla tp_1.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cliente` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Id_cliente` (`Id_cliente`),
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `Id_cliente` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_producto` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
