-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2026 a las 16:23:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `standapi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portador`
--

CREATE TABLE `portador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `aparicion` varchar(100) DEFAULT NULL,
  `imagen_manga` varchar(100) DEFAULT NULL,
  `imagen_anime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `portador`
--

INSERT INTO `portador` (`id`, `nombre`, `descripcion`, `aparicion`, `imagen_manga`, `imagen_anime`) VALUES
(1, 'Jotaro Kujo', 'Protagonista de Stardust Crusaders', 'Parte 3', NULL, NULL),
(2, 'Muhammad Avdol', 'Aliado de Jotaro', 'Parte 3', NULL, NULL),
(3, 'Joseph Joestar', 'Abuelo de Jotaro', 'Parte 2 y 3', NULL, NULL),
(4, 'Noriaki Kakyoin', 'Aliado con Stand de largo alcance', 'Parte 3', NULL, NULL),
(5, 'Jean Pierre Polnareff', 'Espadachín honorable', 'Parte 3, 5', NULL, NULL),
(6, 'DIO', 'Vampiro con poder sobre el tiempo', 'Parte 3', NULL, NULL),
(7, 'Josuke Higashikata', 'Puede reparar objetos y personas', 'Parte 4', NULL, NULL),
(8, 'Koichi Hirose', 'Evoluciona su Stand varias veces', 'Parte 4', NULL, NULL),
(9, 'Okuyasu Nijimura', 'Gran poder pero poco juicio', 'Parte 4', NULL, NULL),
(10, 'Rohan Kishibe', 'Mangaka con poder sobre las personas', 'Parte 4', NULL, NULL),
(11, 'Giorno Giovanna', 'Convierte objetos en vida', 'Parte 5', NULL, NULL),
(12, 'Bruno Bucciarati', 'Crea cremalleras', 'Parte 5', NULL, NULL),
(13, 'Guido Mista', 'Controla balas vivas', 'Parte 5', NULL, NULL),
(14, 'Narancia Ghirga', 'Ataques aéreos con radar', 'Parte 5', NULL, NULL),
(15, 'Leone Abbacchio', 'Reproduce eventos pasados', 'Parte 5', NULL, NULL),
(16, 'Diavolo', 'Manipula el tiempo y el destino', 'Parte 5', NULL, NULL),
(17, 'Jolyne Cujoh', 'Convierte su cuerpo en hilo', 'Parte 6', NULL, NULL),
(18, 'Ermes Costello', 'Duplica objetos con pegatinas', 'Parte 6', NULL, NULL),
(19, 'Weather Report', 'Controla el clima', 'Parte 6', NULL, NULL),
(20, 'Enrico Pucci', 'Sacerdote con evolución de Stand', 'Parte 6', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stand`
--

CREATE TABLE `stand` (
  `id` int(11) NOT NULL,
  `id_evolucion` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `aparicion` varchar(100) DEFAULT NULL,
  `imagen_manga` varchar(100) DEFAULT NULL,
  `imagen_anime` varchar(100) DEFAULT NULL,
  `poder` char(1) DEFAULT NULL,
  `velocidad` char(1) DEFAULT NULL,
  `alcance` char(1) DEFAULT NULL,
  `durabilidad` char(1) DEFAULT NULL,
  `precis` char(1) DEFAULT NULL,
  `potencial` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stand`
--

INSERT INTO `stand` (`id`, `id_evolucion`, `nombre`, `descripcion`, `aparicion`, `imagen_manga`, `imagen_anime`, `poder`, `velocidad`, `alcance`, `durabilidad`, `precis`, `potencial`) VALUES
(1, NULL, 'Star Platinum', 'Star Platinum es un Stand de corto alcance, con un alcance básico de solo 2 metros del cuerpo de Jotaro, pero con una fuerza, velocidad y precisión increíbles. Es uno de los Stands más poderosos de la', 'Parte 3', NULL, NULL, 'A', 'A', 'C', 'A', 'A', 'A'),
(2, NULL, 'Magician\'s Red', 'Magician\'s Red es un Stand humanoide de rango-medio; su capacidad única es la generación y manipulación del fuego.', 'Parte 3', NULL, NULL, 'B', 'B', 'C', 'B', 'C', 'D'),
(3, NULL, 'Hermit Purple', 'Las habilidades físicas de Hermit Purple son relativamente débiles, pero proporcionan a Joseph con una considerable habilidad de adivinación, permitiéndole divinizar y materializar cualquier tipo de i', 'Parte 3 y Parte 4', NULL, NULL, 'D', 'C', 'D', 'A', 'D', 'E'),
(4, NULL, 'Hierophant Green', 'Hierophant Green es un Stand elástico y remoto, capaz de \"explorar\" el terreno y realizar acciones desde una gran distancia. Kakyoin ha poseído este Stand desde su nacimiento.', 'Parte 3', NULL, NULL, 'C', 'B', 'A', 'B', 'C', 'D'),
(5, NULL, 'Silver Chariot', 'Espadachín extremadamente rápido', 'Parte 3', NULL, NULL, 'B', 'A', 'C', 'C', 'B', 'C'),
(6, NULL, 'The World', 'Detiene el tiempo', 'Parte 3', NULL, NULL, 'A', 'A', 'C', 'A', 'A', 'B'),
(7, NULL, 'Crazy Diamond', 'Restaura objetos y personas', 'Parte 4', NULL, NULL, 'A', 'A', 'C', 'A', 'B', 'C'),
(8, 9, 'Echoes Act 1', 'Manipula sonido', 'Parte 4', NULL, NULL, 'E', 'C', 'B', 'C', 'C', 'A'),
(9, 10, 'Echoes Act 2', 'Sonidos con efectos físicos', 'Parte 4', NULL, NULL, 'C', 'C', 'B', 'C', 'C', 'A'),
(10, NULL, 'Echoes Act 3', 'Aumenta peso gravitacional', 'Parte 4', NULL, NULL, 'B', 'C', 'C', 'B', 'C', 'C'),
(11, NULL, 'The Hand', 'Borra espacio', 'Parte 4', NULL, NULL, 'A', 'B', 'D', 'A', 'C', 'C'),
(12, NULL, 'Heavens Door', 'Controla acciones humanas', 'Parte 4', NULL, NULL, 'C', 'B', 'B', 'B', 'A', 'B'),
(13, NULL, 'Gold Experience', 'Crea vida', 'Parte 5', NULL, NULL, 'C', 'A', 'C', 'D', 'C', 'A'),
(14, NULL, 'Sticky Fingers', 'Cremalleras dimensionales', 'Parte 5', NULL, NULL, 'A', 'A', 'C', 'A', 'C', 'D'),
(15, NULL, 'Sex Pistols', 'Balas con voluntad', 'Parte 5', NULL, NULL, 'B', 'B', 'B', 'A', 'A', 'C'),
(16, NULL, 'Aerosmith', 'Avión con ametralladoras', 'Parte 5', NULL, NULL, 'B', 'B', 'C', 'C', 'C', 'C'),
(17, NULL, 'Moody Blues', 'Reproduce el pasado', 'Parte 5', NULL, NULL, 'C', 'C', 'A', 'A', 'B', 'C'),
(18, NULL, 'King Crimson', 'Borra tiempo', 'Parte 5', NULL, NULL, 'A', 'A', 'C', 'A', 'A', 'E'),
(19, NULL, 'Stone Free', 'Cuerpo de hilo', 'Parte 6', NULL, NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(20, NULL, 'Kiss', 'Duplica objetos', 'Parte 6', NULL, NULL, 'A', 'A', 'C', 'A', 'C', 'A'),
(21, NULL, 'Weather Report', 'Control del clima', 'Parte 6', NULL, NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(22, 23, 'Whitesnake', 'Roba memoria y Stand', 'Parte 6', NULL, NULL, 'C', 'B', 'C', 'A', 'B', 'A'),
(23, 24, 'C-Moon', 'Controla gravedad', 'Parte 6', NULL, NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(24, NULL, 'Made in Heaven', 'Acelera el tiempo', 'Parte 6', NULL, NULL, 'A', 'A', 'A', 'A', 'C', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stand_portador`
--

CREATE TABLE `stand_portador` (
  `id_stand` int(11) NOT NULL,
  `id_portador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stand_portador`
--

INSERT INTO `stand_portador` (`id_stand`, `id_portador`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 8),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13),
(16, 14),
(17, 15),
(18, 16),
(19, 17),
(20, 18),
(21, 19),
(22, 20),
(23, 20),
(24, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `portador`
--
ALTER TABLE `portador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stand`
--
ALTER TABLE `stand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stand_evolucion` (`id_evolucion`);

--
-- Indices de la tabla `stand_portador`
--
ALTER TABLE `stand_portador`
  ADD PRIMARY KEY (`id_stand`,`id_portador`),
  ADD KEY `id_portador` (`id_portador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `portador`
--
ALTER TABLE `portador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `stand`
--
ALTER TABLE `stand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `stand`
--
ALTER TABLE `stand`
  ADD CONSTRAINT `fk_stand_evolucion` FOREIGN KEY (`id_evolucion`) REFERENCES `stand` (`id`);

--
-- Filtros para la tabla `stand_portador`
--
ALTER TABLE `stand_portador`
  ADD CONSTRAINT `stand_portador_ibfk_1` FOREIGN KEY (`id_stand`) REFERENCES `stand` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stand_portador_ibfk_2` FOREIGN KEY (`id_portador`) REFERENCES `portador` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
