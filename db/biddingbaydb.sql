-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2024 a las 04:15:33
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biddingbaydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auctions`
--

CREATE TABLE `auctions` (
  `auctionID` int(11) NOT NULL,
  `objectName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `categories` varchar(200) NOT NULL,
  `startDate` varchar(50) NOT NULL,
  `endDate` varchar(50) NOT NULL,
  `imgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relation_auctions`
--

CREATE TABLE `relation_auctions` (
  `relation_auctionsID` int(11) NOT NULL,
  `auctionID` int(11) NOT NULL,
  `creatorUserID` int(11) NOT NULL,
  `bidderUserID` int(11) DEFAULT NULL,
  `minStartBid` double NOT NULL,
  `currentMaxBid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `adress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`auctionID`);

--
-- Indices de la tabla `relation_auctions`
--
ALTER TABLE `relation_auctions`
  ADD PRIMARY KEY (`relation_auctionsID`),
  ADD KEY `relations_auctions_ibfk_1` (`auctionID`),
  ADD KEY `relations_auctions_ibfk_2` (`creatorUserID`),
  ADD KEY `relations_auctions_ibfk_3` (`bidderUserID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auctions`
--
ALTER TABLE `auctions`
  MODIFY `auctionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relation_auctions`
--
ALTER TABLE `relation_auctions`
  MODIFY `relation_auctionsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relation_auctions`
--
ALTER TABLE `relation_auctions`
  ADD CONSTRAINT `relations_auctions_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auctions` (`auctionID`),
  ADD CONSTRAINT `relations_auctions_ibfk_2` FOREIGN KEY (`creatorUserID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `relations_auctions_ibfk_3` FOREIGN KEY (`bidderUserID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
