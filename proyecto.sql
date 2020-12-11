-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2020 a las 17:23:12
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `numeroCliente` int(11) NOT NULL,
  `nombreCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `sexoCliente` enum('Mujer','Hombre') COLLATE utf8_spanish_ci NOT NULL,
  `direccionCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefonoCliente` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `codigoTipoCliente` int(11) NOT NULL,
  `usuarioCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `claveCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`numeroCliente`, `nombreCliente`, `apellidoCliente`, `sexoCliente`, `direccionCliente`, `telefonoCliente`, `codigoTipoCliente`, `usuarioCliente`, `claveCliente`) VALUES
(14, 'Juan', 'Garcí­a', 'Hombre', 'Cl. Sol, 3 Valencia', '653303035', 1, 'jgarcia', '123'),
(15, 'Ana', 'Puig', 'Mujer', 'Cl. Marte, 5 Valencia', '630505050', 2, 'apuig', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `cantidadVenta` int(11) NOT NULL,
  `ImporteVenta` decimal(6,2) NOT NULL,
  `numeroVenta` int(11) NOT NULL,
  `codigoComida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `path` text NOT NULL,
  `uploaded_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `title`, `description`, `path`, `uploaded_date`) VALUES
(1, 'Snacks', 'Variedad de Snacks', 'images/13524_m1.jpg', '2020-07-16 20:09:26'),
(2, 'Pasta', 'Kit para hacer pasta', 'images/68371_m1.jpg', '2020-07-16 20:10:05'),
(3, 'Jamon', 'Jamon iberico', 'images/69346_m1.jpg', '2020-07-10 20:10:45'),
(4, 'Queso', 'Queso de Arzúa', 'images/69349_m1.jpg', '2020-07-16 20:11:27'),
(5, 'Agua', 'Hidratate bien', 'images/91919_m1.jpg', '2020-07-16 20:12:00'),
(6, 'Bebidas Azucaradas', 'Consumir en menor medida', 'images/93310_m1.jpg', '2020-07-16 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `polls`
--

INSERT INTO `polls` (`id`, `title`, `desc`) VALUES
(1, '¿Cuando quieres que haya vacaciones en la tienda?', ''),
(2, '¿Que producto crees que se vende más?', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_answers`
--

CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `poll_answers`
--

INSERT INTO `poll_answers` (`id`, `poll_id`, `title`, `votes`) VALUES
(1, 1, 'Junio', 0),
(2, 1, 'Julio', 0),
(3, 1, 'Agosto', 2),
(4, 1, 'Septiembre', 0),
(5, 2, 'champu', 0),
(6, 2, 'patatas', 0),
(7, 2, 'leche', 3),
(8, 2, 'jabon', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprod`
--

CREATE TABLE `tblprod` (
  `id` int(10) UNSIGNED NOT NULL,
  `prod_code` varchar(20) NOT NULL,
  `prod_name` varchar(50) NOT NULL,
  `prod_ctry` varchar(50) NOT NULL,
  `prod_qty` int(20) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblprod`
--

INSERT INTO `tblprod` (`id`, `prod_code`, `prod_name`, `prod_ctry`, `prod_qty`, `price`) VALUES
(8, '002', 'Gardenia', 'PanaderÃ­a', 25, '2.50'),
(9, '003', 'Coco Crunch', 'Cereales', 15, '5.25'),
(10, '0001', 'Red Bull', 'Bebidas', 50, '1.25'),
(11, '004', 'Queso Eden', 'LÃ¡cteos', 30, '3.25'),
(12, '005', 'Kiwi', 'Frutas', 20, '2.00'),
(13, '006', 'Porkchop', 'Carnes', 60, '4.25'),
(14, '007', 'Pimienta negra', 'Especies', 5, '1.25'),
(15, '008', 'Miel de aveja', 'Edulcorantes', 40, '3.00'),
(16, '009', 'Coliflor', 'Vegetales', 15, '1.50'),
(18, '0011', 'Uva  ', 'Bebidas', 22, '0.50'),
(19, '001', 'Quaker Oats', 'Cereales', 98, '3.25'),
(21, '0015', 'Avena quaker', 'Cereales', 49, '4.25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoclientes`
--

CREATE TABLE `tipoclientes` (
  `codigoTipoCliente` int(11) NOT NULL,
  `nombreTipoCliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoclientes`
--

INSERT INTO `tipoclientes` (`codigoTipoCliente`, `nombreTipoCliente`) VALUES
(1, 'Básico'),
(2, 'VIP');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`numeroCliente`),
  ADD KEY `codigoTipoCliente` (`codigoTipoCliente`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `poll_answers`
--
ALTER TABLE `poll_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblprod`
--
ALTER TABLE `tblprod`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `book_id` (`prod_code`);

--
-- Indices de la tabla `tipoclientes`
--
ALTER TABLE `tipoclientes`
  ADD PRIMARY KEY (`codigoTipoCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `numeroCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `poll_answers`
--
ALTER TABLE `poll_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tblprod`
--
ALTER TABLE `tblprod`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tipoclientes`
--
ALTER TABLE `tipoclientes`
  MODIFY `codigoTipoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`codigoTipoCliente`) REFERENCES `tipoclientes` (`codigoTipoCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
