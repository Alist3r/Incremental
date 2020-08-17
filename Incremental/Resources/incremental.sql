-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 15, 2019 alle 12:19
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `incremental`
--
CREATE DATABASE IF NOT EXISTS `incremental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `incremental`;

-- --------------------------------------------------------

--
-- Struttura della tabella `defstatsutente`
--

DROP TABLE IF EXISTS `defstatsutente`;
CREATE TABLE `defstatsutente` (
  `idUtente` int(11) DEFAULT NULL,
  `idStatsbase` int(11) DEFAULT NULL,
  `valoreBase` int(11) DEFAULT NULL,
  `valoreAttuale` int(11) DEFAULT NULL,
  `bonusEquip` int(11) DEFAULT '0',
  `bonusVirtus` int(11) DEFAULT '0',
  `bonusAbilita` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `defstatsutente`
--

INSERT INTO `defstatsutente` (`idUtente`, `idStatsbase`, `valoreBase`, `valoreAttuale`, `bonusEquip`, `bonusVirtus`, `bonusAbilita`) VALUES
(2, 1, 20, 20, 0, 0, 0),
(2, 2, 10, 10, 0, 0, 0),
(2, 3, 1, 1, 0, 0, 0),
(2, 4, 5, 5, 0, 0, 0),
(2, 5, 5, 5, 0, 0, 0),
(2, 6, 5, 5, 0, 0, 0),
(2, 7, 5, 5, 0, 0, 0),
(2, 8, 0, 0, 0, 0, 0),
(2, 9, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_virtus`
--

DROP TABLE IF EXISTS `ha_virtus`;
CREATE TABLE `ha_virtus` (
  `idUtente` int(11) NOT NULL,
  `idVirtus` int(11) NOT NULL,
  `valore` int(11) NOT NULL DEFAULT '0',
  `puntiCrescita` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ha_virtus`
--

INSERT INTO `ha_virtus` (`idUtente`, `idVirtus`, `valore`, `puntiCrescita`) VALUES
(2, 1, 0, 0),
(2, 2, 0, 0),
(2, 3, 0, 0),
(2, 4, 0, 0),
(2, 5, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `pagina`
--

DROP TABLE IF EXISTS `pagina`;
CREATE TABLE `pagina` (
  `idPagina` int(11) NOT NULL,
  `percorso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `pagina`
--

INSERT INTO `pagina` (`idPagina`, `percorso`) VALUES
(1, 'prologo/prologo-1');

-- --------------------------------------------------------

--
-- Struttura della tabella `statsbase`
--

DROP TABLE IF EXISTS `statsbase`;
CREATE TABLE `statsbase` (
  `idStatsbase` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descrizione` varchar(200) DEFAULT NULL,
  `abbrev` varchar(3) DEFAULT NULL,
  `defaultUtente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `statsbase`
--

INSERT INTO `statsbase` (`idStatsbase`, `nome`, `descrizione`, `abbrev`, `defaultUtente`) VALUES
(1, 'Punti Vita', 'I Punti Vita determinano il numero di danni massimi che si possono subire. Se i Punti Vita scendono a 0, sei morto.', 'PV', 20),
(2, 'Energia', 'Questo valore permette di utilizzare abilità e tecniche.', 'ENR', 10),
(3, 'Resistenza', 'Questo valore determina il numero di danni assorbiti da', 'RES', 1),
(4, 'Chance Crit.', 'Chance di effettuare un danno critico', 'CRT', 5),
(5, 'Forza Fisica', 'Stabilisce i danni fisici inflitti', 'FFS', 5),
(6, 'Forza Mentale', 'Stabilisce i danni magici inflitti', 'FMN', 5),
(7, 'Evasione', 'Chance di evadere danni', 'EVS', 5),
(8, 'Punti Crescita', '...', 'PC', 0),
(9, 'Punti Abilità', '...', 'PA', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ultimapagina`
--

DROP TABLE IF EXISTS `ultimapagina`;
CREATE TABLE `ultimapagina` (
  `idUtente` int(11) NOT NULL,
  `idPagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ultimapagina`
--

INSERT INTO `ultimapagina` (`idUtente`, `idPagina`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
  `idUtente` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tempoGioco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idUtente`, `password`, `username`, `tempoGioco`) VALUES
(2, 'XkmjOQoZrHbaQb7nAIjQV7OlJ00GNMBD', 'Alist3r', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `virtus`
--

DROP TABLE IF EXISTS `virtus`;
CREATE TABLE `virtus` (
  `idVirtus` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descrizione` varchar(200) NOT NULL,
  `idStatsbase1` int(11) NOT NULL,
  `idStatsbase2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `virtus`
--

INSERT INTO `virtus` (`idVirtus`, `nome`, `descrizione`, `idStatsbase1`, `idStatsbase2`) VALUES
(1, 'Coraggio', '...', 2, 5),
(2, 'Astuzia', '...', 4, 7),
(3, 'Vigore', '...', 1, 3),
(4, 'Giustizia', '...', 5, 6),
(5, 'Volontà', '...', 3, 6);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `defstatsutente`
--
ALTER TABLE `defstatsutente`
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idStatsbase` (`idStatsbase`);

--
-- Indici per le tabelle `ha_virtus`
--
ALTER TABLE `ha_virtus`
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idVirtus` (`idVirtus`);

--
-- Indici per le tabelle `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`idPagina`);

--
-- Indici per le tabelle `statsbase`
--
ALTER TABLE `statsbase`
  ADD PRIMARY KEY (`idStatsbase`);

--
-- Indici per le tabelle `ultimapagina`
--
ALTER TABLE `ultimapagina`
  ADD KEY `idUtente` (`idUtente`),
  ADD KEY `idPagina` (`idPagina`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`idUtente`);

--
-- Indici per le tabelle `virtus`
--
ALTER TABLE `virtus`
  ADD PRIMARY KEY (`idVirtus`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `defstatsutente`
--
ALTER TABLE `defstatsutente`
  ADD CONSTRAINT `defstatsutente_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`),
  ADD CONSTRAINT `defstatsutente_ibfk_2` FOREIGN KEY (`idStatsbase`) REFERENCES `statsbase` (`idStatsbase`);

--
-- Limiti per la tabella `ha_virtus`
--
ALTER TABLE `ha_virtus`
  ADD CONSTRAINT `ha_virtus_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`),
  ADD CONSTRAINT `ha_virtus_ibfk_2` FOREIGN KEY (`idVirtus`) REFERENCES `virtus` (`idVirtus`);

--
-- Limiti per la tabella `ultimapagina`
--
ALTER TABLE `ultimapagina`
  ADD CONSTRAINT `ultimapagina_ibfk_1` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`),
  ADD CONSTRAINT `ultimapagina_ibfk_2` FOREIGN KEY (`idPagina`) REFERENCES `pagina` (`idPagina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
