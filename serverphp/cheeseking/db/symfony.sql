-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Трв 24 2019 р., 18:15
-- Версія сервера: 5.7.24-0ubuntu0.18.04.1
-- Версія PHP: 7.1.26-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `symfony`
--

-- --------------------------------------------------------

--
-- Структура таблиці `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `hash` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `cart`
--

INSERT IGNORE INTO `cart` (`id`, `goods_id`, `users_id`, `count`, `hash`) VALUES
(46, 51, NULL, 1, 'AavyvcPEzAyvRoo'),
(47, 42, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(48, 38, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(49, 19, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(50, 103, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(51, 51, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(52, 23, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(53, 22, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(54, 84, NULL, 1, 'RqdFxh8c7wJ4xyI'),
(55, 15, NULL, 1, 'KRX621UnX7mnh4g'),
(56, 24, NULL, 1, 'KRX621UnX7mnh4g'),
(57, 11, NULL, 1, 'i0KC5nZ7B5gpWr8'),
(59, 13, 3, 1, NULL),
(60, 41, 3, 5, NULL),
(70, 22, NULL, 1, 'lgg7BYV1NsR2Piq'),
(71, 42, NULL, 1, 'lgg7BYV1NsR2Piq');

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name_ua` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name_ru` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name_by` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name_en` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paren_id` int(11) DEFAULT NULL,
  `alias` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT IGNORE INTO `categories` (`id`, `category_name_ua`, `category_name_ru`, `category_name_by`, `category_name_en`, `paren_id`, `alias`, `ordering`, `icon`, `seo`) VALUES
