-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2022 a las 23:47:52
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gradosytitulos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acta de sustentacion`
--

CREATE TABLE `acta de sustentacion` (
  `Id` int(10) NOT NULL,
  `Fecha` varchar(255) NOT NULL,
  `Hora` varchar(5) NOT NULL,
  `IdPresidente` int(3) NOT NULL,
  `IdSecretario` int(3) NOT NULL,
  `IdVocal` int(3) NOT NULL,
  `FechaResolucionPlan` varchar(10) NOT NULL,
  `IdResolucionPlan` int(10) NOT NULL,
  `NumeroResolucionExpeditoTesis` int(10) NOT NULL,
  `IdTesista` int(10) NOT NULL,
  `IdAsesor` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Dni` int(10) NOT NULL,
  `IdEscuela` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `Id` int(3) NOT NULL,
  `Escuela` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `Grados` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jurados`
--

CREATE TABLE `jurados` (
  `id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Dni` int(10) NOT NULL,
  `Tipo` int(3) NOT NULL,
  `IdEscuela` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `Id` int(3) NOT NULL,
  `TituloTema` varchar(100) NOT NULL,
  `Asesor` int(3) NOT NULL,
  `Tesista` int(10) NOT NULL,
  `Jurados` int(3) NOT NULL,
  `Grado` int(3) NOT NULL,
  `TituloGrado` int(3) NOT NULL,
  `Estado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion de plan`
--

CREATE TABLE `resolucion de plan` (
  `Id` int(10) NOT NULL,
  `IdAlumno` int(10) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `IdJuradoAprobo` int(3) NOT NULL,
  `IdAsesor` int(3) NOT NULL,
  `Grado` int(3) NOT NULL,
  `TituloGrado` int(3) NOT NULL,
  `IdTesista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion de tesis`
--

CREATE TABLE `resolucion de tesis` (
  `Id` int(3) NOT NULL,
  `IdAlumno` int(10) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `IdJuradoAprobo` int(3) NOT NULL,
  `IdAsesor` int(3) NOT NULL,
  `Grado` int(10) NOT NULL,
  `TituloGrado` int(3) NOT NULL,
  `IdTesista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesis`
--

CREATE TABLE `tesis` (
  `id` int(3) NOT NULL,
  `TituloTema` int(10) NOT NULL,
  `Tesista` int(10) NOT NULL,
  `Estado` int(3) NOT NULL,
  `Jurados` int(3) NOT NULL,
  `Asesor` int(3) NOT NULL,
  `Grado` int(3) NOT NULL,
  `TituloGrado` int(10) NOT NULL,
  `Column` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesista`
--

