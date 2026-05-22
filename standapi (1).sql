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
(1, 'Jotaro Kujo', 'Protagonista de la Parte 3; estudiante serio que viaja a Egipto para derrotar a DIO y salvar a su madre; nieto de Joseph.', 'Parte 3, 4, 5 y 6', 'https://static.jojowiki.com/images/6/69/latest/20201130220440/Jotaro_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/3a/latest/20210430072039/Jotaro_SC_Infobox_Anime.png'),
(2, 'Muhammad Avdol', 'Aliado leal de Joseph y Jotaro con poderes de fuego.', 'Parte 3', 'https://static.jojowiki.com/images/a/a8/latest/20260218075959/Avdol_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/80/latest/20210430075909/Avdol_Infobox_Anime.png'),
(3, 'Joseph Joestar', 'Protagonista de la Parte 2; abuelo de Jotaro; veterano astuto que guía al grupo.', 'Parte 2, 3 y 4', 'https://static.jojowiki.com/images/4/4a/latest/20221007033126/Joseph_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a1/latest/20211011184730/Joseph_SC_Infobox_Anime.png'),
(4, 'Noriaki Kakyoin', 'Estudiante aliado de Jotaro; inteligente y estratégico.', 'Parte 3', 'https://static.jojowiki.com/images/6/67/latest/20240807163352/Kakyoin_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/9f/latest/20210507202834/Kakyoin_Infobox_Anime.png'),
(5, 'Jean Pierre Polnareff', 'Frances aliado de Jotaro; espadachín impulsivo que busca venganza por la muerte de su hermana.', 'Parte 3 y 5', 'https://static.jojowiki.com/images/b/be/latest/20210512192332/Polnareff_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/ba/latest/20211013051059/Polnareff_SC_Infobox_Anime.png'),
(6, 'DIO', 'Vampiro y villano principal; enemigo histórico de los Joestar, usa el cuerpo de Jonathan y domina el tiempo.', 'Parte 1 y 3', 'https://static.jojowiki.com/images/b/b5/latest/20220116051744/DIO_Normal_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/0a/latest/20210424101455/DIO_Normal_SC_Infobox_Anime.png'),
(7, 'Josuke Higashikata', 'Protagonista de la Parte 4; chico amable de Morioh con poder de reparar cualquier cosa; hijo ilegítimo de Joseph.', 'Parte 4', 'https://static.jojowiki.com/images/a/a1/latest/20221007024100/Josuke_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/49/latest/20250817060117/Josuke_DU_Infobox_Anime.png'),
(8, 'Koichi Hirose', 'Amigo cercano de Josuke; evoluciona mucho como luchador.', 'Parte 4 y 5', 'https://static.jojowiki.com/images/4/4e/latest/20210107173808/Koichi_Hirose_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/9b/latest/20211012034402/Koichi_Hirose_Infobox_Anime.png'),
(9, 'Okuyasu Nijimura', 'Mejor amigo de Josuke; fuerte pero algo torpe.', 'Parte 4', 'https://static.jojowiki.com/images/3/3b/latest/20241202150518/Okuyasu_Nijimura_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/80/latest/20210907213301/Okuyasu_Nijimura_Infobox_Anime.png'),
(10, 'Rohan Kishibe', 'Mangaka excéntrico con un poder muy peculiar.', 'Parte 4', 'https://static.jojowiki.com/images/2/2e/latest/20250218031607/Rohan_Kishibe_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/9e/latest/20210314044358/Rohan_Kishibe_Infobox_Anime.png'),
(11, 'Giorno Giovanna', 'Protagonista de la Parte 5; hijo de DIO (con el cuerpo de Jonathan) que quiere reformar la mafia.', 'Parte 5', 'https://static.jojowiki.com/images/2/21/latest/20210313222135/Giorno_Giovanna_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/4a/latest/20210422070411/Giorno_Giovanna_Infobox_Anime.png'),
(12, 'Bruno Bucciarati', 'Líder del grupo; mentor de Giorno dentro de la mafia.', 'Parte 5', 'https://static.jojowiki.com/images/c/cc/latest/20210908165838/Bruno_Bucciarati_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a2/latest/20210513091755/Bruno_Bucciarati_Infobox_Anime.png'),
(13, 'Guido Mista', 'Pistolero supersticioso; fiel compañero de Giorno.', 'Parte 5', 'https://static.jojowiki.com/images/1/17/latest/20201214192335/Guido_Mista_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c6/latest/20210827063749/Guido_Mista_Infobox_Anime.png'),
(14, 'Narancia Ghirga', 'Joven impulsivo con un pasado difícil.', 'Parte 5', 'https://static.jojowiki.com/images/c/c2/latest/20230320122834/Narancia_Ghirga_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/44/latest/20201126091532/Narancia_Ghirga_Infobox_Anime.png'),
(15, 'Leone Abbacchio', 'Ex policía; serio y desconfiado, pero leal a Bucciarati.', 'Parte 5', 'https://static.jojowiki.com/images/0/05/latest/20240711031041/Leone_Abbacchio_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/ee/latest/20210827060558/Leone_Abbacchio_Infobox_Anime.png'),
(16, 'Diavolo', 'Líder secreto de la mafia Passione; quiere borrar su identidad y controlar el destino.', 'Parte 5', 'https://static.jojowiki.com/images/0/03/latest/20250601031900/Diavolo_Revealed_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/21/latest/20250601031852/Diavolo_Revealed_Infobox_Anime.png'),
(17, 'Jolyne Cujoh', 'Protagonista de la Parte 6; hija de Jotaro que acaba en prisión; lucha para detener el plan de Pucci.', 'Parte 6', 'https://static.jojowiki.com/images/2/20/latest/20200923041552/Jolyne_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/03/latest/20220905170256/Jolyne_Cujoh_Infobox_Anime.png'),
(18, 'Ermes Costello', 'Aliada de Jolyne en prisión; busca venganza.', 'Parte 6', 'https://static.jojowiki.com/images/8/8a/latest/20210520090701/Ermes_Costello_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/1f/latest/20220304040153/Ermes_Costello_Infobox_Anime.png'),
(19, 'Weather Report', 'Aliado con pasado trágico y poderes climáticos; se desconoce su nombre por lo que se le llama como a su Stand.', 'Parte 6', 'https://static.jojowiki.com/images/f/f3/latest/20210201073132/Weather_Report_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/8e/latest/20231022194830/Weather_Report_Infobox_Anime.png'),
(20, 'Enrico Pucci', 'Sacerdote y seguidor de DIO; busca alcancar el "cielo" siguiendo el diario de DIO.', 'Parte 6', 'https://static.jojowiki.com/images/d/d3/latest/20241130134017/Pucci_Original_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/2b/latest/20230401105327/Pucci_Infobox_Anime.png'),
(21, 'Iggy', 'Perro desobediente aliado del grupo de Jotaro; le encantan los chicles de café.', 'Parte 3', 'https://static.jojowiki.com/images/a/af/latest/20201130220802/Iggy_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/31/latest/20201220221635/Iggy_Infobox_Anime.png'),
(22, 'J. Geil', 'Asesino al servicio de DIO con dos manos derechas; hijo de Enya y responsable de la muerte de la hermana de Polnareff.', 'Parte 3', 'https://static.jojowiki.com/images/a/ae/latest/20200415174100/JGeil_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/92/latest/20200415174115/JGeil_Infobox_Anime.png'),
(23, 'Hol Horse', 'Pistolero mercenario de DIO; combate utilizando balas manipulables.', 'Parte 3', 'https://static.jojowiki.com/images/6/61/latest/20210530032357/Hol_Horse_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/64/latest/20210530063641/Hol_Horse_Infobox_Anime.png'),
(24, 'Vanilla Ice', 'Sirviente fanático de DIO y vampiro; con un Stand basado en el vacío absoluto.', 'Parte 3', 'https://static.jojowiki.com/images/f/ff/latest/20210318205840/Vanilla_Ice_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a8/latest/20210530021831/Vanilla_Ice_Infobox_Anime.png'),
(25, 'Yoshikage Kira', 'Asesino en serie obsesionado con la tranquilidad; vive oculto en Morioh.', 'Parte 4', 'https://static.jojowiki.com/images/c/ce/latest/20210107171552/Yoshikage_Kira_Original_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/10/latest/20230325211649/Yoshikage_Kira_Original_Infobox_Anime.png'),
(26, 'Keicho Nijimura', 'Hermano de Okuyasu; controla un ejército miniatura mediante su Stand.', 'Parte 4', 'https://static.jojowiki.com/images/9/9a/latest/20211006073546/Keicho_Nijimura_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/46/latest/20210907212017/Keicho_Nijimura_Infobox_Anime.png'),
(27, 'Akira Otoishi', 'Usuario eléctrico obsesionado con la música y el poder.', 'Parte 4', 'https://static.jojowiki.com/images/1/14/latest/20210422114825/Akira_Otoishi_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/31/latest/20211213170342/Akira_Otoishi_Infobox_Anime.png'),
(28, 'Pannacotta Fugo', 'Miembro con mal temperamento del grupo de Bucciarati; con un Stand viral extremadamente peligroso.', 'Parte 5', 'https://static.jojowiki.com/images/6/68/latest/20210607065345/Pannacotta_Fugo_Infobox_Manga.png', 'https://static.jojowiki.com/images/f/f7/latest/20201126081211/Pannacotta_Fugo_Infobox_Anime.png'),
(29, 'Trish Una', 'Hija de Diavolo; capaz de volver blandos los objetos.', 'Parte 5', 'https://static.jojowiki.com/images/6/61/latest/20251019230324/Trish_Una_Infobox_Manga.PNG', 'https://static.jojowiki.com/images/f/fc/latest/20210609202738/Trish_Una_Infobox_Anime.png'),
(30, 'Risotto Nero', 'Líder del grupo La Squadra; especializado en asesinatos silenciosos.', 'Parte 5', 'https://static.jojowiki.com/images/3/3e/latest/20201129070822/Risotto_Nero_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/2a/latest/20210806010338/Risotto_Nero_Infobox_Anime.png'),
(31, 'Emporio Alnino', 'Niño superviviente de Green Dolphin Street; con acceso a objetos fantasma.', 'Parte 6', 'https://static.jojowiki.com/images/a/a1/latest/20260306214854/Emporio_Alnino_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/26/latest/20220718124851/Emporio_Alnino_Infobox_Anime.png'),
(32, 'Foo Fighters', 'Entidad de plancton inteligente que adopta forma humana; aliada de Jolyne.', 'Parte 6', 'https://static.jojowiki.com/images/9/93/latest/20210323143846/F.F._Infobox_Manga.png', 'https://static.jojowiki.com/images/d/de/latest/20211204055511/F.F._Infobox_Anime.png'),
(33, 'Narciso Anasui', 'Prisionero obsesionado con Jolyne; experto en infiltración estructural.', 'Parte 6', 'https://static.jojowiki.com/images/7/76/latest/20221017142034/Narciso_Anasui_Infobox_Manga.png', 'https://static.jojowiki.com/images/d/d7/latest/20230208231420/Narciso_Anasui_Infobox_Anime.png'),
(34, 'Johnny Joestar', 'Protagonista de la Parte 7; exjinete paralítico que compite en la Steel Ball Run para poder volver a caminar.', 'Parte 7', 'https://static.jojowiki.com/images/b/b7/latest/20230129074253/Johnny_Joestar_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/e7/latest/20260306203832/Johnny_Joestar_Infobox_Anime.png'),
(35, 'Gyro Zeppeli', 'Compañero de Johnny; maestro del "Spin"; figura clave y participante de la Steel Ball Run.', 'Parte 7', 'https://static.jojowiki.com/images/7/76/latest/20200816174510/Gyro_Zeppeli_Infobox_Manga.png', 'https://static.jojowiki.com/images/f/fc/latest/20260411021621/Gyro_Zeppeli_Infobox_Anime.png'),
(36, 'Lucy Steel', 'Joven esposa del creador de la Steel Ball Run; acaba involucrada en la Steel Ball Run por su propia supervivencia.', 'Parte 7', 'https://static.jojowiki.com/images/c/cf/latest/20260204033150/Lucy_Steel_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/4a/latest/20260414203114/Lucy_Steel_Infobox_Anime.png'),
(37, 'Diego Brando', 'Jinete rival de Johnny con habilidades de dinosaurio gracias a su Stand.', 'Parte 7', 'https://static.jojowiki.com/images/4/4b/latest/20200913222640/Diego_Brando_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/80/latest/20260411021621/Diego_Brando_Infobox_Anime.png'),
(38, 'Doctor Ferdinand', 'Paleontólogo obsesionado con los dinosaurios; usuario secundario de Scary Monsters.', 'Parte 7', 'https://static.jojowiki.com/images/2/21/latest/20250429193649/Dr_Ferdinand_Infobox_Manga.png', NULL),
(39, 'Funny Valentine', 'Presidente de EE.UU; quiere reunir el "cadáver sagrado" para beneficiar a su país.', 'Parte 7', 'https://static.jojowiki.com/images/6/6b/latest/20260218123844/Valentine_Normal_Infobox_Manga.png', NULL),
(40, 'Diego Brando', 'Versión alternativa de otro universo de Diego Brando que posee a The World.', 'Parte 7', 'https://static.jojowiki.com/images/7/74/latest/20240521133606/Diego_AU_Infobox_Manga.png', NULL),
(41, 'Josuke Higashikata', 'Protagonista de la Parte 8; versión alternativa de Josuke; joven amnésico encontrado en Morioh, ligado a un misterio de identidad.', 'Parte 8', 'https://static.jojowiki.com/images/3/3a/latest/20210617175837/Josuke_JJL_Infobox_Manga.png', NULL),
(42, 'Tooru', 'Misterioso enemigo ligado a los Rock Humans; manipula la desgracia.', 'Parte 8', 'https://static.jojowiki.com/images/8/83/latest/20210829142716/Toru_Infobox_Manga.png' , NULL),
(43, 'Yoshikage Kira', 'Versión alternativa del universo JoJolion vinculada a Killer Queen.', 'Parte 8', 'https://static.jojowiki.com/images/5/5c/latest/20210102234928/Yoshikage_Kira_JJL_Infobox_Manga.PNG', NULL),
(44, 'Jodio Joestar', 'Protagonista de la Parte 9; adolescente ambicioso en Hawái que busca enriquecerse junto a su banda.', 'Parte 9', 'https://static.jojowiki.com/images/8/86/latest/20240714175735/Jodio_Joestar_Infobox_Manga.png', NULL),
(45, 'Rohan Kishibe', 'Versión alternativa de Rohan; presente en la Parte 9: The JOJOLands.', 'Parte 9', 'https://static.jojowiki.com/images/2/2f/latest/20250111162055/Rohan_Kishibe_TJL_Infobox_Manga.png', NULL),
(46, 'Yoshifumi Kujo', 'Identidad original de Josuke relacionado con el origen de Soft and Wet.', 'Parte 8', 'https://static.jojowiki.com/images/a/a3/latest/20210826162618/Josefumi_Kujo_Infobox_Manga.png', NULL),
(47, 'Mariah', 'Usuaria egipcia al servicio de DIO; disfruta jugando con sus enemigos.', 'Parte 3', 'https://static.jojowiki.com/images/3/3a/latest/20260322104230/Mariah_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/60/latest/20250930185845/Mariah_Infobox_Anime.png'),
(48, 'Enya la anciana', 'Anciana seguidora de DIO y madre de J. Geil; manipuladora y figura clave en su organización.', 'Parte 3', 'https://static.jojowiki.com/images/7/7b/latest/20230302120319/Enya_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/3a/latest/20230202193328/Enya_Infobox_Anime.png'),
(49, 'Shigekiyo Yangu', 'Apodado Shigechi; es un estudiante de Morioh codicioso pero ingenuo, con comportamiento infantil.', 'Parte 4', 'https://static.jojowiki.com/images/9/9b/latest/20220528181757/Shigechi_Infobox_Manga.png', 'https://static.jojowiki.com/images/f/fe/latest/20230322175351/Shigechi_Infobox_Anime.png'),
(50, 'Tonio Trussardi', 'Chef italiano apasionado; busca mejorar la vida de sus clientes con su cocina.', 'Parte 4', 'https://static.jojowiki.com/images/9/96/latest/20241012100049/Tonio_Trussardi_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/87/latest/20220112144423/Tonio_Trussardi_Infobox_Anime.png'),
(51, 'Polpo', 'Capo de Passione; figura influyente que supervisa el ingreso de nuevos miembros desde la carcel.', 'Parte 5', 'https://static.jojowiki.com/images/f/f2/latest/20191015212934/Polpo_Infobox_Manga.png', 'https://static.jojowiki.com/images/f/ff/latest/20191015213339/Polpo_Infobox_Anime.png'),
(52, 'Ghiaccio', 'Miembro de La Squadra; temperamental y obsesivo, se enfurece por detalles mínimos.', 'Parte 5', 'https://static.jojowiki.com/images/0/0a/latest/20250226123239/Ghiaccio_Infobox_Manga.png', 'https://static.jojowiki.com/images/5/5d/latest/20220115115447/Ghiaccio_Infobox_Anime.png'),
(53, 'Cioccolata', 'Ex-cirujano sádico; disfruta causando sufrimiento y caos.', 'Parte 5', 'https://static.jojowiki.com/images/c/c0/latest/20250502165251/Cioccolata_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/25/latest/20250918041243/Cioccolata_Infobox_Anime.png'),
(54, 'Ungalo', 'Hijo de DIO; marginado con una vida marcada por el abandono y la adicción.', 'Parte 6', 'https://static.jojowiki.com/images/6/6c/latest/20210215170857/Ungalo_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/e1/latest/20221204004107/Ungalo_Anime_Infobox.png'),
(55, 'Rikiel', 'Hijo de DIO; inseguro y ansioso, lucha por ganar confianza.', 'Parte 6', 'https://static.jojowiki.com/images/4/4a/latest/20210108161447/Rikiel_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/ea/latest/20240924174731/Rikiel_Infobox_Anime.png'),
(56, 'Donatello Versus', 'Hijo de DIO; frío y oportunista, actúa en beneficio propio.', 'Parte 6', 'https://static.jojowiki.com/images/3/30/latest/20251016222709/Donatello_Versus_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/07/latest/20221201205901/Donatello_Versus_Anime_Infobox.png'),
(57, 'Sandman', 'Nativo americano; compite en la Steel Ball Run corriendo con sus propias piernas.', 'Parte 7', 'https://static.jojowiki.com/images/4/4f/latest/20251223070316/Sandman_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/ab/latest/20260319175032/Sandman_Infobox_Anime.png'),
(58, 'Pocoloco', 'Participante de la Steel Ball Run; despreocupado y extremadamente afortunado.', 'Parte 7', 'https://static.jojowiki.com/images/8/81/latest/20260406083455/Pocoloco_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/87/latest/20251220212333/Pocoloco_Infobox_Anime.png'),
(59, 'Hot Pants', 'Ex-monja con pasado trágico; decidida y guiada por su redención.', 'Parte 7', 'https://static.jojowiki.com/images/6/61/latest/20250421191232/Hot_Pants_Infobox_Manga.png', NULL),
(60, 'Yasuho Hirose', 'Joven inteligente y decidida; apoya a Josuke en la investigación sobre su identidad.', 'Parte 8', 'https://static.jojowiki.com/images/a/a7/latest/20221208021338/Yasuho_Hirose_Infobox_Manga.png', NULL),
(61, 'Joshu Higashikata', 'Miembro de la familia Higashikata; egoísta e inmaduro.', 'Parte 8', 'https://static.jojowiki.com/images/9/99/latest/20240410012151/Joshu_Higashikata_Infobox_Manga.png', NULL),
(62, 'Jobin Higashikata', 'Hijo mayor ambicioso; prioriza a su familia por encima de todo.', 'Parte 8', 'https://static.jojowiki.com/images/2/20/latest/20250211185435/Jobin_Higashikata_Infobox_Manga.png', NULL),
(63, 'Dragona Joestar', 'Hermana de Jodio; carismática y segura de sí misma.', 'Parte 9', 'https://static.jojowiki.com/images/6/65/latest/20231226223644/Dragona_Infobox_Manga.png', NULL),
(64, 'Haccaa Howler', 'Figura del entorno criminal; vinculado a actividades ilegales.', 'Parte 9', 'https://static.jojowiki.com/images/3/39/latest/20251217215152/Hacca_Howler_Infobox_Manga.png', NULL);

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
  `potencial` char(1) DEFAULT NULL,
  `referencia_musical` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stand`
--

INSERT INTO `stand` (`id`, `id_evolucion`, `nombre`, `descripcion`, `aparicion`, `imagen_manga`, `imagen_anime`, `poder`, `velocidad`, `alcance`, `durabilidad`, `precis`, `potencial`, `referencia_musical`) VALUES
(1, NULL, 'Star Platinum', 'Stand de gran fuerza y precisión extrema que puede detener el tiempo.', 'Parte 3, 4, 5 y 6', 'https://static.jojowiki.com/images/2/2d/latest/20210316191453/Star_Platinum_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/ca/latest/20200927002609/Star_Platinum_SC_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'A', NULL),
(2, NULL, 'Magician s Red', 'Stand de fuego con gran control de llamas y ataques a distancia.', 'Parte 3', 'https://static.jojowiki.com/images/5/56/latest/20210529144745/Magician%27s_Red_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/48/latest/20220916201225/Magician%27s_Red_Infobox_Anime.png', 'B', 'B', 'C', 'B', 'C', 'D', NULL),
(3, NULL, 'Hermit Purple', 'Stand de enredaderas que utiliza el "Hamond" para rastrear y obtener información.', 'Parte 3 y 4', 'https://static.jojowiki.com/images/c/c1/latest/20260226030336/Hermit_Purple_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/0a/latest/20220922193045/Hermit_Purple_SC_Infobox_Anime.png', 'D', 'C', 'D', 'A', 'D', 'E', NULL),
(4, NULL, 'Hierophant Green', 'Stand versátil que ataca a distancia y puede infiltrarse en objetos.', 'Parte 3', 'https://static.jojowiki.com/images/8/8e/latest/20260314161255/Hierophant_Green_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/3e/latest/20210616200106/Hierophant_Green_Infobox_Anime.png', 'C', 'B', 'A', 'B', 'C', 'D', NULL),
(5, NULL, 'Silver Chariot', 'Stand de combate especializado en esgrima, extremadamente rápido y preciso en ataques cuerpo a cuerpo.', 'Parte 3 y 5', 'https://static.jojowiki.com/images/9/9b/latest/20220502142632/Silver_Chariot_SC_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/09/latest/20221019190021/Silver_Chariot_SC_Infobox_Anime.png', 'B', 'A', 'C', 'C', 'B', 'C', NULL),
(6, NULL, 'The World', 'Stand de gran poder físico capaz de detener el tiempo durante unos segundos y atacar sin oposición.', 'Parte 3', 'https://static.jojowiki.com/images/f/f5/latest/20210424162912/The_World_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/7e/latest/20221004175724/The_World_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'B', NULL),
(7, NULL, 'Crazy Diamond', 'Stand con gran fuerza que puede reparar objetos y seres vivos devolviéndolos a su estado original.', 'Parte 4', 'https://static.jojowiki.com/images/c/c5/latest/20200625184236/Crazy_Diamond_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/b5/latest/20191015215419/Crazy_Diamond_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'B', 'C', 'Shine On You Crazy Diamond Pink Floyd'),
(8, 9, 'Echoes Act 1', 'Stand que materializa sonidos escritos, permitiendo manipular el entorno mediante efectos sonoros.', 'Parte 4 y 5', 'https://static.jojowiki.com/images/d/db/latest/20230330014026/Echoes_ACT1_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/d/dc/latest/20210424210829/Echoes_ACT1_DU_Infobox_Anime.png', 'E', 'C', 'B', 'C', 'C', 'A', 'Echoes Pink Floyd'),
(9, 10, 'Echoes Act 2', 'Evolución de Echoes que convierte palabras en efectos físicos capaces de afectar directamente a los objetivos.', 'Parte 4 y 5', 'https://static.jojowiki.com/images/1/11/latest/20220313112608/Echoes_ACT2_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/69/latest/20231215131846/Echoes_ACT2_DU_Infobox_Anime.png', 'C', 'C', 'B', 'C', 'C', 'A', 'Echoes Pink Floyd'),
(10, NULL, 'Echoes Act 3', 'Forma final de Echoes que puede aumentar el peso de los objetos y enemigos mediante su habilidad gravitacional.', 'Parte 4 y 5', 'https://static.jojowiki.com/images/4/4e/latest/20191015214620/Echoes_ACT3_DU_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/8e/latest/20210422175130/Echoes_ACT3_DU_Infobox_Anime.png', 'B', 'C', 'C', 'B', 'C', 'C', 'Echoes Pink Floyd'),
(11, NULL, 'The Hand', 'Stand con la capacidad de borrar el espacio que toca, eliminando todo lo que se encuentre en su trayectoria.', 'Parte 4', 'https://static.jojowiki.com/images/2/20/latest/20260218065303/The_Hand_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/ae/latest/20210111150120/The_Hand_Infobox_Anime.png', 'A', 'B', 'D', 'A', 'C', 'C', 'The Weight The Band'),
(12, NULL, 'Heavens Door', 'Stand que transforma a las personas en libros, permitiendo leer y alterar sus recuerdos y acciones.', 'Parte 4', 'https://static.jojowiki.com/images/d/de/latest/20191228045732/Heaven%27s_Door_Infobox_Manga.png', 'https://static.jojowiki.com/images/5/50/latest/20210203193008/Heaven%27s_Door_Infobox_Anime.png', 'C', 'B', 'B', 'B', 'A', 'B', 'Knockin On Heavens Door Bob Dylan'),
(13, 25, 'Gold Experience', 'Stand de corto alcance capaz de crear vida a partir de objetos inertes y usarla de forma estratégica.', 'Parte 5', 'https://static.jojowiki.com/images/2/28/latest/20241013015824/Gold_Experience_Infobox_Manga.png', 'https://static.jojowiki.com/images/8/81/latest/20210707053105/Gold_Experience_Infobox_Anime.png', 'C', 'A', 'C', 'D', 'C', 'A', 'Gold Experience Prince'),
(25, NULL, 'Gold Experience Requiem', 'Evolución de Gold Experience con el poder de anular acciones y devolver todo a cero.', 'Parte 5', 'https://static.jojowiki.com/images/1/13/latest/20210525092302/GER_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/19/latest/20220802141706/GER_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'A', 'A', 'Gold Experience Prince'),
(14, NULL, 'Sticky Fingers', 'Stand veloz que crea cremalleras en cualquier superficie para abrir, separar o atravesar objetos.', 'Parte 5', 'https://static.jojowiki.com/images/4/42/latest/20251201143842/Sticky_Fingers_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/78/latest/20221006032155/Sticky_Fingers_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'C', 'D', 'How to fly Sticky Fingers'),
(15, NULL, 'Sex Pistols', 'Stand dividido en pequeñas entidades que manipulan la trayectoria de las balas disparadas.', 'Parte 5', 'https://static.jojowiki.com/images/3/3d/latest/20191015212825/Sex_Pistols_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/b9/latest/20210521114106/Sex_Pistols_Infobox_Anime.png', 'B', 'B', 'B', 'A', 'A', 'C', 'Anarchy in the UK Sex Pistols'),
(16, NULL, 'Aerosmith', 'Stand con forma de avión de juguete capaz de disparar, lanzar bombas y rastrear enemigos por dióxido de carbono.', 'Parte 5', 'https://static.jojowiki.com/images/b/be/latest/20240220023709/Aerosmith_Infobox_Manga.jpg', 'https://static.jojowiki.com/images/7/7c/latest/20210701024635/Aerosmith_Infobox_Anime.png', 'B', 'B', 'C', 'C', 'C', 'C', 'Dream On Aerosmith'),
(17, NULL, 'Moody Blues', 'Stand que reproduce acciones pasadas de una persona en un lugar concreto como si fuera una grabación.', 'Parte 5', 'https://static.jojowiki.com/images/9/93/latest/20230520124240/Moody_Blues_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/91/latest/20220916205647/Moody_Blues_Infobox_Anime.png', 'C', 'C', 'A', 'A', 'B', 'C', 'Nights in White Satin The Moody Blues'),
(18, NULL, 'King Crimson', 'Stand extremadamente poderoso que puede borrar intervalos de tiempo y anticipar movimientos enemigos.', 'Parte 5', 'https://static.jojowiki.com/images/8/85/latest/20191015214647/King_Crimson_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c6/latest/20241012182526/King_Crimson_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'A', 'E', 'The Court of the Crimson King'),
(19, NULL, 'Stone Free', 'Stand que permite transformar el cuerpo de su usuaria en hilos para atacar, defenderse o moverse.', 'Parte 6', 'https://static.jojowiki.com/images/2/24/latest/20220925022203/Stone_Free_Infobox_Manga.png', 'https://static.jojowiki.com/images/0/03/latest/20230826070709/Stone_Free_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'A', 'Stone Free Jimi Hendrix'),
(20, NULL, 'Kiss', 'Stand que coloca pegatinas capaces de duplicar objetos y dañarlos al volver a unirse.', 'Parte 6', 'https://static.jojowiki.com/images/7/77/latest/20210829145227/Kiss_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/24/latest/20230826110958/Kiss_Infobox_Anime.png', 'A', 'A', 'C', 'A', 'C', 'A', 'I Was Made For Lovin You Kiss'),
(21, NULL, 'Weather Report', 'Stand muy versátil capaz de controlar el clima y manipular fenómenos atmosféricos a gran escala.', 'Parte 6', 'https://static.jojowiki.com/images/8/8a/latest/20211109144423/Weather_Report_Stand_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/ac/latest/20230826110804/Weather_Report_Stand_Anime_Infobox.png', 'A', 'B', 'C', 'A', 'C', 'A', 'Birdland Weather Report'),
(22, 23, 'Whitesnake', 'Stand que extrae recuerdos y Stands en forma de discos, permitiendo robar o manipular habilidades.', 'Parte 6', 'https://static.jojowiki.com/images/6/62/latest/20231210172019/Whitesnake_Infobox_Manga.png', 'https://static.jojowiki.com/images/9/91/latest/20241001191051/Whitesnake_Infobox_Anime.png', 'C', 'B', 'C', 'A', 'B', 'A', 'Here I Go Again Whitesnake'),
(23, 24, 'C-Moon', 'Stand evolucionado que altera la gravedad alrededor de su usuario y puede invertir cuerpos y superficies.', 'Parte 6', 'https://static.jojowiki.com/images/2/23/latest/20221204031754/C-MOON_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/e8/latest/20221202021237/C-MOON_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'A', 'C-Moon Paul McCartney'),
(24, NULL, 'Made in Heaven', 'Forma final de la evolución de Pucci, capaz de acelerar el tiempo hasta reiniciar el universo.', 'Parte 6', 'https://static.jojowiki.com/images/b/bb/latest/20211117220434/Made_in_Heaven_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a4/latest/20221205184222/Made_in_Heaven_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'C', 'A', 'Made in Heaven Queen'),
(26, NULL, 'The Fool', 'Stand de arena que adopta formas sólidas como bestias o vehículos para combatir y proteger a su usuario.', 'Parte 3', 'https://static.jojowiki.com/images/f/f0/latest/20191015214051/The_Fool_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/10/latest/20210312225357/The_Fool_Infobox_Anime.png', 'B', 'C', 'D', 'B', 'D', 'C', NULL),
(27, NULL, 'Hanged Man', 'Stand que viaja a través de superficies reflectantes y ataca a gran velocidad desde estas.', 'Parte 3', 'https://static.jojowiki.com/images/2/26/latest/20220407125952/Hanged_Man_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/1f/latest/20220917022046/Hanged_Man_Infobox_Anime.png', 'C', 'A', 'A', 'C', 'B', 'D', NULL),
(28, NULL, 'Emperor', 'Stand con forma de pistola capaz de disparar balas manipulables por su usuario.', 'Parte 3', 'https://static.jojowiki.com/images/c/cf/latest/20240221172024/Emperor_Infobox_Manga.png' , 'https://static.jojowiki.com/images/5/5d/latest/20220917022257/Emperor_Infobox_Anime.png', 'B', 'B', 'B', 'D', 'A', 'D', NULL),
(29, NULL, 'Cream', 'Stand capaz de devorar materia y desplazarse dentro del vacío absoluto.', 'Parte 3', 'https://static.jojowiki.com/images/0/0c/latest/20191015214713/Cream_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/7f/latest/20220916193130/Cream_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'C', 'D', NULL),
(30, NULL, 'Anubis', 'Stand vinculado a una espada maldita que puede poseer a quienes la utilizan.', 'Parte 3', 'https://static.jojowiki.com/images/c/c5/latest/20240528161709/Anubis_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/64/latest/20220916183812/Anubis_Infobox_Anime.png', 'B', 'A', 'E', 'B', 'A', 'C', NULL),
(31, 32, 'Killer Queen', 'Stand explosivo capaz de convertir cualquier objeto en una bomba y soltar una unidad mecánica a distancia que explota al acercarse a alguien..', 'Parte 4', 'https://static.jojowiki.com/images/f/fb/latest/20210420222949/Killer_Queen_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/14/latest/20221020232023/Killer_Queen_Infobox_Anime.png', 'A', 'B', 'D', 'A', 'B', 'A', 'Killer Queen Queen'),
(32, NULL, 'Killer Queen (Bites the Dust)', 'Evolución de Killer Queen capaz de crear bucles temporales automáticos ligados a una explosión.', 'Parte 4', 'https://static.jojowiki.com/images/f/f9/latest/20260218063857/Bites_the_Dust_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/cb/latest/20230313162119/Bites_the_Dust_Infobox_Anime.png', 'A', 'B', 'A', 'A', 'A', 'A', NULL),
(33, NULL, 'Bad Company', 'Stand compuesto por un ejército militar en miniatura equipado con armas y vehículos.', 'Parte 4', 'https://static.jojowiki.com/images/d/d0/latest/20220930220817/Bad_Company_Infobox_Manga.png', 'https://static.jojowiki.com/images/4/4a/latest/20221020231958/Bad_Company_Infobox_Anime.png', 'B', 'B', 'C', 'C', 'B', 'C', 'Bad Company Bad Company'),
(34, NULL, 'Red Hot Chili Pepper', 'Stand eléctrico capaz de desplazarse por cables y absorber energía.', 'Parte 4', 'https://static.jojowiki.com/images/6/6b/latest/20210716115856/RHCP_Infobox_Manga.png', 'https://static.jojowiki.com/images/5/59/latest/20191015213016/RHCP_Infobox_Anime.png', 'A', 'A', 'A', 'A', 'B', 'A', 'Californication Red Hot Chili Peppers'),
(35, NULL, 'Purple Haze', 'Stand extremadamente agresivo que libera un virus mortal al romper sus cápsulas.', 'Parte 5', 'https://static.jojowiki.com/images/8/82/latest/20210215173755/Purple_Haze_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/ca/latest/20191015214140/Purple_Haze_Infobox_Anime.png', 'A', 'A', 'C', 'D', 'E', 'A', 'Purple Haze Jimi Hendrix'),
(36, NULL, 'Spice Girl', 'Stand que puede volver blandos y flexibles los objetos para absorber impactos.', 'Parte 5', 'https://static.jojowiki.com/images/8/84/latest/20191015214711/Spice_Girl_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/21/latest/20200118002424/Spice_Girl_Infobox_Anime.png', 'C', 'B', 'C', 'A', 'C', 'A', 'Wannabe Spice Girls'),
(37, NULL, 'Metallica', 'Stand microscópico que manipula el metal como el hierro presente en la sangre.', 'Parte 5', 'https://static.jojowiki.com/images/4/46/latest/20260226035811/Metallica_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c0/latest/20241122144847/Metallica_Infobox_Anime.png', 'C', 'C', 'C', 'A', 'A', 'C', 'Enter Sandman Metallica'),
(38, NULL, 'Chariot Requiem', 'Forma evolucionada de Silver Chariot;entra en modo automático y altera los cuerpos y almas de todos los seres cercanos.', 'Parte 5', 'https://static.jojowiki.com/images/e/e8/latest/20230328152452/Chariot_Requiem_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/12/latest/20211210020712/Chariot_Requiem_Infobox_Anime.png', 'A', 'B', 'A', 'A', 'C', 'A', NULL),
(39, NULL, 'Burning Down the House', 'Stand que permite acceder y manipular objetos fantasma de estructuras destruidas.', 'Parte 6', 'https://static.jojowiki.com/images/0/00/latest/20191015215502/BDtH_Infobox_Manga.png', 'https://static.jojowiki.com/images/2/20/latest/20220919210706/BDtH_Infobox_Anime.png', 'E', 'E', 'C', 'C', 'D', 'C', 'Burning Down the House Talking Heads'),
(40, NULL, 'Foo Fighters', 'Stand compuesto por plancton inteligente capaz de regenerarse y controlar cuerpos.', 'Parte 6', 'https://static.jojowiki.com/images/0/07/latest/20210313143756/Foo_Fighters_Stand_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/37/latest/20220902190331/Foo_Fighters_Stand_Anime_Infobox.png', 'B', 'B', 'C', 'A', 'C', 'A', 'Everlong Foo Fighters'),
(41, NULL, 'Diver Down', 'Stand capaz de introducirse dentro de objetos o cuerpos y modificar su estructura interna (intangibilidad).', 'Parte 6', 'https://static.jojowiki.com/images/9/98/latest/20211112115109/Diver_Down_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c6/latest/20230826110448/Diver_Down_Anime_Infobox.png', 'A', 'A', 'C', 'A', 'B', 'B', 'Jump Van Halen'),
(42, 43, 'Tusk Act 1', 'Primera forma de Tusk, capaz de disparar uñas giratorias con energía rotacional.', 'Parte 7', 'https://static.jojowiki.com/images/c/ce/latest/20210323194311/Tusk_ACT1_SBR_Infobox_Manga.png', NULL, 'D', 'D', 'B', 'A', 'B', 'A', 'Tusk Fleetwood Mac'),
(43, 44, 'Tusk Act 2', 'Evolución de Tusk que añade trayectorias móviles a sus disparos rotacionales.', 'Parte 7', 'https://static.jojowiki.com/images/5/5c/latest/20221023143640/Tusk_ACT2_SBR_Infobox_Manga.png', NULL, 'C', 'C', 'B', 'A', 'B', 'A', 'Tusk Fleetwood Mac'),
(44, 45, 'Tusk Act 3', 'Forma avanzada de Tusk capaz de utilizar agujeros dimensionales ligados a la rotación.', 'Parte 7', 'https://static.jojowiki.com/images/8/82/latest/20260312011542/Tusk_ACT3_SBR_Infobox_Manga.png', NULL, 'B', 'B', 'B', 'A', 'B', 'A', 'Tusk Fleetwood Mac'),
(45, NULL, 'Tusk Act 4', 'Forma definitiva de Tusk que utiliza la rotación infinita para atravesar cualquier defensa.', 'Parte 7', 'https://static.jojowiki.com/images/8/83/latest/20220321010212/Tusk_ACT4_SBR_Infobox_Manga.png', NULL, 'A', 'A', 'A', 'A', 'A', 'A', 'Tusk Fleetwood Mac'),
(46, NULL, 'Ball Breaker', 'Stand vinculado a la técnica del Spin capaz de afectar directamente al envejecimiento.', 'Parte 7', 'https://static.jojowiki.com/images/e/ee/latest/20210109000447/Ball_Breaker_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'A', 'B', 'A', 'Ballbreaker AC/DC'),
(47, NULL, 'Ticket to Ride', 'Poder relacionado con la protección divina y la canalización de la fortuna.', 'Parte 7', 'https://static.jojowiki.com/images/e/e7/latest/20240203231516/Ticket_to_Ride_Infobox_Manga.png', NULL, 'E', 'E', 'A', 'A', 'E', 'A', 'Ticket to Ride The Beatles'),
(48, NULL, 'Scary Monsters', 'Stand que transforma seres vivos en dinosaurios y otorga habilidades prehistóricas.', 'Parte 7', 'https://static.jojowiki.com/images/1/14/latest/20241023050843/Scary_Monsters_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'A', 'C', 'A', 'Scary Monsters David Bowie'),
(49, 50, 'D4C', 'Stand dimensional capaz de viajar entre universos paralelos y manipular realidades alternativas.', 'Parte 7', 'https://static.jojowiki.com/images/0/01/latest/20250601031840/D4C_Infobox_Manga.png', NULL, 'A', 'A', 'A', 'A', 'A', 'A', 'Dirty Deeds Done Dirt Cheap AC/DC'),
(50, NULL, 'D4C (Love Train)', 'Evolución de D4C que desvía toda desgracia lejos de su usuario mediante una barrera dimensional.', 'Parte 7', 'https://static.jojowiki.com/images/1/19/latest/20250601021013/D4C_Love_Train_Infobox_Manga.JPG', NULL, 'A', 'A', 'A', 'A', 'A', 'A', NULL),
(51, NULL, 'The World', 'Versión alternativa de The World perteneciente al universo de Steel Ball Run.', 'Parte 7', 'https://static.jojowiki.com/images/8/8a/latest/20220924001200/THE_WORLD_Infobox_Manga.PNG', NULL, 'A', 'A', 'C', 'A', 'A', 'B', NULL),
(52, NULL, 'Soft and Wet', 'Stand capaz de crear burbujas especiales que roban propiedades físicas o abstractas.', 'Parte 8', 'https://static.jojowiki.com/images/5/55/latest/20220801101811/Soft_%26_Wet_Infobox_Manga.png', NULL, 'B', 'B', 'C', 'B', 'B', 'A', 'Soft and Wet Prince'),
(53, NULL, 'Wonder of U', 'Stand automático que provoca calamidades inevitables contra quienes persiguen a su usuario.', 'Parte 8', 'https://static.jojowiki.com/images/2/24/latest/20210418202241/Wonder_of_U_Hybrid_Infobox_Manga.png', NULL, 'A', 'A', 'A', 'A', 'A', 'A', 'The Wonder of You Elvis Presley'),
(54, NULL, 'Killer Queen', 'Versión alternativa de Killer Queen con capacidades explosivas adaptadas al universo de JoJolion.', 'Parte 8', 'https://static.jojowiki.com/images/1/16/latest/20260423070746/Killer_Queen_JJL_Infobox_Manga.png', NULL, 'A', 'B', 'D', 'A', 'B', 'A', 'Killer Queen Queen'),
(55, NULL, 'November Rain', 'Stand capaz de generar lluvia extremadamente pesada para aplastar objetivos.', 'Parte 9', 'https://static.jojowiki.com/images/b/bf/latest/20231223005916/November_Rain_Infobox_Manga.png', NULL, 'B', 'C', 'B', 'A', 'B', 'A', 'November Rain Guns N Roses'),
(56, NULL, 'Heavens Door', 'Versión alternativa de Heaven s Door con habilidades relacionadas con la manipulación de información y percepción.', 'Parte 9', 'https://static.jojowiki.com/images/c/c3/latest/20231219050605/Heaven%27s_Door_TJL_Infobox_Manga.png', NULL, 'C', 'B', 'B', 'B', 'A', 'B', 'Knockin On Heavens Door Bob Dylan'),
(57, NULL, 'Bastet', 'Stand en forma de enchufe que magnetiza a los objetivos tras tocarlos, atrayendo objetos metálicos.', 'Parte 3', 'https://static.jojowiki.com/images/f/f6/latest/20250930170536/Bastet_Infobox_Manga.png', 'https://static.jojowiki.com/images/d/dd/latest/20211010231924/Bastet_Infobox_Anime.png', 'E', 'C', 'D', 'E', 'E', 'E', NULL),
(58, NULL, 'Justice', 'Stand de niebla que controla cuerpos a través de heridas abiertas.', 'Parte 3', 'https://static.jojowiki.com/images/f/f8/latest/20191015215013/Justice_Infobox_Manga.png', 'https://static.jojowiki.com/images/e/e9/latest/20221008022907/Justice_Infobox_Anime.png', 'B', 'C', 'D', 'A', 'D', 'C', NULL),
(59, NULL, 'Harvest', 'Stand formado por múltiples unidades pequeñas que recolectan objetos y recursos.', 'Parte 4', 'https://static.jojowiki.com/images/f/f3/latest/20220429135035/Harvest_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/73/latest/20220904041353/Harvest_Infobox_Anime.png', 'C', 'B', 'A', 'C', 'B', 'C', 'Harvest Neil Young'),
(60, NULL, 'Pearl Jam', 'Stand que cura el cuerpo mediante alimentos preparados especialmente.', 'Parte 4', 'https://static.jojowiki.com/images/d/d3/latest/20250724144742/Pearl_Jam_Infobox_Manga.png', 'https://static.jojowiki.com/images/7/70/latest/20250722142541/Pearl_Jam_Infobox_Anime.png', 'E', 'E', 'A', 'C', 'A', 'C', 'Even Flow Pearl Jam'),
(61, NULL, 'Black Sabbath', 'Stand automático que emerge de las sombras y posée una flecha de stand.', 'Parte 5', 'https://static.jojowiki.com/images/3/38/latest/20191015213503/Black_Sabbath_Infobox_Manga.png', 'https://static.jojowiki.com/images/1/17/latest/20220920220032/Black_Sabbath_Infobox_Anime.png', 'A', 'B', 'C', 'A', 'E', 'A', 'Paranoid Black Sabbath'),
(62, NULL, 'White Album', 'Stand que congela el entorno y protege al usuario con una armadura de hielo.', 'Parte 5', 'https://static.jojowiki.com/images/b/be/latest/20240405022040/White_Album_Infobox_Manga.png', 'https://static.jojowiki.com/images/c/c0/latest/20221003162753/White_Album_Acrylic.png', 'A', 'A', 'B', 'C', 'C', 'A', 'While My Guitar Gently Weeps The Beatles'),
(63, NULL, 'Green Day', 'Stand que libera moho letal al descender de altura.', 'Parte 5', 'https://static.jojowiki.com/images/b/b7/latest/20221026025215/Green_Day_Infobox_Manga.png', 'https://static.jojowiki.com/images/a/a4/latest/20230303153451/Green_Day_Infobox_Anime.png', 'A', 'C', 'A', 'A', 'E', 'A', 'American idiot Green Day'),
(64, NULL, 'Bohemian Rhapsody', 'Stand que da vida a personajes ficticios y los hace interactuar con la realidad.', 'Parte 6', 'https://static.jojowiki.com/images/4/42/latest/20211116164745/Bohemian_Rhapsody_Infobox_Manga.png', 'https://static.jojowiki.com/images/b/b4/latest/20260503053546/Bohemian_Rhapsody_Infobox_Anime.png', 'E', 'E', 'A', 'A', 'E', 'A', 'Bohemian Rhapsody Queen'),
(65, NULL, 'Sky High', 'Stand que controla criaturas invisibles que drenan la energía vital.', 'Parte 6', 'https://static.jojowiki.com/images/c/ce/latest/20210312133144/Sky_High_Infobox_Manga.png', 'https://static.jojowiki.com/images/6/6b/latest/20221201105503/Sky_High_Render_Appearance_Anime.png', 'C', 'B', 'C', 'B', 'B', 'C', 'Sky High Jigsaw'),
(66, NULL, 'Under World', 'Stand que recrea eventos pasados como fenómenos físicos inevitables.', 'Parte 6', 'https://static.jojowiki.com/images/5/54/latest/20251016215142/Under_World_Infobox_Manga.png', 'https://static.jojowiki.com/images/3/3d/latest/20251123210313/Under_World_Infobox_Anime.png', 'C', 'C', 'B', 'A', 'B', 'B', 'Born Slippy Underworld'),
(67, NULL, 'In a Silent Way', 'Stand que materializa sonidos en formas físicas con efectos dañinos.', 'Parte 7', 'https://static.jojowiki.com/images/a/a1/latest/20251221060957/In_a_Silent_Way_Infobox_Manga.png', NULL, 'B', 'C', 'B', 'B', 'B', 'B', 'In a Silent Way Miles Davis'),
(68, NULL, 'Hey Ya!', 'Stand que guía al usuario con consejos y aumenta su suerte.', 'Parte 7', 'https://static.jojowiki.com/images/a/ac/latest/20250429202656/Hey_Ya%21_Infobox_Manga.png', NULL, 'E', 'E', 'A', 'E', 'E', 'E', 'Hey Ya! Outkast'),
(69, NULL, 'Cream Starter', 'Stand que permite generar y moldear carne humana en forma de spray para curar heridas o atacar.', 'Parte 7', 'https://static.jojowiki.com/images/7/7b/latest/20240204003114/Cream_Starter_Infobox_Manga.png', NULL, 'B', 'C', 'A', 'B', 'B', 'C', NULL),
(70, NULL, 'Paisley Park', 'Stand que guía mediante información y rutas óptimas en el entorno.', 'Parte 8', 'https://static.jojowiki.com/images/d/d4/latest/20260323015410/Paisley_Park_Infobox_Manga.png', NULL, 'E', 'E', 'A', 'A', 'A', 'A', 'Paisley Park Prince'),
(71, NULL, 'Nut King Call', 'Stand que desmonta objetos en piezas unidas como tornillos.', 'Parte 8', 'https://static.jojowiki.com/images/2/2b/latest/20260323221115/Nut_King_Call_Infobox_Manga.png', NULL, 'C', 'B', 'C', 'C', 'B', 'C', 'Unforgettable Nat King Cole'),
(72, NULL, 'Speed King', 'Stand que acumula y libera calor en objetos y superficies.', 'Parte 8', 'https://static.jojowiki.com/images/3/34/latest/20210213140112/Speed_King_Infobox_Manga.png', NULL, 'A', 'B', 'C', 'C', 'B', 'B', 'Speed King Deep Purple'),
(73, NULL, 'Smooth Operators', 'Stand formado por pequeñas unidades que manipulan objetos y posiciones.', 'Parte 9', 'https://static.jojowiki.com/images/5/53/latest/20260502185126/Smooth_Operators_Infobox_Manga.png', NULL, 'C', 'B', 'B', 'B', 'A', 'B', 'Smooth Operator Sade'),
(74, NULL, 'Eclipse Eight', 'Stand que manipula fenómenos y energía de forma compleja y destructiva.', 'Parte 9', 'https://static.jojowiki.com/images/f/fd/latest/20260122182848/Eclipse_Eight_Infobox_Manga.png', NULL, 'B', 'B', 'B', 'B', 'B', 'B', 'Eclipse Pink Floyd');
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
(52, 41),
(52, 46),
(53, 42),
(54, 43),
(55, 44),
(56, 45),
(57, 47),
(58, 48),
(59, 49),
(60, 50),
(61, 51),
(62, 52),
(63, 53),
(64, 54),
(65, 55),
(66, 56),
(67, 57),
(68, 58),
(69, 59),
(70, 60),
(71, 61),
(72, 62),
(73, 63),
(74, 64);

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
