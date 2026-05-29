-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 29, 2026 alle 12:04
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventicuneo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria_nome`) VALUES
(5, 'Arte'),
(12, 'Benessere'),
(7, 'Business'),
(4, 'Cinema'),
(11, 'Festival'),
(8, 'Food & Drink'),
(9, 'Gaming'),
(10, 'Istruzione'),
(1, 'Musica'),
(2, 'Sport'),
(6, 'Teatro'),
(3, 'Tecnologia');

-- --------------------------------------------------------

--
-- Struttura della tabella `eventi`
--

CREATE TABLE `eventi` (
  `id_evento` int(11) NOT NULL,
  `titolo` varchar(200) NOT NULL,
  `descrizione` varchar(1000) NOT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `ora_inizio` time NOT NULL,
  `ora_fine` time DEFAULT NULL,
  `chiusura_prenotazione` datetime NOT NULL,
  `importo` decimal(10,2) DEFAULT NULL,
  `posti_max` int(11) DEFAULT NULL,
  `localita_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `organizzatore_id` int(11) NOT NULL,
  `immagine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `eventi`
--

INSERT INTO `eventi` (`id_evento`, `titolo`, `descrizione`, `indirizzo`, `data_inizio`, `data_fine`, `ora_inizio`, `ora_fine`, `chiusura_prenotazione`, `importo`, `posti_max`, `localita_id`, `categoria_id`, `organizzatore_id`, `immagine`) VALUES
(3, 'Munse music festival', 'festival musicale', NULL, '2026-06-01', '2026-06-03', '10:00:00', '23:59:00', '2026-06-01 23:59:59', NULL, 100, 46, 1, 11, 'a602764ef93f8d.jpg'),
(4, 'camminata sulla bisalta', 'camminata in montagna in giornata', NULL, '2026-07-05', '2026-07-05', '07:00:00', '13:00:00', '2026-07-04 23:59:59', NULL, 20, 47, 2, 13, '09f1a3c28d0360.jpeg');

-- --------------------------------------------------------

--
-- Struttura della tabella `localita`
--

CREATE TABLE `localita` (
  `id_localita` int(11) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `cap` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `localita`
--

INSERT INTO `localita` (`id_localita`, `citta`, `cap`) VALUES
(36, 'Alba', '12051'),
(46, 'Borgo San Dalmazzo', '12011'),
(54, 'Boves', '12012'),
(37, 'Bra', '12042'),
(42, 'Busca', '12022'),
(56, 'Cervasca', '12010'),
(43, 'Ceva', '12073'),
(51, 'Demonte', '12014'),
(44, 'Dronero', '12025'),
(50, 'Entracque', '12010'),
(38, 'Fossano', '12045'),
(48, 'Limone Piemonte', '12015'),
(39, 'Mondovì', '12084'),
(55, 'Peveragno', '12016'),
(53, 'Pietraporzio', '12010'),
(45, 'Racconigi', '12035'),
(60, 'Roccavione', '12018'),
(40, 'Saluzzo', '12037'),
(58, 'Sant\'Albano Stura', '12040'),
(41, 'Savigliano', '12038'),
(59, 'Trinità', '12049'),
(49, 'Valdieri', '12010'),
(47, 'Vernante', '12019'),
(57, 'Vignolo', '12010'),
(52, 'Vinadio', '12010');

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazioni`
--

CREATE TABLE `partecipazioni` (
  `id_evento` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `invio_qr` varchar(30) DEFAULT NULL,
  `partecipazione_registrata` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partecipazioni`
--

INSERT INTO `partecipazioni` (`id_evento`, `id_utente`, `invio_qr`, `partecipazione_registrata`) VALUES
(3, 13, NULL, '2026-05-29 11:12:54'),
(3, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `segnalazioni`
--

CREATE TABLE `segnalazioni` (
  `id_evento` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id_utente` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `natoli` varchar(100) NOT NULL,
  `sesso` char(1) NOT NULL,
  `cod_amm` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id_utente`, `username`, `password`, `natoli`, `sesso`, `cod_amm`, `email`) VALUES
(11, 'andre', '$2y$10$bRN9Xuf5/33RpFFbcJAq.ec20Hnhv7KT8xQPD2i4rQb3j18MiVsxe', '2007-03-15', 'M', NULL, 'andrea.fino@gmail.com'),
(12, 'mario', '$2y$10$EfiZiFJmEcxIuhGMNRYTH.pjKe54xoePKEeP4/2EgtXOGf1MsspRW', '2000-01-10', 'M', '1', 'mario.rossi@gmail.com'),
(13, 'alice', '$2y$10$ilke602YnnrwTsN6wIwCk./Irxlt8DEN486RbRm0swTl4IXAibHmu', '2004-01-04', 'F', NULL, 'alice.bianchi@gmail.com'),
(14, 'gianni', '$2y$10$sdn928AuENKst9BnSeY7PeeHmvWOEDs/xBkxcz9c9IWuRNcB0qjw2', '2000-01-01', 'M', NULL, 'gianni.rossi@gmail.com');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `categoria_nome` (`categoria_nome`);

--
-- Indici per le tabelle `eventi`
--
ALTER TABLE `eventi`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `localita_id` (`localita_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `fk_eventi_organizzatore` (`organizzatore_id`);

--
-- Indici per le tabelle `localita`
--
ALTER TABLE `localita`
  ADD PRIMARY KEY (`id_localita`),
  ADD UNIQUE KEY `citta` (`citta`,`cap`);

--
-- Indici per le tabelle `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD PRIMARY KEY (`id_evento`,`id_utente`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `segnalazioni`
--
ALTER TABLE `segnalazioni`
  ADD PRIMARY KEY (`id_evento`,`id_utente`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `eventi`
--
ALTER TABLE `eventi`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `localita`
--
ALTER TABLE `localita`
  MODIFY `id_localita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `eventi`
--
ALTER TABLE `eventi`
  ADD CONSTRAINT `eventi_ibfk_1` FOREIGN KEY (`localita_id`) REFERENCES `localita` (`id_localita`),
  ADD CONSTRAINT `eventi_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_eventi_organizzatore` FOREIGN KEY (`organizzatore_id`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD CONSTRAINT `partecipazioni_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventi` (`id_evento`) ON DELETE CASCADE,
  ADD CONSTRAINT `partecipazioni_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE;

--
-- Limiti per la tabella `segnalazioni`
--
ALTER TABLE `segnalazioni`
  ADD CONSTRAINT `segnalazioni_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventi` (`id_evento`) ON DELETE CASCADE,
  ADD CONSTRAINT `segnalazioni_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
