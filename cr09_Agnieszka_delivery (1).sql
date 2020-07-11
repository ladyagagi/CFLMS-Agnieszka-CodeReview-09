-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Jul 2020 um 14:10
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_Agnieszka_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_Agnieszka_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_Agnieszka_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

CREATE TABLE `city` (
  `zipcode` int(11) NOT NULL,
  `name` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `city`
--

INSERT INTO `city` (`zipcode`, `name`) VALUES
(1010, 'Vienna'),
(5020, 'Salzburg'),
(6020, 'Innsbruck'),
(7000, 'Eisenstadt'),
(8010, 'Graz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dofPReciever`
--

CREATE TABLE `dofPReciever` (
  `fk_reciever_id` int(11) DEFAULT NULL,
  `fk_dofP_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dropOffPoint`
--

CREATE TABLE `dropOffPoint` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `dropOffPoint`
--

INSERT INTO `dropOffPoint` (`id`, `name`) VALUES
(1, 'point1'),
(2, 'point2'),
(3, 'point3'),
(4, 'point4'),
(5, 'point5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`id`, `name`) VALUES
(1, 'employee1'),
(2, 'employee2'),
(3, 'employee3'),
(4, 'employee4'),
(5, 'employee5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employeePackages`
--

CREATE TABLE `employeePackages` (
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `fk_sender_id` int(11) NOT NULL,
  `fk_reciever_id` int(11) NOT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_dofP_id` int(11) NOT NULL,
  `sendTimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deliveredTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pickupTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`id`, `fk_sender_id`, `fk_reciever_id`, `fk_employee_id`, `fk_dofP_id`, `sendTimestamp`, `deliveredTimestamp`, `pickupTimestamp`) VALUES
(1, 1, 3, 4, 4, '2020-04-05 10:19:54', '2020-04-07 17:30:05', '2020-04-13 09:18:05'),
(2, 1, 4, 2, 4, '2020-02-11 10:19:54', '2020-02-07 17:30:05', '2020-02-10 09:18:05'),
(3, 3, 1, 3, 1, '2020-04-29 10:10:54', '2020-04-30 18:30:05', '2020-05-06 09:00:05'),
(4, 2, 2, 3, 2, '2020-06-05 10:19:54', '2020-06-07 17:30:05', '2020-06-13 09:18:05'),
(5, 3, 5, 3, 3, '2020-06-09 10:19:54', '2020-06-15 17:30:05', '2020-06-19 09:18:05'),
(6, 1, 5, 5, 3, '2020-06-21 10:19:54', '2020-06-24 17:30:05', '2020-06-30 09:18:05');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reciever`
--

CREATE TABLE `reciever` (
  `id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `fk_zipcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reciever`
--

INSERT INTO `reciever` (`id`, `name`, `fk_zipcode`) VALUES
(1, 'reciever1', 1010),
(2, 'reciever2', 8010),
(3, 'reciever3', 7000),
(4, 'reciever4', 8010),
(5, 'reciever5', 1010);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recieverPackages`
--

CREATE TABLE `recieverPackages` (
  `fk_reciever_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `fk_zipcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sender`
--

INSERT INTO `sender` (`id`, `name`, `fk_zipcode`) VALUES
(1, 'sender1', 1010),
(2, 'sender2', 5020),
(3, 'sender3', 7000),
(4, 'sender4', 6020),
(5, 'sender5', 1010),
(6, 'sender6', 6020);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `senderPackages`
--

CREATE TABLE `senderPackages` (
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`zipcode`);

--
-- Indizes für die Tabelle `dofPReciever`
--
ALTER TABLE `dofPReciever`
  ADD KEY `fk_reciever_id` (`fk_reciever_id`),
  ADD KEY `fk_dofP_id` (`fk_dofP_id`);

--
-- Indizes für die Tabelle `dropOffPoint`
--
ALTER TABLE `dropOffPoint`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `employeePackages`
--
ALTER TABLE `employeePackages`
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_reciever_id` (`fk_reciever_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `reciever`
--
ALTER TABLE `reciever`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zipcode` (`fk_zipcode`);

--
-- Indizes für die Tabelle `recieverPackages`
--
ALTER TABLE `recieverPackages`
  ADD KEY `fk_reciever_id` (`fk_reciever_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zipcode` (`fk_zipcode`);

--
-- Indizes für die Tabelle `senderPackages`
--
ALTER TABLE `senderPackages`
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `dofPReciever`
--
ALTER TABLE `dofPReciever`
  ADD CONSTRAINT `dofPReciever_ibfk_1` FOREIGN KEY (`fk_reciever_id`) REFERENCES `reciever` (`id`),
  ADD CONSTRAINT `dofPReciever_ibfk_2` FOREIGN KEY (`fk_dofP_id`) REFERENCES `dropOffPoint` (`id`);

--
-- Constraints der Tabelle `employeePackages`
--
ALTER TABLE `employeePackages`
  ADD CONSTRAINT `employeePackages_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employeePackages_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`id`);

--
-- Constraints der Tabelle `reciever`
--
ALTER TABLE `reciever`
  ADD CONSTRAINT `reciever_ibfk_1` FOREIGN KEY (`fk_zipcode`) REFERENCES `city` (`zipcode`);

--
-- Constraints der Tabelle `recieverPackages`
--
ALTER TABLE `recieverPackages`
  ADD CONSTRAINT `recieverPackages_ibfk_1` FOREIGN KEY (`fk_reciever_id`) REFERENCES `reciever` (`id`),
  ADD CONSTRAINT `recieverPackages_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`id`);

--
-- Constraints der Tabelle `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_zipcode`) REFERENCES `city` (`zipcode`);

--
-- Constraints der Tabelle `senderPackages`
--
ALTER TABLE `senderPackages`
  ADD CONSTRAINT `senderPackages_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`id`),
  ADD CONSTRAINT `senderPackages_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
