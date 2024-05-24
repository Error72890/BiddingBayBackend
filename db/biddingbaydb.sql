-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 04:12:41
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
-- Base de datos: `biddingbaydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auctions`
--

CREATE TABLE `auctions` (
  `auctionId` int(11) NOT NULL,
  `objectName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `categories` varchar(200) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `minBid` double NOT NULL DEFAULT 0,
  `minBidIncrement` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auctions`
--

INSERT INTO `auctions` (`auctionId`, `objectName`, `description`, `categories`, `startDate`, `endDate`, `img`, `minBid`, `minBidIncrement`) VALUES
(1, 'Reloj Vintage', 'Un hermoso reloj vintage del siglo XIX.', 'Antiguedades,Relojes', '2024-05-01 00:00:00', '2024-05-31 03:00:00', '', 100, 10),
(2, 'Pintura de Arte Moderno', 'Una pintura abstracta de arte moderno.', 'Arte,Moderno,Antiguedades', '2024-05-10 00:00:00', '2024-05-23 00:00:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716510164619_sporefy.jpeg', 500, 40),
(3, 'Coche Clásico', 'Un coche clásico en excelente estado.', 'Vehículos,Automóviles', '2024-05-01 00:00:00', '2024-05-21 06:00:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716510164619_sporefy.jpeg', 50000, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations_auctions`
--

CREATE TABLE `relations_auctions` (
  `relation_auctionsId` int(11) NOT NULL,
  `auctionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isCreator` tinyint(1) NOT NULL,
  `bidAmt` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `relations_auctions`
--

INSERT INTO `relations_auctions` (`relation_auctionsId`, `auctionId`, `userId`, `isCreator`, `bidAmt`) VALUES
(1, 1, 1, 1, 0),
(2, 2, 2, 1, 0),
(3, 3, 3, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `adress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `fullName`, `email`, `password`, `phoneNumber`, `adress`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', 'contrasena123', '555-1234', 'Calle Principal 123'),
(2, 'María García', 'maria.garcia@example.com', 'contrasena456', '555-5678', 'Avenida de la Paz 456'),
(3, 'Carlos López', 'carlos.lopez@example.com', 'contrasena789', '555-8765', 'Boulevard del Sol 789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`auctionId`);

--
-- Indices de la tabla `relations_auctions`
--
ALTER TABLE `relations_auctions`
  ADD PRIMARY KEY (`relation_auctionsId`),
  ADD KEY `relations_auctions_ibfk_1` (`auctionId`),
  ADD KEY `relations_auctions_ibfk_2` (`userId`) USING BTREE;

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auctions`
--
ALTER TABLE `auctions`
  MODIFY `auctionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `relations_auctions`
--
ALTER TABLE `relations_auctions`
  MODIFY `relation_auctionsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relations_auctions`
--
ALTER TABLE `relations_auctions`
  ADD CONSTRAINT `relations_auctions_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auctions` (`auctionId`),
  ADD CONSTRAINT `relations_auctions_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
