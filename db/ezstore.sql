-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2020 a las 06:39:07
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ezstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL COMMENT 'foranea de usuario',
  `id_producto` varchar(100) NOT NULL COMMENT 'foranea de producto',
  `cantidad` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_detalle` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_producto` varchar(100) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla para facturacion';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id_domicilio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL COMMENT 'foranea para enlazar las direcciones del usuario',
  `direccion` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla de direccciones del usuario/cliente';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_pago`
--

CREATE TABLE `m_pago` (
  `id_pago` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL COMMENT 'metodo de pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lista de opciones de pago';

--
-- Volcado de datos para la tabla `m_pago`
--

INSERT INTO `m_pago` (`id_pago`, `nombre`) VALUES
(1, 'tarjeta'),
(2, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL COMMENT 'foranea del usuario',
  `id_pago` int(11) NOT NULL COMMENT 'foranea de metodo de pago',
  `total` decimal(10,2) UNSIGNED NOT NULL COMMENT 'total de la suma del carrito',
  `id_domicilio` int(11) NOT NULL COMMENT 'foranea para el domicilio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='totalizacion de la orden de compras';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` varchar(100) NOT NULL COMMENT 'modelo del producto',
  `nombre` varchar(100) NOT NULL COMMENT 'descripcion del producto',
  `precio` decimal(10,2) UNSIGNED NOT NULL COMMENT 'unitario en dolar',
  `stock` int(10) UNSIGNED NOT NULL COMMENT 'inventario',
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `stock`, `fecha`) VALUES
('20-c205la', 'HP 20-c205la - 1 x Celeron J3060', '490.45', 15, '2020-07-06 10:46:13'),
('22-c014la', 'HP 22-c014la - Intel Core i3 I3-8130U', '700.74', 15, '2020-07-06 10:46:44'),
('coolman-a380', 'Case Coolman Airbus A380 RGB', '145.00', 15, '2020-07-06 10:48:31'),
('CronosRGB7.1', 'Auricular en oreja - Tt ESPORTS CRONOS RGB 7.1', '103.53', 15, '2020-07-06 10:53:15'),
('gigabyte-c200', 'CASE GIGABYTE C200 GLASS', '95.00', 15, '2020-07-06 10:49:05'),
('i3-9100F', 'Procesador Intel® Core™ i3-9100F', '83.00', 15, '2020-07-06 11:10:08'),
('i5-9400F', 'Procesador Intel® Core™ i5-9400F', '148.00', 15, '2020-07-06 11:10:36'),
('i7-9700K', 'Intel® Core™ i7-9700K Processor', '380.00', 15, '2020-07-06 11:10:59'),
('KG271', 'Monitor LED - 27\" - Acer KG271', '362.24', 15, '2020-07-06 11:08:18'),
('KPS-304', 'Ecran Klip Xtreme KPS-304 120 pulgadas', '115.16', 15, '2020-07-06 10:56:18'),
('KWS-640', 'PARLANTES XTREME 2.1 SD USB KWS-640\r\n', '89.27', 15, '2020-07-06 10:55:43'),
('M715q', 'Lenovo - M715q - Tiny AMD', '829.46', 15, '2020-07-06 10:45:39'),
('PowerLiteS41+', 'Proyector 3LCD - portátil - Epson PowerLite S41+', '460.56', 15, '2020-07-06 10:57:02'),
('ryzen-3200g', 'AMD Ryzen 3 3200G', '100.00', 15, '2020-07-06 11:08:54'),
('ryzen-3400g', 'AMD Ryzen 5 3400G', '175.00', 15, '2020-07-06 11:09:21'),
('ryzen-3700x', 'AMD Ryzen 7 3700X', '329.00', 15, '2020-07-06 11:09:49'),
('Sms-10', 'Audifonos Maxell Solids2 Sms-10 Metalz', '20.00', 15, '2020-07-06 10:51:56'),
('WD40PURZ', 'Disco Duro 3.5 WD HDD 4TB WD40PURZ', '145.00', 15, '2020-07-06 11:12:56'),
('XTC-308', 'Cable VGA Xtech XTC-308 6FT', '1.84', 15, '2020-07-06 11:12:31'),
('XTC-365', 'Cable Micro USB 3.0 A-Macho a Micro B-Macho 3ft - XTC-365', '4.00', 15, '2020-07-06 11:11:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL COMMENT 'nombre del cliente',
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `fecha`) VALUES
(1, '', 'gg.sgranados@gmail.com', '$2y$10$f96p7j6oerBgWer8L5YkG.1HUeQUV4IF93GU11ZOHAlAzN8LogcCu', '2020-07-06 11:15:29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `m_pago`
--
ALTER TABLE `m_pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pago` (`id_pago`),
  ADD KEY `id_domicilio` (`id_domicilio`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `m_pago`
--
ALTER TABLE `m_pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `m_pago` (`id_pago`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
