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
(1, NULL, 'Star Platinum', 'Stand de gran fuerza y precisión extrema que puede detener el tiempo.', 'Parte 3', 'https://static.jojowiki.com/images/2/2d/latest/20210316191453/Star_Platinum_SC_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'A', 'A'),
(2, NULL, 'Magician s Red', 'Stand de fuego con gran control de llamas y ataques a distancia.', 'Parte 3', 'https://static.jojowiki.com/images/5/56/latest/20210529144745/Magician%27s_Red_Infobox_Manga.png', NULL, 'B', 'B', 'C', 'B', 'C', 'D'),
(3, NULL, 'Hermit Purple', 'Stand de enredaderas que permite rastrear y obtener información.', 'Parte 3 y Parte 4', 'https://static.jojowiki.com/images/c/c1/latest/20260226030336/Hermit_Purple_SC_Infobox_Manga.png', NULL, 'D', 'C', 'D', 'A', 'D', 'E'),
(4, NULL, 'Hierophant Green', 'Stand versátil que ataca a distancia y puede infiltrarse en objetos.', 'Parte 3', 'https://static.jojowiki.com/images/8/8e/latest/20260314161255/Hierophant_Green_Infobox_Manga.png', NULL, 'C', 'B', 'A', 'B', 'C', 'D'),
(5, NULL, 'Silver Chariot', 'Stand de combate especializado en esgrima, extremadamente rápido y preciso en ataques cuerpo a cuerpo.', 'Parte 3', 'https://static.jojowiki.com/images/9/9b/latest/20220502142632/Silver_Chariot_SC_Infobox_Manga.png', NULL, 'B', 'A', 'C', 'C', 'B', 'C'),
(6, NULL, 'The World', 'Stand de gran poder físico capaz de detener el tiempo durante unos segundos y atacar sin oposición.', 'Parte 3', 'https://static.jojowiki.com/images/f/f5/latest/20210424162912/The_World_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'A', 'B'),
(7, NULL, 'Crazy Diamond', 'Stand con gran fuerza que puede reparar objetos y seres vivos devolviéndolos a su estado original.', 'Parte 4', 'https://static.jojowiki.com/images/c/c5/latest/20200625184236/Crazy_Diamond_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'B', 'C'),
(8, 9, 'Echoes Act 1', 'Stand que materializa sonidos escritos, permitiendo manipular el entorno mediante efectos sonoros.', 'Parte 4', 'https://static.jojowiki.com/images/d/db/latest/20230330014026/Echoes_ACT1_DU_Infobox_Manga.png', NULL, 'E', 'C', 'B', 'C', 'C', 'A'),
(9, 10, 'Echoes Act 2', 'Evolución de Echoes que convierte palabras en efectos físicos capaces de afectar directamente a los objetivos.', 'Parte 4', 'https://static.jojowiki.com/images/1/11/latest/20220313112608/Echoes_ACT2_DU_Infobox_Manga.png', NULL, 'C', 'C', 'B', 'C', 'C', 'A'),
(10, NULL, 'Echoes Act 3', 'Forma final de Echoes que puede aumentar el peso de los objetos y enemigos mediante su habilidad gravitacional.', 'Parte 4', 'https://static.jojowiki.com/images/c/cd/latest/20220313115644/Echoes_ACT1_VA_Infobox_Manga.png', NULL, 'B', 'C', 'C', 'B', 'C', 'C'),
(11, NULL, 'The Hand', 'Stand con la capacidad de borrar el espacio que toca, eliminando todo lo que se encuentre en su trayectoria.', 'Parte 4', 'https://static.jojowiki.com/images/2/20/latest/20260218065303/The_Hand_Infobox_Manga.png', NULL, 'A', 'B', 'D', 'A', 'C', 'C'),
(12, NULL, 'Heavens Door', 'Stand que transforma a las personas en libros, permitiendo leer y alterar sus recuerdos y acciones.', 'Parte 4', 'https://static.jojowiki.com/images/d/de/latest/20191228045732/Heaven%27s_Door_Infobox_Manga.png', NULL, 'C', 'B', 'B', 'B', 'A', 'B'),
(13, 25, 'Gold Experience', 'Stand de corto alcance capaz de crear vida a partir de objetos inertes y usarla de forma estratégica.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Gold_Experience_Infobox_Manga.png', NULL, 'C', 'A', 'C', 'D', 'C', 'A'),
(25, NULL, 'Gold Experience Requiem', 'Evolución de Gold Experience con el poder de anular acciones y devolver todo a cero.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Gold_Experience_Requiem_Infobox_Manga.png', NULL, 'A', 'A', 'A', 'A', 'A', 'A'),
(14, NULL, 'Sticky Fingers', 'Stand veloz que crea cremalleras en cualquier superficie para abrir, separar o atravesar objetos.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Sticky_Fingers_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'C', 'D'),
(15, NULL, 'Sex Pistols', 'Stand dividido en pequeñas entidades que manipulan la trayectoria de las balas disparadas.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Sex_Pistols_Infobox_Manga.png', NULL, 'B', 'B', 'B', 'A', 'A', 'C'),
(16, NULL, 'Aerosmith', 'Stand con forma de avión capaz de disparar, lanzar bombas y rastrear enemigos por dióxido de carbono.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Aerosmith_Infobox_Manga.jpg', NULL, 'B', 'B', 'C', 'C', 'C', 'C'),
(17, NULL, 'Moody Blues', 'Stand que reproduce acciones pasadas de una persona en un lugar concreto como si fuera una grabación.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/Moody_Blues_Infobox_Manga.png', NULL, 'C', 'C', 'A', 'A', 'B', 'C'),
(18, NULL, 'King Crimson', 'Stand extremadamente poderoso que puede borrar intervalos de tiempo y anticipar movimientos enemigos.', 'Parte 5', 'https://jojowiki.com/Special:Redirect/file/King_Crimson_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'A', 'E'),
(19, NULL, 'Stone Free', 'Stand que permite transformar el cuerpo de su usuaria en hilos para atacar, defenderse o moverse.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/Stone_Free_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(20, NULL, 'Kiss', 'Stand que coloca pegatinas capaces de duplicar objetos y dañarlos al volver a unirse.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/Kiss_Infobox_Manga.png', NULL, 'A', 'A', 'C', 'A', 'C', 'A'),
(21, NULL, 'Weather Report', 'Stand muy versátil capaz de controlar el clima y manipular fenómenos atmosféricos a gran escala.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/Weather_Report_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(22, 23, 'Whitesnake', 'Stand que extrae recuerdos y Stands en forma de discos, permitiendo robar o manipular habilidades.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/Whitesnake_Infobox_Manga.png', NULL, 'C', 'B', 'C', 'A', 'B', 'A'),
(23, 24, 'C-Moon', 'Stand evolucionado que altera la gravedad alrededor de su usuario y puede invertir cuerpos y superficies.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/C-MOON_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'A', 'C', 'A'),
(24, NULL, 'Made in Heaven', 'Forma final de la evolución de Pucci, capaz de acelerar el tiempo hasta reiniciar el universo.', 'Parte 6', 'https://jojowiki.com/Special:Redirect/file/Made_in_Heaven_Infobox_Manga.png', NULL, 'A', 'A', 'A', 'A', 'C', 'A');

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
(24, 20),
(25, 11);

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
