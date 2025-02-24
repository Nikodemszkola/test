-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Gru 2024, 14:56
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `baza`
--
DROP DATABASE IF EXISTS `baza`;
CREATE DATABASE IF NOT EXISTS `baza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `baza`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `budynki`
--

DROP TABLE IF EXISTS `budynki`;
CREATE TABLE IF NOT EXISTS `budynki` (
  `id` int(11) NOT NULL,
  `nazwa_budynku` text DEFAULT NULL,
  `adres` text NOT NULL,
  `przeznaczenie` text DEFAULT 'Budynek Gospodarczy',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nazwa_budynku` (`nazwa_budynku`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `maszyny`
--

DROP TABLE IF EXISTS `maszyny`;
CREATE TABLE IF NOT EXISTS `maszyny` (
  `Idmaszyny` int(11) NOT NULL AUTO_INCREMENT,
  `Czy_dostepna` tinyint(1) DEFAULT NULL,
  `Typ` varchar(100) DEFAULT NULL,
  `Przeznaczenie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idmaszyny`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `maszyny`
--

INSERT INTO `maszyny` (`Idmaszyny`, `Czy_dostepna`, `Typ`, `Przeznaczenie`) VALUES
(1, 0, 'Kombajn', 'Zbieranie zboz'),
(2, 1, 'Traktor', 'Prace polowe'),
(3, 0, 'Kombajn zbozowy', 'Zbior zboza'),
(4, 1, 'Traktor rolniczy', 'Transport i orka'),
(5, 0, 'Kombajn do burakow', 'Zbior burakow'),
(6, 1, 'Traktor terenowy', 'Prace w trudnym terenie'),
(7, 0, 'Kombajn do kukurydzy', 'Zbior kukurydzy'),
(8, 1, 'Traktor specjalistyczny', 'Obsluga maszyn rolniczych'),
(9, 0, 'Kombajn uniwersalny', 'Zbior roznych roslin'),
(10, 1, 'Traktor z ladowaczem', 'Ladowanie i transport materialow');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nowa_tabela`
--

DROP TABLE IF EXISTS `nowa_tabela`;
CREATE TABLE IF NOT EXISTS `nowa_tabela` (
  `kolumna1` int(11) NOT NULL,
  `kolumna2` int(11) DEFAULT NULL,
  `kolumna3` int(11) DEFAULT NULL,
  PRIMARY KEY (`kolumna1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `nowa_tabela`
--

INSERT INTO `nowa_tabela` (`kolumna1`, `kolumna2`, `kolumna3`) VALUES
(1, 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nowa_tabela2`
--

DROP TABLE IF EXISTS `nowa_tabela2`;
CREATE TABLE IF NOT EXISTS `nowa_tabela2` (
  `Kolumna1` int(11) NOT NULL,
  `Komulna4` varchar(255) NOT NULL,
  `Kolumna5` varchar(255) DEFAULT NULL,
  `Kolumna6` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kolumna1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `nowa_tabela2`
--

INSERT INTO `nowa_tabela2` (`Kolumna1`, `Komulna4`, `Kolumna5`, `Kolumna6`) VALUES
(2, '4', '6', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pola`
--

DROP TABLE IF EXISTS `pola`;
CREATE TABLE IF NOT EXISTS `pola` (
  `Idpola` int(11) NOT NULL AUTO_INCREMENT,
  `Rozmiar_ha` int(11) DEFAULT NULL,
  `Rodzaj_gleby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idpola`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pola`
--

INSERT INTO `pola` (`Idpola`, `Rozmiar_ha`, `Rodzaj_gleby`) VALUES
(1, 10, ' Gleba czarnoziem'),
(2, 5, 'Gleba mad'),
(3, 8, 'Gleba bielicowa'),
(4, 12, 'Gleba brunatna'),
(5, 15, 'Gleba czarnoziem'),
(6, 7, 'Gleba torfowa'),
(7, 20, 'Gleba bielicowa'),
(8, 9, 'Gleba bielicowa'),
(9, 11, 'Gleba czarnoziem'),
(10, 14, 'Gleba brunatna'),
(11, 13, 'Gleba czarnoziem'),
(12, 6, 'Gleba mad'),
(13, 9, 'Gleba bielicowa'),
(14, 11, 'Gleba brunatna'),
(15, 16, 'Gleba czarnoziem'),
(16, 8, 'Gleba torfowa'),
(17, 18, 'Gleba bielicowa'),
(18, 10, 'Gleba bielicowa'),
(19, 12, 'Gleba czarnoziem'),
(20, 17, 'Gleba brunatna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozywienie`
--

DROP TABLE IF EXISTS `pozywienie`;
CREATE TABLE IF NOT EXISTS `pozywienie` (
  `Idzagrody` int(11) NOT NULL,
  `Idrolnika` int(11) NOT NULL,
  `Typ_pozywienia` varchar(100) DEFAULT NULL,
  `DataGodzinaKarmienia` date DEFAULT NULL,
  PRIMARY KEY (`Idzagrody`,`Idrolnika`),
  KEY `Idrolnika` (`Idrolnika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pozywienie`
--

INSERT INTO `pozywienie` (`Idzagrody`, `Idrolnika`, `Typ_pozywienia`, `DataGodzinaKarmienia`) VALUES
(1, 3, 'Marchew', '2023-10-04'),
(1, 5, 'Ziemniak', '2023-10-01'),
(2, 4, 'Kukurydza', '2023-10-20'),
(2, 8, 'Kukurydza', '2023-10-08'),
(3, 1, 'Jablko', '2023-10-11'),
(3, 9, 'Jablko', '2023-10-24'),
(4, 2, 'Ziemniak', '2023-10-27'),
(4, 10, 'Ziemniak', '2023-10-14'),
(5, 6, 'Marchew', '2023-10-18'),
(5, 7, 'Marchew', '2023-10-30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

DROP TABLE IF EXISTS `produkty`;
CREATE TABLE IF NOT EXISTS `produkty` (
  `IdProdukty` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) DEFAULT NULL,
  `Odmiana` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdProdukty`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`IdProdukty`, `Nazwa`, `Odmiana`) VALUES
(1, 'Jablko', 'Golden Delicious'),
(2, 'Jablko', 'Granny Smith'),
(3, 'Ziemniak', 'Irga'),
(4, 'Ziemniak', 'Vineta'),
(5, 'Marchew', 'Nantes'),
(6, 'Siano', 'Lakowe'),
(7, 'Siano', 'Gorskie'),
(8, 'Pszenica', 'Ozima'),
(9, 'Zyto', 'Daniowskie Zlote'),
(10, 'Kukurydza', 'Pioneer');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rolnicy`
--

DROP TABLE IF EXISTS `rolnicy`;
CREATE TABLE IF NOT EXISTS `rolnicy` (
  `Idrolnika` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(100) DEFAULT NULL,
  `Nazwisko` varchar(200) DEFAULT NULL,
  `Pesel` char(11) NOT NULL,
  PRIMARY KEY (`Idrolnika`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rolnicy`
--

INSERT INTO `rolnicy` (`Idrolnika`, `Imie`, `Nazwisko`, `Pesel`) VALUES
(1, 'Nikodem', 'Tomczuk', '12345678912'),
(2, 'Jan', 'Kowalski', '12348553016'),
(3, 'Piotr', 'Wisniewski', '75062709876'),
(4, 'Maria', 'Lis', '69030245678'),
(5, 'Adam', 'Jankowski', '84121234567'),
(6, 'Ewa', 'Kaczmarek', '92052076543'),
(7, 'Krzysztof', 'Zajac', '80070623456'),
(8, 'Magdalena', 'Szymanska', '88053187654'),
(9, 'Tomasz', 'Wozniak', '73021578901'),
(10, 'Karolina', 'Dabrowska', '91070765432');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rolnicy2`
--

DROP TABLE IF EXISTS `rolnicy2`;
CREATE TABLE IF NOT EXISTS `rolnicy2` (
  `idrolnika` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `pesel` char(11) DEFAULT NULL,
  PRIMARY KEY (`idrolnika`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rolnicy2`
--

INSERT INTO `rolnicy2` (`idrolnika`, `imie`, `nazwisko`, `pesel`) VALUES
(1, 'Jan', 'Kowalski', '12345678901'),
(2, 'Anna', 'Nowak', '23456789012'),
(3, 'Piotr', 'Wiśniewski', '34567890123'),
(4, 'Maria', 'Wójcik', '45678901234'),
(5, 'Krzysztof', 'Kowalczyk', '56789012345'),
(6, 'Agnieszka', 'Kamińska', '67890123456'),
(7, 'Tomasz', 'Lewandowski', '78901234567'),
(8, 'Katarzyna', 'Zielińska', '89012345678'),
(9, 'Michał', 'Szymański', '90123456789'),
(10, 'Ewa', 'Woźniak', '01234567890');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegolyupraw`
--

DROP TABLE IF EXISTS `szczegolyupraw`;
CREATE TABLE IF NOT EXISTS `szczegolyupraw` (
  `Iduprawy` int(11) NOT NULL,
  `IdRolnika` int(11) NOT NULL,
  `IdMaszyny` int(11) DEFAULT NULL,
  `Czynnosc` varchar(100) DEFAULT NULL,
  `DataWykonaniaCzynosci` date DEFAULT NULL,
  PRIMARY KEY (`Iduprawy`,`IdRolnika`),
  KEY `IdRolnika` (`IdRolnika`),
  KEY `IdMaszyny` (`IdMaszyny`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `szczegolyupraw`
--

INSERT INTO `szczegolyupraw` (`Iduprawy`, `IdRolnika`, `IdMaszyny`, `Czynnosc`, `DataWykonaniaCzynosci`) VALUES
(1, 6, 5, 'Nawozenie', '2023-10-10'),
(2, 1, 4, 'Mieszanie gleb', '2023-10-06'),
(3, 4, 7, 'Siew', '2023-10-03'),
(4, 5, 9, 'Zwalczanie szkodnikow', '2023-10-01'),
(5, 8, 3, 'Odmrazanie', '2023-10-02'),
(6, 8, 10, 'Podlewanie', '2023-10-21'),
(7, 9, 6, 'Mieszanie gleb', '2023-10-24'),
(8, 5, 1, 'Zwalczanie chwastow', '2023-10-15'),
(9, 4, 1, 'Zwalczanie chwastow', '2023-10-19'),
(10, 6, 5, 'Nawozenie', '2023-10-09'),
(11, 2, 8, 'Zbiory', '2023-10-16'),
(12, 2, 10, 'Podlewanie', '2023-10-25'),
(13, 6, 9, 'Zwalczanie szkodnikow', '2023-10-17'),
(14, 4, 5, 'Pielegnacja', '2023-10-13'),
(15, 1, 3, 'Zwalczanie chwastow', '2023-10-12'),
(16, 7, 3, 'Zbiory mechaniczne', '2023-10-07'),
(17, 10, 1, 'Nawozenie', '2023-10-22'),
(18, 2, 3, 'Zbiory', '2023-10-08'),
(19, 3, 2, 'Odmrazanie', '2023-10-18'),
(20, 7, 8, 'Siew', '2023-10-04'),
(21, 3, 9, 'Zbiory', '2023-10-23'),
(22, 10, 7, 'Pielegnacja', '2023-10-20'),
(23, 5, 2, 'Siew', '2023-10-05'),
(24, 9, 6, 'Zwalczanie chwastow', '2023-10-11'),
(25, 10, 4, 'Zwalczanie szkodnikow', '2023-10-26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uprawy`
--

DROP TABLE IF EXISTS `uprawy`;
CREATE TABLE IF NOT EXISTS `uprawy` (
  `Iduprawy` int(11) NOT NULL AUTO_INCREMENT,
  `Idpola` int(11) DEFAULT NULL,
  `IdProduktu` int(11) DEFAULT NULL,
  PRIMARY KEY (`Iduprawy`),
  KEY `Idpola` (`Idpola`),
  KEY `IdProduktu` (`IdProduktu`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `uprawy`
--

INSERT INTO `uprawy` (`Iduprawy`, `Idpola`, `IdProduktu`) VALUES
(1, 1, 3),
(2, 2, 7),
(3, 3, 1),
(4, 4, 5),
(5, 5, 9),
(6, 6, 2),
(7, 7, 4),
(8, 8, 6),
(9, 9, 8),
(10, 10, 10),
(11, 1, 3),
(12, 2, 7),
(13, 3, 1),
(14, 4, 5),
(15, 5, 9),
(16, 6, 2),
(17, 7, 4),
(18, 8, 6),
(19, 9, 8),
(20, 10, 10),
(21, 1, 3),
(22, 2, 7),
(23, 3, 1),
(24, 4, 5),
(25, 5, 9),
(26, 6, 2),
(27, 7, 4),
(28, 8, 6),
(29, 9, 8),
(30, 10, 10),
(31, 11, 10),
(32, 12, 1),
(33, 13, 4),
(34, 14, 7),
(35, 15, 9),
(36, 16, 3),
(37, 17, 2),
(38, 18, 5),
(39, 19, 6),
(40, 20, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciele`
--

DROP TABLE IF EXISTS `wlasciciele`;
CREATE TABLE IF NOT EXISTS `wlasciciele` (
  `Idrolnika` int(11) NOT NULL,
  `IdPola` int(11) NOT NULL,
  `UdzialProcentowy` float DEFAULT NULL,
  PRIMARY KEY (`Idrolnika`,`IdPola`),
  KEY `IdPola` (`IdPola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `wlasciciele`
--

INSERT INTO `wlasciciele` (`Idrolnika`, `IdPola`, `UdzialProcentowy`) VALUES
(1, 5, 10),
(2, 4, 15),
(3, 7, 40),
(4, 9, 40),
(5, 1, 25),
(6, 8, 25),
(7, 2, 30),
(8, 6, 35),
(9, 3, 40),
(10, 10, 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zagroda`
--

DROP TABLE IF EXISTS `zagroda`;
CREATE TABLE IF NOT EXISTS `zagroda` (
  `Idzagrody` int(11) NOT NULL AUTO_INCREMENT,
  `Idrolnika` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idzagrody`),
  KEY `Idrolnika` (`Idrolnika`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `zagroda`
--

INSERT INTO `zagroda` (`Idzagrody`, `Idrolnika`) VALUES
(1, 1),
(5, 2),
(2, 3),
(3, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwierzeta`
--

DROP TABLE IF EXISTS `zwierzeta`;
CREATE TABLE IF NOT EXISTS `zwierzeta` (
  `Idzwierzecia` int(11) NOT NULL AUTO_INCREMENT,
  `IdZagrody` int(11) DEFAULT NULL,
  `Gatunek` varchar(100) DEFAULT NULL,
  `Rasa` varchar(100) DEFAULT NULL,
  `Waga_kg` float DEFAULT NULL,
  `Plec` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Idzwierzecia`),
  KEY `IdZagrody` (`IdZagrody`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `zwierzeta`
--

INSERT INTO `zwierzeta` (`Idzwierzecia`, `IdZagrody`, `Gatunek`, `Rasa`, `Waga_kg`, `Plec`) VALUES
(25, 1, 'Swinia', 'Polska Biala Zwisloucha', 120, 'K'),
(26, 1, 'Swinia', 'Polska Biala Zwisloucha', 130, 'M'),
(27, 1, 'Swinia', 'Polska Biala Zwisloucha', 115, 'K'),
(28, 1, 'Swinia', 'Duroc', 140, 'M'),
(29, 1, 'Swinia', 'Duroc', 135, 'K'),
(30, 1, 'Swinia', 'Duroc', 138, 'M'),
(31, 2, 'Krowa', 'Holsztynsko-Fryzyjska', 600, 'K'),
(32, 2, 'Krowa', 'Holsztynsko-Fryzyjska', 650, 'M'),
(33, 2, 'Krowa', 'Holsztynsko-Fryzyjska', 620, 'K'),
(34, 2, 'Krowa', 'Jersey', 450, 'K'),
(35, 2, 'Krowa', 'Jersey', 470, 'M'),
(36, 2, 'Krowa', 'Jersey', 460, 'K'),
(37, 3, 'Owca', 'Merynos', 70, 'K'),
(38, 3, 'Owca', 'Merynos', 75, 'M'),
(39, 3, 'Owca', 'Merynos', 68, 'K'),
(40, 3, 'Owca', 'Suffolk', 80, 'K'),
(41, 3, 'Owca', 'Suffolk', 85, 'M'),
(42, 3, 'Owca', 'Suffolk', 82, 'K'),
(43, 4, 'Kon', 'Arab', 500, 'K'),
(44, 4, 'Kon', 'Arab', 520, 'M'),
(45, 4, 'Kon', 'Arab', 510, 'K'),
(46, 5, 'Kurczak', 'Leghorn', 2, 'K'),
(47, 5, 'Kurczak', 'Leghorn', 2.5, 'M'),
(48, 5, 'Kurczak', 'Leghorn', 2.2, 'K');

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pozywienie`
--
ALTER TABLE `pozywienie`
  ADD CONSTRAINT `pozywienie_ibfk_1` FOREIGN KEY (`Idrolnika`) REFERENCES `rolnicy` (`Idrolnika`),
  ADD CONSTRAINT `pozywienie_ibfk_2` FOREIGN KEY (`Idzagrody`) REFERENCES `zagroda` (`Idzagrody`);

--
-- Ograniczenia dla tabeli `szczegolyupraw`
--
ALTER TABLE `szczegolyupraw`
  ADD CONSTRAINT `szczegolyupraw_ibfk_1` FOREIGN KEY (`IdRolnika`) REFERENCES `rolnicy` (`Idrolnika`),
  ADD CONSTRAINT `szczegolyupraw_ibfk_2` FOREIGN KEY (`Iduprawy`) REFERENCES `uprawy` (`Iduprawy`),
  ADD CONSTRAINT `szczegolyupraw_ibfk_3` FOREIGN KEY (`IdMaszyny`) REFERENCES `maszyny` (`Idmaszyny`);

--
-- Ograniczenia dla tabeli `uprawy`
--
ALTER TABLE `uprawy`
  ADD CONSTRAINT `uprawy_ibfk_1` FOREIGN KEY (`Idpola`) REFERENCES `pola` (`Idpola`),
  ADD CONSTRAINT `uprawy_ibfk_2` FOREIGN KEY (`IdProduktu`) REFERENCES `produkty` (`IdProdukty`);

--
-- Ograniczenia dla tabeli `wlasciciele`
--
ALTER TABLE `wlasciciele`
  ADD CONSTRAINT `wlasciciele_ibfk_1` FOREIGN KEY (`Idrolnika`) REFERENCES `rolnicy` (`Idrolnika`),
  ADD CONSTRAINT `wlasciciele_ibfk_2` FOREIGN KEY (`IdPola`) REFERENCES `pola` (`Idpola`);

--
-- Ograniczenia dla tabeli `zagroda`
--
ALTER TABLE `zagroda`
  ADD CONSTRAINT `zagroda_ibfk_1` FOREIGN KEY (`Idrolnika`) REFERENCES `rolnicy` (`Idrolnika`);

--
-- Ograniczenia dla tabeli `zwierzeta`
--
ALTER TABLE `zwierzeta`
  ADD CONSTRAINT `zwierzeta_ibfk_1` FOREIGN KEY (`IdZagrody`) REFERENCES `zagroda` (`Idzagrody`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
