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
(20, 'Enrico Pucci', 'Sacerdote con evolución de Stand', 'Parte 6', NULL, NULL),
(21, 'Iggy', 'Perro aliado del grupo de Stardust Crusaders con control sobre arena.', 'Parte 3', NULL, NULL),
(22, 'J. Geil', 'Asesino que utiliza reflejos para atacar con su Stand.', 'Parte 3', NULL, NULL),
(23, 'Hol Horse', 'Pistolero mercenario que combate utilizando balas manipulables.', 'Parte 3', NULL, NULL),
(24, 'Vanilla Ice', 'Sirviente fanático de DIO con un Stand basado en el vacío absoluto.', 'Parte 3', NULL, NULL),
(25, 'Yoshikage Kira', 'Asesino serial obsesionado con mantener una vida tranquila mientras utiliza explosiones letales.', 'Parte 4', NULL, NULL),
(26, 'Keicho Nijimura', 'Líder militarizado que controla un ejército miniatura mediante su Stand.', 'Parte 4', NULL, NULL),
(27, 'Akira Otoishi', 'Usuario eléctrico obsesionado con la música y el poder.', 'Parte 4', NULL, NULL),
(28, 'Pannacotta Fugo', 'Miembro temperamental de Bucciarati con un Stand viral extremadamente peligroso.', 'Parte 5', NULL, NULL),
(29, 'Trish Una', 'Hija de Diavolo con un Stand capaz de volver blandos los objetos.', 'Parte 5', NULL, NULL),
(30, 'Risotto Nero', 'Líder del grupo La Squadra especializado en asesinatos silenciosos.', 'Parte 5', NULL, NULL),
(31, 'Emporio Alnino', 'Niño superviviente de Green Dolphin Street con acceso a objetos fantasma.', 'Parte 6', NULL, NULL),
(32, 'Foo Fighters', 'Entidad de plancton inteligente que adopta forma humana.', 'Parte 6', NULL, NULL),
(33, 'Narciso Anasui', 'Prisionero obsesionado con Jolyne y experto en infiltración estructural.', 'Parte 6', NULL, NULL),
(34, 'Johnny Joestar', 'Jinete protagonista que desarrolla el poder del Spin y la evolución de Tusk.', 'Parte 7', NULL, NULL),
(35, 'Gyro Zeppeli', 'Maestro del Spin y participante de la Steel Ball Run.', 'Parte 7', NULL, NULL),
(36, 'Lucy Steel', 'Figura clave relacionada con poderes de protección y fortuna.', 'Parte 7', NULL, NULL),
(37, 'Diego Brando', 'Jinete rival de Johnny con habilidades dinosaurio gracias a su Stand.', 'Parte 7', NULL, NULL),
(38, 'Doctor Ferdinand', 'Paleontólogo obsesionado con los dinosaurios y usuario secundario de Scary Monsters.', 'Parte 7', NULL, NULL),
(39, 'Funny Valentine', 'Presidente de Estados Unidos capaz de manipular dimensiones paralelas.', 'Parte 7', NULL, NULL),
(40, 'Diego Brando (Alternate Universe)', 'Versión alternativa de Diego que posee The World.', 'Parte 7', NULL, NULL),
(41, 'Josuke Higashikata (Parte 8)', 'Protagonista de JoJolion con habilidades relacionadas con burbujas especiales.', 'Parte 8', NULL, NULL),
(42, 'Tooru', 'Antagonista capaz de provocar calamidades inevitables mediante Wonder of U.', 'Parte 8', NULL, NULL),
(43, 'Yoshikage Kira (Parte 8)', 'Versión alternativa del universo JoJolion vinculada a Killer Queen.', 'Parte 8', NULL, NULL),
(44, 'Jodio Joestar', 'Protagonista de The JOJOLands con control sobre lluvia pesada.', 'Parte 9', NULL, NULL),
(45, 'Rohan Kishibe (Parte 9)', 'Versión alternativa de Rohan presente en The JOJOLands.', 'Parte 9', NULL, NULL),
(46, 'Yoshifumi Kujo', 'Identidad original relacionada con el origen de Soft and Wet.', 'Parte 8', NULL, NULL);

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
(1, NULL, 'Star Platinum', 'Stand de gran fuerza y precisión extrema que puede detener el tiempo.', 'Parte 3', 'https://static.jojowiki.com/images/2/2d/latest/20210316191453/Star_Platinum_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/ca/latest/20200927002609/Star_Platinum_SC_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'A'),
(2, NULL, 'Magician s Red', 'Stand de fuego con gran control de llamas y ataques a distancia.', 'Parte 3', 'https://static.jojowiki.com/images/5/56/latest/20210529144745/Magician%27s_Red_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/48/latest/20220916201225/Magician%27s_Red_Infobox_Anime.png', 'B', 'B', 'C', 'B', 'C', 'D'),
(3, NULL, 'Hermit Purple', 'Stand de enredaderas que permite rastrear y obtener información.', 'Parte 3 y Parte 4', 'https://static.jojowiki.com/images/c/c1/latest/20260226030336/Hermit_Purple_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/0a/latest/20220922193045/Hermit_Purple_SC_Infobox_Anime.png', 'D', 'C', 'D', 'A', 'D', 'E'),
(4, NULL, 'Hierophant Green', 'Stand versátil que ataca a distancia y puede infiltrarse en objetos.', 'Parte 3', 'https://static.jojowiki.com/images/8/8e/latest/20260314161255/Hierophant_Green_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/3e/latest/20210616200106/Hierophant_Green_Infobox_Anime.png', 'C', 'B', 'A', 'B', 'C', 'D'),
(5, NULL, 'Silver Chariot', 'Stand de combate especializado en esgrima, extremadamente rápido y preciso en ataques cuerpo a cuerpo.', 'Parte 3 y Parte 5', 'https://static.jojowiki.com/images/9/9b/latest/20220502142632/Silver_Chariot_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/09/latest/20221019190021/Silver_Chariot_SC_Infobox_Anime.png', 'B', 'A', 'C', 'C', 'B', 'C'),
(6, NULL, 'The World', 'Stand de gran poder físico capaz de detener el tiempo durante unos segundos y atacar sin oposición.', 'Parte 3', 'https://static.jojowiki.com/images/f/f5/latest/20210424162912/The_World_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/7e/latest/20221004175724/The_World_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'B'),
(7, NULL, 'Crazy Diamond', 'Stand con gran fuerza que puede reparar objetos y seres vivos devolviéndolos a su estado original.', 'Parte 4', 'https://static.jojowiki.com/images/c/c5/latest/20200625184236/Crazy_Diamond_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/b5/latest/20191015215419/Crazy_Diamond_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'B', 'C'),
(8, 9, 'Echoes Act 1', 'Stand que materializa sonidos escritos, permitiendo manipular el entorno mediante efectos sonoros.', 'Parte 4', 'https://static.jojowiki.com/images/d/db/latest/20230330014026/Echoes_ACT1_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/d/dc/latest/20210424210829/Echoes_ACT1_DU_Infobox_Anime.png', 'E', 'C', 'B', 'C', 'C', 'A'),
(9, 10, 'Echoes Act 2', 'Evolución de Echoes que convierte palabras en efectos físicos capaces de afectar directamente a los objetivos.', 'Parte 4', 'https://static.jojowiki.com/images/1/11/latest/20220313112608/Echoes_ACT2_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/69/latest/20231215131846/Echoes_ACT2_DU_Infobox_Anime.png', 'C', 'C', 'B', 'C', 'C', 'A'),
(10, NULL, 'Echoes Act 3', 'Forma final de Echoes que puede aumentar el peso de los objetos y enemigos mediante su habilidad gravitacional.', 'Parte 4', 'https://static.jojowiki.com/images/4/4e/latest/20191015214620/Echoes_ACT3_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/8e/latest/20210422175130/Echoes_ACT3_DU_Infobox_Anime.png', 'B', 'C', 'C', 'B', 'C', 'C'),
(11, NULL, 'The Hand', 'Stand con la capacidad de borrar el espacio que toca, eliminando todo lo que se encuentre en su trayectoria.', 'Parte 4', 'https://static.jojowiki.com/images/2/20/latest/20260218065303/The_Hand_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/ae/latest/20210111150120/The_Hand_Infobox_Anime.png', 'A', 'B', 'D', 'A', 'C', 'C'),
(12, NULL, 'Heavens Door', 'Stand que transforma a las personas en libros, permitiendo leer y alterar sus recuerdos y acciones.', 'Parte 4', 'https://static.jojowiki.com/images/d/de/latest/20191228045732/Heaven%27s_Door_Infobox_Manga.png', 'https://static.jojowiki.com/images/5/50/latest/20210203193008/Heaven%27s_Door_Infobox_Anime.png', 'C', 'B', 'B', 'B', 'A', 'B'),
(13, 25, 'Gold Experience', 'Stand de corto alcance capaz de crear vida a partir de objetos inertes y usarla de forma estratégica.', 'Parte 5', 'https://static.jojowiki.com/images/2/28/latest/20241013015824/Gold_Experience_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/81/latest/20210707053105/Gold_Experience_Infobox_Anime.png', 'C', 'A', 'C', 'D', 'C', 'A'),
(25, NULL, 'Gold Experience Requiem', 'Evolución de Gold Experience con el poder de anular acciones y devolver todo a cero.', 'Parte 5', 'https://static.jojowiki.com/images/1/13/latest/20210525092302/GER_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/19/latest/20220802141706/GER_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'A', 'A'),
(14, NULL, 'Sticky Fingers', 'Stand veloz que crea cremalleras en cualquier superficie para abrir, separar o atravesar objetos.', 'Parte 5', 'https://static.jojowiki.com/images/4/42/latest/20251201143842/Sticky_Fingers_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/78/latest/20221006032155/Sticky_Fingers_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'C', 'D'),
(15, NULL, 'Sex Pistols', 'Stand dividido en pequeñas entidades que manipulan la trayectoria de las balas disparadas.', 'Parte 5', 'https://static.jojowiki.com/images/3/3d/latest/20191015212825/Sex_Pistols_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/b9/latest/20210521114106/Sex_Pistols_Infobox_Anime.png', 'B', 'B', 'B', 'A', 'A', 'C'),
(16, NULL, 'Aerosmith', 'Stand con forma de avión capaz de disparar, lanzar bombas y rastrear enemigos por dióxido de carbono.', 'Parte 5', 'https://static.jojowiki.com/images/b/be/latest/20240220023709/Aerosmith_Infobox_Manga.jpg', 'https://static.jojowiki.com/images/7/7c/latest/20210701024635/Aerosmith_Infobox_Anime.png', 'B', 'B', 'C', 'C', 'C', 'C'),
(17, NULL, 'Moody Blues', 'Stand que reproduce acciones pasadas de una persona en un lugar concreto como si fuera una grabación.', 'Parte 5', 'https://static.jojowiki.com/images/9/93/latest/20230520124240/Moody_Blues_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/91/latest/20220916205647/Moody_Blues_Infobox_Anime.png', 'C', 'C', 'A', 'A', 'B', 'C'),
(18, NULL, 'King Crimson', 'Stand extremadamente poderoso que puede borrar intervalos de tiempo y anticipar movimientos enemigos.', 'Parte 5', 'https://static.jojowiki.com/images/8/85/latest/20191015214647/King_Crimson_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c6/latest/20241012182526/King_Crimson_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'E'),
(19, NULL, 'Stone Free', 'Stand que permite transformar el cuerpo de su usuaria en hilos para atacar, defenderse o moverse.', 'Parte 6', 'https://static.jojowiki.com/images/2/24/latest/20220925022203/Stone_Free_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/03/latest/20230826070709/Stone_Free_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'A'),
(20, NULL, 'Kiss', 'Stand que coloca pegatinas capaces de duplicar objetos y dañarlos al volver a unirse.', 'Parte 6', 'https://static.jojowiki.com/images/7/77/latest/20210829145227/Kiss_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/24/latest/20230826110958/Kiss_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'C', 'A'),
(21, NULL, 'Weather Report', 'Stand muy versátil capaz de controlar el clima y manipular fenómenos atmosféricos a gran escala.', 'Parte 6', 'https://static.jojowiki.com/images/8/8a/latest/20211109144423/Weather_Report_Stand_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/ac/latest/20230826110804/Weather_Report_Stand_Anime_Infobox.png', 'A', 'B', 'C', 'A', 'C', 'A'),
(22, 23, 'Whitesnake', 'Stand que extrae recuerdos y Stands en forma de discos, permitiendo robar o manipular habilidades.', 'Parte 6', 'https://static.jojowiki.com/images/6/62/latest/20231210172019/Whitesnake_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/91/latest/20241001191051/Whitesnake_Infobox_Anime.png', 'C', 'B', 'C', 'A', 'B', 'A'),
(23, 24, 'C-Moon', 'Stand evolucionado que altera la gravedad alrededor de su usuario y puede invertir cuerpos y superficies.', 'Parte 6', 'https://static.jojowiki.com/images/2/23/latest/20221204031754/C-MOON_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/e8/latest/20221202021237/C-MOON_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'A'),
(24, NULL, 'Made in Heaven', 'Forma final de la evolución de Pucci, capaz de acelerar el tiempo hasta reiniciar el universo.', 'Parte 6', 'https://static.jojowiki.com/images/b/bb/latest/20211117220434/Made_in_Heaven_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a4/latest/20221205184222/Made_in_Heaven_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'C', 'A'),
(26, NULL, 'The Fool', 'Stand con forma cambiante compuesto de arena capaz de adoptar distintas estructuras para atacar o defender.', 'Parte 3', 'https://static.jojowiki.com/images/f/f0/latest/20191015214051/The_Fool_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/10/latest/20210312225357/The_Fool_Infobox_Anime.png', 'B', 'C', 'D', 'B', 'D', 'C'),
(27, NULL, 'Hanged Man', 'Stand que viaja a través de superficies reflectantes y ataca a gran velocidad desde los reflejos.', 'Parte 3', 'https://static.jojowiki.com/images/2/26/latest/20220407125952/Hanged_Man_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/1f/latest/20220917022046/Hanged_Man_Infobox_Anime.png', 'C', 'A', 'A', 'C', 'B', 'D'),
(28, NULL, 'Emperor', 'Stand con forma de pistola capaz de disparar balas manipulables por su usuario.', 'Parte 3', 'https://static.jojowiki.com/images/c/cf/latest/20240221172024/Emperor_Infobox_Manga.png' , 'https://static.jojowiki.com/images/5/5d/latest/20220917022257/Emperor_Infobox_Anime.png', 'B', 'B', 'B', 'D', 'A', 'D'),
(29, NULL, 'Cream', 'Stand capaz de devorar materia y desplazarse dentro del vacío absoluto.', 'Parte 3', 'https://static.jojowiki.com/images/0/0c/latest/20191015214713/Cream_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/7f/latest/20220916193130/Cream_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'D'),
(30, NULL, 'Anubis', 'Stand vinculado a una espada maldita que puede poseer a quienes la utilizan.', 'Parte 3', 'https://static.jojowiki.com/images/c/c5/latest/20240528161709/Anubis_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/64/latest/20220916183812/Anubis_Infobox_Anime.png', 'B', 'A', 'E', 'B', 'A', 'C'),
(31, 32, 'Killer Queen', 'Stand explosivo capaz de convertir cualquier objeto en una bomba letal mediante el contacto.', 'Parte 4', 'https://static.jojowiki.com/images/f/fb/latest/20210420222949/Killer_Queen_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/14/latest/20221020232023/Killer_Queen_Infobox_Anime.png', 'A', 'B', 'D', 'A', 'B', 'A'),
(32, NULL, 'Killer Queen (Bites the Dust)', 'Evolución de Killer Queen capaz de crear bucles temporales automáticos ligados a explosiones.', 'Parte 4', 'https://static.jojowiki.com/images/f/f9/latest/20260218063857/Bites_the_Dust_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/cb/latest/20230313162119/Bites_the_Dust_Infobox_Anime.png', 'A', 'B', 'A', 'A', 'A', 'A'),
(33, NULL, 'Bad Company', 'Stand compuesto por un ejército militar miniatura equipado con armas y vehículos.', 'Parte 4', 'https://static.jojowiki.com/images/d/d0/latest/20220930220817/Bad_Company_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/4a/latest/20221020231958/Bad_Company_Infobox_Anime.png', 'B', 'B', 'C', 'C', 'B', 'C'),
(34, NULL, 'Red Hot Chili Pepper', 'Stand eléctrico capaz de desplazarse por cables y absorber energía.', 'Parte 4', 'https://static.jojowiki.com/images/6/6b/latest/20210716115856/RHCP_Infobox_Manga.png', 'https://static.jojowiki.com/images/5/59/latest/20191015213016/RHCP_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'B', 'A'),
(35, NULL, 'Purple Haze', 'Stand extremadamente agresivo que libera un virus mortal al romper sus cápsulas.', 'Parte 5', 'https://static.jojowiki.com/images/8/82/latest/20210215173755/Purple_Haze_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/ca/latest/20191015214140/Purple_Haze_Infobox_Anime.png', 'A', 'A', 'C', 'D', 'E', 'A'),
(36, NULL, 'Spice Girl', 'Stand que puede volver blandos y flexibles los objetos para absorber impactos.', 'Parte 5', 'https://static.jojowiki.com/images/8/84/latest/20191015214711/Spice_Girl_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/21/latest/20200118002424/Spice_Girl_Infobox_Anime.png', 'C', 'B', 'C', 'A', 'C', 'A'),
(37, NULL, 'Metallica', 'Stand microscópico que manipula el hierro presente en la sangre y el entorno.', 'Parte 5', 'https://static.jojowiki.com/images/4/46/latest/20260226035811/Metallica_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c0/latest/20241122144847/Metallica_Infobox_Anime.png', 'C', 'C', 'C', 'A', 'A', 'C'),
(38, NULL, 'Chariot Requiem', 'Forma evolucionada de Silver Chariot con poderes relacionados con almas y transformación.', 'Parte 5', 'https://static.jojowiki.com/images/e/e8/latest/20230328152452/Chariot_Requiem_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/12/latest/20211210020712/Chariot_Requiem_Infobox_Anime.png', 'A', 'B', 'A', 'A', 'C', 'A'),
(39, NULL, 'Burning Down the House', 'Stand que permite acceder y manipular objetos fantasma de estructuras destruidas.', 'Parte 6', 'https://static.jojowiki.com/images/0/00/latest/20191015215502/BDtH_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/20/latest/20220919210706/BDtH_Infobox_Anime.png', 'E', 'E', 'C', 'C', 'D', 'C'),
(40, NULL, 'Foo Fighters', 'Stand compuesto por plancton inteligente capaz de regenerarse y controlar cuerpos.', 'Parte 6', 'https://static.jojowiki.com/images/0/07/latest/20210313143756/Foo_Fighters_Stand_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/37/latest/20220902190331/Foo_Fighters_Stand_Anime_Infobox.png', 'B', 'B', 'C', 'A', 'C', 'A'),
(41, NULL, 'Diver Down', 'Stand capaz de introducirse dentro de objetos o cuerpos y modificar su estructura interna.', 'Parte 6', 'https://static.jojowiki.com/images/9/98/latest/20211112115109/Diver_Down_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c6/latest/20230826110448/Diver_Down_Anime_Infobox.png', 'A', 'A', 'C', 'A', 'B', 'B'),
(42, 43, 'Tusk Act 1', 'Primera forma de Tusk, capaz de disparar uñas giratorias con energía rotacional.', 'Parte 7', 'https://static.jojowiki.com/images/c/ce/latest/20210323194311/Tusk_ACT1_SBR_Infobox_Manga.png', '', 'D', 'D', 'B', 'A', 'B', 'A'),
(43, 44, 'Tusk Act 2', 'Evolución de Tusk que añade trayectorias móviles a sus disparos rotacionales.', 'Parte 7', 'https://static.jojowiki.com/images/5/5c/latest/20221023143640/Tusk_ACT2_SBR_Infobox_Manga.png', '', 'C', 'C', 'B', 'A', 'B', 'A'),
(44, 45, 'Tusk Act 3', 'Forma avanzada de Tusk capaz de utilizar agujeros dimensionales ligados a la rotación.', 'Parte 7', 'https://static.jojowiki.com/images/8/82/latest/20260312011542/Tusk_ACT3_SBR_Infobox_Manga.png', '', 'B', 'B', 'B', 'A', 'B', 'A'),
(45, NULL, 'Tusk Act 4', 'Forma definitiva de Tusk que utiliza la rotación infinita para atravesar cualquier defensa.', 'Parte 7', 'https://static.jojowiki.com/images/8/83/latest/20220321010212/Tusk_ACT4_SBR_Infobox_Manga.png', '', 'A', 'A', 'A', 'A', 'A', 'A'),
(46, NULL, 'Ball Breaker', 'Stand vinculado a la técnica del Spin capaz de afectar directamente al envejecimiento.', 'Parte 7', 'https://static.jojowiki.com/images/e/ee/latest/20210109000447/Ball_Breaker_Infobox_Manga.png', '', 'A', 'B', 'C', 'A', 'B', 'A'),
(47, NULL, 'Ticket to Ride', 'Poder relacionado con la protección divina y la canalización de la fortuna.', 'Parte 7', 'https://static.jojowiki.com/images/e/e7/latest/20240203231516/Ticket_to_Ride_Infobox_Manga.png', '', 'E', 'E', 'A', 'A', 'E', 'A'),
(48, NULL, 'Scary Monsters', 'Stand que transforma seres vivos en dinosaurios y otorga habilidades prehistóricas.', 'Parte 7', 'https://static.jojowiki.com/images/1/14/latest/20241023050843/Scary_Monsters_Infobox_Manga.png', '', 'A', 'B', 'C', 'A', 'C', 'A'),
(49, 50, 'D4C', 'Stand dimensional capaz de viajar entre universos paralelos y manipular realidades alternativas.', 'Parte 7', 'https://static.jojowiki.com/images/0/01/latest/20250601031840/D4C_Infobox_Manga.png', '', 'A', 'A', 'A', 'A', 'A', 'A'),
(50, NULL, 'D4C (Love Train)', 'Evolución de D4C que desvía toda desgracia lejos de su usuario mediante una barrera dimensional.', 'Parte 7', 'https://static.jojowiki.com/images/1/19/latest/20250601021013/D4C_Love_Train_Infobox_Manga.JPG', '', 'A', 'A', 'A', 'A', 'A', 'A'),
(51, NULL, 'The World', 'Versión alternativa de The World perteneciente al universo de Steel Ball Run con control temporal.', 'Parte 7', 'https://static.jojowiki.com/images/8/8a/latest/20220924001200/THE_WORLD_Infobox_Manga.PNG', '', 'A', 'A', 'C', 'A', 'A', 'B'),
(52, NULL, 'Soft and Wet', 'Stand capaz de crear burbujas especiales que roban propiedades físicas o abstractas.', 'Parte 8', 'https://static.jojowiki.com/images/5/55/latest/20220801101811/Soft_%26_Wet_Infobox_Manga.png', '', 'B', 'B', 'C', 'B', 'B', 'A'),
(53, NULL, 'Wonder of U', 'Stand automático que provoca calamidades inevitables contra quienes persiguen a su usuario.', 'Parte 8', 'https://static.jojowiki.com/images/2/24/latest/20210418202241/Wonder_of_U_Hybrid_Infobox_Manga.png', '', 'A', 'A', 'A', 'A', 'A', 'A'),
(54, NULL, 'Killer Queen (Parte 8)', 'Versión alternativa de Killer Queen con capacidades explosivas adaptadas al universo de JoJolion.', 'Parte 8', 'https://static.jojowiki.com/images/1/16/latest/20260423070746/Killer_Queen_JJL_Infobox_Manga.png', '', 'A', 'B', 'D', 'A', 'B', 'A'),
(55, NULL, 'November Rain', 'Stand capaz de generar lluvia extremadamente pesada para aplastar objetivos.', 'Parte 9', 'https://static.jojowiki.com/images/b/bf/latest/20231223005916/November_Rain_Infobox_Manga.png', '', 'B', 'C', 'B', 'A', 'B', 'A'),
(56, NULL, 'Heavens Door (Parte 9)', 'Versión alternativa de Heaven s Door con habilidades relacionadas con manipulación de información y percepción.', 'Parte 9', 'https://static.jojowiki.com/images/c/c3/latest/20231219050605/Heaven%27s_Door_TJL_Infobox_Manga.png', '', 'C', 'B', 'B', 'B', 'A', 'B');
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
(25, 11),
(26, 21),
(27, 22),
(28, 23),
(29, 24),
(31, 25),
(32, 25),
(33, 26),
(34, 27),
(35, 28),
(36, 29),
(37, 30),
(38, 5),
(39, 31),
(21, 31),
(40, 32),
(41, 33),
(42, 34),
(43, 34),
(44, 34),
(45, 34),
(46, 35),
(47, 36),
(48, 37),
(48, 38),
(49, 39),
(50, 39),
(50, 36),
(51, 40),
(52, 46),
(53, 42),
(54, 43),
(55, 44),
(56, 45);

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
