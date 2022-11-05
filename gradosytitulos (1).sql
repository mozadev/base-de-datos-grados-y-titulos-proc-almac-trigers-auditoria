-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2022 a las 23:25:13
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Asesor` (`Id` INTEGER(3), IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_IdEscuela` INT(3))  BEGIN 
	INSERT INTO asesor(Nombre,Apellido,Dni,IdEscuela) VALUES(_Nombre,_Apellido,_Dni,_IdEscuela);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Jurados` (`Id` INTEGER(3), IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_IdEscuela` INT(3))  BEGIN 
	INSERT INTO juradors(Nombre,Apellido,Dni,Escuela) VALUES (_Nombre,_Apellido,_Dni,_IdEscuela);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Plan` (IN `_TituloTema` VARCHAR(100), IN `_Asesor` INT(3), IN `_Tesista` INT(10), IN `_idTipo` INT(3), IN `_TituloGrado` INT(3))  BEGIN
INSERT INTO plan (TituloTema,Asesor,Tesista,idTipo,TituloGrado,idEstado) VALUES (_TituloTema,_Asesor,_Tesista,_idTipo,_TituloGrado,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Tesista` (IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_Escuela` INT(3))  BEGIN
INSERT INTO tesista (Nombre,Apellido,Dni,Escuela) VALUES (_Nombre,_Apellido,_Dni,_Escuela);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearPlanEnResPlan` (IN `n_res` INT, IN `fecha` VARCHAR(10), IN `codplann` INT)  INSERT INTO `resolucion de plan` (`Id`, `N_Resolucion`, `Fecha`, `idPlan`) VALUES (NULL, n_res, fecha, codplann)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearTesisEnResTesis` (`n_res` INT, `fecha` VARCHAR(10), `codtesis` INT)  INSERT INTO `resolucion de tesis` (`Id`, `N_Resolucion`, `Fecha`, `idTesis`) VALUES (NULL, n_res, fecha, codtesis)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Edit_Asesor` (IN `_Id` INT(10), IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_IdEscuela` INT(3))  BEGIN
UPDATE asesor SET
Nombre = _Nombre,
Apellido = _Apellido,
Dni = _Dni,
IdEscuela = _IdEscuela
   WHERE Id = _Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Edit_Jurados` (IN `_Id` INT(10), IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_IdEscuela` INT(3))  BEGIN
UPDATE jurados SET
Nombre = _Nombre,
Apellido = _Apellido,
Dni = _Dni,
IdEscuela = _IdEscuela
   WHERE Id = _Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPlanEnResPlan` (IN `n_plan` INT)  BEGIN
DELETE FROM `resolucion de plan` WHERE `resolucion de plan`.`idPlan` = n_plan;
UPDATE `plan` SET `plan`.`idEstado` = 1 WHERE `plan`.`Id` = n_plan;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTesisEnResTesis` (IN `n_tesis` INT)  BEGIN
DELETE FROM `resolucion de tesis` WHERE `resolucion de tesis`.`idTesis` = n_tesis;
UPDATE `tesis` SET `tesis`.`idEstado` = 1 WHERE `tesis`.`Id` = n_tesis;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarTitulos` (`tipo` INT)  select tesis.id, tesis.TituloTema, Asesor.Nombre AS `Nombre Asesor`, Tesista.Nombre AS `Nombre Tesista`, tipo.Nombre AS `Tipo Tesis`, TituloGrado.Nombre , estado.Nombre as `Estado` from tesis 
INNER JOIN Asesor on tesis.Asesor = Asesor.Id 
INNER JOIN Tesista on tesis.Tesista = Tesista.Id 
INNER JOIN tipo on tesis.idTipo = tipo.Id
INNER JOIN titulogrado on tesis.TituloGrado = TituloGrado.id
INNER JOIN estado on tesis.idEstado = estado.Id
where tesis.idEstado = tipo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarFechaResPlan` (`n_res` INT, `fecha` VARCHAR(10))  UPDATE `resolucion de plan` SET `Fecha` = fecha WHERE `resolucion de plan`.`N_Resolucion` = n_res$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarFechaResTesis` (`n_res` INT, `fecha` VARCHAR(10))  UPDATE `resolucion de tesis` set `Fecha` = fecha where `resolucion de tesis`.`N_Resolucion` = n_res$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modify_Plan` (IN `_Id` INT(3), IN `_TituloTema` VARCHAR(100), IN `_Asesor` INT(3), IN `_Tesista` INT(10), IN `_idTipo` INT(3), IN `_TituloGrado` INT(3), IN `_idEstado` INT(10))  BEGIN
UPDATE plan SET
TituloTema = _TituloTema,
Asesor = _Asesor,
Tesista = _Tesista,
idTipo = _idTipo,
TituloGrado = _TituloGrado,
idEstado = _idEstado
   WHERE Id = _Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modify_Tesista` (IN `_Id` INT(10), IN `_Nombre` VARCHAR(100), IN `_Apellido` VARCHAR(100), IN `_Dni` INT(10), IN `_Escuela` INT(3))  BEGIN
UPDATE tesista SET
Nombre = _Nombre,
Apellido = _Apellido,
Dni = _Dni,
Escuela = _Escuela
   WHERE Id = _Id;
   
INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(_Id,"tesista","Modificar","Se hizo la accion de Mostrar en Tabla Tesista",now(),CURRENT_USER());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarResolucionPlan` (IN `N_res` INT(2))  BEGIN

select `resolucion de plan`.Id,N_Resolucion,Fecha,`plan`.`TituloTema` from `resolucion de plan` INNER JOIN `plan` on `resolucion de plan`.`idPlan` = plan.Id where N_Resolucion = N_res;

INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(N_res,"asesor","Mostrar","Se hizo la accion de Mostrar en Tabla Asesor",now(),CURRENT_USER());

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarResolucionTesis` (IN `n_res` INT)  BEGIN
select `resolucion de tesis`.`Id`, `resolucion de tesis`.`N_Resolucion`, `tesis`.`TituloTema`, `resolucion de tesis`.`Fecha`  from `resolucion de tesis`
INNER JOIN `tesis` on `resolucion de tesis`.`idTesis` = tesis.id 
WHERE N_Resolucion = n_res;

INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(n_res,"resolucion de plan","Mostrar","Se hizo la accion de Mostrar en Tabla Resolucion de Plan",now(),CURRENT_USER());

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_Asesor` ()  BEGIN
SELECT * FROM `asesor` inner join escuela on asesor.IdEscuela = escuela.Id;

INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(0,"asesor","Mostrar","Se hizo la accion de Mostrar en Tabla Asesor",now(),CURRENT_USER());

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_Jurados` ()  BEGIN
SELECT * FROM `jurados` inner join escuela on jurados.IdEscuela = escuela.Id;

INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(0,"Jurados","Modificar","Se hizo la accion de Mostrar en Tabla Jurados",now(),CURRENT_USER());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_Plan` (IN `_Id` INT(10))  BEGIN
SELECT plan.Id,plan.TituloTema,asesor.Nombre,tesista.Nombre,tipo.Nombre,titulogrado.Nombre,estado.Nombre
FROM plan
INNER JOIN asesor ON plan.Asesor = asesor.Id
INNER JOIN tesista ON plan.Tesista = tesista.Id
INNER JOIN tipo ON plan.idTipo = tipo.Id
INNER JOIN titulogrado ON plan.TituloGrado = titulogrado.id
INNER JOIN estado ON plan.idEstado = estado.Id
WHERE plan.Id= _Id;

INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(_Id,"plan","Mostrar","Se hizo la accion de Actualizar en Tabla Plan",now(),CURRENT_USER());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_Tesista` (IN `_Id` INT(10))  BEGIN
SELECT tesista.Id,tesista.Nombre,tesista.Apellido,tesista.Dni, escuela.Escuela
FROM tesista
INNER JOIN escuela ON tesista.Escuela = escuela.Id WHERE tesista.Id= _Id;
END$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `asesor`
--

INSERT INTO `asesor` (`Id`, `Nombre`, `Apellido`, `Dni`, `IdEscuela`) VALUES
(1, 'Oscar Jose', 'Condori Pacha', 65123548, 1),
(2, 'Isabela', 'Maza Trujillo', 57071350, 2);

--
-- Disparadores `asesor`
--
DELIMITER $$
CREATE TRIGGER `de_asesor` AFTER DELETE ON `asesor` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"asesor","Eliminar","Se hizo la accion de Eliminar en Tabla Asesor",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_asesor` AFTER UPDATE ON `asesor` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"asesor","Modificar","Se realizo la accion de Actualizar en Tabla Asesor",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `idelemento` int(11) NOT NULL,
  `tabla` varchar(255) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `detalles` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `idelemento`, `tabla`, `accion`, `detalles`, `fecha`, `usuario`) VALUES
(1, 2, 'asesor', 'Modificar', 'se hizo la accion de Actualizar en Tabla Asesor', '2022-11-01 17:37:06', 'root@localhost'),
(2, 0, 'asesor', 'Mostrar', 'Se hizo la accion de Mostrar en Tabla Asesor', '2022-11-02 14:08:00', 'root@localhost'),
(3, 1, 'asesor', 'Mostrar', 'Se hizo la accion de Mostrar en Tabla Asesor', '2022-11-02 14:08:48', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `Id` int(3) NOT NULL,
  `Escuela` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`Id`, `Escuela`) VALUES
(1, 'Ingeniería de Sistemas'),
(2, 'Ingeniería de Transportes'),
(3, 'Ingeniería Agroindustrial'),
(4, 'Ingeniería Industrial');

--
-- Disparadores `escuela`
--
DELIMITER $$
CREATE TRIGGER `de_escuela` AFTER DELETE ON `escuela` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"escuela","Eliminar","Se hizo la accion de Eliminar en Tabla Escuela",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_escuela` AFTER UPDATE ON `escuela` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"escuela","Modificar","Se hizo la accion de Actualizar en Tabla Escuela",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id`, `Nombre`) VALUES
(1, 'Desarrollo'),
(2, 'Aprobado'),
(3, 'Desaprobado');

--
-- Disparadores `estado`
--
DELIMITER $$
CREATE TRIGGER `de_estado` AFTER DELETE ON `estado` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"estado","Eliminar","Se hizo la accion de Eliminar en Tabla Estado",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_estado` AFTER UPDATE ON `estado` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"estado","Modificar","Se hizo la accion de Actualizar en Tabla Estado",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jurados`
--

CREATE TABLE `jurados` (
  `id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Dni` int(10) NOT NULL,
  `IdEscuela` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jurados`
--

INSERT INTO `jurados` (`id`, `Nombre`, `Apellido`, `Dni`, `IdEscuela`) VALUES
(1, 'Luis Omar', 'Hernandez Fuentes', 84301957, 1),
(2, 'Sofia', 'Peña Garcia', 76108323, 2),
(3, 'Lucas', 'Baquero Amaya', 13292298, 3),
(4, 'Henry', 'Ormeño Pedrero', 71857458, 4);

--
-- Disparadores `jurados`
--
DELIMITER $$
CREATE TRIGGER `de_jurados` AFTER DELETE ON `jurados` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(id,"jurados","Eliminar","Se hizo la accion de Eliminar en Tabla jurados",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_jurados` AFTER UPDATE ON `jurados` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.id,"jurados","Modificar","Se hizo la accion de Actualizar en Tabla jurados",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `Id` int(3) NOT NULL,
  `TituloTema` varchar(100) NOT NULL,
  `Asesor` int(3) NOT NULL,
  `Tesista` int(10) NOT NULL,
  `idTipo` int(3) NOT NULL,
  `TituloGrado` int(3) NOT NULL,
  `idEstado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`Id`, `TituloTema`, `Asesor`, `Tesista`, `idTipo`, `TituloGrado`, `idEstado`) VALUES
(1, 'Sistema de apoyo para la toma de decisión de inversión en la Bolsa de Valores ﻿', 1, 1, 1, 1, 2),
(2, 'Sistema de apoyo para la toma de decisión de inversión en la Bolsa de Valores ﻿', 2, 4, 2, 1, 1),
(3, 'Efecto del ozono como pre tratamiento para incrementar la conservación de la carne de pollo broiler ', 2, 3, 2, 5, 1),
(4, 'Propuesta de un prototipo de señalización para un usuario universal del sistema de la Empresa Públic', 1, 5, 1, 1, 2);

--
-- Disparadores `plan`
--
DELIMITER $$
CREATE TRIGGER `de_plan` AFTER DELETE ON `plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"plan","Eliminar","Se hizo la accion de Eliminar en Tabla Plan",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_plan` AFTER UPDATE ON `plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"plan","Modificar","Se hizo la accion de Actualizar en Tabla Plan",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion de plan`
--

CREATE TABLE `resolucion de plan` (
  `Id` int(10) NOT NULL,
  `N_Resolucion` int(10) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `idPlan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resolucion de plan`
--

INSERT INTO `resolucion de plan` (`Id`, `N_Resolucion`, `Fecha`, `idPlan`) VALUES
(1, 1, '09/02/2022', 1),
(4, 2, '12/10/2022', 4),
(6, 1, '09/02/2022', 2),
(9, 2, '12/10/2022', 4);

--
-- Disparadores `resolucion de plan`
--
DELIMITER $$
CREATE TRIGGER `de_Resolucion_Plan` AFTER DELETE ON `resolucion de plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"resolucion de plan","Eliminar","Se hizo la accion de Eliminar en Tabla Resolucion de Plan",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_Resolucion_Plan` AFTER UPDATE ON `resolucion de plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"resolucion de plan","Modificar","Se hizo la accion de Actualizar en Tabla Resolucion de Plan",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion de tesis`
--

CREATE TABLE `resolucion de tesis` (
  `Id` int(3) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `N_Resolucion` int(10) NOT NULL,
  `idTesis` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `resolucion de tesis`
--
DELIMITER $$
CREATE TRIGGER `de_Resolucion_Tesis` AFTER DELETE ON `resolucion de tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"resolucion de tesis","Eliminar","Se hizo la accion de Eliminar en Tabla Resolucion de Tesis",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_Resolucion_Tesis` AFTER UPDATE ON `resolucion de tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"resolucion de tesis","Modificar","Se hizo la accion de Actualizar en Tabla Resolucion de Tesis",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustentacion_plan`
--

CREATE TABLE `sustentacion_plan` (
  `Id` int(10) NOT NULL,
  `idPlan` int(3) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `Hora` varchar(5) NOT NULL,
  `idPresidente` int(3) NOT NULL,
  `idSecretario` int(3) NOT NULL,
  `idVocal` int(3) NOT NULL,
  `idEstado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sustentacion_plan`
--

INSERT INTO `sustentacion_plan` (`Id`, `idPlan`, `Fecha`, `Hora`, `idPresidente`, `idSecretario`, `idVocal`, `idEstado`) VALUES
(1, 1, '05/01/2022', '16:41', 1, 2, 3, 2),
(2, 2, '05/01/2022', '17:00', 1, 2, 3, 2),
(3, 3, '06/01/2022', '16:00', 1, 2, 3, 2),
(4, 4, '06/01/2022', '17:00', 1, 2, 3, 2);

--
-- Disparadores `sustentacion_plan`
--
DELIMITER $$
CREATE TRIGGER `de_sustentacion_plan` AFTER DELETE ON `sustentacion_plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"sustentacion_plan","Eliminar","Se hizo la accion de Eliminar en Tabla Sustentacion_Plan",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_sustentacion_plan` AFTER UPDATE ON `sustentacion_plan` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"sustentacion_plan","Modificar","Se hizo la accion de Actualizar en Tabla Sustentacion_Plan",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustentacion_tesis`
--

CREATE TABLE `sustentacion_tesis` (
  `id` int(10) NOT NULL,
  `idTesis` int(3) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `Hora` varchar(5) NOT NULL,
  `idPresidente` int(3) NOT NULL,
  `idVocal` int(3) NOT NULL,
  `idSecretario` int(3) NOT NULL,
  `idEstado` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sustentacion_tesis`
--

INSERT INTO `sustentacion_tesis` (`id`, `idTesis`, `Fecha`, `Hora`, `idPresidente`, `idVocal`, `idSecretario`, `idEstado`) VALUES
(1, 1, '05/05/2022', '16:41', 1, 2, 3, 2);

--
-- Disparadores `sustentacion_tesis`
--
DELIMITER $$
CREATE TRIGGER `de_sustentacion_tesis` AFTER DELETE ON `sustentacion_tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(id,"sustentacion_tesis","Eliminar","Se hizo la accion de Eliminar en Tabla Sustentacion_Tesis",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_sustentacion_tesis` AFTER UPDATE ON `sustentacion_tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.id,"sustentacion_tesis","Modificar","Se hizo la accion de Actualizar en Tabla Sustentacion_Tesis",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesis`
--

CREATE TABLE `tesis` (
  `id` int(3) NOT NULL,
  `TituloTema` varchar(255) NOT NULL,
  `Asesor` int(3) NOT NULL,
  `Tesista` int(10) NOT NULL,
  `idTipo` int(3) NOT NULL,
  `TituloGrado` int(3) NOT NULL,
  `idEstado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tesis`
--

INSERT INTO `tesis` (`id`, `TituloTema`, `Asesor`, `Tesista`, `idTipo`, `TituloGrado`, `idEstado`) VALUES
(1, 'Sistema de apoyo para la toma de decisión de inversión en la Bolsa de Valores ﻿', 2, 1, 1, 1, 2),
(2, 'Sistema de apoyo para la toma de decisión de inversión en la Bolsa de Valores ﻿', 2, 4, 2, 2, 1),
(3, 'Efecto del ozono como pre tratamiento para incrementar la conservación de la carne de pollo broiler ', 2, 3, 2, 5, 1),
(4, 'Propuesta de un prototipo de señalización para un usuario universal del sistema de la Empresa Públic', 1, 5, 1, 1, 1);

--
-- Disparadores `tesis`
--
DELIMITER $$
CREATE TRIGGER `de_tesis` AFTER DELETE ON `tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(id,"tesis","Eliminar","Se hizo la accion de Eliminar en Tabla Tesis",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_tesis` AFTER UPDATE ON `tesis` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.id,"tesis","Modificar","Se hizo la accion de Actualizar en Tabla Tesis",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesista`
--

CREATE TABLE `tesista` (
  `Id` int(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Dni` int(10) NOT NULL,
  `Escuela` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tesista`
--

INSERT INTO `tesista` (`Id`, `Nombre`, `Apellido`, `Dni`, `Escuela`) VALUES
(1, 'Ronaldo Vargas', 'Chumbe Herrera', 64523883, 1),
(2, 'Oliver ', 'Sanchez Guzman', 39159854, 3),
(3, 'Emma', 'Salvador Aliaga', 14838044, 1),
(4, 'Liam', 'Mendez Guzman', 88788918, 2),
(5, 'Amelia', 'Zapata Chamorro', 88436998, 4);

--
-- Disparadores `tesista`
--
DELIMITER $$
CREATE TRIGGER `de_tesista` AFTER DELETE ON `tesista` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"tesista","Eliminar","Se hizo la accion de Eliminar en Tabla Tesista",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_tesista` AFTER UPDATE ON `tesista` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"tesista","Modificar","Se hizo la accion de Actualizar en Tabla Tesista",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `Id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`Id`, `Nombre`) VALUES
(1, 'Grado'),
(2, 'Titulo');

--
-- Disparadores `tipo`
--
DELIMITER $$
CREATE TRIGGER `de_tipo` AFTER DELETE ON `tipo` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(Id,"tipo","Eliminar","Se hizo la accion de Eliminar en Tabla Tipo",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_tipo` AFTER UPDATE ON `tipo` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.Id,"tipo","Modificar","Se hizo la accion de Actualizar en Tabla Tipo",now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulogrado`
--

CREATE TABLE `titulogrado` (
  `id` int(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `titulogrado`
--

INSERT INTO `titulogrado` (`id`, `Nombre`) VALUES
(1, 'Bachiller'),
(2, 'Master'),
(3, 'Doctor'),
(4, 'Especializacion1'),
(5, 'Especializacion2'),
(6, 'Especializcion3');

--
-- Disparadores `titulogrado`
--
DELIMITER $$
CREATE TRIGGER `de_titulogrado` AFTER DELETE ON `titulogrado` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(id,"titulogrado","Eliminar","Se hizo la accion de Eliminar en Tabla TituloGrado",now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_titulogrado` AFTER UPDATE ON `titulogrado` FOR EACH ROW INSERT INTO auditoria(idelemento,tabla,accion,detalles,fecha,usuario) VALUES(new.id,"titulogrado","Modificar","Se hizo la accion de Actualizar en Tabla TituloGrado",now(),CURRENT_USER())
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdEscuela` (`IdEscuela`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `jurados`
--
ALTER TABLE `jurados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IdEscuela` (`IdEscuela`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Asesor` (`Asesor`),
  ADD KEY `Tesista` (`Tesista`),
  ADD KEY `idTipo` (`idTipo`),
  ADD KEY `TituloGrado` (`TituloGrado`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idPlan` (`idPlan`);

--
-- Indices de la tabla `resolucion de tesis`
--
ALTER TABLE `resolucion de tesis`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idTesis` (`idTesis`);

--
-- Indices de la tabla `sustentacion_plan`
--
ALTER TABLE `sustentacion_plan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idPlan` (`idPlan`),
  ADD KEY `idPresidente` (`idPresidente`),
  ADD KEY `idSecretario` (`idSecretario`),
  ADD KEY `idVocal` (`idVocal`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `sustentacion_tesis`
--
ALTER TABLE `sustentacion_tesis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTesis` (`idTesis`),
  ADD KEY `idPresidente` (`idPresidente`),
  ADD KEY `idVocal` (`idVocal`),
  ADD KEY `idSecretario` (`idSecretario`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `tesis`
--
ALTER TABLE `tesis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Asesor` (`Asesor`),
  ADD KEY `Tesista` (`Tesista`),
  ADD KEY `idTipo` (`idTipo`),
  ADD KEY `TituloGrado` (`TituloGrado`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `tesista`
--
ALTER TABLE `tesista`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Escuela` (`Escuela`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `titulogrado`
--
ALTER TABLE `titulogrado`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asesor`
--
ALTER TABLE `asesor`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jurados`
--
ALTER TABLE `jurados`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `resolucion de tesis`
--
ALTER TABLE `resolucion de tesis`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sustentacion_plan`
--
ALTER TABLE `sustentacion_plan`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sustentacion_tesis`
--
ALTER TABLE `sustentacion_tesis`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tesis`
--
ALTER TABLE `tesis`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tesista`
--
ALTER TABLE `tesista`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `titulogrado`
--
ALTER TABLE `titulogrado`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `FKPlan271644` FOREIGN KEY (`Tesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKPlan29718` FOREIGN KEY (`Asesor`) REFERENCES `asesor` (`Id`),
  ADD CONSTRAINT `FKPlan364044` FOREIGN KEY (`TituloGrado`) REFERENCES `titulogrado` (`id`),
  ADD CONSTRAINT `FKPlan376955` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `FKPlan849117` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`Id`);

--
-- Filtros para la tabla `resolucion de plan`
--
ALTER TABLE `resolucion de plan`
  ADD CONSTRAINT `FKResolucion963967` FOREIGN KEY (`idPlan`) REFERENCES `plan` (`Id`);

--
-- Filtros para la tabla `resolucion de tesis`
--
ALTER TABLE `resolucion de tesis`
  ADD CONSTRAINT `FKResolucion406761` FOREIGN KEY (`idTesis`) REFERENCES `tesis` (`id`);

--
-- Filtros para la tabla `sustentacion_plan`
--
ALTER TABLE `sustentacion_plan`
  ADD CONSTRAINT `FKSustentaci186426` FOREIGN KEY (`idVocal`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKSustentaci576432` FOREIGN KEY (`idPresidente`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKSustentaci640463` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `FKSustentaci819103` FOREIGN KEY (`idPlan`) REFERENCES `plan` (`Id`),
  ADD CONSTRAINT `FKSustentaci875853` FOREIGN KEY (`idSecretario`) REFERENCES `jurados` (`id`);

--
-- Filtros para la tabla `sustentacion_tesis`
--
ALTER TABLE `sustentacion_tesis`
  ADD CONSTRAINT `FKSustentaci237827` FOREIGN KEY (`idSecretario`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKSustentaci718522` FOREIGN KEY (`idPresidente`) REFERENCES `jurados` (`id`),
  ADD CONSTRAINT `FKSustentaci782553` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `FKSustentaci819036` FOREIGN KEY (`idTesis`) REFERENCES `tesis` (`id`),
  ADD CONSTRAINT `FKSustentaci927254` FOREIGN KEY (`idVocal`) REFERENCES `jurados` (`id`);

--
-- Filtros para la tabla `tesis`
--
ALTER TABLE `tesis`
  ADD CONSTRAINT `FKTesis480077` FOREIGN KEY (`Tesista`) REFERENCES `tesista` (`Id`),
  ADD CONSTRAINT `FKTesis572477` FOREIGN KEY (`TituloGrado`) REFERENCES `titulogrado` (`id`),
  ADD CONSTRAINT `FKTesis585388` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `FKTesis640684` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`Id`),
  ADD CONSTRAINT `FKTesis821284` FOREIGN KEY (`Asesor`) REFERENCES `asesor` (`Id`);

--
-- Filtros para la tabla `tesista`
--
ALTER TABLE `tesista`
  ADD CONSTRAINT `FKTesista115403` FOREIGN KEY (`Escuela`) REFERENCES `escuela` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
