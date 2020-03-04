-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2020 a las 23:48:58
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `e-commerce`
--

DELIMITER $$
--
-- Procedimientos
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(5) NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `categoria_padre` int(5) DEFAULT NULL,
  `foto` text COLLATE utf32_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf32_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `categoria_padre`, `foto`, `descripcion`) VALUES
(1, 'Ropa', NULL, '../../resources/img/ropa0.jpg', NULL),
(3, 'Hogar', NULL, '../../resources/img/hogar0.jpg', NULL),
(4, 'Electrodomesticos', NULL, '../../resources/img/electro0.jpg', NULL),
(5, 'Hombre', 1, '../../resources/img/r_h_000.jpg', 'Nuestra ultima colección pensada especialmente par'),
(6, 'Mujer', 1, '../../resources/img/ropa_m_00.jpg', 'Los vestidos mas populares de este mes solo aquí'),
(7, 'Camas', 3, '../../resources/img/c_00.jpg', 'Las camas mas suaves que encontraras'),
(8, 'Sillas', 3, '../../resources/img/s_00.jpg', 'Sillas '),
(9, 'prueba', NULL, '/e-commerce/resources/prueba1-.jpg', '12345'),
(11, 'prueba5', NULL, '../../resources/imgprueba1-.jpg', 'prueba5'),
(17, 'prueba6', NULL, NULL, 'Esto es una prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
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
-- Volcado de datos para la tabla `producto`
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
(12, 'prueba', 'Esto es una prueba', 0, 0, 1, '../../resources/imgprueba1-2.jpg', '../../resources/imgImagen1.png', '../../resources/imgImagen1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
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
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo`, `contrasenia`, `rol`) VALUES
(100060020, 'Santiago', 'Ruiz RincÃ³n', 'santyago3601@gmail.com', '12345', 1),
(1000264665, 'Shirley', 'Bernal', 'shriley.01@gmail.com', '12345', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `categoria_padre` (`categoria_padre`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_product` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_cat_cat` FOREIGN KEY (`categoria_padre`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_cat_pro` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