(34, '111UAUAUAU', '111RURUR', '111BYBYBY', '111En', 0, 'GoUwQ0', 1, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(35, '222UAUAUAU', '222RURUR', '222BYBYBY', '222En', 0, '6gp9h8', 2, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(36, '333UAUAUAU', '333RURUR', '333BYBYBY', '333En', 0, 'Gh2c3y', 3, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(37, '444UAUAUAU', '444RURUR', '444BYBYBY', '444En', 0, 'bYNbB9', 4, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(38, '555UAUAUAU', '555RURUR', '555BYBYBY', '555En', 37, 'wL7xiZ', 5, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(39, '666UAUAUAU', '666RURUR', '666BYBYBY', '666En', 38, '2IfBJb', 6, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(40, '777UAUAUAU', '777RURUR', '777BYBYBY', '777En', 39, 'W5H0sM', 7, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(41, '888UAUAUAU', '888RURUR', '888BYBYBY', '888En', 0, 'Oaaouj', 8, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(42, '999UAUAUAU', '999RURUR', '999BYBYBY', '999En', 0, 'CQI9pP', 9, 'icon', '{\"description\":\"ddfdsafasdfasfd\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(43, '101010UAUAUAU', '101010RURUR', '101010BYBYBY', '101010En', 0, '6VClHW', 10, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}'),
(44, '111111UAUAUAU', '111111RURUR', '111111BYBYBY', '111111En', 0, 'fFnywQ', 11, 'icon', '{\"description\":\"Description\", \"keywords\":\"Key1;Key2\",\"robots\":\"sd sdf dsaf asdf sa dfasdf\"}');

-- --------------------------------------------------------

--
-- Структура таблиці `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `cur_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `national_convertation_koefficient` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `currencies`
--

INSERT IGNORE INTO `currencies` (`id`, `cur_code`, `is_default`, `national_convertation_koefficient`) VALUES
(5, 'UAH', 1, 1),
(6, 'USD', 0, 28);

-- --------------------------------------------------------

--
-- Структура таблиці `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `hash` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `favourites`
--

INSERT IGNORE INTO `favourites` (`id`, `goods_id`, `users_id`, `hash`) VALUES
(133, 22, NULL, 'oe0jQlmZOldiYkp'),
(134, 23, NULL, 'oe0jQlmZOldiYkp'),
(139, 12, NULL, 'oe0jQlmZOldiYkp'),
(140, 14, NULL, 'oe0jQlmZOldiYkp'),
(141, 17, NULL, 'oe0jQlmZOldiYkp'),
(142, 27, NULL, 'oe0jQlmZOldiYkp'),
(143, 73, NULL, 'oe0jQlmZOldiYkp'),
(146, 22, 1, NULL),
(149, 42, 1, NULL),
(150, 19, 1, NULL),
(151, 18, 1, NULL),
(152, 24, 1, NULL),
(153, 26, 1, NULL),
(154, 29, 1, NULL),
(156, 41, NULL, 'mY6G2LLrnzSLpmp'),
(157, 48, NULL, 'mY6G2LLrnzSLpmp'),
(159, 72, NULL, 'mY6G2LLrnzSLpmp'),
(160, 18, NULL, 'mY6G2LLrnzSLpmp'),
(161, 90, NULL, 'mY6G2LLrnzSLpmp'),
(162, 11, NULL, 'mY6G2LLrnzSLpmp'),
(165, 28, NULL, 'mY6G2LLrnzSLpmp'),
(166, 28, NULL, 'mY6G2LLrnzSLpmp'),
(167, 28, NULL, 'mY6G2LLrnzSLpmp'),
(168, 28, NULL, 'mY6G2LLrnzSLpmp'),
(169, 28, NULL, 'mY6G2LLrnzSLpmp'),
(170, 28, NULL, 'mY6G2LLrnzSLpmp'),
(171, 28, NULL, 'mY6G2LLrnzSLpmp'),
(172, 28, NULL, 'mY6G2LLrnzSLpmp'),
(173, 28, NULL, 'mY6G2LLrnzSLpmp'),
(174, 28, NULL, 'mY6G2LLrnzSLpmp'),
(184, 20, NULL, 'mY6G2LLrnzSLpmp'),
(185, 20, NULL, 'mY6G2LLrnzSLpmp'),
(186, 20, NULL, 'mY6G2LLrnzSLpmp'),
(187, 20, NULL, 'mY6G2LLrnzSLpmp'),
(195, 20, NULL, 'mY6G2LLrnzSLpmp'),
(196, 20, NULL, 'mY6G2LLrnzSLpmp'),
(197, 20, NULL, 'mY6G2LLrnzSLpmp'),
(201, 15, NULL, 'mY6G2LLrnzSLpmp'),
(205, 29, NULL, 'mY6G2LLrnzSLpmp'),
(206, 20, NULL, 'mY6G2LLrnzSLpmp'),
(207, 30, NULL, 'mY6G2LLrnzSLpmp'),
(209, 22, NULL, 'mY6G2LLrnzSLpmp'),
(211, 51, NULL, 'mY6G2LLrnzSLpmp'),
(217, 42, NULL, 'mY6G2LLrnzSLpmp'),
(220, 19, NULL, 'mY6G2LLrnzSLpmp'),
(222, 45, NULL, 'mY6G2LLrnzSLpmp'),
(223, 53, NULL, 'mY6G2LLrnzSLpmp'),
(224, 56, NULL, 'mY6G2LLrnzSLpmp'),
(225, 54, NULL, 'mY6G2LLrnzSLpmp'),
(226, 47, NULL, 'mY6G2LLrnzSLpmp'),
(227, 50, NULL, 'mY6G2LLrnzSLpmp'),
(228, 62, NULL, 'mY6G2LLrnzSLpmp'),
(229, 24, NULL, 'mY6G2LLrnzSLpmp'),
(230, 26, NULL, 'mY6G2LLrnzSLpmp'),
(231, 31, NULL, 'mY6G2LLrnzSLpmp'),
(232, 33, NULL, 'mY6G2LLrnzSLpmp'),
(233, 37, NULL, 'mY6G2LLrnzSLpmp'),
(234, 39, NULL, 'mY6G2LLrnzSLpmp'),
(235, 95, NULL, 'mY6G2LLrnzSLpmp'),
(236, 96, NULL, 'mY6G2LLrnzSLpmp'),
(237, 97, NULL, 'mY6G2LLrnzSLpmp'),
(238, 99, NULL, 'mY6G2LLrnzSLpmp'),
(240, 71, NULL, 'mY6G2LLrnzSLpmp'),
(242, 79, NULL, 'mY6G2LLrnzSLpmp'),
(243, 68, NULL, 'mY6G2LLrnzSLpmp'),
(244, 69, NULL, 'mY6G2LLrnzSLpmp'),
(245, 12, NULL, 'mY6G2LLrnzSLpmp'),
(246, 14, NULL, 'mY6G2LLrnzSLpmp'),
(247, 16, NULL, 'mY6G2LLrnzSLpmp'),
(249, 40, NULL, 'mY6G2LLrnzSLpmp'),
(250, 43, NULL, 'mY6G2LLrnzSLpmp'),
(251, 76, NULL, 'mY6G2LLrnzSLpmp'),
(252, 34, NULL, 'mY6G2LLrnzSLpmp'),
(253, 21, NULL, 'mY6G2LLrnzSLpmp'),
(254, 77, NULL, 'mY6G2LLrnzSLpmp'),
(255, 108, NULL, 'mY6G2LLrnzSLpmp'),
(256, 96, NULL, '5Qgh4W7uUssyJwc'),
(257, 38, NULL, 'i0KC5nZ7B5gpWr8'),
(258, 10, NULL, 'i0KC5nZ7B5gpWr8'),
(259, 23, NULL, 'SGzUvhUQe1o3qro'),
(260, 30, NULL, 'VUVezbEfLkBzeO9'),
(261, 26, NULL, 'VUVezbEfLkBzeO9'),
(262, 38, NULL, 'lgg7BYV1NsR2Piq'),
(263, 42, NULL, 'lgg7BYV1NsR2Piq');

-- --------------------------------------------------------

--
-- Структура таблиці `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `name_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ru` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filter_type` int(11) NOT NULL,
  `id_ext` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `filters`
--

INSERT IGNORE INTO `filters` (`id`, `name_by`, `name_en`, `name_ua`, `name_ru`, `allowed`, `filter_type`, `id_ext`) VALUES
(151, 'Slhv BY', 'Slhv EN', 'Slhv UA', 'Slhv RU', '[{\"id\":0,\"RU\":\"I5tt RU\",\"EN\":\"I5tt EN\",\"UA\":\"I5tt UA\",\"BY\":\"I5tt BY\"},{\"id\":1,\"RU\":\"Mrqu RU\",\"EN\":\"Mrqu EN\",\"UA\":\"Mrqu UA\",\"BY\":\"Mrqu BY\"},{\"id\":2,\"RU\":\"MXqT RU\",\"EN\":\"MXqT EN\",\"UA\":\"MXqT UA\",\"BY\":\"MXqT BY\"},{\"id\":3,\"RU\":\"9Rfp RU\",\"EN\":\"9Rfp EN\",\"UA\":\"9Rfp UA\",\"BY\":\"9Rfp BY\"}]', 2, NULL),
(152, 'BkmE BY', 'BkmE EN', 'BkmE UA', 'BkmE RU', '[{\"id\":4,\"RU\":\"kk7L RU\",\"EN\":\"kk7L EN\",\"UA\":\"kk7L UA\",\"BY\":\"kk7L BY\"},{\"id\":5,\"RU\":\"p617 RU\",\"EN\":\"p617 EN\",\"UA\":\"p617 UA\",\"BY\":\"p617 BY\"},{\"id\":6,\"RU\":\"tLQJ RU\",\"EN\":\"tLQJ EN\",\"UA\":\"tLQJ UA\",\"BY\":\"tLQJ BY\"},{\"id\":7,\"RU\":\"Igi4 RU\",\"EN\":\"Igi4 EN\",\"UA\":\"Igi4 UA\",\"BY\":\"Igi4 BY\"},{\"id\":8,\"RU\":\"SXRp RU\",\"EN\":\"SXRp EN\",\"UA\":\"SXRp UA\",\"BY\":\"SXRp BY\"}]', 2, NULL),
(153, 'yjQ1 BY', 'yjQ1 EN', 'yjQ1 UA', 'yjQ1 RU', '[{\"id\":9,\"RU\":\"F99k RU\",\"EN\":\"F99k EN\",\"UA\":\"F99k UA\",\"BY\":\"F99k BY\"},{\"id\":10,\"RU\":\"6rfC RU\",\"EN\":\"6rfC EN\",\"UA\":\"6rfC UA\",\"BY\":\"6rfC BY\"},{\"id\":11,\"RU\":\"k0jr RU\",\"EN\":\"k0jr EN\",\"UA\":\"k0jr UA\",\"BY\":\"k0jr BY\"},{\"id\":12,\"RU\":\"HGsL RU\",\"EN\":\"HGsL EN\",\"UA\":\"HGsL UA\",\"BY\":\"HGsL BY\"},{\"id\":13,\"RU\":\"021e RU\",\"EN\":\"021e EN\",\"UA\":\"021e UA\",\"BY\":\"021e BY\"},{\"id\":14,\"RU\":\"1Qvu RU\",\"EN\":\"1Qvu EN\",\"UA\":\"1Qvu UA\",\"BY\":\"1Qvu BY\"},{\"id\":15,\"RU\":\"BPdI RU\",\"EN\":\"BPdI EN\",\"UA\":\"BPdI UA\",\"BY\":\"BPdI BY\"}]', 2, NULL),
(154, 'f3pE BY', 'f3pE EN', 'f3pE UA', 'f3pE RU', '[{\"id\":16,\"RU\":\"UztU RU\",\"EN\":\"UztU EN\",\"UA\":\"UztU UA\",\"BY\":\"UztU BY\"},{\"id\":17,\"RU\":\"Oia3 RU\",\"EN\":\"Oia3 EN\",\"UA\":\"Oia3 UA\",\"BY\":\"Oia3 BY\"},{\"id\":18,\"RU\":\"F5da RU\",\"EN\":\"F5da EN\",\"UA\":\"F5da UA\",\"BY\":\"F5da BY\"},{\"id\":19,\"RU\":\"im2y RU\",\"EN\":\"im2y EN\",\"UA\":\"im2y UA\",\"BY\":\"im2y BY\"},{\"id\":20,\"RU\":\"9H4v RU\",\"EN\":\"9H4v EN\",\"UA\":\"9H4v UA\",\"BY\":\"9H4v BY\"}]', 2, NULL),
(155, 'YtCc BY', 'YtCc EN', 'YtCc UA', 'YtCc RU', '[{\"id\":21,\"RU\":\"3Y5N RU\",\"EN\":\"3Y5N EN\",\"UA\":\"3Y5N UA\",\"BY\":\"3Y5N BY\"},{\"id\":22,\"RU\":\"ylQX RU\",\"EN\":\"ylQX EN\",\"UA\":\"ylQX UA\",\"BY\":\"ylQX BY\"},{\"id\":23,\"RU\":\"TMqo RU\",\"EN\":\"TMqo EN\",\"UA\":\"TMqo UA\",\"BY\":\"TMqo BY\"},{\"id\":24,\"RU\":\"oSaN RU\",\"EN\":\"oSaN EN\",\"UA\":\"oSaN UA\",\"BY\":\"oSaN BY\"},{\"id\":25,\"RU\":\"UHuW RU\",\"EN\":\"UHuW EN\",\"UA\":\"UHuW UA\",\"BY\":\"UHuW BY\"}]', 2, NULL),
(156, 'MpKX BY', 'MpKX EN', 'MpKX UA', 'MpKX RU', '{\"min\":11,\"max\":121}', 1, NULL),
(157, 'N9Li BY', 'N9Li EN', 'N9Li UA', 'N9Li RU', '[{\"id\":26,\"RU\":\"5Kz3 RU\",\"EN\":\"5Kz3 EN\",\"UA\":\"5Kz3 UA\",\"BY\":\"5Kz3 BY\"},{\"id\":27,\"RU\":\"Smic RU\",\"EN\":\"Smic EN\",\"UA\":\"Smic UA\",\"BY\":\"Smic BY\"},{\"id\":28,\"RU\":\"7g8G RU\",\"EN\":\"7g8G EN\",\"UA\":\"7g8G UA\",\"BY\":\"7g8G BY\"},{\"id\":29,\"RU\":\"jfXG RU\",\"EN\":\"jfXG EN\",\"UA\":\"jfXG UA\",\"BY\":\"jfXG BY\"},{\"id\":30,\"RU\":\"b0Qq RU\",\"EN\":\"b0Qq EN\",\"UA\":\"b0Qq UA\",\"BY\":\"b0Qq BY\"},{\"id\":31,\"RU\":\"FCJg RU\",\"EN\":\"FCJg EN\",\"UA\":\"FCJg UA\",\"BY\":\"FCJg BY\"}]', 2, NULL),
(158, 'kIpA BY', 'kIpA EN', 'kIpA UA', 'kIpA RU', '{\"min\":10,\"max\":118}', 1, NULL),
(159, 'oPYP BY', 'oPYP EN', 'oPYP UA', 'oPYP RU', '{\"min\":11,\"max\":141}', 1, NULL),
(160, 'x66G BY', 'x66G EN', 'x66G UA', 'x66G RU', '{\"min\":12,\"max\":112}', 1, NULL),
(161, 'i8Mp BY', 'i8Mp EN', 'i8Mp UA', 'i8Mp RU', '{\"min\":13,\"max\":137}', 1, NULL),
(162, 'PyOu BY', 'PyOu EN', 'PyOu UA', 'PyOu RU', '{\"min\":11,\"max\":137}', 1, NULL),
(163, 'titw BY', 'titw EN', 'titw UA', 'titw RU', '[{\"id\":32,\"RU\":\"DiqM RU\",\"EN\":\"DiqM EN\",\"UA\":\"DiqM UA\",\"BY\":\"DiqM BY\"},{\"id\":33,\"RU\":\"ZNh9 RU\",\"EN\":\"ZNh9 EN\",\"UA\":\"ZNh9 UA\",\"BY\":\"ZNh9 BY\"},{\"id\":34,\"RU\":\"Ug8b RU\",\"EN\":\"Ug8b EN\",\"UA\":\"Ug8b UA\",\"BY\":\"Ug8b BY\"}]', 2, NULL),
(164, 'BCDY BY', 'BCDY EN', 'BCDY UA', 'BCDY RU', '[{\"id\":35,\"RU\":\"FDY1 RU\",\"EN\":\"FDY1 EN\",\"UA\":\"FDY1 UA\",\"BY\":\"FDY1 BY\"},{\"id\":36,\"RU\":\"qU4T RU\",\"EN\":\"qU4T EN\",\"UA\":\"qU4T UA\",\"BY\":\"qU4T BY\"},{\"id\":37,\"RU\":\"VGcm RU\",\"EN\":\"VGcm EN\",\"UA\":\"VGcm UA\",\"BY\":\"VGcm BY\"},{\"id\":38,\"RU\":\"2jGN RU\",\"EN\":\"2jGN EN\",\"UA\":\"2jGN UA\",\"BY\":\"2jGN BY\"}]', 2, NULL),
(165, 'g30T BY', 'g30T EN', 'g30T UA', 'g30T RU', '{\"min\":15,\"max\":147}', 1, NULL),
(166, 'CePd BY', 'CePd EN', 'CePd UA', 'CePd RU', '[{\"id\":39,\"RU\":\"asPZ RU\",\"EN\":\"asPZ EN\",\"UA\":\"asPZ UA\",\"BY\":\"asPZ BY\"},{\"id\":40,\"RU\":\"0swv RU\",\"EN\":\"0swv EN\",\"UA\":\"0swv UA\",\"BY\":\"0swv BY\"},{\"id\":41,\"RU\":\"uk7C RU\",\"EN\":\"uk7C EN\",\"UA\":\"uk7C UA\",\"BY\":\"uk7C BY\"},{\"id\":42,\"RU\":\"GN2v RU\",\"EN\":\"GN2v EN\",\"UA\":\"GN2v UA\",\"BY\":\"GN2v BY\"},{\"id\":43,\"RU\":\"v2B9 RU\",\"EN\":\"v2B9 EN\",\"UA\":\"v2B9 UA\",\"BY\":\"v2B9 BY\"}]', 2, NULL),
(167, '0t5V BY', '0t5V EN', '0t5V UA', '0t5V RU', '[{\"id\":44,\"RU\":\"DPrR RU\",\"EN\":\"DPrR EN\",\"UA\":\"DPrR UA\",\"BY\":\"DPrR BY\"},{\"id\":45,\"RU\":\"8zrj RU\",\"EN\":\"8zrj EN\",\"UA\":\"8zrj UA\",\"BY\":\"8zrj BY\"},{\"id\":46,\"RU\":\"q8Us RU\",\"EN\":\"q8Us EN\",\"UA\":\"q8Us UA\",\"BY\":\"q8Us BY\"},{\"id\":47,\"RU\":\"quQ9 RU\",\"EN\":\"quQ9 EN\",\"UA\":\"quQ9 UA\",\"BY\":\"quQ9 BY\"}]', 2, NULL),
(168, '7na9 BY', '7na9 EN', '7na9 UA', '7na9 RU', '{\"min\":11,\"max\":122}', 1, NULL),
(169, 'sfgl BY', 'sfgl EN', 'sfgl UA', 'sfgl RU', '{\"min\":14,\"max\":148}', 1, NULL),
(170, 'lHmj BY', 'lHmj EN', 'lHmj UA', 'lHmj RU', '{\"min\":14,\"max\":113}', 1, NULL),
(171, '3Hg1 BY', '3Hg1 EN', '3Hg1 UA', '3Hg1 RU', '{\"min\":11,\"max\":139}', 1, NULL),
(172, '20HN BY', '20HN EN', '20HN UA', '20HN RU', '{\"min\":14,\"max\":123}', 1, NULL),
(173, 'P8BP BY', 'P8BP EN', 'P8BP UA', 'P8BP RU', '{\"min\":15,\"max\":139}', 1, NULL),
(174, 'rDvY BY', 'rDvY EN', 'rDvY UA', 'rDvY RU', '{\"min\":11,\"max\":112}', 1, NULL),
(175, 'e5lE BY', 'e5lE EN', 'e5lE UA', 'e5lE RU', '[{\"id\":48,\"RU\":\"B9Is RU\",\"EN\":\"B9Is EN\",\"UA\":\"B9Is UA\",\"BY\":\"B9Is BY\"},{\"id\":49,\"RU\":\"Qzv4 RU\",\"EN\":\"Qzv4 EN\",\"UA\":\"Qzv4 UA\",\"BY\":\"Qzv4 BY\"},{\"id\":50,\"RU\":\"Wi95 RU\",\"EN\":\"Wi95 EN\",\"UA\":\"Wi95 UA\",\"BY\":\"Wi95 BY\"},{\"id\":51,\"RU\":\"5dns RU\",\"EN\":\"5dns EN\",\"UA\":\"5dns UA\",\"BY\":\"5dns BY\"},{\"id\":52,\"RU\":\"KR2V RU\",\"EN\":\"KR2V EN\",\"UA\":\"KR2V UA\",\"BY\":\"KR2V BY\"},{\"id\":53,\"RU\":\"xogY RU\",\"EN\":\"xogY EN\",\"UA\":\"xogY UA\",\"BY\":\"xogY BY\"},{\"id\":54,\"RU\":\"8nHH RU\",\"EN\":\"8nHH EN\",\"UA\":\"8nHH UA\",\"BY\":\"8nHH BY\"}]', 2, NULL),
(176, 'yrK3 BY', 'yrK3 EN', 'yrK3 UA', 'yrK3 RU', '{\"min\":10,\"max\":109}', 1, NULL),
(177, 'sl8l BY', 'sl8l EN', 'sl8l UA', 'sl8l RU', '[{\"id\":55,\"RU\":\"gTdt RU\",\"EN\":\"gTdt EN\",\"UA\":\"gTdt UA\",\"BY\":\"gTdt BY\"},{\"id\":56,\"RU\":\"q50h RU\",\"EN\":\"q50h EN\",\"UA\":\"q50h UA\",\"BY\":\"q50h BY\"},{\"id\":57,\"RU\":\"sHXC RU\",\"EN\":\"sHXC EN\",\"UA\":\"sHXC UA\",\"BY\":\"sHXC BY\"},{\"id\":58,\"RU\":\"acpY RU\",\"EN\":\"acpY EN\",\"UA\":\"acpY UA\",\"BY\":\"acpY BY\"}]', 2, NULL),
(178, 'nkZe BY', 'nkZe EN', 'nkZe UA', 'nkZe RU', '{\"min\":12,\"max\":118}', 1, NULL),
(179, 'iNpB BY', 'iNpB EN', 'iNpB UA', 'iNpB RU', '{\"min\":11,\"max\":149}', 1, NULL),
(180, 'zj7D BY', 'zj7D EN', 'zj7D UA', 'zj7D RU', '[{\"id\":59,\"RU\":\"CYeG RU\",\"EN\":\"CYeG EN\",\"UA\":\"CYeG UA\",\"BY\":\"CYeG BY\"},{\"id\":60,\"RU\":\"by0H RU\",\"EN\":\"by0H EN\",\"UA\":\"by0H UA\",\"BY\":\"by0H BY\"},{\"id\":61,\"RU\":\"8uli RU\",\"EN\":\"8uli EN\",\"UA\":\"8uli UA\",\"BY\":\"8uli BY\"},{\"id\":62,\"RU\":\"nFLL RU\",\"EN\":\"nFLL EN\",\"UA\":\"nFLL UA\",\"BY\":\"nFLL BY\"},{\"id\":63,\"RU\":\"DcoS RU\",\"EN\":\"DcoS EN\",\"UA\":\"DcoS UA\",\"BY\":\"DcoS BY\"},{\"id\":64,\"RU\":\"1ISG RU\",\"EN\":\"1ISG EN\",\"UA\":\"1ISG UA\",\"BY\":\"1ISG BY\"}]', 2, NULL),
(181, 'S2kX BY', 'S2kX EN', 'S2kX UA', 'S2kX RU', '{\"min\":11,\"max\":118}', 1, NULL),
(182, 'JFzm BY', 'JFzm EN', 'JFzm UA', 'JFzm RU', '[{\"id\":65,\"RU\":\"CTay RU\",\"EN\":\"CTay EN\",\"UA\":\"CTay UA\",\"BY\":\"CTay BY\"},{\"id\":66,\"RU\":\"IEaT RU\",\"EN\":\"IEaT EN\",\"UA\":\"IEaT UA\",\"BY\":\"IEaT BY\"},{\"id\":67,\"RU\":\"A13U RU\",\"EN\":\"A13U EN\",\"UA\":\"A13U UA\",\"BY\":\"A13U BY\"}]', 2, NULL),
(183, 'gSNL BY', 'gSNL EN', 'gSNL UA', 'gSNL RU', '[{\"id\":68,\"RU\":\"f79Z RU\",\"EN\":\"f79Z EN\",\"UA\":\"f79Z UA\",\"BY\":\"f79Z BY\"},{\"id\":69,\"RU\":\"QSU5 RU\",\"EN\":\"QSU5 EN\",\"UA\":\"QSU5 UA\",\"BY\":\"QSU5 BY\"},{\"id\":70,\"RU\":\"42sY RU\",\"EN\":\"42sY EN\",\"UA\":\"42sY UA\",\"BY\":\"42sY BY\"},{\"id\":71,\"RU\":\"UXQt RU\",\"EN\":\"UXQt EN\",\"UA\":\"UXQt UA\",\"BY\":\"UXQt BY\"},{\"id\":72,\"RU\":\"6y0q RU\",\"EN\":\"6y0q EN\",\"UA\":\"6y0q UA\",\"BY\":\"6y0q BY\"},{\"id\":73,\"RU\":\"WbRK RU\",\"EN\":\"WbRK EN\",\"UA\":\"WbRK UA\",\"BY\":\"WbRK BY\"}]', 2, NULL),
(184, 'IBF4 BY', 'IBF4 EN', 'IBF4 UA', 'IBF4 RU', '{\"min\":12,\"max\":114}', 1, NULL),
(185, 'y5zL BY', 'y5zL EN', 'y5zL UA', 'y5zL RU', '[{\"id\":74,\"RU\":\"bJ9g RU\",\"EN\":\"bJ9g EN\",\"UA\":\"bJ9g UA\",\"BY\":\"bJ9g BY\"},{\"id\":75,\"RU\":\"zIC6 RU\",\"EN\":\"zIC6 EN\",\"UA\":\"zIC6 UA\",\"BY\":\"zIC6 BY\"},{\"id\":76,\"RU\":\"6Mw2 RU\",\"EN\":\"6Mw2 EN\",\"UA\":\"6Mw2 UA\",\"BY\":\"6Mw2 BY\"}]', 2, NULL),
(186, 'N2uc BY', 'N2uc EN', 'N2uc UA', 'N2uc RU', '{\"min\":12,\"max\":144}', 1, NULL),
(187, 'ZGhA BY', 'ZGhA EN', 'ZGhA UA', 'ZGhA RU', '[{\"id\":77,\"RU\":\"JX2R RU\",\"EN\":\"JX2R EN\",\"UA\":\"JX2R UA\",\"BY\":\"JX2R BY\"},{\"id\":78,\"RU\":\"PZ3S RU\",\"EN\":\"PZ3S EN\",\"UA\":\"PZ3S UA\",\"BY\":\"PZ3S BY\"},{\"id\":79,\"RU\":\"EDig RU\",\"EN\":\"EDig EN\",\"UA\":\"EDig UA\",\"BY\":\"EDig BY\"},{\"id\":80,\"RU\":\"9RZ6 RU\",\"EN\":\"9RZ6 EN\",\"UA\":\"9RZ6 UA\",\"BY\":\"9RZ6 BY\"},{\"id\":81,\"RU\":\"dl6P RU\",\"EN\":\"dl6P EN\",\"UA\":\"dl6P UA\",\"BY\":\"dl6P BY\"}]', 2, NULL),
(188, '5HpV BY', '5HpV EN', '5HpV UA', '5HpV RU', '[{\"id\":82,\"RU\":\"qnXg RU\",\"EN\":\"qnXg EN\",\"UA\":\"qnXg UA\",\"BY\":\"qnXg BY\"},{\"id\":83,\"RU\":\"fvEt RU\",\"EN\":\"fvEt EN\",\"UA\":\"fvEt UA\",\"BY\":\"fvEt BY\"},{\"id\":84,\"RU\":\"fxU4 RU\",\"EN\":\"fxU4 EN\",\"UA\":\"fxU4 UA\",\"BY\":\"fxU4 BY\"},{\"id\":85,\"RU\":\"Qx7L RU\",\"EN\":\"Qx7L EN\",\"UA\":\"Qx7L UA\",\"BY\":\"Qx7L BY\"},{\"id\":86,\"RU\":\"SjoW RU\",\"EN\":\"SjoW EN\",\"UA\":\"SjoW UA\",\"BY\":\"SjoW BY\"}]', 2, NULL),
(189, '2XvR BY', '2XvR EN', '2XvR UA', '2XvR RU', '[{\"id\":87,\"RU\":\"Fua5 RU\",\"EN\":\"Fua5 EN\",\"UA\":\"Fua5 UA\",\"BY\":\"Fua5 BY\"},{\"id\":88,\"RU\":\"h3lC RU\",\"EN\":\"h3lC EN\",\"UA\":\"h3lC UA\",\"BY\":\"h3lC BY\"},{\"id\":89,\"RU\":\"JIna RU\",\"EN\":\"JIna EN\",\"UA\":\"JIna UA\",\"BY\":\"JIna BY\"},{\"id\":90,\"RU\":\"VBVE RU\",\"EN\":\"VBVE EN\",\"UA\":\"VBVE UA\",\"BY\":\"VBVE BY\"}]', 2, NULL),
(190, 'G4fk BY', 'G4fk EN', 'G4fk UA', 'G4fk RU', '[{\"id\":91,\"RU\":\"johO RU\",\"EN\":\"johO EN\",\"UA\":\"johO UA\",\"BY\":\"johO BY\"},{\"id\":92,\"RU\":\"n66D RU\",\"EN\":\"n66D EN\",\"UA\":\"n66D UA\",\"BY\":\"n66D BY\"},{\"id\":93,\"RU\":\"ekOZ RU\",\"EN\":\"ekOZ EN\",\"UA\":\"ekOZ UA\",\"BY\":\"ekOZ BY\"},{\"id\":94,\"RU\":\"ypNo RU\",\"EN\":\"ypNo EN\",\"UA\":\"ypNo UA\",\"BY\":\"ypNo BY\"}]', 2, NULL),
(191, 'mHXp BY', 'mHXp EN', 'mHXp UA', 'mHXp RU', '{\"min\":10,\"max\":130}', 1, NULL),
(192, 'pyd6 BY', 'pyd6 EN', 'pyd6 UA', 'pyd6 RU', '[{\"id\":95,\"RU\":\"0Vbu RU\",\"EN\":\"0Vbu EN\",\"UA\":\"0Vbu UA\",\"BY\":\"0Vbu BY\"},{\"id\":96,\"RU\":\"bltE RU\",\"EN\":\"bltE EN\",\"UA\":\"bltE UA\",\"BY\":\"bltE BY\"},{\"id\":97,\"RU\":\"f95Q RU\",\"EN\":\"f95Q EN\",\"UA\":\"f95Q UA\",\"BY\":\"f95Q BY\"}]', 2, NULL),
(193, 'ndev BY', 'ndev EN', 'ndev UA', 'ndev RU', '[{\"id\":98,\"RU\":\"92w0 RU\",\"EN\":\"92w0 EN\",\"UA\":\"92w0 UA\",\"BY\":\"92w0 BY\"},{\"id\":99,\"RU\":\"vgB1 RU\",\"EN\":\"vgB1 EN\",\"UA\":\"vgB1 UA\",\"BY\":\"vgB1 BY\"},{\"id\":100,\"RU\":\"SyX4 RU\",\"EN\":\"SyX4 EN\",\"UA\":\"SyX4 UA\",\"BY\":\"SyX4 BY\"},{\"id\":101,\"RU\":\"LaSm RU\",\"EN\":\"LaSm EN\",\"UA\":\"LaSm UA\",\"BY\":\"LaSm BY\"}]', 2, NULL),
(194, 'E8Xe BY', 'E8Xe EN', 'E8Xe UA', 'E8Xe RU', '[{\"id\":102,\"RU\":\"G1p3 RU\",\"EN\":\"G1p3 EN\",\"UA\":\"G1p3 UA\",\"BY\":\"G1p3 BY\"},{\"id\":103,\"RU\":\"hvQ5 RU\",\"EN\":\"hvQ5 EN\",\"UA\":\"hvQ5 UA\",\"BY\":\"hvQ5 BY\"},{\"id\":104,\"RU\":\"gCTD RU\",\"EN\":\"gCTD EN\",\"UA\":\"gCTD UA\",\"BY\":\"gCTD BY\"},{\"id\":105,\"RU\":\"qL4a RU\",\"EN\":\"qL4a EN\",\"UA\":\"qL4a UA\",\"BY\":\"qL4a BY\"},{\"id\":106,\"RU\":\"iOtq RU\",\"EN\":\"iOtq EN\",\"UA\":\"iOtq UA\",\"BY\":\"iOtq BY\"}]', 2, NULL),
(195, 'uXxT BY', 'uXxT EN', 'uXxT UA', 'uXxT RU', '{\"min\":10,\"max\":124}', 1, NULL),
(196, 'ZEpf BY', 'ZEpf EN', 'ZEpf UA', 'ZEpf RU', '[{\"id\":107,\"RU\":\"nsOS RU\",\"EN\":\"nsOS EN\",\"UA\":\"nsOS UA\",\"BY\":\"nsOS BY\"},{\"id\":108,\"RU\":\"APzS RU\",\"EN\":\"APzS EN\",\"UA\":\"APzS UA\",\"BY\":\"APzS BY\"},{\"id\":109,\"RU\":\"bRxp RU\",\"EN\":\"bRxp EN\",\"UA\":\"bRxp UA\",\"BY\":\"bRxp BY\"}]', 2, NULL),
(197, 'cIpT BY', 'cIpT EN', 'cIpT UA', 'cIpT RU', '{\"min\":15,\"max\":109}', 1, NULL),
(198, '735O BY', '735O EN', '735O UA', '735O RU', '{\"min\":11,\"max\":141}', 1, NULL),
(199, '2hNC BY', '2hNC EN', '2hNC UA', '2hNC RU', '[{\"id\":110,\"RU\":\"Mcxy RU\",\"EN\":\"Mcxy EN\",\"UA\":\"Mcxy UA\",\"BY\":\"Mcxy BY\"},{\"id\":111,\"RU\":\"mLI4 RU\",\"EN\":\"mLI4 EN\",\"UA\":\"mLI4 UA\",\"BY\":\"mLI4 BY\"},{\"id\":112,\"RU\":\"Dkm3 RU\",\"EN\":\"Dkm3 EN\",\"UA\":\"Dkm3 UA\",\"BY\":\"Dkm3 BY\"}]', 2, NULL),
(200, 'BDbr BY', 'BDbr EN', 'BDbr UA', 'BDbr RU', '{\"min\":10,\"max\":144}', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `filters_to_categories`
--

CREATE TABLE `filters_to_categories` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `filters_to_categories`
--

INSERT IGNORE INTO `filters_to_categories` (`id`, `filter_id`, `category_id`) VALUES
(107, 158, 34),
(108, 166, 34),
(109, 179, 34),
(110, 158, 35),
(111, 189, 35),
(112, 160, 36),
(113, 173, 36),
(114, 179, 36),
(115, 152, 37),
(116, 155, 37),
(117, 159, 38),
(118, 189, 38),
(119, 161, 39),
(120, 182, 39),
(121, 163, 40),
(122, 185, 40),
(123, 189, 40),
(124, 164, 41),
(125, 171, 41),
(126, 187, 41),
(127, 170, 42),
(128, 181, 42),
(129, 185, 42),
(130, 191, 42),
(131, 184, 43),
(132, 195, 43),
(133, 198, 43),
(134, 199, 43),
(135, 153, 44),
(136, 158, 44),
(137, 175, 44),
(138, 181, 44);

-- --------------------------------------------------------

--
-- Структура таблиці `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `name_ru` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_ua` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_by` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_en` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_type_1` double DEFAULT NULL,
  `images` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_type_2` double DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_recommended` double DEFAULT NULL,
  `multiply` int(11) NOT NULL,
  `article` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_removed` int(11) NOT NULL,
  `is_index_slider` int(11) NOT NULL,
  `img_for_slider` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_bottom` int(11) NOT NULL,
  `img_bottom` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `made` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `goods`
--

INSERT IGNORE INTO `goods` (`id`, `categories_id`, `name_ru`, `name_ua`, `name_by`, `name_en`, `price_type_1`, `images`, `main_image`, `price_type_2`, `description`, `price_recommended`, `multiply`, `article`, `is_removed`, `is_index_slider`, `img_for_slider`, `is_bottom`, `img_bottom`, `brand`, `made`, `seo`) VALUES
(10, 44, ' Good  RY1', ' Good  UA1', ' Good  BY1', ' Good  EN1', 72379, NULL, NULL, 217137, NULL, 7254.02536254751, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(11, 43, ' Good  RY2', ' Good  UA2', ' Good  BY2', ' Good  EN2', 31946, NULL, NULL, 95838, NULL, 50996.479716870446, 1, NULL, 0, 1, 'slider-2.jpg', 0, NULL, NULL, NULL, NULL),
(12, 44, ' Good  RY3', ' Good  UA3', ' Good  BY3', ' Good  EN3', 97573, NULL, NULL, 292719, NULL, 17825.325806569614, 1, NULL, 0, 2, 'slider-3.jpg', 0, NULL, NULL, NULL, NULL),
(13, 35, ' Good  RY4', ' Good  UA4', ' Good  BY4', ' Good  EN4', 30284, NULL, NULL, 90852, NULL, 43827.19319209661, 1, NULL, 0, 3, 'slider-1.jpg', 0, NULL, NULL, NULL, NULL),
(14, 44, ' Good  RY5', ' Good  UA5', ' Good  BY5', ' Good  EN5', 25879, NULL, NULL, 77637, NULL, 57959.9918506341, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(15, 40, ' Good  RY6', ' Good  UA6', ' Good  BY6', ' Good  EN6', 31768, NULL, NULL, 95304, NULL, 50618.382986740566, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(16, 44, ' Good  RY7', ' Good  UA7', ' Good  BY7', ' Good  EN7', 34898, NULL, NULL, 104694, NULL, 79206.94269166043, 1, NULL, 0, 0, NULL, 1, 'discount.png', NULL, NULL, NULL),
(17, 44, ' Good  RY8', ' Good  UA8', ' Good  BY8', ' Good  EN8', 110916, NULL, NULL, 332748, NULL, 28784.567807940366, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(18, 34, ' Good  RY9', ' Good  UA9', ' Good  BY9', ' Good  EN9', 82094, NULL, NULL, 246282, NULL, 13992.014274580417, 1, NULL, 0, 0, NULL, 2, 'discount.png', NULL, NULL, NULL),
(19, 41, ' Good  RY10', ' Good  UA10', ' Good  BY10', ' Good  EN10', 50496, NULL, NULL, 151488, NULL, 91296.3712589409, 1, NULL, 0, 0, NULL, 3, 'discount.png', NULL, NULL, NULL),
(20, 34, ' Good  RY11', ' Good  UA11', ' Good  BY11', ' Good  EN11', 60471, NULL, NULL, 181413, NULL, 91415.81678082311, 1, NULL, 0, 0, NULL, 4, 'discount.png', NULL, NULL, NULL),
(21, 43, ' Good  RY12', ' Good  UA12', ' Good  BY12', ' Good  EN12', 25489, NULL, NULL, 76467, NULL, 75489.97343715277, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(22, 36, ' Good  RY13', ' Good  UA13', ' Good  BY13', ' Good  EN13', 118370, NULL, NULL, 355110, NULL, 103197.42015315445, 1, NULL, 0, 0, NULL, 0, NULL, 'petia production', 'Puten', NULL),
(23, 36, ' Good  RY14', ' Good  UA14', ' Good  BY14', ' Good  EN14', 90696, NULL, NULL, 272088, NULL, 74122.18376417382, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(24, 37, ' Good  RY15', ' Good  UA15', ' Good  BY15', ' Good  EN15', 112725, NULL, NULL, 338175, NULL, 61013.66167126564, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(25, 42, ' Good  RY16', ' Good  UA16', ' Good  BY16', ' Good  EN16', 53307, NULL, NULL, 159921, NULL, 82696.76037366666, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(26, 40, ' Good  RY17', ' Good  UA17', ' Good  BY17', ' Good  EN17', 86485, NULL, NULL, 259455, NULL, 15047.820164396262, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(27, 44, ' Good  RY18', ' Good  UA18', ' Good  BY18', ' Good  EN18', 103411, NULL, NULL, 310233, NULL, 42533.82301084122, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(28, 42, ' Good  RY19', ' Good  UA19', ' Good  BY19', ' Good  EN19', 73876, NULL, NULL, 221628, NULL, 59825.657870877214, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(29, 37, ' Good  RY20', ' Good  UA20', ' Good  BY20', ' Good  EN20', 29636, NULL, NULL, 88908, NULL, 63826.82363172232, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(30, 34, ' Good  RY21', ' Good  UA21', ' Good  BY21', ' Good  EN21', 89747, NULL, NULL, 269241, NULL, 31957.14785583983, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(31, 40, ' Good  RY22', ' Good  UA22', ' Good  BY22', ' Good  EN22', 32432, NULL, NULL, 97296, NULL, 75995.27169389211, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(32, 42, ' Good  RY23', ' Good  UA23', ' Good  BY23', ' Good  EN23', 47833, NULL, NULL, 143499, NULL, 68709.9182118009, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(33, 39, ' Good  RY24', ' Good  UA24', ' Good  BY24', ' Good  EN24', 71043, NULL, NULL, 213129, NULL, 7863.779287188108, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(34, 43, ' Good  RY25', ' Good  UA25', ' Good  BY25', ' Good  EN25', 102011, NULL, NULL, 306033, NULL, 48574.14511039774, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(35, 43, ' Good  RY26', ' Good  UA26', ' Good  BY26', ' Good  EN26', 73889, NULL, NULL, 221667, NULL, 3884.3910002842463, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(36, 40, ' Good  RY27', ' Good  UA27', ' Good  BY27', ' Good  EN27', 90640, NULL, NULL, 271920, NULL, 89084.52298008792, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(37, 39, ' Good  RY28', ' Good  UA28', ' Good  BY28', ' Good  EN28', 83386, NULL, NULL, 250158, NULL, 2984.445209446778, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(38, 41, ' Good  RY29', ' Good  UA29', ' Good  BY29', ' Good  EN29', 117566, NULL, NULL, 352698, NULL, 70748.66041683001, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(39, 38, ' Good  RY30', ' Good  UA30', ' Good  BY30', ' Good  EN30', 81897, NULL, NULL, 245691, NULL, 21699.969765669637, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(40, 43, ' Good  RY31', ' Good  UA31', ' Good  BY31', ' Good  EN31', 69149, NULL, NULL, 207447, NULL, 3943.8708877180434, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(41, 35, ' Good  RY32', ' Good  UA32', ' Good  BY32', ' Good  EN32', 49757, NULL, NULL, 149271, NULL, 62309.4484514412, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(42, 41, ' Good  RY33', ' Good  UA33', ' Good  BY33', ' Good  EN33', 11975, NULL, NULL, 35925, NULL, 84320.63290391176, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(43, 43, ' Good  RY34', ' Good  UA34', ' Good  BY34', ' Good  EN34', 27223, NULL, NULL, 81669, NULL, 19279.822475095116, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(44, 34, ' Good  RY35', ' Good  UA35', ' Good  BY35', ' Good  EN35', 18211, NULL, NULL, 54633, NULL, 58822.21697360019, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(45, 41, ' Good  RY36', ' Good  UA36', ' Good  BY36', ' Good  EN36', 36420, NULL, NULL, 109260, NULL, 20876.620752575454, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(46, 34, ' Good  RY37', ' Good  UA37', ' Good  BY37', ' Good  EN37', 38075, NULL, NULL, 114225, NULL, 35606.456151936625, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(47, 40, ' Good  RY38', ' Good  UA38', ' Good  BY38', ' Good  EN38', 99242, NULL, NULL, 297726, NULL, 7702.4218118166755, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(48, 35, ' Good  RY39', ' Good  UA39', ' Good  BY39', ' Good  EN39', 14993, NULL, NULL, 44979, NULL, 39382.74391313339, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(49, 42, ' Good  RY40', ' Good  UA40', ' Good  BY40', ' Good  EN40', 117123, NULL, NULL, 351369, NULL, 66106.45744007683, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(50, 39, ' Good  RY41', ' Good  UA41', ' Good  BY41', ' Good  EN41', 22011, NULL, NULL, 66033, NULL, 104684.05877084383, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(51, 36, ' Good  RY42', ' Good  UA42', ' Good  BY42', ' Good  EN42', 53946, NULL, NULL, 161838, NULL, 2010.924843848613, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(52, 44, ' Good  RY43', ' Good  UA43', ' Good  BY43', ' Good  EN43', 14791, NULL, NULL, 44373, NULL, 19082.451216571455, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(53, 39, ' Good  RY44', ' Good  UA44', ' Good  BY44', ' Good  EN44', 19533, NULL, NULL, 58599, NULL, 89374.48486117132, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(54, 38, ' Good  RY45', ' Good  UA45', ' Good  BY45', ' Good  EN45', 10003, NULL, NULL, 30009, NULL, 66535.07396600215, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(55, 42, ' Good  RY46', ' Good  UA46', ' Good  BY46', ' Good  EN46', 85687, NULL, NULL, 257061, NULL, 64546.91855635673, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(56, 37, ' Good  RY47', ' Good  UA47', ' Good  BY47', ' Good  EN47', 21852, NULL, NULL, 65556, NULL, 15429.374193637048, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(57, 39, ' Good  RY48', ' Good  UA48', ' Good  BY48', ' Good  EN48', 38051, NULL, NULL, 114153, NULL, 98891.11860897495, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(58, 36, ' Good  RY49', ' Good  UA49', ' Good  BY49', ' Good  EN49', 67827, NULL, NULL, 203481, NULL, 17382.473773823564, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(59, 40, ' Good  RY50', ' Good  UA50', ' Good  BY50', ' Good  EN50', 120716, NULL, NULL, 362148, NULL, 5624.016352052816, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(60, 42, ' Good  RY51', ' Good  UA51', ' Good  BY51', ' Good  EN51', 49066, NULL, NULL, 147198, NULL, 83662.66374865329, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(61, 37, ' Good  RY52', ' Good  UA52', ' Good  BY52', ' Good  EN52', 113010, NULL, NULL, 339030, NULL, 78351.2729969679, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(62, 39, ' Good  RY53', ' Good  UA53', ' Good  BY53', ' Good  EN53', 53235, NULL, NULL, 159705, NULL, 33068.37704873958, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(63, 38, ' Good  RY54', ' Good  UA54', ' Good  BY54', ' Good  EN54', 89135, NULL, NULL, 267405, NULL, 37978.06956265408, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(64, 39, ' Good  RY55', ' Good  UA55', ' Good  BY55', ' Good  EN55', 76843, NULL, NULL, 230529, NULL, 90680.21997691153, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(65, 34, ' Good  RY56', ' Good  UA56', ' Good  BY56', ' Good  EN56', 34246, NULL, NULL, 102738, NULL, 16376.8945064553, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(66, 44, ' Good  RY57', ' Good  UA57', ' Good  BY57', ' Good  EN57', 77840, NULL, NULL, 233520, NULL, 25228.815911401824, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(67, 34, ' Good  RY58', ' Good  UA58', ' Good  BY58', ' Good  EN58', 22762, NULL, NULL, 68286, NULL, 77008.39934750312, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(68, 38, ' Good  RY59', ' Good  UA59', ' Good  BY59', ' Good  EN59', 19550, NULL, NULL, 58650, NULL, 93960.55231316997, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(69, 40, ' Good  RY60', ' Good  UA60', ' Good  BY60', ' Good  EN60', 15500, NULL, NULL, 46500, NULL, 23382.56683320046, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(70, 44, ' Good  RY61', ' Good  UA61', ' Good  BY61', ' Good  EN61', 7336, NULL, NULL, 22008, NULL, 50416.180536352265, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(71, 37, ' Good  RY62', ' Good  UA62', ' Good  BY62', ' Good  EN62', 72757, NULL, NULL, 218271, NULL, 74233.20549201984, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(72, 35, ' Good  RY63', ' Good  UA63', ' Good  BY63', ' Good  EN63', 52166, NULL, NULL, 156498, NULL, 4522.4891609023225, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(73, 44, ' Good  RY64', ' Good  UA64', ' Good  BY64', ' Good  EN64', 67392, NULL, NULL, 202176, NULL, 15297.832638311977, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(74, 39, ' Good  RY65', ' Good  UA65', ' Good  BY65', ' Good  EN65', 60212, NULL, NULL, 180636, NULL, 62916.6990187128, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(75, 36, ' Good  RY66', ' Good  UA66', ' Good  BY66', ' Good  EN66', 78021, NULL, NULL, 234063, NULL, 53295.000488488, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(76, 43, ' Good  RY67', ' Good  UA67', ' Good  BY67', ' Good  EN67', 113398, NULL, NULL, 340194, NULL, 77719.9086961615, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(77, 43, ' Good  RY68', ' Good  UA68', ' Good  BY68', ' Good  EN68', 25387, NULL, NULL, 76161, NULL, 13319.545325203375, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(78, 34, ' Good  RY69', ' Good  UA69', ' Good  BY69', ' Good  EN69', 15669, NULL, NULL, 47007, NULL, 48823.003847392276, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(79, 38, ' Good  RY70', ' Good  UA70', ' Good  BY70', ' Good  EN70', 26981, NULL, NULL, 80943, NULL, 96456.38657121116, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(80, 35, ' Good  RY71', ' Good  UA71', ' Good  BY71', ' Good  EN71', 19438, NULL, NULL, 58314, NULL, 12722.924623738903, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(81, 39, ' Good  RY72', ' Good  UA72', ' Good  BY72', ' Good  EN72', 6263, NULL, NULL, 18789, NULL, 97325.46671492091, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(82, 40, ' Good  RY73', ' Good  UA73', ' Good  BY73', ' Good  EN73', 13349, NULL, NULL, 40047, NULL, 17673.563013247738, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(83, 41, ' Good  RY74', ' Good  UA74', ' Good  BY74', ' Good  EN74', 87724, NULL, NULL, 263172, NULL, 11776.418231335858, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(84, 36, ' Good  RY75', ' Good  UA75', ' Good  BY75', ' Good  EN75', 55309, NULL, NULL, 165927, NULL, 5856.405426795972, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(85, 39, ' Good  RY76', ' Good  UA76', ' Good  BY76', ' Good  EN76', 93481, NULL, NULL, 280443, NULL, 101642.77574983219, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(86, 42, ' Good  RY77', ' Good  UA77', ' Good  BY77', ' Good  EN77', 69762, NULL, NULL, 209286, NULL, 59859.6657786329, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(87, 40, ' Good  RY78', ' Good  UA78', ' Good  BY78', ' Good  EN78', 22831, NULL, NULL, 68493, NULL, 102060.00495352782, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(88, 34, ' Good  RY79', ' Good  UA79', ' Good  BY79', ' Good  EN79', 50200, NULL, NULL, 150600, NULL, 7631.030741600349, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(89, 40, ' Good  RY80', ' Good  UA80', ' Good  BY80', ' Good  EN80', 55147, NULL, NULL, 165441, NULL, 55055.14215727816, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(90, 39, ' Good  RY81', ' Good  UA81', ' Good  BY81', ' Good  EN81', 85931, NULL, NULL, 257793, NULL, 36987.621871449635, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(91, 39, ' Good  RY82', ' Good  UA82', ' Good  BY82', ' Good  EN82', 93538, NULL, NULL, 280614, NULL, 19767.686195273593, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(92, 34, ' Good  RY83', ' Good  UA83', ' Good  BY83', ' Good  EN83', 59164, NULL, NULL, 177492, NULL, 95565.56867187897, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(93, 42, ' Good  RY84', ' Good  UA84', ' Good  BY84', ' Good  EN84', 46357, NULL, NULL, 139071, NULL, 95434.78808343392, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(94, 42, ' Good  RY85', ' Good  UA85', ' Good  BY85', ' Good  EN85', 8736, NULL, NULL, 26208, NULL, 82777.23771139256, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(95, 40, ' Good  RY86', ' Good  UA86', ' Good  BY86', ' Good  EN86', 84082, NULL, NULL, 252246, NULL, 19881.827616520997, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(96, 37, ' Good  RY87', ' Good  UA87', ' Good  BY87', ' Good  EN87', 2988, NULL, NULL, 8964, NULL, 66462.42825828718, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(97, 39, ' Good  RY88', ' Good  UA88', ' Good  BY88', ' Good  EN88', 83620, NULL, NULL, 250860, NULL, 57271.66175173284, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(98, 36, ' Good  RY89', ' Good  UA89', ' Good  BY89', ' Good  EN89', 43075, NULL, NULL, 129225, NULL, 86966.02729366257, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(99, 37, ' Good  RY90', ' Good  UA90', ' Good  BY90', ' Good  EN90', 9870, NULL, NULL, 29610, NULL, 47620.15452297419, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(100, 38, ' Good  RY91', ' Good  UA91', ' Good  BY91', ' Good  EN91', 113749, NULL, NULL, 341247, NULL, 84892.69404374313, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(101, 38, ' Good  RY92', ' Good  UA92', ' Good  BY92', ' Good  EN92', 116765, NULL, NULL, 350295, NULL, 66208.00995965303, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(102, 42, ' Good  RY93', ' Good  UA93', ' Good  BY93', ' Good  EN93', 18163, NULL, NULL, 54489, NULL, 76356.97097689562, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(103, 36, ' Good  RY94', ' Good  UA94', ' Good  BY94', ' Good  EN94', 97043, NULL, NULL, 291129, NULL, 75460.82831537894, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(104, 42, ' Good  RY95', ' Good  UA95', ' Good  BY95', ' Good  EN95', 115119, NULL, NULL, 345357, NULL, 40533.23195606771, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(105, 34, ' Good  RY96', ' Good  UA96', ' Good  BY96', ' Good  EN96', 36347, NULL, NULL, 109041, NULL, 83973.67814406163, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(106, 38, ' Good  RY97', ' Good  UA97', ' Good  BY97', ' Good  EN97', 98118, NULL, NULL, 294354, NULL, 82873.69816196496, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(107, 37, ' Good  RY98', ' Good  UA98', ' Good  BY98', ' Good  EN98', 25293, NULL, NULL, 75879, NULL, 54747.45968749975, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(108, 43, ' Good  RY99', ' Good  UA99', ' Good  BY99', ' Good  EN99', 106580, NULL, NULL, 319740, NULL, 25111.20726146382, 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `goods_to_filters`
--

CREATE TABLE `goods_to_filters` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `value_id` int(11) DEFAULT NULL,
  `raw_value` double DEFAULT NULL,
  `id_ext` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `goods_to_filters`
--

INSERT IGNORE INTO `goods_to_filters` (`id`, `filter_id`, `good_id`, `value_id`, `raw_value`, `id_ext`) VALUES
(26, 153, 10, 9, NULL, NULL),
(27, 158, 10, NULL, 118, NULL),
(28, 175, 10, 48, NULL, NULL),
(29, 181, 10, NULL, 118, NULL),
(30, 184, 11, NULL, 12, NULL),
(31, 195, 11, NULL, 124, NULL),
(32, 198, 11, NULL, 11, NULL),
(33, 199, 11, 111, NULL, NULL),
(34, 153, 12, 10, NULL, NULL),
(35, 158, 12, NULL, 10, NULL),
(36, 175, 12, 50, NULL, NULL),
(37, 181, 12, NULL, 11, NULL),
(38, 158, 13, NULL, 10, NULL),
(39, 189, 13, 88, NULL, NULL),
(40, 153, 14, 9, NULL, NULL),
(41, 158, 14, NULL, 10, NULL),
(42, 175, 14, 53, NULL, NULL),
(43, 181, 14, NULL, 11, NULL),
(44, 163, 15, 32, NULL, NULL),
(45, 185, 15, 75, NULL, NULL),
(46, 189, 15, 88, NULL, NULL),
(47, 153, 16, 15, NULL, NULL),
(48, 158, 16, NULL, 10, NULL),
(49, 175, 16, 50, NULL, NULL),
(50, 181, 16, NULL, 118, NULL),
(51, 153, 17, 9, NULL, NULL),
(52, 158, 17, NULL, 10, NULL),
(53, 175, 17, 53, NULL, NULL),
(54, 181, 17, NULL, 118, NULL),
(55, 158, 18, NULL, 118, NULL),
(56, 166, 18, 42, NULL, NULL),
(57, 179, 18, NULL, 149, NULL),
(58, 164, 19, 36, NULL, NULL),
(59, 171, 19, NULL, 139, NULL),
(60, 187, 19, 79, NULL, NULL),
(61, 158, 20, NULL, 118, NULL),
(62, 166, 20, 42, NULL, NULL),
(63, 179, 20, NULL, 149, NULL),
(64, 184, 21, NULL, 114, NULL),
(65, 195, 21, NULL, 10, NULL),
(66, 198, 21, NULL, 141, NULL),
(67, 199, 21, 112, NULL, NULL),
(68, 160, 22, NULL, 12, NULL),
(69, 173, 22, NULL, 15, NULL),
(70, 179, 22, NULL, 149, NULL),
(71, 160, 23, NULL, 112, NULL),
(72, 173, 23, NULL, 15, NULL),
(73, 179, 23, NULL, 149, NULL),
(74, 152, 24, 8, NULL, NULL),
(75, 155, 24, 21, NULL, NULL),
(76, 170, 25, NULL, 14, NULL),
(77, 181, 25, NULL, 11, NULL),
(78, 185, 25, 75, NULL, NULL),
(79, 191, 25, NULL, 130, NULL),
(80, 163, 26, 34, NULL, NULL),
(81, 185, 26, 74, NULL, NULL),
(82, 189, 26, 89, NULL, NULL),
(83, 153, 27, 10, NULL, NULL),
(84, 158, 27, NULL, 118, NULL),
(85, 175, 27, 50, NULL, NULL),
(86, 181, 27, NULL, 11, NULL),
(87, 170, 28, NULL, 113, NULL),
(88, 181, 28, NULL, 118, NULL),
(89, 185, 28, 74, NULL, NULL),
(90, 191, 28, NULL, 10, NULL),
(91, 152, 29, 7, NULL, NULL),
(92, 155, 29, 25, NULL, NULL),
(93, 158, 30, NULL, 118, NULL),
(94, 166, 30, 43, NULL, NULL),
(95, 179, 30, NULL, 11, NULL),
(96, 163, 31, 32, NULL, NULL),
(97, 185, 31, 74, NULL, NULL),
(98, 189, 31, 89, NULL, NULL),
(99, 170, 32, NULL, 14, NULL),
(100, 181, 32, NULL, 118, NULL),
(101, 185, 32, 75, NULL, NULL),
(102, 191, 32, NULL, 130, NULL),
(103, 161, 33, NULL, 13, NULL),
(104, 182, 33, 66, NULL, NULL),
(105, 184, 34, NULL, 12, NULL),
(106, 195, 34, NULL, 10, NULL),
(107, 198, 34, NULL, 11, NULL),
(108, 199, 34, 110, NULL, NULL),
(109, 184, 35, NULL, 114, NULL),
(110, 195, 35, NULL, 10, NULL),
(111, 198, 35, NULL, 11, NULL),
(112, 199, 35, 110, NULL, NULL),
(113, 163, 36, 33, NULL, NULL),
(114, 185, 36, 75, NULL, NULL),
(115, 189, 36, 90, NULL, NULL),
(116, 161, 37, NULL, 13, NULL),
(117, 182, 37, 67, NULL, NULL),
(118, 164, 38, 38, NULL, NULL),
(119, 171, 38, NULL, 139, NULL),
(120, 187, 38, 80, NULL, NULL),
(121, 159, 39, NULL, 11, NULL),
(122, 189, 39, 87, NULL, NULL),
(123, 184, 40, NULL, 12, NULL),
(124, 195, 40, NULL, 10, NULL),
(125, 198, 40, NULL, 11, NULL),
(126, 199, 40, 110, NULL, NULL),
(127, 158, 41, NULL, 118, NULL),
(128, 189, 41, 89, NULL, NULL),
(129, 164, 42, 36, NULL, NULL),
(130, 171, 42, NULL, 11, NULL),
(131, 187, 42, 78, NULL, NULL),
(132, 184, 43, NULL, 114, NULL),
(133, 195, 43, NULL, 124, NULL),
(134, 198, 43, NULL, 11, NULL),
(135, 199, 43, 110, NULL, NULL),
(136, 158, 44, NULL, 118, NULL),
(137, 166, 44, 42, NULL, NULL),
(138, 179, 44, NULL, 149, NULL),
(139, 164, 45, 38, NULL, NULL),
(140, 171, 45, NULL, 11, NULL),
(141, 187, 45, 78, NULL, NULL),
(142, 158, 46, NULL, 10, NULL),
(143, 166, 46, 41, NULL, NULL),
(144, 179, 46, NULL, 11, NULL),
(145, 163, 47, 32, NULL, NULL),
(146, 185, 47, 74, NULL, NULL),
(147, 189, 47, 90, NULL, NULL),
(148, 158, 48, NULL, 118, NULL),
(149, 189, 48, 89, NULL, NULL),
(150, 170, 49, NULL, 14, NULL),
(151, 181, 49, NULL, 118, NULL),
(152, 185, 49, 74, NULL, NULL),
(153, 191, 49, NULL, 130, NULL),
(154, 161, 50, NULL, 137, NULL),
(155, 182, 50, 67, NULL, NULL),
(156, 160, 51, NULL, 12, NULL),
(157, 173, 51, NULL, 15, NULL),
(158, 179, 51, NULL, 149, NULL),
(159, 153, 52, 9, NULL, NULL),
(160, 158, 52, NULL, 118, NULL),
(161, 175, 52, 52, NULL, NULL),
(162, 181, 52, NULL, 11, NULL),
(163, 161, 53, NULL, 137, NULL),
(164, 182, 53, 65, NULL, NULL),
(165, 159, 54, NULL, 11, NULL),
(166, 189, 54, 87, NULL, NULL),
(167, 170, 55, NULL, 14, NULL),
(168, 181, 55, NULL, 118, NULL),
(169, 185, 55, 76, NULL, NULL),
(170, 191, 55, NULL, 130, NULL),
(171, 152, 56, 4, NULL, NULL),
(172, 155, 56, 24, NULL, NULL),
(173, 161, 57, NULL, 137, NULL),
(174, 182, 57, 65, NULL, NULL),
(175, 160, 58, NULL, 12, NULL),
(176, 173, 58, NULL, 15, NULL),
(177, 179, 58, NULL, 11, NULL),
(178, 163, 59, 34, NULL, NULL),
(179, 185, 59, 76, NULL, NULL),
(180, 189, 59, 87, NULL, NULL),
(181, 170, 60, NULL, 113, NULL),
(182, 181, 60, NULL, 118, NULL),
(183, 185, 60, 74, NULL, NULL),
(184, 191, 60, NULL, 10, NULL),
(185, 152, 61, 4, NULL, NULL),
(186, 155, 61, 22, NULL, NULL),
(187, 161, 62, NULL, 13, NULL),
(188, 182, 62, 67, NULL, NULL),
(189, 159, 63, NULL, 11, NULL),
(190, 189, 63, 90, NULL, NULL),
(191, 161, 64, NULL, 137, NULL),
(192, 182, 64, 65, NULL, NULL),
(193, 158, 65, NULL, 118, NULL),
(194, 166, 65, 39, NULL, NULL),
(195, 179, 65, NULL, 149, NULL),
(196, 153, 66, 10, NULL, NULL),
(197, 158, 66, NULL, 118, NULL),
(198, 175, 66, 54, NULL, NULL),
(199, 181, 66, NULL, 11, NULL),
(200, 158, 67, NULL, 118, NULL),
(201, 166, 67, 39, NULL, NULL),
(202, 179, 67, NULL, 11, NULL),
(203, 159, 68, NULL, 11, NULL),
(204, 189, 68, 90, NULL, NULL),
(205, 163, 69, 32, NULL, NULL),
(206, 185, 69, 74, NULL, NULL),
(207, 189, 69, 87, NULL, NULL),
(208, 153, 70, 13, NULL, NULL),
(209, 158, 70, NULL, 10, NULL),
(210, 175, 70, 51, NULL, NULL),
(211, 181, 70, NULL, 11, NULL),
(212, 152, 71, 6, NULL, NULL),
(213, 155, 71, 23, NULL, NULL),
(214, 158, 72, NULL, 118, NULL),
(215, 189, 72, 90, NULL, NULL),
(216, 153, 73, 9, NULL, NULL),
(217, 158, 73, NULL, 10, NULL),
(218, 175, 73, 49, NULL, NULL),
(219, 181, 73, NULL, 118, NULL),
(220, 161, 74, NULL, 13, NULL),
(221, 182, 74, 66, NULL, NULL),
(222, 160, 75, NULL, 112, NULL),
(223, 173, 75, NULL, 139, NULL),
(224, 179, 75, NULL, 149, NULL),
(225, 184, 76, NULL, 114, NULL),
(226, 195, 76, NULL, 124, NULL),
(227, 198, 76, NULL, 11, NULL),
(228, 199, 76, 111, NULL, NULL),
(229, 184, 77, NULL, 114, NULL),
(230, 195, 77, NULL, 124, NULL),
(231, 198, 77, NULL, 11, NULL),
(232, 199, 77, 112, NULL, NULL),
(233, 158, 78, NULL, 118, NULL),
(234, 166, 78, 41, NULL, NULL),
(235, 179, 78, NULL, 11, NULL),
(236, 159, 79, NULL, 141, NULL),
(237, 189, 79, 89, NULL, NULL),
(238, 158, 80, NULL, 118, NULL),
(239, 189, 80, 87, NULL, NULL),
(240, 161, 81, NULL, 13, NULL),
(241, 182, 81, 66, NULL, NULL),
(242, 163, 82, 32, NULL, NULL),
(243, 185, 82, 75, NULL, NULL),
(244, 189, 82, 88, NULL, NULL),
(245, 164, 83, 38, NULL, NULL),
(246, 171, 83, NULL, 139, NULL),
(247, 187, 83, 79, NULL, NULL),
(248, 160, 84, NULL, 12, NULL),
(249, 173, 84, NULL, 15, NULL),
(250, 179, 84, NULL, 11, NULL),
(251, 161, 85, NULL, 13, NULL),
(252, 182, 85, 67, NULL, NULL),
(253, 170, 86, NULL, 14, NULL),
(254, 181, 86, NULL, 118, NULL),
(255, 185, 86, 76, NULL, NULL),
(256, 191, 86, NULL, 10, NULL),
(257, 163, 87, 33, NULL, NULL),
(258, 185, 87, 74, NULL, NULL),
(259, 189, 87, 89, NULL, NULL),
(260, 158, 88, NULL, 118, NULL),
(261, 166, 88, 41, NULL, NULL),
(262, 179, 88, NULL, 149, NULL),
(263, 163, 89, 34, NULL, NULL),
(264, 185, 89, 75, NULL, NULL),
(265, 189, 89, 90, NULL, NULL),
(266, 161, 90, NULL, 137, NULL),
(267, 182, 90, 66, NULL, NULL),
(268, 161, 91, NULL, 137, NULL),
(269, 182, 91, 66, NULL, NULL),
(270, 158, 92, NULL, 10, NULL),
(271, 166, 92, 42, NULL, NULL),
(272, 179, 92, NULL, 149, NULL),
(273, 170, 93, NULL, 14, NULL),
(274, 181, 93, NULL, 11, NULL),
(275, 185, 93, 74, NULL, NULL),
(276, 191, 93, NULL, 130, NULL),
(277, 170, 94, NULL, 113, NULL),
(278, 181, 94, NULL, 11, NULL),
(279, 185, 94, 75, NULL, NULL),
(280, 191, 94, NULL, 130, NULL),
(281, 163, 95, 32, NULL, NULL),
(282, 185, 95, 76, NULL, NULL),
(283, 189, 95, 90, NULL, NULL),
(284, 152, 96, 6, NULL, NULL),
(285, 155, 96, 23, NULL, NULL),
(286, 161, 97, NULL, 137, NULL),
(287, 182, 97, 67, NULL, NULL),
(288, 160, 98, NULL, 112, NULL),
(289, 173, 98, NULL, 139, NULL),
(290, 179, 98, NULL, 149, NULL),
(291, 152, 99, 5, NULL, NULL),
(292, 155, 99, 25, NULL, NULL),
(293, 159, 100, NULL, 11, NULL),
(294, 189, 100, 90, NULL, NULL),
(295, 159, 101, NULL, 141, NULL),
(296, 189, 101, 89, NULL, NULL),
(297, 170, 102, NULL, 113, NULL),
(298, 181, 102, NULL, 11, NULL),
(299, 185, 102, 75, NULL, NULL),
(300, 191, 102, NULL, 130, NULL),
(301, 160, 103, NULL, 12, NULL),
(302, 173, 103, NULL, 139, NULL),
(303, 179, 103, NULL, 11, NULL),
(304, 170, 104, NULL, 14, NULL),
(305, 181, 104, NULL, 11, NULL),
(306, 185, 104, 75, NULL, NULL),
(307, 191, 104, NULL, 10, NULL),
(308, 158, 105, NULL, 10, NULL),
(309, 166, 105, 41, NULL, NULL),
(310, 179, 105, NULL, 11, NULL),
(311, 159, 106, NULL, 141, NULL),
(312, 189, 106, 90, NULL, NULL),
(313, 152, 107, 4, NULL, NULL),
(314, 155, 107, 22, NULL, NULL),
(315, 184, 108, NULL, 12, NULL),
(316, 195, 108, NULL, 10, NULL),
(317, 198, 108, NULL, 11, NULL),
(318, 199, 108, 111, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `goods_to_warehouses`
--

CREATE TABLE `goods_to_warehouses` (
  `idgoods_to_warehouses` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `warehouses_id` int(11) DEFAULT NULL,
  `goods_to_warehousescol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_remains` int(11) DEFAULT NULL,
  `count_reserved_by_cart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `goods_to_warehouses`
--

INSERT IGNORE INTO `goods_to_warehouses` (`idgoods_to_warehouses`, `goods_id`, `warehouses_id`, `goods_to_warehousescol`, `count_remains`, `count_reserved_by_cart`) VALUES
(1, 10, 59, NULL, 7842, 2),
(2, 11, 43, NULL, 8979, 2),
(3, 12, 59, NULL, 3471, 2),
(4, 12, 48, NULL, 5014, 2),
(5, 13, 56, NULL, 8006, 2),
(6, 13, 42, NULL, 1267, 2),
(7, 13, 53, NULL, 2099, 2),
(8, 14, 46, NULL, 2008, 2),
(9, 14, 59, NULL, 2018, 2),
(10, 14, 41, NULL, 6534, 2),
(11, 15, 59, NULL, 7579, 2),
(12, 15, 49, NULL, 4924, 2),
(13, 15, 42, NULL, 6790, 2),
(14, 16, 57, NULL, 3081, 2),
(15, 16, 60, NULL, 8736, 2),
(16, 16, 56, NULL, 2695, 2),
(17, 16, 44, NULL, 4572, 2),
(18, 17, 60, NULL, 6631, 2),
(19, 17, 55, NULL, 1912, 2),
(20, 17, 58, NULL, 4393, 2),
(21, 17, 52, NULL, 9024, 2),
(22, 18, 58, NULL, 7705, 2),
(23, 19, 41, NULL, 1454, 2),
(24, 20, 45, NULL, 4642, 2),
(25, 20, 43, NULL, 160, 2),
(26, 20, 50, NULL, 7016, 2),
(27, 20, 54, NULL, 3510, 2),
(28, 21, 43, NULL, 9795, 2),
(29, 21, 41, NULL, 9362, 2),
(30, 21, 52, NULL, 3423, 2),
(31, 22, 56, NULL, 3082, 2),
(32, 22, 51, NULL, 2558, 2),
(33, 23, 47, NULL, 6872, 2),
(34, 24, 58, NULL, 4182, 2),
(35, 25, 42, NULL, 2468, 2),
(36, 25, 55, NULL, 4239, 2),
(37, 25, 42, NULL, 258, 2),
(38, 25, 42, NULL, 7891, 2),
(39, 26, 49, NULL, 6072, 2),
(40, 26, 43, NULL, 5951, 2),
(41, 26, 59, NULL, 2601, 2),
(42, 27, 47, NULL, 4371, 2),
(43, 27, 57, NULL, 5271, 2),
(44, 28, 53, NULL, 1223, 2),
(45, 28, 55, NULL, 6726, 2),
(46, 28, 47, NULL, 6393, 2),
(47, 28, 49, NULL, 2807, 2),
(48, 29, 59, NULL, 1254, 2),
(49, 29, 54, NULL, 2682, 2),
(50, 29, 58, NULL, 3003, 2),
(51, 29, 60, NULL, 4420, 2),
(52, 30, 46, NULL, 534, 2),
(53, 31, 58, NULL, 6181, 2),
(54, 31, 56, NULL, 7497, 2),
(55, 31, 52, NULL, 9829, 2),
(56, 32, 59, NULL, 2806, 2),
(57, 32, 49, NULL, 7860, 2),
(58, 33, 43, NULL, 9236, 2),
(59, 33, 44, NULL, 9633, 2),
(60, 33, 55, NULL, 6690, 2),
(61, 33, 42, NULL, 2833, 2),
(62, 34, 41, NULL, 7912, 2),
(63, 35, 49, NULL, 504, 2),
(64, 35, 45, NULL, 2501, 2),
(65, 36, 46, NULL, 9798, 2),
(66, 36, 60, NULL, 9902, 2),
(67, 36, 42, NULL, 4856, 2),
(68, 37, 47, NULL, 9931, 2),
(69, 37, 44, NULL, 9011, 2),
(70, 37, 42, NULL, 6063, 2),
(71, 37, 58, NULL, 4255, 2),
(72, 38, 43, NULL, 9387, 2),
(73, 38, 52, NULL, 5194, 2),
(74, 38, 53, NULL, 5928, 2),
(75, 38, 48, NULL, 1522, 2),
(76, 39, 51, NULL, 9411, 2),
(77, 39, 44, NULL, 3857, 2),
(78, 40, 42, NULL, 7747, 2),
(79, 40, 55, NULL, 1789, 2),
(80, 40, 60, NULL, 1600, 2),
(81, 40, 44, NULL, 4899, 2),
(82, 41, 44, NULL, 833, 2),
(83, 41, 45, NULL, 2, 2),
(84, 41, 57, NULL, 5162, 2),
(85, 41, 45, NULL, 4447, 2),
(86, 42, 47, NULL, 8860, 2),
(87, 42, 45, NULL, 9130, 2),
(88, 42, 50, NULL, 6294, 2),
(89, 43, 41, NULL, 5935, 2),
(90, 43, 45, NULL, 544, 2),
(91, 43, 55, NULL, 8125, 2),
(92, 43, 49, NULL, 2279, 2),
(93, 44, 58, NULL, 4226, 2),
(94, 44, 45, NULL, 5244, 2),
(95, 44, 41, NULL, 4722, 2),
(96, 45, 48, NULL, 8137, 2),
(97, 45, 41, NULL, 7515, 2),
(98, 45, 54, NULL, 6635, 2),
(99, 45, 60, NULL, 9373, 2),
(100, 46, 41, NULL, 9249, 2),
(101, 46, 47, NULL, 9554, 2),
(102, 46, 60, NULL, 8241, 2),
(103, 46, 60, NULL, 4126, 2),
(104, 47, 49, NULL, 5466, 2),
(105, 48, 56, NULL, 2926, 2),
(106, 48, 54, NULL, 2569, 2),
(107, 48, 41, NULL, 75, 2),
(108, 48, 42, NULL, 5306, 2),
(109, 49, 52, NULL, 8302, 2),
(110, 49, 51, NULL, 5912, 2),
(111, 50, 50, NULL, 6557, 2),
(112, 50, 52, NULL, 654, 2),
(113, 51, 47, NULL, 5074, 2),
(114, 51, 47, NULL, 4880, 2),
(115, 51, 48, NULL, 3778, 2),
(116, 52, 60, NULL, 643, 2),
(117, 52, 49, NULL, 1646, 2),
(118, 52, 50, NULL, 220, 2),
(119, 52, 43, NULL, 1642, 2),
(120, 53, 59, NULL, 3418, 2),
(121, 53, 50, NULL, 9805, 2),
(122, 53, 58, NULL, 4341, 2),
(123, 53, 56, NULL, 922, 2),
(124, 54, 54, NULL, 873, 2),
(125, 54, 55, NULL, 4228, 2),
(126, 55, 56, NULL, 1648, 2),
(127, 55, 55, NULL, 1125, 2),
(128, 56, 48, NULL, 7330, 2),
(129, 57, 48, NULL, 6793, 2),
(130, 57, 50, NULL, 6804, 2),
(131, 58, 59, NULL, 1288, 2),
(132, 59, 50, NULL, 2661, 2),
(133, 59, 48, NULL, 7353, 2),
(134, 60, 57, NULL, 2110, 2),
(135, 61, 46, NULL, 218, 2),
(136, 62, 56, NULL, 2446, 2),
(137, 62, 57, NULL, 9180, 2),
(138, 62, 42, NULL, 4545, 2),
(139, 62, 56, NULL, 8564, 2),
(140, 63, 48, NULL, 961, 2),
(141, 63, 44, NULL, 6399, 2),
(142, 63, 53, NULL, 4356, 2),
(143, 64, 60, NULL, 2000, 2),
(144, 64, 43, NULL, 9704, 2),
(145, 65, 53, NULL, 1795, 2),
(146, 66, 58, NULL, 2077, 2),
(147, 66, 53, NULL, 3588, 2),
(148, 67, 59, NULL, 6096, 2),
(149, 68, 59, NULL, 3788, 2),
(150, 68, 45, NULL, 1558, 2),
(151, 68, 51, NULL, 7370, 2),
(152, 68, 44, NULL, 3614, 2),
(153, 69, 51, NULL, 5328, 2),
(154, 69, 47, NULL, 2219, 2),
(155, 69, 51, NULL, 275, 2),
(156, 70, 46, NULL, 2906, 2),
(157, 71, 42, NULL, 8695, 2),
(158, 71, 49, NULL, 7891, 2),
(159, 72, 52, NULL, 4671, 2),
(160, 72, 42, NULL, 4743, 2),
(161, 72, 49, NULL, 7490, 2),
(162, 73, 45, NULL, 1567, 2),
(163, 73, 50, NULL, 7966, 2),
(164, 73, 51, NULL, 5576, 2),
(165, 73, 44, NULL, 288, 2),
(166, 74, 41, NULL, 5852, 2),
(167, 74, 42, NULL, 6165, 2),
(168, 74, 52, NULL, 343, 2),
(169, 74, 45, NULL, 2850, 2),
(170, 75, 56, NULL, 2519, 2),
(171, 75, 51, NULL, 2515, 2),
(172, 75, 57, NULL, 6645, 2),
(173, 76, 42, NULL, 5245, 2),
(174, 76, 42, NULL, 4926, 2),
(175, 77, 59, NULL, 4912, 2),
(176, 77, 48, NULL, 3828, 2),
(177, 77, 58, NULL, 9335, 2),
(178, 78, 57, NULL, 4243, 2),
(179, 78, 46, NULL, 9554, 2),
(180, 78, 56, NULL, 5981, 2),
(181, 79, 46, NULL, 5410, 2),
(182, 79, 47, NULL, 6881, 2),
(183, 80, 53, NULL, 546, 2),
(184, 80, 59, NULL, 1977, 2),
(185, 80, 51, NULL, 4060, 2),
(186, 80, 43, NULL, 4346, 2),
(187, 81, 55, NULL, 9828, 2),
(188, 81, 59, NULL, 292, 2),
(189, 81, 53, NULL, 8787, 2),
(190, 81, 46, NULL, 7833, 2),
(191, 82, 45, NULL, 6788, 2),
(192, 82, 49, NULL, 4880, 2),
(193, 83, 42, NULL, 9974, 2),
(194, 83, 42, NULL, 5951, 2),
(195, 83, 55, NULL, 3345, 2),
(196, 83, 50, NULL, 1712, 2),
(197, 84, 60, NULL, 999, 2),
(198, 85, 54, NULL, 6768, 2),
(199, 86, 49, NULL, 9210, 2),
(200, 86, 57, NULL, 1091, 2),
(201, 86, 44, NULL, 9565, 2),
(202, 86, 45, NULL, 541, 2),
(203, 87, 44, NULL, 2240, 2),
(204, 88, 52, NULL, 4100, 2),
(205, 88, 58, NULL, 4200, 2),
(206, 88, 57, NULL, 9927, 2),
(207, 88, 49, NULL, 4644, 2),
(208, 89, 59, NULL, 7867, 2),
(209, 90, 44, NULL, 2435, 2),
(210, 90, 60, NULL, 3148, 2),
(211, 91, 52, NULL, 9318, 2),
(212, 92, 60, NULL, 8456, 2),
(213, 92, 41, NULL, 1186, 2),
(214, 92, 58, NULL, 2635, 2),
(215, 92, 57, NULL, 6105, 2),
(216, 93, 49, NULL, 6560, 2),
(217, 94, 50, NULL, 655, 2),
(218, 95, 54, NULL, 6525, 2),
(219, 95, 43, NULL, 2465, 2),
(220, 95, 51, NULL, 962, 2),
(221, 96, 44, NULL, 4466, 2),
(222, 96, 49, NULL, 5625, 2),
(223, 97, 49, NULL, 6162, 2),
(224, 98, 41, NULL, 3495, 2),
(225, 99, 43, NULL, 3594, 2),
(226, 100, 57, NULL, 147, 2),
(227, 100, 51, NULL, 6970, 2),
(228, 101, 47, NULL, 5627, 2),
(229, 101, 60, NULL, 2192, 2),
(230, 101, 43, NULL, 5231, 2),
(231, 101, 48, NULL, 9505, 2),
(232, 102, 58, NULL, 2270, 2),
(233, 102, 42, NULL, 9503, 2),
(234, 102, 56, NULL, 1118, 2),
(235, 103, 56, NULL, 3630, 2),
(236, 103, 54, NULL, 7210, 2),
(237, 103, 53, NULL, 7798, 2),
(238, 103, 49, NULL, 1557, 2),
(239, 104, 42, NULL, 3012, 2),
(240, 104, 51, NULL, 6350, 2),
(241, 104, 44, NULL, 4476, 2),
(242, 104, 59, NULL, 7812, 2),
(243, 105, 52, NULL, 7862, 2),
(244, 105, 54, NULL, 7910, 2),
(245, 106, 59, NULL, 502, 2),
(246, 106, 53, NULL, 7107, 2),
(247, 106, 53, NULL, 6583, 2),
(248, 107, 55, NULL, 6824, 2),
(249, 107, 51, NULL, 8167, 2),
(250, 107, 50, NULL, 802, 2),
(251, 108, 55, NULL, 4342, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `menu`
--

INSERT IGNORE INTO `menu` (`id`, `data`, `date`) VALUES
(4, 'a:8:{i:34;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:34;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"111UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"111RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"111BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"111En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"GoUwQ0\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:1;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:35;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:35;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"222UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"222RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"222BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"222En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"6gp9h8\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:2;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:36;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:36;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"333UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"333RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"333BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"333En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"Gh2c3y\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:3;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:37;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:37;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"444UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"444RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"444BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"444En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"bYNbB9\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:4;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:1:{i:38;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:38;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"555UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"555RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"555BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"555En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:37;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"wL7xiZ\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:5;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:1:{i:39;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:39;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"666UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"666RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"666BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"666En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:38;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"2IfBJb\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:6;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:1:{i:40;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:40;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"777UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"777RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"777BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"777En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:39;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"W5H0sM\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:7;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}}}}}}}i:41;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:41;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"888UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"888RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"888BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"888En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"Oaaouj\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:8;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:42;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:42;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:10:\"999UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:8:\"999RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:9:\"999BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:5:\"999En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"CQI9pP\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:9;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:43;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:43;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:13:\"101010UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:11:\"101010RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:12:\"101010BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:8:\"101010En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"6VClHW\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:10;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}i:44;a:2:{s:4:\"data\";O:36:\"Eshop\\SampleBundle\\Entity\\Categories\":10:{s:40:\"\0Eshop\\SampleBundle\\Entity\\Categories\0id\";i:44;s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameUa\";s:13:\"111111UAUAUAU\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameRu\";s:11:\"111111RURUR\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameBy\";s:12:\"111111BYBYBY\";s:52:\"\0Eshop\\SampleBundle\\Entity\\Categories\0categoryNameEn\";s:8:\"111111En\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0parenId\";i:0;s:43:\"\0Eshop\\SampleBundle\\Entity\\Categories\0alias\";s:6:\"fFnywQ\";s:46:\"\0Eshop\\SampleBundle\\Entity\\Categories\0ordering\";i:11;s:42:\"\0Eshop\\SampleBundle\\Entity\\Categories\0icon\";s:4:\"icon\";s:45:\"\0Eshop\\SampleBundle\\Entity\\Categories\0filters\";N;}s:5:\"child\";a:0:{}}}', '2019-02-15');

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `progress` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `total_price_orders` double DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `hash` text COLLATE utf8_unicode_ci,
  `is_payed` int(11) DEFAULT NULL,
  `additional_order_data` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `payed_error` text COLLATE utf8_unicode_ci,
  `payed_hash` text COLLATE utf8_unicode_ci,
  `is_offline` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `orders`
--

INSERT IGNORE INTO `orders` (`id`, `users_id`, `currency`, `progress`, `date`, `total_price_orders`, `description`, `hash`, `is_payed`, `additional_order_data`, `status`, `payed_error`, `payed_hash`, `is_offline`) VALUES
(95, 1, 5, 'NEW', '2019-03-03', 807634, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"description\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\"}', 1, NULL, NULL, NULL),
(97, 1, 5, 'NEW', '2019-03-03', 473480, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\"}', 1, NULL, NULL, NULL),
(98, 1, 5, 'NEW', '2019-03-03', 355110, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\"}', 1, NULL, NULL, NULL),
(99, 1, 5, 'NEW', '2019-03-03', 49757, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\"}', 1, NULL, NULL, NULL),
(100, 1, 5, 'NEW', '2019-03-03', 0, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":null}', 1, NULL, NULL, NULL),
(101, 1, 5, 'NEW', '2019-03-03', 149271, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":null}', 1, NULL, NULL, NULL),
(102, 1, 5, 'NEW', '2019-03-03', 516948, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":null}', 1, NULL, NULL, NULL),
(103, 1, 5, 'NEW', '2019-03-03', 47900, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"ggggggggggggggg\"}', 1, NULL, NULL, NULL),
(104, 1, 5, 'NEW', '2019-03-03', 77752, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"ggggggggggggg\"}', 1, NULL, NULL, NULL),
(105, 1, 5, 'NEW', '2019-03-03', 252480, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"werwerwer\"}', 1, NULL, NULL, NULL),
(106, 1, 5, 'NEW', '2019-03-03', 127072, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"sadfasdf\"}', 1, NULL, NULL, NULL),
(107, 1, 5, 'NEW', '2019-03-04', 266535, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"wesdfasd\"}', 1, NULL, NULL, NULL),
(108, 1, 5, 'NEW', '2019-03-04', 236740, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"dfsdgdsfg\"}', 2, NULL, NULL, NULL),
(109, 1, 5, 'NEW', '2019-03-04', 221236, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"adfasfsdf\"}', 1, NULL, NULL, NULL),
(110, NULL, 5, 'NEW', '2019-03-05', 266724.58954921, 'Test description', 'oe0jQlmZOldiYkp', 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, NULL, NULL),
(111, 1, 5, 'NEW', '2019-03-06', 1376486, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"ewrewrwqr\"}', 1, NULL, NULL, NULL),
(112, NULL, 5, 'NEW', '2019-03-06', 610991.2409245, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"ivan\"}', 1, NULL, NULL, NULL),
(113, NULL, 5, 'NEW', '2019-03-06', 375119.23827623, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, NULL, NULL),
(114, NULL, 5, 'NEW', '2019-03-06', 515987.10076577, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, NULL, NULL, NULL),
(115, NULL, 5, 'NEW', '2019-03-06', 456481.8562947, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"dsfgdsfg\"}', 3, NULL, NULL, NULL),
(116, NULL, 5, 'NEW', '2019-03-06', 253091.9149337, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, NULL, NULL, NULL),
(117, NULL, 5, 'NEW', '2019-03-06', 350211.76884952, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, NULL, NULL, NULL),
(118, NULL, 5, 'NEW', '2019-03-06', 202473.53194696, 'Test description', 'D4FEbjzcdwZ4fkv', 1, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 2, NULL, NULL, NULL),
(119, NULL, 5, 'NEW', '2019-03-06', 412789.68061262, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, NULL, NULL),
(120, NULL, 5, 'NEW', '2019-03-06', 29282.02713398, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', NULL, NULL),
(121, NULL, 5, 'NEW', '2019-03-06', 82696.760373667, 'Test description', 'D4FEbjzcdwZ4fkv', 1, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 2, NULL, NULL, NULL),
(122, NULL, 5, 'NEW', '2019-03-06', 131481.57957629, 'Test description', 'D4FEbjzcdwZ4fkv', 1, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 2, 'OK', NULL, NULL),
(123, NULL, 5, 'NEW', '2019-03-06', 547778.22755365, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', NULL, NULL),
(124, NULL, 5, 'NEW', '2019-03-06', 203985.91886748, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', NULL, NULL),
(125, NULL, 5, 'NEW', '2019-03-06', 103197.42015315, 'Test description', 'D4FEbjzcdwZ4fkv', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"dsfasdf dsf adgdsfg dsgsdfg dfgsdfg dsfgdfg dfg dsfgdfg dfg \"}', 3, 'У получателя не установлена карта для приема платежей', NULL, NULL),
(126, 1, 5, 'NEW', '2019-03-06', 355110, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', '1551975544.2674_oxyL', NULL),
(127, 1, 5, 'NEW', '2019-03-07', 591850, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', NULL, NULL),
(128, 1, 5, 'NEW', '2019-03-07', 127183, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', '1551975976.3761_57TU', NULL),
(129, 1, 5, 'NEW', '2019-03-07', 140609, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 3, 'У получателя не установлена карта для приема платежей', '1551976437.989_jZAh', NULL),
(130, 1, 5, 'NEW', '2019-03-07', 158840, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1551977970.5119_EqWh', NULL),
(131, NULL, 5, 'NEW', '2019-03-10', 383714.44422364, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242317.2069_wkkN', 0),
(132, NULL, 5, 'NEW', '2019-03-10', 722381.94107208, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242444.9652_1aAm', 0),
(133, NULL, 5, 'NEW', '2019-03-10', 730425.64044748, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242510.3828_7qfe', 0),
(134, NULL, 5, 'NEW', '2019-03-10', 805509.40101908, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242710.6376_jSid', 0),
(135, 1, 5, 'NEW', '2019-03-10', 109094, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242743.1724_cnHy', 0),
(136, 1, 5, 'NEW', '2019-03-10', 158840, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552242886.5442_XUUe', 0),
(137, 1, 5, 'NEW', '2019-03-10', 82094, 'Test description', NULL, 0, '{\"name\":\"\\u0410\\u043d\\u043d\\u0430\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u0427\\u0435\\u0440\\u0435\\u043f\\u0438\\u043d\\u0430 38, 49\",\"phone\":\"501408375\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552244580.1146_lyuD', 0),
(138, 1, 5, 'NEW', '2019-03-10', 236740, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552246687.5143_LXvm', 0),
(139, 1, 5, 'NEW', '2019-03-10', 940528, 'Test description', NULL, 0, NULL, 1, NULL, '1552246695.2345_DSLy', 1),
(140, 1, 5, 'NEW', '2019-03-10', 0, 'Test description', NULL, 0, '{\"name\":null,\"surname\":null,\"city\":null,\"address\":null,\"phone\":null,\"email\":null,\"description\":null}', 1, NULL, '1552245538.3651_ioME', 1),
(141, 1, 5, 'NEW', '2019-03-10', 0, 'Test description', NULL, 0, '{\"name\":null,\"surname\":null,\"city\":null,\"address\":null,\"phone\":null,\"email\":null,\"description\":null}', 1, NULL, '1552245564.9625_Tlyj', 1),
(142, 1, 5, 'NEW', '2019-03-10', 940528, 'Test description', NULL, 0, NULL, 1, NULL, '1552246664.1768_iUD1', 1),
(143, 1, 5, 'NEW', '2019-03-10', 158840, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552246782.5903_Y5YA', 1),
(144, 1, 5, 'NEW', '2019-03-10', 158840, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552247317.3013_v251', 1),
(145, 1, 5, 'NEW', '2019-03-10', 158840, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552246835.4068_pPAt', 1),
(146, 1, 5, 'NEW', '2019-03-10', 355110, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552247393.6357_jF3k', 0),
(147, 1, 5, 'NEW', '2019-03-10', 0, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552247407.7901_EblZ', 1),
(148, 1, 5, 'NEW', '2019-03-10', 100992, 'Test description', NULL, 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552490694.8944_lBMT', 1),
(149, NULL, 5, 'NEW', '2019-03-13', 380731.15280392, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1552473345.592_LqWy', 1),
(150, NULL, 5, 'NEW', '2019-03-20', 995636.43726734, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1553094639.2775_6CY7', 1),
(151, NULL, 5, 'NEW', '2019-04-08', 412789.68061262, 'Test description', 'mY6G2LLrnzSLpmp', 0, '{\"name\":\"\\u0418\\u0432\\u0430\\u043d\",\"surname\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"city\":\"\\u041b\\u043e\\u0431\\u043e\\u0434\\u044e\\u043a\",\"address\":\"\\u041d\\u0438\\u0436\\u043d\\u0454-\\u0441\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u0441\\u044c\\u043a\\u0430\",\"phone\":\"680998164\",\"email\":\"ivan.lobodyuk@gmail.com\",\"description\":\"\"}', 1, NULL, '1554727743.5488_GAEO', 0),
(152, 2, 5, 'NEW', '2019-05-02', 82094, 'Test description', NULL, 0, '{\"name\":\"Vyacheslav\",\"surname\":\"Kharchenko\",\"city\":\"Kharchenko\",\"address\":\"SKD 12\\/212\",\"phone\":\"+380505777460\",\"email\":\"icland@gmail.com\",\"description\":\"\"}', 1, NULL, '1556816620.2095_pEF0', 1),
(153, NULL, 5, 'NEW', '2019-05-07', 252955.98020715, 'Test description', 'SGzUvhUQe1o3qro', 0, '{\"name\":\"John\",\"surname\":\"Lenon\",\"city\":\"Lenon\",\"address\":\"some street\",\"phone\":\"678095\",\"email\":\"john@gmail.com\",\"description\":\"pack well plz!\"}', 1, NULL, '1557235606.6421_69Fz', 1),
(154, NULL, 5, 'NEW', '2019-05-07', 127828.59142336, 'Test description', 'VUVezbEfLkBzeO9', 0, '{\"name\":\"Jina\",\"surname\":\"Lee\",\"city\":\"Lee\",\"address\":\"street name, 25\",\"phone\":\"797979\",\"email\":\"email.@com.com\",\"description\":\"description\"}', 1, NULL, '1557241780.3313_UTVC', 1),
(155, NULL, 5, 'NEW', '2019-05-07', 103197.42015315, 'Test description', 'VUVezbEfLkBzeO9', 0, '{\"name\":\"jona\",\"surname\":\"milkovich\",\"city\":\"milkovich\",\"address\":\"12\",\"phone\":\"123\",\"email\":\"jona2@comcom.com\",\"description\":\"1231\"}', 1, NULL, '1557241826.0715_QfT3', 1),
(156, NULL, 5, 'NEW', '2019-05-07', 202473.53194696, 'Test description', 'VUVezbEfLkBzeO9', 0, '{\"name\":\"jona\",\"surname\":\"milkovich\",\"city\":\"milkovich\",\"address\":\"address\",\"phone\":\"235325\",\"email\":\"jona2@comcom.com\",\"description\":\"test\"}', 1, NULL, '1557241943.8911_WCLX', 1),
(157, NULL, 5, 'NEW', '2019-05-07', 60191.280657585, 'Test description', 'VUVezbEfLkBzeO9', 0, '{\"name\":\"jona\",\"surname\":\"milkovich\",\"city\":\"milkovich\",\"address\":\"address street home\",\"phone\":\"09548484\",\"email\":\"ivan.lobodyuk@gma.com\",\"description\":\"description\"}', 1, NULL, '1557242339.9703_JCZf', 1),
(158, 4, 5, 'NEW', '2019-05-07', 181413, 'Test description', NULL, 0, '{\"name\":\"test\",\"surname\":\"test1\",\"city\":\"test1\",\"address\":\"Street\",\"phone\":\"785065\",\"email\":\"jina@ggaol.com\",\"description\":\"test\"}', 1, NULL, '1557242451.738_t3Iq', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `orders_product`
--

CREATE TABLE `orders_product` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `price_snap` double DEFAULT NULL,
  `koef_snap` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `orders_product`
--

INSERT IGNORE INTO `orders_product` (`id`, `goods_id`, `orders_id`, `count`, `total_price`, `price_snap`, `koef_snap`) VALUES
(305, 22, 95, 5, 591850, 118370, 1),
(306, 51, 95, 4, 215784, 53946, 1),
(307, 22, 97, 4, 473480, 118370, 1),
(308, 22, 98, 3, 355110, 118370, 1),
(309, 41, 99, 1, 49757, 49757, 1),
(310, 41, 101, 3, 149271, 49757, 1),
(311, 22, 102, 3, 355110, 118370, 1),
(312, 51, 102, 3, 161838, 53946, 1),
(313, 42, 103, 4, 47900, 11975, 1),
(314, 80, 104, 4, 77752, 19438, 1),
(315, 19, 105, 5, 252480, 50496, 1),
(316, 15, 106, 4, 127072, 31768, 1),
(317, 25, 107, 5, 266535, 53307, 1),
(318, 22, 108, 2, 236740, 118370, 1),
(319, 84, 109, 4, 221236, 55309, 1),
(320, 20, 110, 1, 91415.816780823, 91415.816780823, 1),
(321, 13, 110, 4, 175308.77276839, 43827.193192097, 1),
(322, 15, 111, 5, 158840, 31768, 1),
(323, 22, 111, 6, 710220, 118370, 1),
(324, 23, 111, 5, 453480, 90696, 1),
(325, 51, 111, 1, 53946, 53946, 1),
(326, 18, 112, 11, 153912.15702038, 13992.01427458, 1),
(327, 20, 112, 5, 457079.08390412, 91415.816780823, 1),
(328, 15, 113, 5, 253091.9149337, 50618.382986741, 1),
(329, 24, 113, 2, 122027.32334253, 61013.661671266, 1),
(330, 22, 114, 5, 515987.10076577, 103197.42015315, 1),
(331, 19, 115, 5, 456481.8562947, 91296.371258941, 1),
(332, 15, 116, 5, 253091.9149337, 50618.382986741, 1),
(333, 24, 117, 5, 305068.30835633, 61013.661671266, 1),
(334, 26, 117, 3, 45143.460493189, 15047.820164396, 1),
(335, 15, 118, 4, 202473.53194696, 50618.382986741, 1),
(336, 22, 119, 4, 412789.68061262, 103197.42015315, 1),
(337, 84, 120, 5, 29282.02713398, 5856.405426796, 1),
(338, 25, 121, 1, 82696.760373667, 82696.760373667, 1),
(339, 13, 122, 3, 131481.57957629, 43827.193192097, 1),
(340, 19, 123, 6, 547778.22755365, 91296.371258941, 1),
(341, 11, 124, 4, 203985.91886748, 50996.47971687, 1),
(342, 22, 125, 1, 103197.42015315, 103197.42015315, 1),
(343, 22, 126, 3, 355110, 118370, 1),
(344, 22, 127, 5, 591850, 118370, 1),
(345, 25, 128, 1, 53307, 53307, 1),
(346, 28, 128, 1, 73876, 73876, 1),
(347, 13, 129, 3, 90852, 30284, 1),
(348, 41, 129, 1, 49757, 49757, 1),
(349, 15, 130, 5, 158840, 31768, 1),
(350, 22, 131, 3, 309592.26045946, 103197.42015315, 1),
(351, 23, 131, 1, 74122.183764174, 74122.183764174, 1),
(352, 22, 132, 7, 722381.94107208, 103197.42015315, 1),
(353, 22, 133, 7, 722381.94107208, 103197.42015315, 1),
(354, 51, 133, 4, 8043.6993753945, 2010.9248438486, 1),
(355, 15, 134, 12, 607420.59584089, 50618.382986741, 1),
(356, 24, 134, 3, 183040.9850138, 61013.661671266, 1),
(357, 26, 134, 1, 15047.820164396, 15047.820164396, 1),
(358, 33, 135, 1, 71043, 71043, 1),
(359, 57, 135, 1, 38051, 38051, 1),
(360, 15, 136, 5, 158840, 31768, 1),
(361, 18, 137, 1, 82094, 82094, 1),
(362, 22, 138, 2, 236740, 118370, 1),
(363, 38, 139, 8, 940528, 117566, 1),
(364, 38, 142, 8, 940528, 117566, 1),
(365, 15, 143, 5, 158840, 31768, 1),
(366, 15, 144, 5, 158840, 31768, 1),
(367, 15, 145, 5, 158840, 31768, 1),
(368, 22, 146, 3, 355110, 118370, 1),
(369, 19, 148, 2, 100992, 50496, 1),
(370, 41, 149, 2, 124618.89690288, 62309.448451441, 1),
(371, 48, 149, 3, 118148.2317394, 39382.743913133, 1),
(372, 80, 149, 3, 38168.773871217, 12722.924623739, 1),
(373, 13, 149, 1, 43827.193192097, 43827.193192097, 1),
(374, 18, 149, 4, 55968.057098322, 13992.01427458, 1),
(375, 18, 150, 42, 587664.59953238, 13992.01427458, 1),
(376, 11, 150, 8, 407971.83773496, 50996.47971687, 1),
(377, 22, 151, 4, 412789.68061262, 103197.42015315, 1),
(378, 18, 152, 1, 82094, 82094, 1),
(379, 23, 153, 2, 148244.36752835, 74122.183764174, 1),
(380, 51, 153, 3, 6032.7745315458, 2010.9248438486, 1),
(381, 84, 153, 2, 11712.810853592, 5856.405426796, 1),
(382, 98, 153, 1, 86966.027293663, 86966.027293663, 1),
(383, 30, 154, 4, 127828.59142336, 31957.14785584, 1),
(384, 22, 155, 1, 103197.42015315, 103197.42015315, 1),
(385, 15, 156, 4, 202473.53194696, 50618.382986741, 1),
(386, 26, 157, 4, 60191.280657585, 15047.820164396, 1),
(387, 20, 158, 3, 181413, 60471, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `img` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `services`
--

INSERT IGNORE INTO `services` (`id`, `name`, `img`, `description`) VALUES
(1, 'name', 'img', 'description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description '),
(2, 'name', 'img', 'description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description '),
(3, 'name', 'img', 'description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description description descriptiondescription description description description ');

-- --------------------------------------------------------

--
-- Структура таблиці `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name_ua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ru` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `statuses`
--

INSERT IGNORE INTO `statuses` (`id`, `name_ua`, `name_ru`, `name_by`, `name_en`) VALUES
(1, 'новый', 'новый', 'новый', 'новый'),
(2, 'получена оплата', 'получена оплата', 'получена оплата', 'получена оплата'),
(3, 'помилка при оплат', 'ошибка оплаты', 'ашибка аплаты ', 'еррор пеймент\r\n');

-- --------------------------------------------------------

--
-- Структура таблиці `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `support`
--

INSERT IGNORE INTO `support` (`id`, `name`, `description`, `phone`, `date`) VALUES
(1, 'Петренко Вікторія Олександрівна', 'ggggggg', '0680998164', NULL),
(2, 'Петренко Вікторія Олександрівна', 'ggggggg', '0680998164', '2019-02-21'),
(3, 'Петренко Вікторія Олександрівна', 'ggggggg', '0680998164', '2019-02-21'),
(4, 'Петренко Вікторія Олександрівна', 'asfdsfasdf', '0680998164', '2019-02-22'),
(5, 'Петренко Вікторія Олександрівна', '', '0680998164', '2019-02-25'),
(6, 'Петренко Вікторія Олександрівна', '65454', '0501408375', '2019-03-13'),
(7, 'Петренко Вікторія Олександрівна', 'adfasfasdf', '0680998164', '2019-03-20'),
(8, '1564654', '123132', '5', '2019-05-22'),
(9, '1564654', '123132', '45456466454615', '2019-05-22');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `default_currency` int(11) DEFAULT NULL,
  `roles` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT IGNORE INTO `users` (`id`, `default_currency`, `roles`, `username`, `name`, `surname`, `email`, `address`, `password`, `company`, `locale`, `phone`, `city`) VALUES
(1, 5, '[\"ROLE_BUYER\"]', 'ivan.lobodyuk@gmail.com', 'root', 'Лободюк', 'ivan.lobodyuk@gmail.com', NULL, '$2y$13$I./uxA4lUehdmV3eUxsdJeTsKrBX5tMt4k6UDPSFT97Cywso9LZgO', 'ivan', 'ua', '680998164', ''),
(2, 5, '[\"ROLE_BUYER\"]', 'icland@gmail.com', 'Vyacheslav', 'Kharchenko', 'icland@gmail.com', NULL, '$2y$13$QoG60N1kZm86MSthgDn4K.cefumgk6aRt9yXRcNE6kdDZC4iEe9N6', 'island', 'ua', '+380505777460', NULL),
(3, 5, '[\"ROLE_BUYER\"]', 'test@test.test', 'test', 'test', 'test@test.test', NULL, '$2y$13$2pucV.bXEabhRQSGMR1am.7S3dTEREbtj.okRH/P1pCQ8SlJJZoXK', 'test', 'en', '8000', NULL),
(4, 5, '[\"ROLE_BUYER\"]', 'jina@ggaol.com', 'test', 'test1', 'jina@ggaol.com', NULL, '$2y$13$eXOnLqBVxnJHkNlms8OlCuy8JMGxF0HKqCiLgznoJaYw2IMlIbcXW', 'test', 'en', '785065', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `user_to_currencies`
--

CREATE TABLE `user_to_currencies` (
  `currencies_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `valueses`
--

CREATE TABLE `valueses` (
  `id` int(11) NOT NULL,
  `name_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ru` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `valueses`
--

INSERT IGNORE INTO `valueses` (`id`, `name_by`, `name_en`, `name_ua`, `name_ru`) VALUES
(0, 'I5tt BY', 'I5tt UA', 'I5tt EN', 'I5tt RU'),
(1, 'Mrqu BY', 'Mrqu UA', 'Mrqu EN', 'Mrqu RU'),
(2, 'MXqT BY', 'MXqT UA', 'MXqT EN', 'MXqT RU'),
(3, '9Rfp BY', '9Rfp UA', '9Rfp EN', '9Rfp RU'),
(4, 'kk7L BY', 'kk7L UA', 'kk7L EN', 'kk7L RU'),
(5, 'p617 BY', 'p617 UA', 'p617 EN', 'p617 RU'),
(6, 'tLQJ BY', 'tLQJ UA', 'tLQJ EN', 'tLQJ RU'),
(7, 'Igi4 BY', 'Igi4 UA', 'Igi4 EN', 'Igi4 RU'),
(8, 'SXRp BY', 'SXRp UA', 'SXRp EN', 'SXRp RU'),
(9, 'F99k BY', 'F99k UA', 'F99k EN', 'F99k RU'),
(10, '6rfC BY', '6rfC UA', '6rfC EN', '6rfC RU'),
(11, 'k0jr BY', 'k0jr UA', 'k0jr EN', 'k0jr RU'),
(12, 'HGsL BY', 'HGsL UA', 'HGsL EN', 'HGsL RU'),
(13, '021e BY', '021e UA', '021e EN', '021e RU'),
(14, '1Qvu BY', '1Qvu UA', '1Qvu EN', '1Qvu RU'),
(15, 'BPdI BY', 'BPdI UA', 'BPdI EN', 'BPdI RU'),
(16, 'UztU BY', 'UztU UA', 'UztU EN', 'UztU RU'),
(17, 'Oia3 BY', 'Oia3 UA', 'Oia3 EN', 'Oia3 RU'),
(18, 'F5da BY', 'F5da UA', 'F5da EN', 'F5da RU'),
(19, 'im2y BY', 'im2y UA', 'im2y EN', 'im2y RU'),
(20, '9H4v BY', '9H4v UA', '9H4v EN', '9H4v RU'),
(21, '3Y5N BY', '3Y5N UA', '3Y5N EN', '3Y5N RU'),
(22, 'ylQX BY', 'ylQX UA', 'ylQX EN', 'ylQX RU'),
(23, 'TMqo BY', 'TMqo UA', 'TMqo EN', 'TMqo RU'),
(24, 'oSaN BY', 'oSaN UA', 'oSaN EN', 'oSaN RU'),
(25, 'UHuW BY', 'UHuW UA', 'UHuW EN', 'UHuW RU'),
(26, '5Kz3 BY', '5Kz3 UA', '5Kz3 EN', '5Kz3 RU'),
(27, 'Smic BY', 'Smic UA', 'Smic EN', 'Smic RU'),
(28, '7g8G BY', '7g8G UA', '7g8G EN', '7g8G RU'),
(29, 'jfXG BY', 'jfXG UA', 'jfXG EN', 'jfXG RU'),
(30, 'b0Qq BY', 'b0Qq UA', 'b0Qq EN', 'b0Qq RU'),
(31, 'FCJg BY', 'FCJg UA', 'FCJg EN', 'FCJg RU'),
(32, 'DiqM BY', 'DiqM UA', 'DiqM EN', 'DiqM RU'),
(33, 'ZNh9 BY', 'ZNh9 UA', 'ZNh9 EN', 'ZNh9 RU'),
(34, 'Ug8b BY', 'Ug8b UA', 'Ug8b EN', 'Ug8b RU'),
(35, 'FDY1 BY', 'FDY1 UA', 'FDY1 EN', 'FDY1 RU'),
(36, 'qU4T BY', 'qU4T UA', 'qU4T EN', 'qU4T RU'),
(37, 'VGcm BY', 'VGcm UA', 'VGcm EN', 'VGcm RU'),
(38, '2jGN BY', '2jGN UA', '2jGN EN', '2jGN RU'),
(39, 'asPZ BY', 'asPZ UA', 'asPZ EN', 'asPZ RU'),
(40, '0swv BY', '0swv UA', '0swv EN', '0swv RU'),
(41, 'uk7C BY', 'uk7C UA', 'uk7C EN', 'uk7C RU'),
(42, 'GN2v BY', 'GN2v UA', 'GN2v EN', 'GN2v RU'),
(43, 'v2B9 BY', 'v2B9 UA', 'v2B9 EN', 'v2B9 RU'),
(44, 'DPrR BY', 'DPrR UA', 'DPrR EN', 'DPrR RU'),
(45, '8zrj BY', '8zrj UA', '8zrj EN', '8zrj RU'),
(46, 'q8Us BY', 'q8Us UA', 'q8Us EN', 'q8Us RU'),
(47, 'quQ9 BY', 'quQ9 UA', 'quQ9 EN', 'quQ9 RU'),
(48, 'B9Is BY', 'B9Is UA', 'B9Is EN', 'B9Is RU'),
(49, 'Qzv4 BY', 'Qzv4 UA', 'Qzv4 EN', 'Qzv4 RU'),
(50, 'Wi95 BY', 'Wi95 UA', 'Wi95 EN', 'Wi95 RU'),
(51, '5dns BY', '5dns UA', '5dns EN', '5dns RU'),
(52, 'KR2V BY', 'KR2V UA', 'KR2V EN', 'KR2V RU'),
(53, 'xogY BY', 'xogY UA', 'xogY EN', 'xogY RU'),
(54, '8nHH BY', '8nHH UA', '8nHH EN', '8nHH RU'),
(55, 'gTdt BY', 'gTdt UA', 'gTdt EN', 'gTdt RU'),
(56, 'q50h BY', 'q50h UA', 'q50h EN', 'q50h RU'),
(57, 'sHXC BY', 'sHXC UA', 'sHXC EN', 'sHXC RU'),
(58, 'acpY BY', 'acpY UA', 'acpY EN', 'acpY RU'),
(59, 'CYeG BY', 'CYeG UA', 'CYeG EN', 'CYeG RU'),
(60, 'by0H BY', 'by0H UA', 'by0H EN', 'by0H RU'),
(61, '8uli BY', '8uli UA', '8uli EN', '8uli RU'),
(62, 'nFLL BY', 'nFLL UA', 'nFLL EN', 'nFLL RU'),
(63, 'DcoS BY', 'DcoS UA', 'DcoS EN', 'DcoS RU'),
(64, '1ISG BY', '1ISG UA', '1ISG EN', '1ISG RU'),
(65, 'CTay BY', 'CTay UA', 'CTay EN', 'CTay RU'),
(66, 'IEaT BY', 'IEaT UA', 'IEaT EN', 'IEaT RU'),
(67, 'A13U BY', 'A13U UA', 'A13U EN', 'A13U RU'),
(68, 'f79Z BY', 'f79Z UA', 'f79Z EN', 'f79Z RU'),
(69, 'QSU5 BY', 'QSU5 UA', 'QSU5 EN', 'QSU5 RU'),
(70, '42sY BY', '42sY UA', '42sY EN', '42sY RU'),
(71, 'UXQt BY', 'UXQt UA', 'UXQt EN', 'UXQt RU'),
(72, '6y0q BY', '6y0q UA', '6y0q EN', '6y0q RU'),
(73, 'WbRK BY', 'WbRK UA', 'WbRK EN', 'WbRK RU'),
(74, 'bJ9g BY', 'bJ9g UA', 'bJ9g EN', 'bJ9g RU'),
(75, 'zIC6 BY', 'zIC6 UA', 'zIC6 EN', 'zIC6 RU'),
(76, '6Mw2 BY', '6Mw2 UA', '6Mw2 EN', '6Mw2 RU'),
(77, 'JX2R BY', 'JX2R UA', 'JX2R EN', 'JX2R RU'),
(78, 'PZ3S BY', 'PZ3S UA', 'PZ3S EN', 'PZ3S RU'),
(79, 'EDig BY', 'EDig UA', 'EDig EN', 'EDig RU'),
(80, '9RZ6 BY', '9RZ6 UA', '9RZ6 EN', '9RZ6 RU'),
(81, 'dl6P BY', 'dl6P UA', 'dl6P EN', 'dl6P RU'),
(82, 'qnXg BY', 'qnXg UA', 'qnXg EN', 'qnXg RU'),
(83, 'fvEt BY', 'fvEt UA', 'fvEt EN', 'fvEt RU'),
(84, 'fxU4 BY', 'fxU4 UA', 'fxU4 EN', 'fxU4 RU'),
(85, 'Qx7L BY', 'Qx7L UA', 'Qx7L EN', 'Qx7L RU'),
(86, 'SjoW BY', 'SjoW UA', 'SjoW EN', 'SjoW RU'),
(87, 'Fua5 BY', 'Fua5 UA', 'Fua5 EN', 'Fua5 RU'),
(88, 'h3lC BY', 'h3lC UA', 'h3lC EN', 'h3lC RU'),
(89, 'JIna BY', 'JIna UA', 'JIna EN', 'JIna RU'),
(90, 'VBVE BY', 'VBVE UA', 'VBVE EN', 'VBVE RU'),
(91, 'johO BY', 'johO UA', 'johO EN', 'johO RU'),
(92, 'n66D BY', 'n66D UA', 'n66D EN', 'n66D RU'),
(93, 'ekOZ BY', 'ekOZ UA', 'ekOZ EN', 'ekOZ RU'),
(94, 'ypNo BY', 'ypNo UA', 'ypNo EN', 'ypNo RU'),
(95, '0Vbu BY', '0Vbu UA', '0Vbu EN', '0Vbu RU'),
(96, 'bltE BY', 'bltE UA', 'bltE EN', 'bltE RU'),
(97, 'f95Q BY', 'f95Q UA', 'f95Q EN', 'f95Q RU'),
(98, '92w0 BY', '92w0 UA', '92w0 EN', '92w0 RU'),
(99, 'vgB1 BY', 'vgB1 UA', 'vgB1 EN', 'vgB1 RU'),
(100, 'SyX4 BY', 'SyX4 UA', 'SyX4 EN', 'SyX4 RU'),
(101, 'LaSm BY', 'LaSm UA', 'LaSm EN', 'LaSm RU'),
(102, 'G1p3 BY', 'G1p3 UA', 'G1p3 EN', 'G1p3 RU'),
(103, 'hvQ5 BY', 'hvQ5 UA', 'hvQ5 EN', 'hvQ5 RU'),
(104, 'gCTD BY', 'gCTD UA', 'gCTD EN', 'gCTD RU'),
(105, 'qL4a BY', 'qL4a UA', 'qL4a EN', 'qL4a RU'),
(106, 'iOtq BY', 'iOtq UA', 'iOtq EN', 'iOtq RU'),
(107, 'nsOS BY', 'nsOS UA', 'nsOS EN', 'nsOS RU'),
(108, 'APzS BY', 'APzS UA', 'APzS EN', 'APzS RU'),
(109, 'bRxp BY', 'bRxp UA', 'bRxp EN', 'bRxp RU'),
(110, 'Mcxy BY', 'Mcxy UA', 'Mcxy EN', 'Mcxy RU'),
(111, 'mLI4 BY', 'mLI4 UA', 'mLI4 EN', 'mLI4 RU'),
(112, 'Dkm3 BY', 'Dkm3 UA', 'Dkm3 EN', 'Dkm3 RU');

-- --------------------------------------------------------

--
-- Структура таблиці `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `warehouses`
--

INSERT IGNORE INTO `warehouses` (`id`, `name`, `locations`) VALUES
(41, 'Warehouse 0', 'Location 11'),
(42, 'Warehouse 1', 'Location 20'),
(43, 'Warehouse 2', 'Location 16'),
(44, 'Warehouse 3', 'Location 10'),
(45, 'Warehouse 4', 'Location 7'),
(46, 'Warehouse 5', 'Location 25'),
(47, 'Warehouse 6', 'Location 4'),
(48, 'Warehouse 7', 'Location 20'),
(49, 'Warehouse 8', 'Location 40'),
(50, 'Warehouse 9', 'Location 22'),
(51, 'Warehouse 10', 'Location 8'),
(52, 'Warehouse 11', 'Location 8'),
(53, 'Warehouse 12', 'Location 28'),
(54, 'Warehouse 13', 'Location 40'),
(55, 'Warehouse 14', 'Location 7'),
(56, 'Warehouse 15', 'Location 32'),
(57, 'Warehouse 16', 'Location 36'),
(58, 'Warehouse 17', 'Location 40'),
(59, 'Warehouse 18', 'Location 13'),
(60, 'Warehouse 19', 'Location 20');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B767B3B43D` (`users_id`),
  ADD KEY `fk_cart_goods1_idx` (`goods_id`);

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7F07C501B7683595` (`goods_id`),
  ADD KEY `IDX_7F07C50167B3B43D` (`users_id`);

--
-- Індекси таблиці `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `filters_to_categories`
--
ALTER TABLE `filters_to_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filter1_idx` (`filter_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Індекси таблиці `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_goods_categories1_idx` (`categories_id`);

--
-- Індекси таблиці `goods_to_filters`
--
ALTER TABLE `goods_to_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_good1_idx` (`good_id`),
  ADD KEY `fk_filter_id` (`filter_id`),
  ADD KEY `fk_value_id` (`value_id`);

--
-- Індекси таблиці `goods_to_warehouses`
--
ALTER TABLE `goods_to_warehouses`
  ADD PRIMARY KEY (`idgoods_to_warehouses`),
  ADD KEY `fk_goods_to_warehouses_goods1_idx` (`goods_id`),
  ADD KEY `fk_goods_to_warehouses_warehouses1_idx` (`warehouses_id`);

--
-- Індекси таблиці `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEE6956883F` (`currency`),
  ADD KEY `orders_ibfk_1` (`users_id`),
  ADD KEY `fk_orders_st_fk_1` (`status`);

--
-- Індекси таблиці `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_goods1` (`goods_id`),
  ADD KEY `fk_orders_product_ibfk_1` (`orders_id`);

--
-- Індекси таблиці `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1483A5E96F12B871` (`default_currency`);

--
-- Індекси таблиці `user_to_currencies`
--
ALTER TABLE `user_to_currencies`
  ADD PRIMARY KEY (`currencies_id`,`users_id`),
  ADD KEY `IDX_FE7909BEA33E2D84` (`currencies_id`),
  ADD KEY `IDX_FE7909BE67B3B43D` (`users_id`);

--
-- Індекси таблиці `valueses`
--
ALTER TABLE `valueses`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблиці `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблиці `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;
--
-- AUTO_INCREMENT для таблиці `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT для таблиці `filters_to_categories`
--
ALTER TABLE `filters_to_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT для таблиці `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT для таблиці `goods_to_filters`
--
ALTER TABLE `goods_to_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;
--
-- AUTO_INCREMENT для таблиці `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT для таблиці `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;
--
-- AUTO_INCREMENT для таблиці `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблиці `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблиці `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблиці `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B767B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_BA388B7B7683595` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `FK_7F07C50167B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_7F07C501B7683595` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `filters_to_categories`
--
ALTER TABLE `filters_to_categories`
  ADD CONSTRAINT `FK_E1AA7C4912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_E1AA7C49D395B25E` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `FK_563B92DA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `goods_to_filters`
--
ALTER TABLE `goods_to_filters`
  ADD CONSTRAINT `FK_87417B261CF98C70` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  ADD CONSTRAINT `FK_87417B26D395B25E` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`),
  ADD CONSTRAINT `FK_87417B26F920BBA2` FOREIGN KEY (`value_id`) REFERENCES `valueses` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `goods_to_warehouses`
--
ALTER TABLE `goods_to_warehouses`
  ADD CONSTRAINT `FK_5309B80D864AC21A` FOREIGN KEY (`warehouses_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `FK_5309B80DB7683595` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE6956883F` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE7B00651C` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `FK_223F76D6B7683595` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  ADD CONSTRAINT `FK_223F76D6CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_1483A5E96F12B871` FOREIGN KEY (`default_currency`) REFERENCES `currencies` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `user_to_currencies`
--
ALTER TABLE `user_to_currencies`
  ADD CONSTRAINT `FK_FE7909BE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_FE7909BEA33E2D84` FOREIGN KEY (`currencies_id`) REFERENCES `currencies` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
