-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mai 2018 um 17:28
-- Server-Version: 10.1.31-MariaDB
-- PHP-Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `vokabeltrainer`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `attributes`
--

CREATE TABLE `attributes` (
  `attribute_id` int(11) NOT NULL,
  `concept_number` int(11) NOT NULL,
  `term_number` int(11) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `attribute_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `concepts`
--

CREATE TABLE `concepts` (
  `concept_id` int(11) NOT NULL,
  `term_number` int(11) NOT NULL,
  `attribute_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `domains`
--

CREATE TABLE `domains` (
  `domain_id` int(11) NOT NULL,
  `domain_name` varchar(50) NOT NULL,
  `domain_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `domains`
--

INSERT INTO `domains` (`domain_id`, `domain_name`, `domain_value`) VALUES
(1, 'NO DOMAIN', '00'),
(2, 'POLITICS', '04'),
(3, 'political framework', '0406'),
(4, 'political party', '0411'),
(5, 'electoral procedure and voting', '0416'),
(6, 'parliament', '0421'),
(7, 'parliamentary proceedings', '0426'),
(8, 'politics and public safety', '0431'),
(9, 'executive power and public service', '0436'),
(10, 'INTERNATIONAL RELATIONS', '08'),
(11, 'international affairs', '0806'),
(12, 'cooperation policy', '0811'),
(13, 'international balance', '0816'),
(14, 'defence', '0821'),
(15, 'EUROPEAN UNION', '10'),
(16, 'EU institutions and European civil service', '1006'),
(17, 'European Union law', '1011'),
(18, 'European construction', '1016'),
(19, 'EU finance', '1021'),
(20, 'LAW', '12'),
(21, 'sources and branches of the law', '1206'),
(22, 'civil law', '1211'),
(23, 'criminal law', '1216'),
(24, 'justice', '1221'),
(25, 'organisation of the legal system', '1226'),
(26, 'international law', '1231'),
(27, 'rights and freedoms', '1236'),
(28, 'ECONOMICS', '16'),
(29, 'economic policy', '1606'),
(30, 'economic conditions', '1611'),
(31, 'regions and regional policy', '1616'),
(32, 'economic structure', '1621'),
(33, 'national accounts', '1626'),
(34, 'economic analysis', '1631'),
(35, 'TRADE', '20'),
(36, 'trade policy', '2006'),
(37, 'tariff policy', '2011'),
(38, 'trade', '2016'),
(39, 'international trade', '2021'),
(40, 'consumption', '2026'),
(41, 'marketing', '2031'),
(42, 'distributive trades', '2036'),
(43, 'FINANCE', '24'),
(44, 'monetary relations', '2406'),
(45, 'monetary economics', '2411'),
(46, 'financial institutions and credit', '2416'),
(47, 'free movement of capital', '2421'),
(48, 'financing and investment', '2426'),
(49, 'insurance', '2431'),
(50, 'public finance and budget policy', '2436'),
(51, 'budget', '2441'),
(52, 'taxation', '2446'),
(53, 'prices', '2451'),
(54, 'SOCIAL QUESTIONS', '28'),
(55, 'family', '2806'),
(56, 'migration', '2811'),
(57, 'demography and population', '2816'),
(58, 'social framework', '2821'),
(59, 'social affairs', '2826'),
(60, 'culture and religion', '2831'),
(61, 'social protection', '2836'),
(62, 'health', '2841'),
(63, 'construction and town planning', '2846'),
(64, 'EDUCATION AND COMMUNICATIONS', '32'),
(65, 'education', '3206'),
(66, 'teaching', '3211'),
(67, 'organisation of teaching', '3216'),
(68, 'documentation', '3221'),
(69, 'communications', '3226'),
(70, 'information and information processing', '3231'),
(71, 'information technology and data processing', '3236'),
(72, 'SCIENCE', '36'),
(73, 'natural and applied sciences', '3606'),
(74, 'humanities', '3611'),
(75, 'BUSINESS AND COMPETITION', '40'),
(76, 'business organisation', '4006'),
(77, 'business classification', '4011'),
(78, 'legal form of organisations', '4016'),
(79, 'management', '4021'),
(80, 'accounting', '4026'),
(81, 'competition', '4031'),
(82, 'EMPLOYMENT AND WORKING CONDITIONS', '44'),
(83, 'employment', '4406'),
(84, 'labour market', '4411'),
(85, 'organisation of work and working conditions', '4416'),
(86, 'personnel management and staff remuneration', '4421'),
(87, 'labour law and labour relations', '4426'),
(88, 'TRANSPORT', '48'),
(89, 'transport policy', '4806'),
(90, 'organisation of transport', '4811'),
(91, 'land transport', '4816'),
(92, 'maritime and inland waterway transport', '4821'),
(93, 'air and space transport', '4826'),
(94, 'ENVIRONMENT', '52'),
(95, 'environmental policy', '5206'),
(96, 'natural environment', '5211'),
(97, 'deterioration of the environment', '5216'),
(98, 'AGRICULTURE, FORESTRY AND FISHERIES', '56'),
(99, 'agricultural policy', '5606'),
(100, 'agricultural structures and production', '5611'),
(101, 'farming systems', '5616'),
(102, 'cultivation of agricultural land', '5621'),
(103, 'means of agricultural production', '5626'),
(104, 'agricultural activity', '5631'),
(105, 'forestry', '5636'),
(106, 'fisheries', '5641'),
(107, 'AGRI-FOODSTUFFS', '60'),
(108, 'plant product', '6006'),
(109, 'animal product', '6011'),
(110, 'processed agricultural produce', '6016'),
(111, 'beverages and sugar', '6021'),
(112, 'foodstuff', '6026'),
(113, 'agri-foodstuffs', '6031'),
(114, 'food technology', '6036'),
(115, 'PRODUCTION, TECHNOLOGY AND RESEARCH', '64'),
(116, 'production', '6406'),
(117, 'technology and technical regulations', '6411'),
(118, 'research and intellectual property', '6416'),
(119, 'ENERGY', '66'),
(120, 'energy policy', '6606'),
(121, 'coal and mining industries', '6611'),
(122, 'oil industry', '6616'),
(123, 'electrical and nuclear industries', '6621'),
(124, 'soft energy', '6626'),
(125, 'INDUSTRY', '68'),
(126, 'industrial structures and policy', '6806'),
(127, 'chemistry', '6811'),
(128, 'iron, steel and other metal industries', '6816'),
(129, 'mechanical engineering', '6821'),
(130, 'electronics and electrical engineering', '6826'),
(131, 'building and public works', '6831'),
(132, 'wood industry', '6836'),
(133, 'leather and textile industries', '6841'),
(134, 'miscellaneous industries', '6846'),
(135, 'GEOGRAPHY', '72'),
(136, 'Europe', '7206'),
(137, 'regions of EU Member States', '7211'),
(138, 'America', '7216'),
(139, 'Africa', '7221'),
(140, 'Asia and Oceania', '7226'),
(141, 'economic geography', '7231'),
(142, 'political geography', '7236'),
(143, 'overseas countries and territories', '7241'),
(144, 'INTERNATIONAL ORGANISATIONS', '76'),
(145, 'United Nations', '7606'),
(146, 'European organisations', '7611'),
(147, 'extra-European organisations', '7616'),
(148, 'world organisations', '7621'),
(149, 'non-governmental organisations', '7626');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_pretty` varchar(50) NOT NULL,
  `language_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `languages`
--

INSERT INTO `languages` (`language_id`, `language_pretty`, `language_code`) VALUES
(1, 'English', 'en'),
(2, 'Bulgarian', 'bg'),
(3, 'Croatian', 'hr'),
(4, 'Czech', 'cs'),
(5, 'Danish', 'da'),
(6, 'German', 'de'),
(7, 'Greek', 'el'),
(8, 'Spanish', 'es'),
(9, 'Estonian', 'et'),
(10, 'Finnish', 'fi'),
(11, 'French', 'fr'),
(12, 'Irish', 'ga'),
(13, 'Italian', 'it'),
(14, 'Hungarian', 'hu'),
(15, 'Lithuanian', 'lt'),
(16, 'Latvian', 'lv'),
(17, 'Maltese', 'mt'),
(18, 'Dutch', 'nl'),
(19, 'Polish', 'pl'),
(20, 'Portuguese', 'pt'),
(21, 'Romanian', 'ro'),
(22, 'Slovak', 'sk'),
(23, 'Slovene', 'sl'),
(24, 'Swedish', 'sv'),
(25, 'Latin', 'la'),
(26, 'Multilingu', 'mul');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `terms`
--

CREATE TABLE `terms` (
  `term_id` int(11) NOT NULL,
  `concept_number` int(11) NOT NULL,
  `term_value` varchar(1000) NOT NULL,
  `language_code_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indizes für die Tabelle `concepts`
--
ALTER TABLE `concepts`
  ADD PRIMARY KEY (`concept_id`);

--
-- Indizes für die Tabelle `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `idx_terms_concept_number` (`concept_number`),
  ADD KEY `idx_terms_term_value` (`term_value`(255));

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `attributes`
--
ALTER TABLE `attributes`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326636;

--
-- AUTO_INCREMENT für Tabelle `concepts`
--
ALTER TABLE `concepts`
  MODIFY `concept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19481;

--
-- AUTO_INCREMENT für Tabelle `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297551;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
