-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 09 2024 г., 19:14
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TestNovis`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Admins`
--

CREATE TABLE `Admins` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Admins`
--

INSERT INTO `Admins` (`id`, `login`, `password`) VALUES
(1, 'admin', '$2y$10$uYv65GFFJ5peU8A7kODs...IJVqHnmBDBMfvcU1nWLRRNFqaB10hK');

-- --------------------------------------------------------

--
-- Структура таблицы `Answers`
--

CREATE TABLE `Answers` (
  `id` int NOT NULL,
  `answer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `question_id` int NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `answer_char` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Answers`
--

INSERT INTO `Answers` (`id`, `answer_text`, `question_id`, `is_correct`, `answer_char`) VALUES
(1, '160', 1, 0, 'a'),
(2, '16', 1, 0, 'b'),
(3, '20', 1, 1, 'c'),
(4, '64', 1, 0, 'd'),
(5, '6', 1, 0, 'e'),
(6, 'глаза', 2, 0, 'a'),
(7, 'нос', 2, 0, 'b'),
(8, 'игрушки', 2, 1, 'c'),
(9, 'лёгкое', 2, 0, 'd'),
(10, 'рот', 2, 0, 'e'),
(11, 'учебники', 3, 0, 'a'),
(12, 'доска', 3, 0, 'b'),
(13, 'дворник', 3, 0, 'c'),
(14, 'учитель', 3, 1, 'd'),
(15, 'карандаши', 3, 0, 'e'),
(16, 'богатству', 4, 0, 'a'),
(17, 'внешности', 4, 0, 'b'),
(18, 'голосу', 4, 0, 'c'),
(19, 'поступкам', 4, 1, 'd'),
(20, 'туфлям', 4, 0, 'e'),
(21, '', 5, 0, 'a'),
(22, '', 5, 0, 'b'),
(23, '', 5, 1, 'c'),
(24, '', 5, 0, 'd'),
(25, '', 5, 0, 'e'),
(26, 'сильный', 6, 0, 'a'),
(27, 'здоровый', 6, 0, 'b'),
(28, 'красивый', 6, 0, 'c'),
(29, 'мелденный', 6, 0, 'd'),
(30, 'гразионзный', 6, 1, 'e'),
(31, 'Венерой', 7, 0, 'a'),
(32, 'облаками', 7, 0, 'b'),
(33, 'Солнцем', 7, 1, 'c'),
(34, 'звёздами', 7, 0, 'd'),
(35, 'Вселенной', 7, 0, 'e'),
(36, 'верно', 8, 1, 'a'),
(37, 'неверно', 8, 0, 'b'),
(38, 'неопределённо', 8, 0, 'c'),
(41, 'скорый', 9, 0, 'a'),
(42, 'быстрый', 9, 0, 'b'),
(43, 'скоростной', 9, 0, 'c'),
(44, 'бежать', 9, 1, 'd'),
(45, 'проворный', 9, 0, 'e'),
(46, 'фрукты', 10, 0, 'a'),
(47, 'форточка', 10, 0, 'b'),
(48, 'фабрика', 10, 1, 'c'),
(49, 'фаянс', 10, 0, 'd'),
(50, 'фейерверк', 10, 0, 'e'),
(51, 'красивее', 11, 0, 'a'),
(52, 'чище', 11, 0, 'b'),
(53, 'прозрачны', 11, 0, 'c'),
(54, 'из углерода', 11, 0, 'd'),
(55, 'реже встречаются', 11, 1, 'e'),
(56, 'Т', 12, 0, 'a'),
(57, 'Р', 12, 0, 'b'),
(58, 'П', 12, 0, 'c'),
(59, 'А', 12, 0, 'd'),
(60, 'Г', 12, 1, 'e'),
(61, 'безопасное', 13, 0, 'a'),
(62, 'смутное', 13, 1, 'b'),
(63, 'забытое', 13, 0, 'c'),
(64, 'прекрасное', 13, 0, 'd'),
(65, 'грустное', 13, 0, 'e'),
(66, '500', 14, 0, 'a'),
(67, '350', 14, 0, 'b'),
(68, '2500', 14, 0, 'c'),
(69, '1000', 14, 1, 'd'),
(70, '250', 14, 0, 'e'),
(71, 'бензин', 15, 0, 'a'),
(72, 'нефть', 15, 0, 'b'),
(73, 'дерево', 15, 0, 'c'),
(74, 'электричество', 15, 1, 'd'),
(75, 'уголь', 15, 0, 'e'),
(76, '205', 16, 0, 'a'),
(77, '55', 16, 0, 'b'),
(78, '175', 16, 1, 'c'),
(79, '120', 16, 0, 'd'),
(80, '195', 16, 0, 'e'),
(81, '7', 17, 0, 'a'),
(82, '9', 17, 1, 'b'),
(83, '10', 17, 0, 'c'),
(84, '12', 17, 0, 'd'),
(85, '6', 17, 0, 'e'),
(86, '', 18, 0, 'a'),
(87, '', 18, 0, 'b'),
(88, '', 18, 1, 'c'),
(89, '', 18, 0, 'd'),
(90, '', 18, 0, 'e'),
(91, '2.50 руб.', 19, 0, 'a'),
(92, '35 копеек', 19, 0, 'b'),
(93, '21 копейка', 19, 0, 'c'),
(94, '1.20 руб.', 19, 1, 'd'),
(95, '75 копеек', 19, 0, 'e'),
(96, 'бросать', 20, 0, 'a'),
(97, 'опротиветь', 20, 0, 'b'),
(98, 'отвергать', 20, 0, 'c'),
(99, 'откликаться', 20, 0, 'd'),
(100, 'слушать', 20, 1, 'e'),
(101, 'разрушающий', 21, 0, 'a'),
(102, 'скупой', 21, 0, 'b'),
(103, 'напрасный', 21, 0, 'c'),
(104, 'расточительный', 21, 1, 'd'),
(105, 'тратящий', 21, 0, 'e'),
(106, 'аргумента', 22, 0, 'a'),
(107, 'офиса', 22, 0, 'b'),
(108, 'председателя', 22, 0, 'c'),
(109, 'слушателей', 22, 0, 'd'),
(110, 'темы', 22, 1, 'e'),
(111, 'П', 23, 0, 'a'),
(112, 'Р', 23, 0, 'b'),
(113, 'Н', 23, 1, 'c'),
(114, 'Г', 23, 0, 'd'),
(115, 'А', 23, 0, 'e'),
(116, 'верно', 24, 0, 'a'),
(117, 'неверно', 24, 0, 'b'),
(118, 'неопределённо', 24, 1, 'c'),
(121, 'неплохой и хороший', 25, 0, 'a'),
(122, 'привлекательный и прекрасный', 25, 0, 'b'),
(123, 'маленький и мелкий', 25, 1, 'c'),
(124, 'тёплый и горячий', 25, 0, 'd'),
(126, '3', 26, 0, 'a'),
(127, '6', 26, 0, 'b'),
(128, '7', 26, 0, 'c'),
(129, '5', 26, 1, 'd'),
(130, '4', 26, 0, 'e'),
(131, 'устаревшим', 27, 0, 'a'),
(132, 'абсолютным', 27, 1, 'b'),
(133, 'гипотетическим', 27, 0, 'c'),
(134, 'теоретическим', 27, 0, 'd'),
(135, 'уточняемым', 27, 0, 'e'),
(136, 'лук', 28, 0, 'a'),
(137, 'боты', 28, 0, 'b'),
(138, 'край', 28, 0, 'c'),
(139, 'кипа', 28, 0, 'd'),
(140, 'лоза', 28, 1, 'e'),
(141, 'остановившийся', 29, 0, 'a'),
(142, 'каждый', 29, 0, 'b'),
(143, 'идущий', 29, 0, 'c'),
(144, 'добавочный', 29, 0, 'd'),
(145, 'быстрый', 29, 1, 'e'),
(146, 'редко', 30, 0, 'a'),
(147, 'периодически', 30, 0, 'b'),
(148, 'часто', 30, 1, 'c'),
(149, 'никогда', 30, 0, 'd'),
(150, 'переменно', 30, 0, 'e'),
(151, '14', 31, 1, 'a'),
(152, '12', 31, 0, 'b'),
(153, '6', 31, 0, 'c'),
(154, '9', 31, 0, 'd'),
(155, '15', 31, 0, 'e'),
(156, 'любовь', 32, 0, 'a'),
(157, 'ободрение', 32, 0, 'b'),
(158, 'радость', 32, 0, 'c'),
(159, 'неприязнь', 32, 1, 'd'),
(160, 'страх', 32, 0, 'e'),
(161, 'плавание', 33, 0, 'a'),
(162, 'водопад', 33, 1, 'b'),
(163, 'яхта', 33, 0, 'c'),
(164, 'рыба', 33, 0, 'd'),
(165, 'вода', 33, 0, 'e'),
(166, 'напитки', 34, 0, 'a'),
(167, 'игры', 34, 0, 'b'),
(168, 'гости', 34, 1, 'c'),
(169, 'кабаре', 34, 0, 'd'),
(170, 'официанты', 34, 0, 'e'),
(171, 'тяжёлым', 35, 0, 'a'),
(172, 'движением', 35, 0, 'b'),
(173, 'весом', 35, 1, 'c'),
(174, 'граммами', 35, 0, 'd'),
(175, 'грузовиком', 35, 0, 'e'),
(176, 'хаос', 36, 0, 'a'),
(177, 'деятельность', 36, 0, 'b'),
(178, 'перестановка', 36, 1, 'c'),
(179, 'путаница', 36, 0, 'd'),
(180, 'продвижение', 36, 0, 'e'),
(181, 'верно', 37, 0, 'a'),
(182, 'неверно', 37, 1, 'b'),
(183, 'неопределённо', 37, 0, 'c'),
(184, 'А', 37, 0, 'd'),
(185, 'Д', 37, 0, 'e'),
(186, 'М', 38, 0, 'a'),
(187, 'Н', 38, 0, 'b'),
(188, 'И', 38, 1, 'c'),
(191, '', 39, 0, 'a'),
(192, '', 39, 1, 'b'),
(193, '', 39, 0, 'c'),
(194, '', 39, 0, 'd'),
(195, '', 39, 0, 'e'),
(196, 'ложь', 40, 0, 'a'),
(197, 'отпуск', 40, 0, 'b'),
(198, 'присутствие', 40, 1, 'c'),
(199, 'прогул', 40, 0, 'd'),
(200, 'визит', 40, 0, 'e'),
(201, 'выше', 41, 0, 'a'),
(202, 'медлительнее', 41, 0, 'b'),
(203, 'старше', 41, 1, 'c'),
(204, 'умнее', 41, 0, 'd'),
(205, 'проницательнее', 41, 0, 'e'),
(206, 'темперамент', 42, 0, 'a'),
(207, 'расовую принадлежность', 42, 1, 'b'),
(208, 'место рождения', 42, 0, 'c'),
(209, 'место проживания', 42, 0, 'd'),
(210, 'личность', 42, 0, 'e'),
(211, 'двери', 43, 0, 'a'),
(212, 'окна', 43, 0, 'b'),
(213, 'стены', 43, 1, 'c'),
(214, 'кирпичи', 43, 0, 'd'),
(215, 'трубы', 43, 0, 'e'),
(216, 'стороны', 44, 0, 'a'),
(217, 'окружность', 44, 1, 'b'),
(218, 'треугольник', 44, 0, 'c'),
(219, 'углы', 44, 0, 'd'),
(220, 'размер', 44, 0, 'e'),
(221, 'грустный-жалость', 45, 1, 'a'),
(222, 'красивый-уродливый', 45, 0, 'b'),
(223, 'правда-ложь', 45, 0, 'c'),
(224, 'давать-брать', 45, 0, 'd'),
(226, 'противоположное', 46, 0, 'a'),
(227, 'то же самое', 46, 0, 'b'),
(228, 'ни то же самое, ни противоположное', 46, 1, 'c'),
(231, 'бежать', 47, 0, 'a'),
(232, 'гулять', 47, 0, 'b'),
(233, 'ползти', 47, 0, 'c'),
(234, 'присажиться', 47, 1, 'd'),
(235, 'прыгать', 47, 0, 'e'),
(236, 'неправдоподобной', 48, 1, 'a'),
(237, 'умной', 48, 0, 'b'),
(238, 'губительной', 48, 0, 'c'),
(239, 'недалёкой', 48, 0, 'd'),
(240, 'астрономической', 48, 0, 'e'),
(241, 'упрямый', 49, 0, 'a'),
(242, 'предатель', 49, 0, 'b'),
(243, 'трусливый', 49, 1, 'c'),
(244, 'медлительный', 49, 0, 'd'),
(245, 'безотвественный', 49, 0, 'e'),
(246, 'добиться', 50, 0, 'a'),
(247, 'отступить', 50, 0, 'b'),
(248, 'неудача', 50, 1, 'c'),
(249, 'препятствие', 50, 0, 'd'),
(250, 'победа', 50, 0, 'e'),
(251, 'упреждать', 51, 0, 'a'),
(252, 'прежде', 51, 1, 'b'),
(253, 'слышать прежде', 51, 0, 'c'),
(254, 'идти прежде', 51, 0, 'd'),
(255, 'сделать прежде или после', 51, 0, 'e'),
(256, '1.25 руб.', 52, 0, 'a'),
(257, '1.05 руб.', 52, 1, 'b'),
(258, '75 коп.', 52, 0, 'c'),
(259, '1.57 руб.', 52, 0, 'd'),
(260, '57 коп.', 52, 0, 'e'),
(261, '5', 53, 0, 'a'),
(262, '1', 53, 0, 'b'),
(263, '0', 53, 0, 'c'),
(264, '6', 53, 1, 'd'),
(265, '7', 53, 0, 'e'),
(266, '', 54, 0, 'a'),
(267, '', 54, 1, 'b'),
(268, '', 54, 0, 'c'),
(269, '', 54, 0, 'd'),
(270, '', 54, 0, 'e'),
(271, 'верно', 55, 0, 'a'),
(272, 'неверно', 55, 0, 'b'),
(273, 'неопределённо', 55, 1, 'c'),
(276, 'Е', 56, 1, 'a'),
(277, 'Л', 56, 0, 'b'),
(278, 'Ь', 56, 0, 'c'),
(279, 'М', 56, 0, 'd'),
(280, 'В', 56, 0, 'e'),
(281, '80', 57, 0, 'a'),
(282, '33.3', 57, 0, 'b'),
(283, '60', 57, 1, 'c'),
(284, '66.6', 57, 0, 'd'),
(285, '40', 57, 0, 'e'),
(286, 'осторожным', 58, 0, 'a'),
(287, 'упрямым', 58, 0, 'b'),
(288, 'лживым', 58, 1, 'c'),
(289, 'неинформационным', 58, 0, 'd'),
(290, 'самоуверенным', 58, 0, 'e'),
(291, 'читать книги', 59, 0, 'a'),
(292, 'стелить постели', 59, 0, 'b'),
(293, 'принимать гостей', 59, 0, 'c'),
(294, 'создавать трудности', 59, 1, 'd'),
(295, '', 59, 0, 'e'),
(296, '12', 60, 0, 'a'),
(297, '8', 60, 0, 'b'),
(298, '15', 60, 1, 'c'),
(299, '18', 60, 0, 'd'),
(300, '20', 60, 0, 'e'),
(301, 'несправедливым', 61, 0, 'a'),
(302, 'верным', 61, 0, 'b'),
(303, 'неоднозначным', 61, 1, 'c'),
(304, 'сомнительным', 61, 0, 'd'),
(305, 'неверным', 61, 0, 'e'),
(306, 'богатство', 62, 0, 'a'),
(307, 'репутация', 62, 0, 'b'),
(308, 'положение', 62, 0, 'c'),
(309, 'замкнутость', 62, 1, 'd'),
(310, 'власть', 62, 0, 'e'),
(311, '11', 63, 0, 'a'),
(312, '3', 63, 1, 'b'),
(313, '5', 63, 0, 'c'),
(314, '9', 63, 0, 'd'),
(315, '10', 63, 0, 'e'),
(316, 'будет', 64, 0, 'a'),
(317, 'сегодня', 64, 0, 'b'),
(318, 'тогда', 64, 1, 'c'),
(319, 'вчера', 64, 0, 'd'),
(320, 'потом', 64, 0, 'e'),
(321, 'Е', 65, 0, 'a'),
(322, 'Й', 65, 0, 'b'),
(323, 'Е', 65, 1, 'c'),
(326, '', 66, 0, 'a'),
(327, '', 66, 0, 'b'),
(328, '', 66, 0, 'c'),
(329, '', 66, 1, 'd'),
(330, '', 66, 0, 'e'),
(331, '92', 67, 0, 'a'),
(332, '48', 67, 0, 'b'),
(333, '88', 67, 1, 'c'),
(334, '90', 67, 0, 'd'),
(335, '76', 67, 0, 'e'),
(336, 'вода', 68, 0, 'a'),
(337, 'снег', 68, 1, 'b'),
(338, 'нефть', 68, 0, 'c'),
(339, 'сыр', 68, 0, 'd'),
(340, 'море', 68, 0, 'e'),
(341, 'ОКНО', 69, 0, 'a'),
(342, 'МАМА', 69, 0, 'b'),
(343, 'ЛАПА', 69, 0, 'c'),
(344, 'ОНО', 69, 1, 'd'),
(345, 'ЛИЛИЯ', 69, 0, 'e'),
(346, 'осла', 70, 0, 'a'),
(347, 'слона', 70, 0, 'b'),
(348, 'волка', 70, 0, 'c'),
(349, 'кошку', 70, 1, 'd'),
(350, 'зебру', 70, 0, 'e'),
(351, 'всегда', 71, 0, 'a'),
(352, 'никогда не', 71, 0, 'b'),
(353, 'намного', 71, 0, 'c'),
(354, 'обычно', 71, 1, 'd'),
(355, 'редко бывают', 71, 0, 'e'),
(356, 'О', 72, 0, 'a'),
(357, 'Е', 72, 0, 'b'),
(358, 'Р', 72, 0, 'c'),
(359, 'И', 72, 0, 'd'),
(360, 'Н', 72, 1, 'e'),
(361, 'лев', 73, 0, 'a'),
(362, 'акробат', 73, 0, 'b'),
(363, 'клоун', 73, 0, 'c'),
(364, 'цирк', 73, 1, 'd'),
(365, 'лошадь', 73, 0, 'e'),
(366, 'экспрессия', 74, 0, 'a'),
(367, 'девальвация', 74, 0, 'b'),
(368, 'деградация', 74, 1, 'c'),
(369, 'революция', 74, 0, 'd'),
(370, 'замедление', 74, 0, 'e'),
(371, '3', 75, 0, 'a'),
(372, '9', 75, 0, 'b'),
(373, '18', 75, 0, 'c'),
(374, '64', 75, 1, 'd'),
(375, '96', 75, 0, 'e'),
(376, 'верно', 76, 0, 'a'),
(377, 'неверно', 76, 1, 'b'),
(378, 'неопределённо', 76, 0, 'c'),
(381, '36.3', 77, 0, 'a'),
(382, '16', 77, 1, 'b'),
(383, '18', 77, 0, 'c'),
(384, '23.6', 77, 0, 'd'),
(385, '24', 77, 0, 'e'),
(386, '1', 78, 0, 'a'),
(387, '2', 78, 0, 'b'),
(388, '3', 78, 1, 'c'),
(389, '4', 78, 0, 'd'),
(390, '5', 78, 0, 'e'),
(391, '1', 79, 0, 'a'),
(392, '2', 79, 0, 'b'),
(393, '3', 79, 1, 'c'),
(394, '4', 79, 0, 'd'),
(395, '5', 79, 0, 'e'),
(396, '4', 80, 0, 'a'),
(397, '3', 80, 0, 'b'),
(398, '2', 80, 0, 'c'),
(399, '6', 80, 1, 'd'),
(400, '5', 80, 0, 'e');

-- --------------------------------------------------------

--
-- Структура таблицы `Companies`
--

CREATE TABLE `Companies` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Companies`
--