CREATE TABLE `tesista` (
  `Id` int(10) NOT NULL,
  `Dni` int(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Escuela` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo`
--

CREATE TABLE `titulo` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acta de sustentacion`
--
ALTER TABLE `acta de sustentacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdPresidente` (`IdPresidente`),
  ADD KEY `IdSecretario` (`IdSecretario`),
  ADD KEY `IdVocal` (`IdVocal`),
  ADD KEY `FechaResolucionPlan` (`FechaResolucionPlan`),
  ADD KEY `IdResolucionPlan` (`IdResolucionPlan`),
  ADD KEY `IdTesista` (`IdTesista`),
  ADD KEY `IdAsesor` (`IdAsesor`);

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdEscuela` (`IdEscuela`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`Grados`);

--
-- Indices de la tabla `jurados`
--
ALTER TABLE `jurados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tipo` (`Tipo`),
  ADD KEY `FKJurados87500` (`IdEscuela`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Asesor` (`Asesor`),
  ADD KEY `Tesista` (`Tesista`),
  ADD KEY `Grado` (`Grado`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `FKPlan848573` (`Jurados`);

--
-- Indices de la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdAlumno` (`IdAlumno`),
  ADD KEY `IdJuradoAprobo` (`IdJuradoAprobo`),
  ADD KEY `IdAsesor` (`IdAsesor`),
  ADD KEY `Grado` (`Grado`),
  ADD KEY `TituloGrado` (`TituloGrado`),
  ADD KEY `IdTesista` (`IdTesista`);

--
-- Indices de la tabla `resolucion de tesis`
--
ALTER TABLE `resolucion de tesis`
  ADD KEY `FKResolucion844028` (`TituloGrado`),
  ADD KEY `FKResolucion388868` (`IdJuradoAprobo`),
  ADD KEY `FKResolucion877412` (`IdAsesor`),
  ADD KEY `FKResolucion550904` (`IdTesista`);

--
-- Indices de la tabla `tesis`
--
ALTER TABLE `tesis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Tesista` (`Tesista`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `Jurados` (`Jurados`),
  ADD KEY `Asesor` (`Asesor`),
  ADD KEY `Grado` (`Grado`),
  ADD KEY `TituloGrado` (`TituloGrado`),
  ADD KEY `Column` (`Column`);

--
-- Indices de la tabla `tesista`
--
ALTER TABLE `tesista`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Escuela` (`Escuela`);

--
-- Indices de la tabla `titulo`
--
ALTER TABLE `titulo`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acta de sustentacion`
--
ALTER TABLE `acta de sustentacion`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asesor`
--
ALTER TABLE `asesor`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `Grados` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jurados`
--
ALTER TABLE `jurados`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tesis`
--
ALTER TABLE `tesis`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tesista`
--
ALTER TABLE `tesista`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `titulo`
--
ALTER TABLE `titulo`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acta de sustentacion`
--
ALTER TABLE `acta de sustentacion`
  ADD CONSTRAINT `FKActa de Su153872` FOREIGN KEY (`IdVocal`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKActa de Su404634` FOREIGN KEY (`IdTesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKActa de Su582238` FOREIGN KEY (`IdPresidente`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKActa de Su78126` FOREIGN KEY (`IdAsesor`) REFERENCES `asesor` (`Id`),
  ADD CONSTRAINT `FKActa de Su830471` FOREIGN KEY (`IdResolucionPlan`) REFERENCES `resolucion de plan` (`Id`),
  ADD CONSTRAINT `FKActa de Su870047` FOREIGN KEY (`IdSecretario`) REFERENCES `jurados` (`id`);

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `FKAsesor634645` FOREIGN KEY (`IdEscuela`) REFERENCES `escuela` (`Id`);

--
-- Filtros para la tabla `jurados`
--
ALTER TABLE `jurados`
  ADD CONSTRAINT `FKJurados87500` FOREIGN KEY (`IdEscuela`) REFERENCES `escuela` (`Id`);

--
-- Filtros para la tabla `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `FKPlan137834` FOREIGN KEY (`Estado`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `FKPlan23832` FOREIGN KEY (`Grado`) REFERENCES `titulo` (`Id`),
  ADD CONSTRAINT `FKPlan271644` FOREIGN KEY (`Tesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKPlan29718` FOREIGN KEY (`Asesor`) REFERENCES `asesor` (`Id`),
  ADD CONSTRAINT `FKPlan466536` FOREIGN KEY (`Grado`) REFERENCES `grados` (`Grados`),
  ADD CONSTRAINT `FKPlan848573` FOREIGN KEY (`Jurados`) REFERENCES `jurados` (`id`);

--
-- Filtros para la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  ADD CONSTRAINT `FKResolucion502352` FOREIGN KEY (`IdTesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKResolucion513116` FOREIGN KEY (`Grado`) REFERENCES `grados` (`Grados`),
  ADD CONSTRAINT `FKResolucion74305` FOREIGN KEY (`TituloGrado`) REFERENCES `titulo` (`Id`),
  ADD CONSTRAINT `FKResolucion795746` FOREIGN KEY (`IdAsesor`) REFERENCES `asesor` (`Id`),
  ADD CONSTRAINT `FKResolucion846932` FOREIGN KEY (`IdAlumno`) REFERENCES `tesista` (`Id`);

--
-- Filtros para la tabla `resolucion de tesis`
--
ALTER TABLE `resolucion de tesis`
  ADD CONSTRAINT `FKResolucion388868` FOREIGN KEY (`IdJuradoAprobo`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKResolucion550904` FOREIGN KEY (`IdTesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKResolucion637193` FOREIGN KEY (`TituloGrado`) REFERENCES `grados` (`Grados`),
  ADD CONSTRAINT `FKResolucion844028` FOREIGN KEY (`TituloGrado`) REFERENCES `titulo` (`Id`),
  ADD CONSTRAINT `FKResolucion877412` FOREIGN KEY (`IdAsesor`) REFERENCES `asesor` (`Id`);

--
-- Filtros para la tabla `tesis`
--
ALTER TABLE `tesis`
  ADD CONSTRAINT `FKTesis480077` FOREIGN KEY (`Tesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKTesis57007` FOREIGN KEY (`Jurados`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKTesis674969` FOREIGN KEY (`Grado`) REFERENCES `grados` (`Grados`),
  ADD CONSTRAINT `FKTesis815398` FOREIGN KEY (`Grado`) REFERENCES `titulo` (`Id`),
  ADD CONSTRAINT `FKTesis821284` FOREIGN KEY (`Asesor`) REFERENCES `asesor` (`Id`),
  ADD CONSTRAINT `FKTesis929400` FOREIGN KEY (`Estado`) REFERENCES `estado` (`Id`);

--
-- Filtros para la tabla `tesista`
--
ALTER TABLE `tesista`
  ADD CONSTRAINT `FKTesista115403` FOREIGN KEY (`Escuela`) REFERENCES `escuela` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
