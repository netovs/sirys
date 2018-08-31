-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2018 a las 21:45:48
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comunica_siriys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_activo`
--

CREATE TABLE `siri_activo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(140) NOT NULL,
  `precio_de_compra` int(11) NOT NULL,
  `unidad_medida` varchar(32) NOT NULL,
  `numero_de_serie` varchar(64) NOT NULL,
  `describe_estado` varchar(140) NOT NULL,
  `fecha_de_compra` date NOT NULL,
  `estado_disponible` tinyint(1) NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `motivo_baja` varchar(140) NOT NULL,
  `proveedorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_activo`
--

INSERT INTO `siri_activo` (`id`, `nombre`, `descripcion`, `precio_de_compra`, `unidad_medida`, `numero_de_serie`, `describe_estado`, `fecha_de_compra`, `estado_disponible`, `fecha_baja`, `motivo_baja`, `proveedorId`) VALUES
(1, 'producto Demo', 'Es un demo', 1000, 'n/a', 'n/a', 'Buen estado, se puede utilizar ', '2018-07-02', 1, '0000-00-00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_activoslocaciones`
--

CREATE TABLE `siri_activoslocaciones` (
  `id` int(11) NOT NULL,
  `activoId` int(11) NOT NULL,
  `LocacionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_activo_imagenes`
--

CREATE TABLE `siri_activo_imagenes` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `url` varchar(256) NOT NULL,
  `activoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_cat_tipo`
--

CREATE TABLE `siri_cat_tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_cat_tipo`
--

INSERT INTO `siri_cat_tipo` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Servicios estética ', 'Servicios citas en peluquerías, barbershop, salones de belleza, uñas, etc. '),
(4, 'Renta de inmuebles', 'Servicio de administración de renta de inmuebles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_locaciones`
--

CREATE TABLE `siri_locaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(512) NOT NULL,
  `direccion` varchar(128) NOT NULL,
  `locacion_lat` varchar(32) NOT NULL,
  `locacion_lon` varchar(32) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL COMMENT '1 = disponible 0 = no disponible ',
  `estado_disponibilidad` varchar(64) NOT NULL COMMENT 'Describe por que no esta disponible',
  `facebook` varchar(256) NOT NULL,
  `twitter` varchar(256) NOT NULL,
  `representante` varchar(64) NOT NULL,
  `telefonoRepresentante` varchar(16) NOT NULL,
  `emailRepresentante` int(11) NOT NULL,
  `API_USER` tinyint(4) NOT NULL DEFAULT '0',
  `negocioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_locaciones`
--

INSERT INTO `siri_locaciones` (`id`, `nombre`, `descripcion`, `direccion`, `locacion_lat`, `locacion_lon`, `fecha_alta`, `fecha_baja`, `disponible`, `estado_disponibilidad`, `facebook`, `twitter`, `representante`, `telefonoRepresentante`, `emailRepresentante`, `API_USER`, `negocioId`) VALUES
(1, 'Departamento en la ciudad ', 'Departamento en la ciudad ', 'Departamento en la ciudad en la ciudad ', '', '', '2018-07-04', NULL, 1, 'Departamento en renta', '', '', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_negocios`
--

CREATE TABLE `siri_negocios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(512) NOT NULL,
  `logo` varchar(512) DEFAULT NULL,
  `tipoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_negocios`
--

INSERT INTO `siri_negocios` (`id`, `nombre`, `descripcion`, `logo`, `tipoId`) VALUES
(1, 'Departamentos demo', 'Propietario de departamentos para rentar', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_niveles_de_usuarios`
--

CREATE TABLE `siri_niveles_de_usuarios` (
  `id` int(11) NOT NULL,
  `nombre_de_nivel` varchar(32) NOT NULL,
  `descripcion_de_nivel` varchar(140) NOT NULL,
  `requiere_licencia` tinyint(4) NOT NULL COMMENT '0 = gratis 1 = liencia 9 = administradores de sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_niveles_de_usuarios`
--

INSERT INTO `siri_niveles_de_usuarios` (`id`, `nombre_de_nivel`, `descripcion_de_nivel`, `requiere_licencia`) VALUES
(7, 'Usuario con licencia', 'Usuario que ha cubierto su licencia y tiene más opciones disponibles', 1),
(8, 'Administrador de sistema', 'Nivel más alto de usuario, puede dar de alta, de baja, modificar y cambiar TODO', 9),
(9, 'Usuario registrado ', 'Usuario común que no requiere licencia', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_proveedor_activos`
--

CREATE TABLE `siri_proveedor_activos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `marca_comercial` varchar(32) NOT NULL,
  `num_telefono` varchar(16) NOT NULL,
  `pagWeb` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `representanteNombre` varchar(64) DEFAULT NULL,
  `tipoNegocioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_proveedor_activos`
--

INSERT INTO `siri_proveedor_activos` (`id`, `nombre`, `marca_comercial`, `num_telefono`, `pagWeb`, `email`, `representanteNombre`, `tipoNegocioId`) VALUES
(1, 'Proveedor demo', 'prodemo', '99999999', 'na', 'email@web.com', 'juan perez', 4),
(4, 'Proveedor Demo 2', 'prodemo2', '88888888', 'na', 'na', 'na', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siri_usuarios`
--

CREATE TABLE `siri_usuarios` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(64) NOT NULL,
  `correo_electronico` varchar(32) NOT NULL,
  `num_movil` varchar(16) NOT NULL,
  `_username_siryis` varchar(16) NOT NULL,
  `_el_password_siryis` varchar(256) NOT NULL,
  `ciudad` varchar(36) NOT NULL,
  `estado` varchar(36) NOT NULL,
  `direccion` varchar(64) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `licenciaId` varchar(20) DEFAULT NULL,
  `usuarioNivelId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `siri_usuarios`
--

INSERT INTO `siri_usuarios` (`id`, `nombre_completo`, `correo_electronico`, `num_movil`, `_username_siryis`, `_el_password_siryis`, `ciudad`, `estado`, `direccion`, `cp`, `licenciaId`, `usuarioNivelId`) VALUES
(9999, 'Nestor Velazquez Sanchez', 'netovs@gmail.com', '9982701724', 'administrador', '3h3491981', 'Puerto Morelos', 'Quintana Roo', 'Turipache 83 Manzana 6 Lote 1\r\nVillas la playa, Villas Morelos 4', '77580', NULL, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `siri_activo`
--
ALTER TABLE `siri_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor` (`proveedorId`);

--
-- Indices de la tabla `siri_activoslocaciones`
--
ALTER TABLE `siri_activoslocaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `siri_activo_imagenes`
--
ALTER TABLE `siri_activo_imagenes`
  ADD KEY `activoId` (`activoId`);

--
-- Indices de la tabla `siri_cat_tipo`
--
ALTER TABLE `siri_cat_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `siri_locaciones`
--
ALTER TABLE `siri_locaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `negocioId` (`negocioId`);

--
-- Indices de la tabla `siri_negocios`
--
ALTER TABLE `siri_negocios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipoNegocios` (`tipoId`);

--
-- Indices de la tabla `siri_niveles_de_usuarios`
--
ALTER TABLE `siri_niveles_de_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `siri_proveedor_activos`
--
ALTER TABLE `siri_proveedor_activos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `negocioDependiente` (`tipoNegocioId`);

--
-- Indices de la tabla `siri_usuarios`
--
ALTER TABLE `siri_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nivelUsuario` (`usuarioNivelId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `siri_activo`
--
ALTER TABLE `siri_activo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `siri_activoslocaciones`
--
ALTER TABLE `siri_activoslocaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `siri_cat_tipo`
--
ALTER TABLE `siri_cat_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `siri_locaciones`
--
ALTER TABLE `siri_locaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `siri_negocios`
--
ALTER TABLE `siri_negocios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `siri_niveles_de_usuarios`
--
ALTER TABLE `siri_niveles_de_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `siri_proveedor_activos`
--
ALTER TABLE `siri_proveedor_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `siri_usuarios`
--
ALTER TABLE `siri_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `siri_activo`
--
ALTER TABLE `siri_activo`
  ADD CONSTRAINT `proveedor` FOREIGN KEY (`proveedorId`) REFERENCES `siri_proveedor_activos` (`id`);

--
-- Filtros para la tabla `siri_activo_imagenes`
--
ALTER TABLE `siri_activo_imagenes`
  ADD CONSTRAINT `siri_activo_imagenes_ibfk_1` FOREIGN KEY (`activoId`) REFERENCES `siri_activo` (`id`);

--
-- Filtros para la tabla `siri_locaciones`
--
ALTER TABLE `siri_locaciones`
  ADD CONSTRAINT `siri_locaciones_ibfk_1` FOREIGN KEY (`negocioId`) REFERENCES `siri_negocios` (`id`);

--
-- Filtros para la tabla `siri_negocios`
--
ALTER TABLE `siri_negocios`
  ADD CONSTRAINT `tipoNegocios` FOREIGN KEY (`tipoId`) REFERENCES `siri_cat_tipo` (`id`);

--
-- Filtros para la tabla `siri_proveedor_activos`
--
ALTER TABLE `siri_proveedor_activos`
  ADD CONSTRAINT `negocioDependiente` FOREIGN KEY (`tipoNegocioId`) REFERENCES `siri_cat_tipo` (`id`);

--
-- Filtros para la tabla `siri_usuarios`
--
ALTER TABLE `siri_usuarios`
  ADD CONSTRAINT `nivelUsuario` FOREIGN KEY (`usuarioNivelId`) REFERENCES `siri_niveles_de_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