INSERT INTO `Companies` (`id`, `name`) VALUES
(3, 'robo'),
(4, 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `QuestionImages`
--

CREATE TABLE `QuestionImages` (
  `id` int NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `question_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `QuestionImages`
--

INSERT INTO `QuestionImages` (`id`, `image_name`, `question_id`) VALUES
(1, '5.jpg', 5),
(2, '18.jpg', 18),
(3, '39.jpg', 39),
(4, '54.jpg', 54),
(5, '66.jpg', 66),
(6, '78.jpg', 78);

-- --------------------------------------------------------

--
-- Структура таблицы `Questions`
--

CREATE TABLE `Questions` (
  `id` int NOT NULL,
  `question_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Questions`
--

INSERT INTO `Questions` (`id`, `question_text`) VALUES
(1, 'Если два мороженых стоять восемь рублей, то сколько можно купить на восемьдесят рублей?'),
(2, 'У ребёнка не всегда есть'),
(3, 'Вероятнее всего в школе есть'),
(4, 'Обычно вернее всего можно судить о характере по'),
(5, 'Первая фигура соотносится со второй, как третья соотносится с одной из следующих четырёх. С какой?'),
(6, 'Противоположным к \"неуклюжий\" является'),
(7, 'Луна соотносится с Землёй так же, как Земля соотносится с'),
(8, 'Если первые два утверждения верны, то третье ______ ? <br>\r\nИлья старше Павла.<br>\r\nСергей старше Ильи.<br>\r\nПавел младше Сергея.'),
(9, 'Которое из пяти данных ниже слов менее всего схоже с четырьмя другими?'),
(10, 'Которое из этих слов идет в словаре перывм по порядку?'),
(11, 'Алмазы дороже стекла, потому что они'),
(12, 'Какая буква в слове ПЕРГАМЕНТ занимает по счёту то же место (считая от начала), что и в алфавите?'),
(13, 'О воспоминании, которое является неточным, можно сказать, что оно'),
(14, 'Если собака может пробежать 10 метров за 1.5 секунды, то сколько метров она может пробежать за 20 секунд?'),
(15, 'Четыре из этих пяти вещей в чём-то схожи, какой пункт не похож на остальные?'),
(16, 'Если 5 ящиков апельсинов весят 200 килограммов, а каждый пустой ящик весит 5 килограммов, то сколько килограммов апелисинов в пяти ящиках?'),
(17, 'Одно число в следующем ряду выпадает из последовательности: 1, 6, 2, 7, 3, 8, 4, 9, 5. Какое?'),
(18, 'Первая фигура соотносится со второй, как третья соотносится с одной из следующих четырёх. С какой?'),
(19, 'Если 2.5 метра проволоки стоят 15 копеек, то сколько будут стоить 20 метров?'),
(20, 'Четыре из этих слов в чем-то похожи. Которое из них не так похоже на остальные?'),
(21, 'Противополодным \"экономный\" является'),
(22, 'Дискуссия всегда предполагает наличие'),
(23, 'Найдите две буквы в слове НЕВРОПАТОЛОГ, между которыми в слове столько же букв, сколько букв между ними в алфавите. Какая из этих двух букв идёт первой в алфавите?'),
(24, 'Если первые два утверждения верны, то третье ________ ?<br>\r\nНельзя стать чемпионом по плаванию без большой тренировки.<br>\r\nДжим часто тренируется в плавании.<br>\r\nДжим будет чемпионом по плаванию.'),
(25, 'Которое из этих выражений менее всего похоже на остальные три?'),
(26, 'Сколько из данных ниже слов можно составить из букв слова КРЕСТОВИНА, используя каждую букву любое количество раз?<br>\r\nФрант, кроссовки, аквамарин, винтовка, верста, треска, антоновка'),
(27, 'В физике закон сохранения энергии является'),
(28, 'Лак относится к бак, как _______ к коза'),
(29, 'Которое из этих слов соотносится с медленный, как много соотносится с мало?'),
(30, 'Противоположное к \"изредка\" это -'),
(31, 'Мужчина и его жена, его две дочери и их мужья и четверо детей в семье каждой дочереи составляют группу из _______ ? человек.'),
(32, 'Противоположное к \"дружелюбию\"'),
(33, 'Кинофильм соотносится с фотографией таким же образом, как _______ соотносится с озером'),
(34, 'На вечеринке всегда есть'),
(35, 'Часы соотносятся со временем, как весы с'),
(36, '\"Действие по изменению позиции\" - хорошее определение для слова'),
(37, 'Если первые два утверждения верно, то третье ______ ?<br>\r\nВсе студенты сдали свои экзамены.<br>\r\nДжон не сдал свой экзамен.<br>\r\nДжон - студент.'),
(38, 'Если слова, данные ниже, переставить, чтобы получилось хорошее предложение, то с какой буквы будет начинаться второе слово в этом предложении?<br>\r\nмужчин две имеет ноги большинство'),
(39, 'Первая фигура соотносится со второй, как третья соотносится с одной из следующих четырёх. С какой?'),
(40, 'Правда относится ко лжи, как _______ ? к отсутствию'),
(41, 'Отец всегда _______ ?, чем его сын'),
(42, 'Такие вещи, как язык, одежда, традиции, цвет кожи, показывают'),
(43, 'Здание всегда имеет'),
(44, 'Что соотносится со сферой так же, как квадрат соотносится с кубом?'),
(45, 'Какая из этих пар слов менее всего похожа на остальные три?'),
(46, 'Два слова <i><b>необходимый</b></i> и <i><b>желанный</b></i> обозначают'),
(47, 'Из пяти слов, данных ниже, четыре определённым образом похожи. Какое слово не похоже на эти четыре?'),
(48, 'Мысль о том, что Земля есть цент Вселенной, является'),
(49, 'Противоположное к храброму'),
(50, 'Противоположное к успеху'),
(51, 'Предшествовать означает \"идти прежде\", предупреждать означает \"сказать прежде\", значит, \"пред-\" означает'),
(52, 'Если 13.5 метров проволоки стоят 1,35 рублей, то сколько будут стоит 10.5 метров?'),
(53, 'Какое число в этом ряду появляется второй раз ближе к началу?<br>\r\n7 5 6 4 8 9 1 0 6 0 9 9 7 6 5 8 4 1 9 0 2'),
(54, 'Первая фигура соотносится со второй, как третья соотносится с одной из следующих четырёх. С какой?'),
(55, 'Если первые два из данных утверждения верно, то третье<br>\r\nНекоторые из наших знакомых - клерки.<br>\r\nНекоторые из наших знакомых - мужчины.<br>\r\nНекоторые из наших знакомых - мужчины-клерки.'),
(56, 'Если слова, данные ниже, переставить, чтобы получилось хорошее предложение, то на какую букву будет оканчиваться четвёртое слово в предложении?<br>\r\nв журавль синица руке в лучше небе чем'),
(57, 'Сифон изготавливает смесь из 3 частей воды и 2 частей апельсинового сиропа. Сколько литров воды потребуется на изготовление 100 литров смеси?'),
(58, 'Если человек говорит вещи, которые, как он знает, неверны, то его называют'),
(59, 'Которое из этих выражений менее всего похоже на остальные три?'),
(60, 'Если отец может пройти 10 метров в том время, как ребёнок проползает 4 метра, то сколько метров может пройти отец, пока ребёнок проползает 6 метров?'),
(61, 'Утверждение, которое не имеет определённого значения, называют'),
(62, 'Что из следующего является чертой личности?'),
(63, 'В данном ряду одно число неверно - 2, 12, 4, 9, 8, 6, 16, 4. Какое число должно быть вместо него?'),
(64, 'Идущий относится к ушедшей, как сейчас относится к'),
(65, 'Если из слов, данных ниже, составить предложение, то на какую букву будет оканчиваться последнее слово в предложении?<br>\r\nзнает мать лучший всегда ответ не'),
(66, 'Первая фигура соотносится со второй, как третья соотносится с одной из следующих четырёх. С какой?'),
(67, 'Кусок бечевки в 72 сантиметра длиной садится до 66 сантиметров, если его намочить. Какая длина будет у 96-сантиметровой бечёвки после того, как её намочили?'),
(68, 'Которая из пяти вещей, данных ниже, более всего схожа с этими тремя: известь, хлопок, слоновая кость?'),
(69, 'Если бы Вы смотрели на пять данных ниже слов в зеркало, стоящее прямо вверху страницы, то которое из них выглядело бы почти так же, как если бы Вы смотрели на него прямо?'),
(70, 'Тигр больше всего похож на'),
(71, 'Какое дополнительное слово из пяти слов внизу дополнило бы это предложение наиболее правильно?<br>\r\nУчителя ______ ? мудрее свои учеников'),
(72, 'Какая буква является четвёртой направо от буквы, стоящей посередине между \"Х\" и \"Е\" в слове СТИХОТВОРЕНИЯ?'),
(73, 'Которое из пяти слов, данных ниже, менее всего похоже на остальные четыре?'),
(74, '\"Регресс\" соотносится с \"эволюцией\", как \"прогресс\" соотносится с'),
(75, 'Одно число является неверным в следующем ряду - 2, 4, 8, 16, 32, 60, 128. Каким должно быть это число?'),
(76, 'Если электропоезд движется на север со скоростью 15 км/час, а ветер сильно дует на юг со скоростью 30 км/час, то поезд будет двигаться на юг со скоростью 15 км/час'),
(77, 'Если кусок бечёвки разрезать так, что одна часть составляет две трети от другой части, а общая длина бечёвки - 40 метров, то какова длина короткой части?'),
(78, 'Какая цифра находится здесь в пространстве, которое в окружности и в треугольнике, но не в прямоугольнике?'),
(79, 'Сколько тут есть цифр, каждая из которых входит в две геометрические фигуры (но только в две)?'),
(80, 'Какая цифра входит в ту же геометрическую фигуру или фигуры (и в никакие другие), что и цифра 7?');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `post_position` varchar(255) DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `first_name`, `second_name`, `last_name`, `post_position`, `company_id`) VALUES
(2, 'Борис', 'Прокофьев', 'Бузуев', 'Программист', 3),
(3, 'Алёна ', 'Стрельцова', 'Ивлева', 'Бухгалтер', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersResults`
--

CREATE TABLE `UsersResults` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `points` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `UsersResults`
--

INSERT INTO `UsersResults` (`id`, `user_id`, `points`) VALUES
(1, 2, 91),
(4, 3, 76);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Admins`
--
ALTER TABLE `Admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Answers`
--
ALTER TABLE `Answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `QuestionImages`
--
ALTER TABLE `QuestionImages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Индексы таблицы `UsersResults`
--
ALTER TABLE `UsersResults`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Admins`
--
ALTER TABLE `Admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Answers`
--
ALTER TABLE `Answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT для таблицы `Companies`
--
ALTER TABLE `Companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `QuestionImages`
--
ALTER TABLE `QuestionImages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `Questions`
--
ALTER TABLE `Questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `UsersResults`
--
ALTER TABLE `UsersResults`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `QuestionImages`
--
ALTER TABLE `QuestionImages`
  ADD CONSTRAINT `questionimages_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `Questions` (`id`);

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `Companies` (`id`);

--
-- Ограничения внешнего ключа таблицы `UsersResults`
--
ALTER TABLE `UsersResults`
  ADD CONSTRAINT `usersresults_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
