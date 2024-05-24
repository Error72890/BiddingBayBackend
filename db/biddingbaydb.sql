-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 05:32:19
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
(3, 'Coche Clásico', 'Un coche clásico en excelente estado.', 'Vehículos,Automóviles', '2024-05-22 00:00:00', '2024-05-21 06:00:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716510164619_sporefy.jpeg', 50000, 200),
(17, 'Bolso Louis Vuitton', 'Un bolso caro', 'RopaparaMujeres,BolsosyCarteras', '2024-05-23 20:45:14', '2024-05-25 20:15:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716516994337_louis-vuitton-bolsa-onthego-gm-monogram-bolsas-de-mano--M45320_PM2_Front view.webp', 4000, 100),
(18, 'TV 55 pulgadas', 'Hermosa TV de 55 como nueva, oferte', 'Electronica', '2024-05-22 20:45:12', '2024-05-24 10:20:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716517228844_download.jpg', 500, 100),
(19, 'Reloj Rolex Submariner', 'Un reloj de lujo con diseño elegante y resistente al agua, perfecto para los amantes de la alta relojería.', 'Relojes', '2024-05-22 11:45:11', '2024-05-29 22:28:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518074218_download.jpg', 4000, 300),
(20, 'iPhone 13 Pro Max', 'El último modelo de iPhone con pantalla OLED, cámara de alta resolución y rendimiento insuperabl', 'DispositivosElectronicos,Telefonos,Electronica', '2024-05-22 19:45:08', '2024-05-31 20:34:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518106776_download.jpg', 8000, 500),
(21, 'Guitarra Fender Stratocaster', 'Una guitarra eléctrica clásica que ofrece un sonido único y versatilidad para cualquier estilo musical', 'Electronica,DispositivosElectronicos,ArticulosdeColeccion,InstrumentosMusicales,ProduccionMusical', '2024-05-22 16:45:05', '2024-05-30 20:35:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518157645_download.jpg', 15500, 1000),
(22, 'Bicicleta de Montaña Trek', 'Bicicleta de alta gama con suspensión completa, ideal para aventuras en terrenos difíciles.', 'CampamentoyAventuras,ArticulosDeportivos,EquipodeEjercicio', '2024-05-22 12:45:03', '2024-05-24 20:30:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518210872_download.jpg', 9900, 500),
(23, 'Set de maletas Samsonite', 'Juego de maletas duraderas y elegantes, perfectas para viajes de negocios o vacaciones.', 'BolsosyCarteras,CampamentoyAventuras', '2024-05-22 20:44:59', '2024-06-06 13:30:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518282908_images.jpg', 600, 20),
(24, 'Anillo de diamantes Tiffany & Co.', 'Un anillo de compromiso espectacular con un diamante de alta calidad, símbolo de amor eterno.', 'Moda,Anillos', '2024-05-22 20:44:56', '2024-05-30 20:43:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518342168_download.jpg', 86600, 2000),
(25, 'Motocicleta Harley-Davidson', 'Moto clásica con diseño robusto y motor potente, ideal para los amantes de la carretera.', 'Motocicletas,Automoviles,VehiculosRecreacionales,CampamentoyAventuras', '2024-05-22 20:44:54', '2024-05-29 20:39:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518386551_download.jpg', 70000, 500),
(26, 'Bolígrafo Montblanc Meisterstück', 'Bolígrafo de lujo fabricado con materiales de alta calidad, perfecto para coleccionistas y ejecutivos.', 'RopaparaHombres,Libros', '2024-05-22 20:44:51', '2024-05-30 12:40:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518430522_download.jpg', 5000, 10),
(27, 'Mesa de comedor de madera maciza', 'Mesa artesanal hecha de madera de alta calidad, perfecta para dar un toque elegante a tu comedor.', 'DecoracióndeCasas,Muebles,Hogar', '2024-05-22 20:44:45', '2024-05-24 23:40:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518479099_download.jpg', 1500, 250),
(28, 'Auriculares Bose QuietComfort 35 II', 'Auriculares inalámbricos con cancelación de ruido, ideales para disfrutar de música sin distracciones.', 'Electronica,DispositivosElectronicos', '2024-05-22 02:45:31', '2024-05-30 20:45:00', 'https://pub-d7283f55a38d49e9b19081945e986fb3.r2.dev/1716518759359_download.jpg', 5600, 100);

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
(3, 3, 3, 1, 0),
(9, 17, 1, 1, 4000),
(10, 18, 1, 1, 500),
(11, 19, 1, 1, 4000),
(12, 20, 1, 1, 8000),
(13, 21, 1, 1, 15500),
(14, 22, 1, 1, 9900),
(15, 23, 1, 1, 600),
(16, 24, 1, 1, 86600),
(17, 25, 1, 1, 70000),
(18, 26, 1, 1, 5000),
(19, 27, 1, 1, 1500),
(20, 28, 1, 1, 5600),
(21, 20, 1, 0, 10000);

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
  MODIFY `auctionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `relations_auctions`
--
ALTER TABLE `relations_auctions`
  MODIFY `relation_auctionsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
