-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2025 a las 05:23:11
-- Versión del servidor: 8.0.42
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minsadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causa`
--

CREATE TABLE `causa` (
  `id_causa` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `causa`
--

INSERT INTO `causa` (`id_causa`, `nombre`) VALUES
(4, 'Estudio de mamas'),
(2, 'IVA'),
(1, 'PAP'),
(3, 'VPH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int NOT NULL,
  `id_obstetra` int NOT NULL,
  `dni_paciente` varchar(20) DEFAULT NULL,
  `nombre_paciente` varchar(100) DEFAULT NULL,
  `apellido_paciente` varchar(100) DEFAULT NULL,
  `nombre_obstetra` varchar(100) DEFAULT NULL,
  `apellido_obstetra` varchar(100) DEFAULT NULL,
  `fecha_cita` date DEFAULT NULL,
  `hora_cita` time DEFAULT NULL,
  `id_causa` int NOT NULL,
  `id_programa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `id_obstetra`, `dni_paciente`, `nombre_paciente`, `apellido_paciente`, `nombre_obstetra`, `apellido_obstetra`, `fecha_cita`, `hora_cita`, `id_causa`, `id_programa`) VALUES
(2, 1, '98989898', 'Maria', 'Sosa Bolivar', 'Alexis', 'Gonzales Flores', '2025-06-12', '14:00:00', 1, NULL),
(3, 1, '98989898', 'Maria', 'Sosa Bolivar', 'Alexis', 'Gonzales Flores', '2025-06-13', '10:00:00', 1, NULL),
(4, 1, '98989898', 'Maria', 'Sosa Bolivar', 'Alexis', 'Gonzales Flores', '2025-06-12', '16:00:00', 1, 1),
(5, 1, '98989898', 'Maria', 'Sosa Bolivar', 'Alexis', 'Gonzales Flores', '2025-06-12', '12:00:00', 4, 1),
(6, 1, '98989898', 'Maria', 'Sosa Bolivar', 'Alexis', 'Gonzales Flores', '2025-06-12', '02:00:00', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obstetras`
--

CREATE TABLE `obstetras` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `gmail` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `citas_realizadas` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `obstetras`
--

INSERT INTO `obstetras` (`id`, `nombre`, `apellido`, `dni`, `fecha_nacimiento`, `genero`, `gmail`, `telefono`, `citas_realizadas`) VALUES
(1, 'Alexis', 'Gonzales Flores', '34534532', '2005-04-04', 'Masculino', 'alexisgonzales21@gmail.com', '323232332', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obstetra_programa`
--

CREATE TABLE `obstetra_programa` (
  `id` int NOT NULL,
  `obstetra_id` int DEFAULT NULL,
  `programa_id` int DEFAULT NULL,
  `citas_realizadas` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dni` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `Telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `dni`, `fecha_nacimiento`, `Telefono`) VALUES
(6, 'Maria', 'Sosa Bolivar', '98989898', '2000-06-02', '900000000'),
(7, 'Marta', 'Sol Orrego', '71111111', '1996-09-09', '111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` int NOT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `meta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `meta`) VALUES
(1, 'Programa de citas', '2025-06-11', '2026-06-11', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int NOT NULL,
  `contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `contraseña`) VALUES
(1, '1111');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `causa`
--
ALTER TABLE `causa`
  ADD PRIMARY KEY (`id_causa`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_citas_causa` (`id_causa`),
  ADD KEY `fk_citas_programa` (`id_programa`),
  ADD KEY `fk_citas_obstetras` (`id_obstetra`);

--
-- Indices de la tabla `obstetras`
--
ALTER TABLE `obstetras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `obstetra_programa`
--
ALTER TABLE `obstetra_programa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obstetra_id` (`obstetra_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `causa`
--
ALTER TABLE `causa`
  MODIFY `id_causa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `obstetras`
--
ALTER TABLE `obstetras`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `obstetra_programa`
--
ALTER TABLE `obstetra_programa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_citas_causa` FOREIGN KEY (`id_causa`) REFERENCES `causa` (`id_causa`),
  ADD CONSTRAINT `fk_citas_obstetras` FOREIGN KEY (`id_obstetra`) REFERENCES `obstetras` (`id`),
  ADD CONSTRAINT `fk_citas_programa` FOREIGN KEY (`id_programa`) REFERENCES `programas` (`id`);

--
-- Filtros para la tabla `obstetra_programa`
--
ALTER TABLE `obstetra_programa`
  ADD CONSTRAINT `obstetra_programa_ibfk_1` FOREIGN KEY (`obstetra_id`) REFERENCES `obstetras` (`id`),
  ADD CONSTRAINT `obstetra_programa_ibfk_2` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
