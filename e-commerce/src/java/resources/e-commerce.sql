-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2020 at 04:10 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectbycat` (IN `cat` INT(5))  BEGIN
  SELECT * FROM producto
  WHERE categoria = cat;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectCatByCatPadreNotNull` ()  NO SQL
BEGIN
  SELECT * FROM categoria
  WHERE categoria.categoria_padre is not null;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectCatByCatPadreNull` ()  NO SQL
BEGIN
  SELECT * FROM categoria
  WHERE categoria.categoria_padre is null;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(5) NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `categoria_padre` int(5) DEFAULT NULL,
  `foto` text COLLATE utf32_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf32_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `categoria_padre`, `foto`, `descripcion`) VALUES
(1, 'Ropa', NULL, '../../resources/img/ropa0.jpg', NULL),
(3, 'Hogar', NULL, '../../resources/img/hogar0.jpg', NULL),
(4, 'Electrodomesticos', NULL, '../../resources/img/electro0.jpg', NULL),
(5, 'Hombre', 1, '../../resources/img/r_h_000.jpg', 'Nuestra ultima colección pensada especialmente par'),
(6, 'Mujer', 1, '../../resources/img/ropa_m_00.jpg', 'Los vestidos mas populares de este mes solo aquí'),
(7, 'Camas', 3, '../../resources/img/c_00.jpg', 'Las camas mas suaves que encontraras'),
(8, 'Sillas', 3, '../../resources/img/s_00.jpg', 'Sillas '),
(18, 'Lavadoras', 4, '../../resources/img/l_00.jpg', 'Las mas modernas lavadoras que encontraras'),
(19, 'Microondas', 4, '../../resources/img/m_00.jpg', 'Microondas'),
(30, 'Deportes', NULL, '../../resources/img/d_00.png', 'Deportes'),
(31, 'Running', 30, '../../resources/img/r00.jpg', 'Running'),
(32, 'Bicicletas', 30, '../../resources/img/b00.jpg', 'Bicicletas');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_product` int(5) NOT NULL,
  `nombre` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf32_spanish_ci NOT NULL,
  `peso` int(5) NOT NULL,
  `precio` bigint(10) NOT NULL,
  `categoria` int(5) NOT NULL,
  `foto_uno` text COLLATE utf32_spanish_ci NOT NULL,
  `foto_dos` text COLLATE utf32_spanish_ci NOT NULL,
  `foto_tres` text COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_product`, `nombre`, `descripcion`, `peso`, `precio`, `categoria`, `foto_uno`, `foto_dos`, `foto_tres`) VALUES
(1, 'Chaqueta ', 'Chaqueta abrigada de color negro', 700, 25, 5, '../resources/img/r_h_011.jpg', '../resources/img/r_h_012.jpg', '../resources/img/r_h_013.jpg'),
(2, 'Camisa ', 'Camisa roja', 600, 10, 5, '../resources/img/r_h_021.jpg', '../resources/img/r_h_022.jpg', '../resources/img/r_h_023.jpg'),
(3, 'Chaqueta', 'Chaqueta verde lijera', 500, 20, 5, '../resources/img/r_h_031.jpg', '../resources/img/r_h_032.jpg', '../resources/img/r_h_033.jpg'),
(4, 'Jean', 'Jean entubado azul', 450, 20, 5, '../resources/img/r_h_041.jpg', '../resources/img/r_h_042.jpg', '../resources/img/r_h_043.jpg'),
(5, 'Blusa', 'Blusa blanca', 300, 50, 6, '../resources/img/r_m_011.jpg', '../resources/img/r_m_012.jpg', '../resources/img/r_m_013.jpg'),
(6, 'Leggis', 'Legis gris con negro', 250, 20, 6, '../resources/img/r_m_021.jpg', '../resources/img/r_m_022.jpg', '../resources/img/r_m_023.jpg'),
(7, 'Cama ', 'Cama doble', 100000, 850, 7, '../resources/img/c_11.jpg', '../resources/img/c_12.jpg', '../resources/img/c_13.jpg'),
(8, 'Cama', 'Cama queen', 100200, 890, 7, '../resources/img/c_21.jpg', '../resources/img/c_22.jpg', '../resources/img/c_23.jpg'),
(9, 'Cama', 'Cama king', 110000, 1000, 7, '../resources/img/c_31.jpg', '../resources/img/c_32.jpg', '../resources/img/c_33.jpg'),
(10, 'Silla', 'Silla de Bamboo', 700, 40, 8, '../resources/img/s_011.jpg', '../resources/img/s_012.jpg', '../resources/img/s_013.jpg'),
(11, 'Silla', 'Silla alcolchada', 800, 50, 8, '../resources/img/s_021.jpg', '../resources/img/s_022.jpg', '../resources/img/s_021.jpg'),
(16, 'Lavadora', 'Lavadora negra Samsung', 68000, 1500, 18, '../resources/img/l_11.jpg', '../resources/img/l_12.jpg', '../resources/img/l_13.jpg'),
(17, 'Lavadora ', 'Lavadora blanca samsung', 68000, 1000, 18, '../resources/img/l_21.jpg', '../resources/img/l_22.jpg', '../resources/img/l_23.jpg'),
(18, 'Lavadora', 'Lavadora negra LG', 70000, 1800, 18, '../resources/img/l_31.jpg', '../resources/img/l_32.jpg', '../resources/img/l_33.jpg'),
(25, 'Microondas', 'Microondas plateado samsung', 2000, 300, 19, '../resources/img/m_11.jpg', '../resources/img/m_12.jpg', '../resources/img/m_13.jpg'),
(26, 'Microondas', 'Microondas gris Wirpool', 2500, 220, 19, '../resources/img/m_21.jpg', '../resources/img/m_22.jpg', '../resources/img/m_23.jpg'),
(27, 'Tennis ', 'Tennis negros running', 500, 300, 31, '../resources/img/t_11.jpg', '../resources/img/t_12.jpg', '../resources/img/t_13.jpg'),
(28, 'Tennis ', 'Tennis Skechers blancos', 400, 400, 31, '../resources/img/t_21.jpg', '../resources/img/t_22.jpg', '../resources/img/t_23.jpg'),
(29, 'Pantalon', 'Pantalon termico', 200, 50, 31, '../resources/img/p_11.jpg', '../resources/img/p_22.jpg', '../resources/img/p_23.jpg'),
(30, 'Bicicleta', 'Bicicleta de montaña Kawasaki negra', 5000, 1200, 32, '../resources/img/b_11.jpg', '../resources/img/b_12.jpg', '../resources/img/b_13.jpg'),
(31, 'Bicicleta', 'Bicicleta de montaña jeep', 3000, 750, 32, '../resources/img/b_21.jpg', '../resources/img/b_22.jpg', '../resources/img/b_23.jpg'),
(32, 'Bicicleta', 'Bicicleta de ruta Jeep', 500, 4500, 32, '../resources/img/b_31.jpg', '../resources/img/b_32.jpg', '../resources/img/b_33.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `contrasenia` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `rol` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo`, `contrasenia`, `rol`) VALUES
(100060020, 'Santiago', 'Ruiz RincÃ³n', 'santyago3601@gmail.com', '12345', 1),
(100200300, 'Juan Pablo ', 'Garcia', 'juan@gmail.com', '12345', 2),
(1000264665, 'Shirley', 'Bernal', 'shriley.01@gmail.com', '12345', 2),
(1000600046, 'Juan Pablo', 'Garcia Jimenez', 'j.p@gmail.com', '12345', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `categoria_padre` (`categoria_padre`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `categoria` (`categoria`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_product` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_cat_cat` FOREIGN KEY (`categoria_padre`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_cat_pro` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
