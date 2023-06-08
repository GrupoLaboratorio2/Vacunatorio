-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2023 a las 16:48:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vacunatorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `matricula` int(11) NOT NULL,
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idRegistro` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `nombreDelCentro` varchar(50) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL,
  `fechaDeAdquisicion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL,
  `fechaDeAdquisicion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `numeroDeSerie` int(11) NOT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL,
  `matricula` int(11) NOT NULL,
  `empresaDescartante` varchar(50) NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaDeDescarte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuyeacentro`
--

CREATE TABLE `distribuyeacentro` (
  `numeroDeSerie` int(11) NOT NULL,
  `idDepositoProvincial` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuyeaprovincia`
--

CREATE TABLE `distribuyeaprovincia` (
  `numeroDeSerie` int(11) NOT NULL,
  `idDepositoNacional` int(11) NOT NULL,
  `idDepositoProvincial` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envia`
--

CREATE TABLE `envia` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeEnvio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `nombreLaboratorio` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `nombreLaboratorio` varchar(100) NOT NULL,
  `tipoDeVacuna` varchar(50) NOT NULL,
  `nombreComercial` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaDeFabricacion` date NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `fechaDeCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(50) NOT NULL,
  `genero` varchar(9) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibe`
--

CREATE TABLE `recibe` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeRecepcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` int(11) NOT NULL,
  `celular2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idRegistro`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`,`numeroDeSerie`),
  ADD UNIQUE KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`,`numeroDeSerie`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`nombreLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`),
  ADD KEY `nombreLaboratorio` (`nombreLaboratorio`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `numeroDeLote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `DNI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD CONSTRAINT `depositonacional_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`);

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`nombreLaboratorio`) REFERENCES `laboratorio` (`nombreLaboratorio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
