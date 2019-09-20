-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2019 at 06:29 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antiks`
--
CREATE DATABASE IF NOT EXISTS `antiks` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `antiks`;
--
-- Database: `baza`
--
CREATE DATABASE IF NOT EXISTS `baza` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `baza`;

-- --------------------------------------------------------

--
-- Table structure for table `drzava`
--

CREATE TABLE `drzava` (
  `drzava_id` int(11) NOT NULL,
  `naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drzava`
--

INSERT INTO `drzava` (`drzava_id`, `naziv`) VALUES
(1, 'SAD'),
(2, 'Srbija'),
(3, 'Kina'),
(4, 'Hrvatska'),
(5, 'BiH'),
(6, 'Velika Britanija'),
(7, 'Italija');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `naslov` varchar(50) NOT NULL,
  `trajanje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`film_id`, `naslov`, `trajanje`) VALUES
(1, 'Ko to tamo peva', 120),
(2, 'Balkanski spijun', 130),
(3, 'Titanik', 160),
(4, 'Dobar, los, zao', 140),
(5, 'Deadpool', 125),
(6, 'Marsovac', 150);

-- --------------------------------------------------------

--
-- Table structure for table `glumac`
--

CREATE TABLE `glumac` (
  `glumac_id` int(11) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `nadimak` varchar(30) NOT NULL,
  `drzava_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `glumac`
--

INSERT INTO `glumac` (`glumac_id`, `ime`, `prezime`, `nadimak`, `drzava_id`) VALUES
(1, 'Leonardo', 'Di Caprio', 'Leo', 1),
(2, 'Saro', 'Urzi', 'Urzi', 7),
(3, 'Branko', 'Djuric', 'Djuro', 5),
(4, 'Boris', 'Dvornik', 'Boris', 4),
(5, 'Dzet', 'Li', 'Li', 3),
(6, 'Steven', 'Segal', 'Steven', 1);

-- --------------------------------------------------------

--
-- Table structure for table `glumio`
--

CREATE TABLE `glumio` (
  `glumio_id` int(11) NOT NULL,
  `glumac_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `glumio`
--

INSERT INTO `glumio` (`glumio_id`, `glumac_id`, `film_id`) VALUES
(1, 1, 3),
(2, 5, 5),
(3, 4, 1),
(4, 2, 5),
(5, 2, 4),
(6, 3, 2),
(7, 2, 4),
(8, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `koprodukcija`
--

CREATE TABLE `koprodukcija` (
  `koprodukcija_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `drzava_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `koprodukcija`
--

INSERT INTO `koprodukcija` (`koprodukcija_id`, `film_id`, `drzava_id`) VALUES
(1, 2, 2),
(2, 5, 1),
(3, 1, 5),
(4, 4, 7),
(5, 3, 6),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `komentari` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `username`, `ime`, `komentari`) VALUES
(1, 'Markec', 'Marko', 'Ovo je Marko programer'),
(2, 'Perkan', 'Pero', 'Ja sam Pero');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drzava`
--
ALTER TABLE `drzava`
  ADD PRIMARY KEY (`drzava_id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indexes for table `glumac`
--
ALTER TABLE `glumac`
  ADD PRIMARY KEY (`glumac_id`),
  ADD KEY `drzava_id` (`drzava_id`);

--
-- Indexes for table `glumio`
--
ALTER TABLE `glumio`
  ADD PRIMARY KEY (`glumio_id`),
  ADD KEY `glumac_id` (`glumac_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indexes for table `koprodukcija`
--
ALTER TABLE `koprodukcija`
  ADD PRIMARY KEY (`koprodukcija_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `drzava_id` (`drzava_id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drzava`
--
ALTER TABLE `drzava`
  MODIFY `drzava_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glumac`
--
ALTER TABLE `glumac`
  MODIFY `glumac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `glumio`
--
ALTER TABLE `glumio`
  MODIFY `glumio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `koprodukcija`
--
ALTER TABLE `koprodukcija`
  MODIFY `koprodukcija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `glumac`
--
ALTER TABLE `glumac`
  ADD CONSTRAINT `glumac_ibfk_1` FOREIGN KEY (`drzava_id`) REFERENCES `drzava` (`drzava_id`);

--
-- Constraints for table `glumio`
--
ALTER TABLE `glumio`
  ADD CONSTRAINT `glumio_ibfk_1` FOREIGN KEY (`glumac_id`) REFERENCES `glumac` (`glumac_id`),
  ADD CONSTRAINT `glumio_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

--
-- Constraints for table `koprodukcija`
--
ALTER TABLE `koprodukcija`
  ADD CONSTRAINT `koprodukcija_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`),
  ADD CONSTRAINT `koprodukcija_ibfk_2` FOREIGN KEY (`drzava_id`) REFERENCES `drzava` (`drzava_id`);
--
-- Database: `bazaa`
--
CREATE DATABASE IF NOT EXISTS `bazaa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bazaa`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `komentari` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `username`, `password`, `ime`, `komentari`) VALUES
(1, 'admin', '12345678', 'Aleksandar', 'Ovo je administrator'),
(2, 'korisnik', '12345678', 'Nenad', 'ovo je obicni korisnik sajt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `bazamania`
--
CREATE DATABASE IF NOT EXISTS `bazamania` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bazamania`;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `naslov` char(1) NOT NULL,
  `tekst` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Ime` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Is_admin` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Ime`, `Email`, `Password`, `Is_admin`) VALUES
(1, 'Aleksandar', 'djukicaleks91@gmail.com', 'jyfctrcf', 0),
(2, 'Marko', 'markovic@gmail.com', 'asfasgasg', 0),
(3, 'aco', 'aco@gmail.com', 'acoaco', 0),
(4, 'Aleksandar', 'acoo@gmail.com', 'aaaaa', 0),
(5, 'Dejan Njezic', 'superdejooo@gmail.com', 'aaaaal', 0),
(6, 'Marko', 'aaa@bbb.ccc', 'aaaaal', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `bazica`
--
CREATE DATABASE IF NOT EXISTS `bazica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bazica`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(99) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `titl` text NOT NULL,
  `message` text NOT NULL,
  `datum_upisa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `email`, `titl`, `message`, `datum_upisa`) VALUES
(1, 'Aleksandar', '111111@gmail.com', 'Pero', '', '2018-12-02 17:10:12'),
(2, 'Aleksandar', '111111@gmail.com', 'Pero', '', '2018-12-02 17:10:12'),
(3, 'fgjfj', 'acoo@gmail.com', 'kjkk', 'Your messjk', '2018-12-02 17:19:57'),
(4, 'Aleksandar', 'acoo@gmail.com', 'asfdasf', 'Your messasgasgasgasgage', '2018-12-02 17:41:56'),
(5, 'Aleksandar', 'acoo@gmail.com', 'asfdasf', 'Your messasgasgasgasgage', '2018-12-02 17:44:00'),
(6, 'Aleksandar', 'acoo@gmail.com', 'asfdasf', 'Your messasgasgasgasgage', '2018-12-02 17:46:23'),
(7, 'Aleksandar', 'acoo@gmail.com', 'asfdasf', 'Your messasgasgasgasgage', '2018-12-02 18:03:42'),
(8, 'Dejan', 'Njezic@gmail.com', 'Informacije o advisoru', 'Interesuje me sve vezano za tripadvisor.Your message', '2018-12-02 18:06:26'),
(9, 'Dragan', 'Draganovic@gmail.com', 'TripAdvisor', 'Imam problem za logovanjem na vas site.Your message', '2018-12-02 18:08:46'),
(10, 'Drago', 'Dragic@hotmail.com', 'AGAGASG', 'Your messagsgagas ag asgaae', '2018-12-02 18:11:07'),
(11, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:13:34'),
(12, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:22:55'),
(13, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:34:23'),
(14, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:35:43'),
(15, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:40:06'),
(16, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:40:29'),
(17, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:40:54'),
(18, 'Aleksandar', '111111@gmail.com', 'asfasf', 'Your masfasfafaf afs fas fas fas essage', '2018-12-02 18:41:18'),
(19, 'Aleksandar', '111111@gmail.com', 'Informacije', 'Your messagekk', '2018-12-02 18:41:51'),
(20, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:46:27'),
(21, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:47:08'),
(22, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:47:18'),
(23, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:47:52'),
(24, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:52:10'),
(25, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 18:54:09'),
(26, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:01:53'),
(27, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:02:27'),
(28, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:02:55'),
(29, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:02:59'),
(30, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:03:17'),
(31, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:04:19'),
(32, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:04:50'),
(33, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:06:08'),
(34, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:06:25'),
(35, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:06:42'),
(36, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:08:24'),
(37, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:08:36'),
(38, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:10:00'),
(39, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:10:17'),
(40, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:13:24'),
(41, 'Marko', '111111@gmail.com', 'Pero', 'Yourasfasfas message', '2018-12-02 19:13:34'),
(42, 'Zeljko', 'Zeljkovic@gmail.com', 'Profesija', 'Zelio bih se prijaviti na posao.Javite mi se na mail', '2018-12-02 19:52:52'),
(43, 'Zeljko', 'Zeljkovic@gmail.com', 'Profesija', 'Zelio bih se prijaviti na posao.Javite mi se na mail', '2018-12-02 20:11:48'),
(44, 'Zeljko', 'Zeljkovic@gmail.com', 'Profesija', 'Zelio bih se prijaviti na posao.Javite mi se na mail', '2018-12-02 20:27:58'),
(45, 'Zeljko', 'Zeljkovic@gmail.com', 'Profesija', 'Zelio bih se prijaviti na posao.Javite mi se na mail', '2018-12-02 20:29:13'),
(46, '', '', '', '', '2018-12-02 20:30:54'),
(47, 'marko', 'markovic@gasga.com', 'aasf@gmaiaasfa.com', 'asfasga', '2018-12-02 20:37:08'),
(48, 'asfasg', 'asf@asg', 'asfasf', 'asf', '2018-12-02 20:51:25'),
(49, 'Aleksandar', '111111@gmail.com', 'Informacije', 'asfa', '2018-12-04 21:58:57'),
(50, 'Aleksandar', '111111@gmail.com', 'Informacije', 'asfa', '2018-12-04 22:00:12'),
(51, '', '', '', '', '2018-12-04 22:07:59'),
(52, '', '', '', '', '2018-12-05 00:50:13'),
(53, 'Aleksandarasd', 'asf@asgasf', 'asfasf', 'asfasfa', '2018-12-05 00:54:54'),
(54, 'Aleksandarasd', 'asf@asgasf', 'asfasf', 'asfasfa', '2018-12-05 00:54:54'),
(55, 'Aleksandar', '111111@gmail.com', 'Informacije', '', '2018-12-05 00:56:45'),
(56, 'Aleksandar', '111111@gmail.com', '', '', '2018-12-05 00:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `podaci`
--

CREATE TABLE `podaci` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `datum_upisa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `podaci`
--

INSERT INTO `podaci` (`id`, `email`, `datum_upisa`) VALUES
(1, 'pero@gmail.com', '2018-11-17 13:35:18'),
(2, 'djukicaleks91@gmail.', '2018-11-17 13:36:00'),
(3, 'djukicaleks91@gmail.', '2018-11-17 13:36:02'),
(4, 'djukicaleks91@gmail.', '2018-11-17 13:36:08'),
(5, 'djukicaleks91@gmail.', '2018-11-17 13:36:26'),
(6, 'majkic@gmail.com', '2018-11-17 14:17:32'),
(28, 'antic92@gmail.com', '2018-11-19 19:02:14'),
(29, '', '2018-11-30 15:30:58'),
(30, '', '2018-11-30 16:52:16'),
(31, '', '2018-11-30 16:54:17'),
(32, '', '2018-12-02 20:36:40'),
(33, '111111@gmail.com', '2018-12-04 20:16:10'),
(34, 'acoo@gmail.com', '2018-12-04 22:01:40'),
(35, 'peroperic@hotmail.co', '2018-12-04 22:04:23'),
(36, '', '2018-12-04 22:09:10'),
(37, '', '2018-12-04 22:46:57'),
(38, 'peroperic@hotmail.co', '2018-12-04 22:49:48'),
(39, 'peroperic@hotmail.co', '2018-12-04 22:49:54'),
(40, '', '2018-12-05 00:47:28'),
(41, '', '2018-12-05 00:48:31'),
(42, '', '2018-12-05 00:50:47'),
(43, 'acoo@gmail.com', '2018-12-05 00:56:14'),
(44, '', '2018-12-05 01:09:01'),
(45, '', '2018-12-05 01:44:12'),
(46, 'acoo@gmail.com', '2018-12-05 01:47:23'),
(47, 'acoo@gmail.com', '2019-01-24 21:03:10'),
(48, 'djukicaleks91@gmail.', '2019-01-24 21:27:05'),
(49, 'djukicaleks91@gmail.', '2019-02-20 17:46:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `podaci`
--
ALTER TABLE `podaci`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `podaci`
--
ALTER TABLE `podaci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `naslov` varchar(30) NOT NULL,
  `tekst` text NOT NULL,
  `datum` date NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `kategorija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `naslov`, `tekst`, `datum`, `korisnik_id`, `kategorija_id`) VALUES
(1, 'Moj prvi blog', 'Tekst mog prvog bloga', '2019-03-13', 1, 1),
(2, 'Blog o Prirodi', 'Pridoda je veoma lijepa i zelena zato sto je prirodna i zdrava. Sluzi za ocuvanje zivotne sredine.', '2019-03-15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_kategorije`
--

CREATE TABLE `blog_kategorije` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_kategorije`
--

INSERT INTO `blog_kategorije` (`id`, `naziv`) VALUES
(1, 'Prva kategorija'),
(2, 'Druga kategorija');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `username`, `ime`, `komentar`) VALUES
(1, 'admin', 'Aleksandar', 'Ovo je administrator sajta'),
(2, 'korisnik', 'Nenad', 'Ovo je korisnik sajta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_kategorije`
--
ALTER TABLE `blog_kategorije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_kategorije`
--
ALTER TABLE `blog_kategorije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `calculator`
--
CREATE DATABASE IF NOT EXISTS `calculator` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `calculator`;

-- --------------------------------------------------------

--
-- Table structure for table `rezultati`
--

CREATE TABLE `rezultati` (
  `id` int(255) NOT NULL,
  `factor1` int(255) NOT NULL,
  `factor2` int(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `result` int(255) NOT NULL,
  `operation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rezultati`
--

INSERT INTO `rezultati` (`id`, `factor1`, `factor2`, `operation`, `result`, `operation_date`) VALUES
(1, 2, 2, '*', 4, '2019-06-26 15:03:12'),
(2, 4, 6, '*', 24, '2019-06-26 15:23:01'),
(3, 8, 7, '*', 56, '2019-06-26 15:23:02'),
(4, 10, 10, '*', 100, '2019-06-26 15:23:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rezultati`
--
ALTER TABLE `rezultati`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rezultati`
--
ALTER TABLE `rezultati`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `cms-blog`
--
CREATE DATABASE IF NOT EXISTS `cms-blog` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `cms-blog`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Angular JS', '2019-09-20 11:32:35', '2019-09-20 11:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_03_175438_create_posts_table', 1),
(4, '2019_09_03_175508_create_categories_table', 1),
(5, '2019_09_12_001502_create_tags_table', 1),
(6, '2019_09_12_013817_create_post_tag_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('writer','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'writer',
  `about` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `role`, `about`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', NULL, 'admin', NULL, 'djukicaleks91@gmail.com', NULL, '$2y$10$3sG6OFUfsAbR7BphtcEDZOF5H8ZNDo469Mrd40Nwz6Vj0ZqFYQNpu', NULL, '2019-09-12 01:56:19', '2019-09-12 01:56:19'),
(2, 'Marko', 'posts/787ylfkpMN0HIW09iXmlSOniXRuCVDM26VIoh55Q.jpeg', 'writer', NULL, 'mark@gmail.com', NULL, '$2y$10$XKOlQo3mTylZ3LD99cETa.mkvUZmHxikyokFLX/BYLbC.3n.WP1gG', NULL, '2019-09-12 01:56:42', '2019-09-12 01:56:42'),
(3, 'Marko', NULL, 'writer', NULL, 'baka@gmail.com', NULL, '$2y$10$/m4JkQ/s8JDHn5vgR1QmneFmh0fQXhZgBi./WVdy8sRBcW6ME2uv6', NULL, '2019-09-12 02:01:53', '2019-09-12 02:01:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `codehacking`
--
CREATE DATABASE IF NOT EXISTS `codehacking` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `codehacking`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PHP', NULL, NULL),
(2, 'JS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `is_active`, `author`, `photo`, `email`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 'Aleksandar Djukic', '', 'djukicaleks91@gmail.com', 'Meni se ne svidja ovaj kurs', '2019-07-13 12:25:53', '2019-07-20 11:29:11'),
(4, 2, 1, 'Aleksandar Djukic', '/images/1562945510aco.jpg', 'djukicaleks91@gmail.com', 'asfasfasg', '2019-07-13 13:45:35', '2019-07-22 10:01:27'),
(5, 2, 0, 'Aleksandar Djukic', '/images/1562945510aco.jpg', 'djukicaleks91@gmail.com', 'Ovo je komentar na post 2\r\n', '2019-07-15 11:58:45', '2019-07-15 12:01:51'),
(6, 2, 0, 'Aleksandar Djukic', '/images/1562945510aco.jpg', 'djukicaleks91@gmail.com', 'kkkkkkkkkkkkkkk', '2019-07-20 11:26:06', '2019-07-20 11:26:06'),
(7, 2, 0, 'Aleksandar Djukic', '/images/1562945510aco.jpg', 'djukicaleks91@gmail.com', 'ssssssssssssss', '2019-07-22 09:21:41', '2019-07-22 09:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_27_135830_create_roles_table', 1),
('2019_06_28_151013_add_photo_id_to_users', 1),
('2019_06_28_153157_create_photos_table', 1),
('2019_06_29_173447_create_posts_table', 1),
('2019_06_30_163706_create_categories_table', 1),
('2019_07_12_131512_create_comments_table', 1),
('2019_07_12_131538_create_comment_replies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('djukicaleks91@gmail.com', 'e770844f5d963a5b4cbb40f59608355a11d8fd7d79eae39dac6fc6f54fadc653', '2019-07-23 20:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `file`, `created_at`, `updated_at`) VALUES
(1, '1562945510aco.jpg', '2019-07-12 13:31:50', '2019-07-12 13:31:50'),
(2, '1563026914aco.jpg', '2019-07-13 12:08:34', '2019-07-13 12:08:34'),
(3, '1563888732baka.jpg', '2019-07-23 11:32:12', '2019-07-23 11:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `photo_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 'LARAVEL', 'Ovo je prvi post', '2019-07-12 13:31:50', '2019-07-12 13:31:50'),
(3, 1, 1, 2, 'Laravel', 'q', '2019-07-13 12:08:34', '2019-07-13 12:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, NULL),
(2, 'Author', NULL, NULL),
(3, 'Subscriber', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `is_active`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `photo_id`) VALUES
(1, 1, 1, 'Aleksandar Djukic', 'djukicaleks91@gmail.com', '$2y$10$Whssn1kOc2yMGyvPyhNJaenC2uUKiTZ/bPzTZBaytYA.KkZ5Jcdti', '5gGzfrxDxOVTVQcDGCjvw459s9g3ChlKyPptzfdTeyin2g2BI6iEIcX0Mi94', '2019-07-12 13:28:07', '2019-07-20 12:51:27', 1),
(2, 2, 1, 'Aleksandar Djukic', 'mark@gmail.com', '$2y$10$ybN1Q81r3Bau15Ya/ko.xe00siaZ6V.ulDKnhgdy/alwlV5vvnzRW', NULL, '2019-07-23 11:32:12', '2019-07-23 11:32:21', 3),
(4, 3, 0, 'asfasf', 'ma66rk@gmail.com', '$2y$10$WCckEh417fuwC7cvXwzXieZpwwhBodMIVyHnoC6Q1rWWU5otVvITe', NULL, '2019-07-23 11:32:47', '2019-07-23 11:32:47', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_index` (`post_id`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_replies_comment_id_index` (`comment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_photo_id_index` (`photo_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD CONSTRAINT `comment_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `cuss_app`
--
CREATE DATABASE IF NOT EXISTS `cuss_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cuss_app`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `sex`, `image`) VALUES
(1, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'male', ''),
(2, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(3, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Female', ''),
(4, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(5, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(6, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(7, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(8, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', ''),
(9, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Female', ''),
(11, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'male', ''),
(14, 'Novo ime', 'aco@mail.com', '111c03ddf31a2a03d3fa3377ab07eb56', 'Male', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `spending` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `spending`) VALUES
(2, 'Marko Markovic', 'markooo@gmail.com', 'aco', 2007),
(3, 'Aleksandar', 'pero@gmail.com', '999', 2007),
(4, 'Aleksandar', 'mark@gmail.com', '9999', 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `cus_app`
--
CREATE DATABASE IF NOT EXISTS `cus_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cus_app`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `image` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `sex`, `password`, `fullname`, `image`) VALUES
(1, 'djukicaleks91@gmail.com', 'admin', '123', 'Aleksandar Djukic', ''),
(2, 'aco-djukic@hotmail.com', 'Secret', '43cb006424cbf7b46dbca36c8ed79b69', 'Pero', ''),
(3, 'dejan@gmail.com', 'Male', 'fa1d3eb08a879de9a4cd9995a1aa91e1', 'Dejan Njezic', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `fullname` varchar(222) NOT NULL,
  `spending_amt` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `fullname`, `spending_amt`) VALUES
(1, 'zeljkec@hotmail.com', '111111', 'Darko', 1000),
(2, 'zeljko93@gmail.com', '12345678', 'Zeljko Bozic', 500),
(3, 'peroperic@gmail.com', 'sifrica', 'Pero PEric', 0),
(16, 'dejannjezic@gmail.com', '', 'Dejan Njezic', 200),
(19, 'zarko214@hotmail.com', 'asafafasf11111', 'Zarko Zarkovic', 500),
(35, 'djukicaleks91@gmail.com', '777777777', 'Aleksandar', 500),
(36, 'djukicaleks91@gmail.com', '777777777', 'Aleksandar', 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Database: `devtest`
--
CREATE DATABASE IF NOT EXISTS `devtest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `devtest`;
--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_30_155654_create_products_table', 1),
(4, '2019_08_30_155910_create_shoppingcarts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Casio', 'posts/Dsmj6yuF7B2xKa2XD823pg9lz8UdESSeoUoF9Bmg.jpeg', 100, '<div>Zlatni sat</div>', '2019-08-30 17:58:12', '2019-08-30 18:03:45'),
(2, 'Diesel', 'product/riWuZMsaZi5lhTQf6njdrkKmRbD0CLx2ZDJe6J80.jpeg', 222, '<div><strong>Gumeni sat</strong></div>', '2019-08-30 17:58:34', '2019-08-30 17:58:34'),
(3, 'Aleksandar', 'product/6BnP99Cf5FnEL8ObvLZbzSNaDHBLvVUhGfuIzYaK.jpeg', 888, '<div>iojoji</div>', '2019-08-30 18:15:09', '2019-08-30 18:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcarts`
--

CREATE TABLE `shoppingcarts` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar Djukic', 'djukicaleks91@gmail.com', NULL, '$2y$10$t.EfDALirs4DPx8ZHqDZT.h2P5AnkzLmfEgiWcBJ2uyc.SsEtdobC', NULL, '2019-08-30 17:57:48', '2019-08-30 17:57:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `ip`
--
CREATE DATABASE IF NOT EXISTS `ip` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ip`;

-- --------------------------------------------------------

--
-- Table structure for table `mjesto`
--

CREATE TABLE `mjesto` (
  `id_mjesta` int(11) NOT NULL,
  `naziv_mjesta` varchar(20) NOT NULL,
  `grad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mjesto`
--

INSERT INTO `mjesto` (`id_mjesta`, `naziv_mjesta`, `grad`) VALUES
(1, 'Kostajnica', 'Kostajnica'),
(2, 'Banja Luka', 'Banja Luka'),
(3, 'Celinac', 'Banja Luka'),
(4, 'Doboj', 'Doboj');

-- --------------------------------------------------------

--
-- Table structure for table `radnik`
--

CREATE TABLE `radnik` (
  `jmbg` int(11) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `mjesto_rodj` varchar(30) NOT NULL,
  `godina_rodjenja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radnik`
--

INSERT INTO `radnik` (`jmbg`, `ime`, `prezime`, `mjesto_rodj`, `godina_rodjenja`) VALUES
(100, 'Vlado', 'Trbic', 'Banja Luka', 1991),
(101, 'Marko', 'Ranic', 'Banja Luka', 1993),
(102, 'Sinisa', 'Marjanovic', 'Doboj', 1994),
(103, 'Dalibor', 'Savicic', 'Banja Luka', 1993);

-- --------------------------------------------------------

--
-- Table structure for table `radno_mjesto`
--

CREATE TABLE `radno_mjesto` (
  `id_radnog` int(11) NOT NULL,
  `jmbg` int(11) NOT NULL,
  `id_mjesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radno_mjesto`
--

INSERT INTO `radno_mjesto` (`id_radnog`, `jmbg`, `id_mjesta`) VALUES
(1, 100, 1),
(2, 101, 4),
(3, 101, 2),
(4, 103, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mjesto`
--
ALTER TABLE `mjesto`
  ADD PRIMARY KEY (`id_mjesta`);

--
-- Indexes for table `radnik`
--
ALTER TABLE `radnik`
  ADD PRIMARY KEY (`jmbg`);

--
-- Indexes for table `radno_mjesto`
--
ALTER TABLE `radno_mjesto`
  ADD PRIMARY KEY (`id_radnog`),
  ADD KEY `jmbg` (`jmbg`),
  ADD KEY `id_mjesta` (`id_mjesta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `radno_mjesto`
--
ALTER TABLE `radno_mjesto`
  ADD CONSTRAINT `radno_mjesto_ibfk_1` FOREIGN KEY (`jmbg`) REFERENCES `radnik` (`jmbg`),
  ADD CONSTRAINT `radno_mjesto_ibfk_2` FOREIGN KEY (`id_mjesta`) REFERENCES `mjesto` (`id_mjesta`);
--
-- Database: `ipkol`
--
CREATE DATABASE IF NOT EXISTS `ipkol` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ipkol`;

-- --------------------------------------------------------

--
-- Table structure for table `rezultati`
--

CREATE TABLE `rezultati` (
  `id_rezultata` int(11) NOT NULL,
  `id_tima1` int(11) NOT NULL,
  `id_tima2` int(11) NOT NULL,
  `rezultat1` int(11) NOT NULL,
  `rezultat2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rezultati`
--

INSERT INTO `rezultati` (`id_rezultata`, `id_tima1`, `id_tima2`, `rezultat1`, `rezultat2`) VALUES
(501, 101, 102, 3, 1),
(502, 102, 104, 4, 2),
(503, 104, 103, 6, 3),
(504, 101, 103, 3, 6),
(505, 104, 102, 1, 3),
(506, 103, 102, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE `tim` (
  `id_tima` int(11) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `godina_osnovan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`id_tima`, `ime`, `godina_osnovan`) VALUES
(101, 'Hercegovac', 1940),
(102, 'Borac', 1950),
(103, 'Leotar', 1990),
(104, 'Srbac', 1965);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rezultati`
--
ALTER TABLE `rezultati`
  ADD PRIMARY KEY (`id_rezultata`),
  ADD KEY `id_tima1` (`id_tima1`),
  ADD KEY `id_tima2` (`id_tima2`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`id_tima`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezultati`
--
ALTER TABLE `rezultati`
  ADD CONSTRAINT `rezultati_ibfk_1` FOREIGN KEY (`id_tima1`) REFERENCES `tim` (`id_tima`),
  ADD CONSTRAINT `rezultati_ibfk_2` FOREIGN KEY (`id_tima2`) REFERENCES `tim` (`id_tima`);
--
-- Database: `konj`
--
CREATE DATABASE IF NOT EXISTS `konj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `konj`;

-- --------------------------------------------------------

--
-- Table structure for table `dosije`
--

CREATE TABLE `dosije` (
  `indeks` int(11) NOT NULL,
  `ime` varchar(10) NOT NULL,
  `prezime` varchar(10) NOT NULL,
  `god_rodjenja` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosije`
--

INSERT INTO `dosije` (`indeks`, `ime`, `prezime`, `god_rodjenja`) VALUES
(1, 'pero', 'peric', 1991),
(2, 'dragan', 'draganovic', 1005);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosije`
--
ALTER TABLE `dosije`
  ADD PRIMARY KEY (`indeks`);
--
-- Database: `laravel-forum`
--
CREATE DATABASE IF NOT EXISTS `laravel-forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel-forum`;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laravel 5.8', 'laravel-58', '2019-08-30 05:17:48', '2019-08-30 05:17:48'),
(2, 'Vue js 3', 'vue-js-3', '2019-08-30 05:17:48', '2019-08-30 05:17:48'),
(3, 'Angular 7', 'angular-7', '2019-08-30 05:17:48', '2019-08-30 05:17:48'),
(4, 'Node js', 'node-js', '2019-08-30 05:17:48', '2019-08-30 05:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `user_id`, `title`, `content`, `reply_id`, `slug`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laravel', '<div><strong>Lorem Ipsum -&nbsp;</strong>Lorem ipsum</div>', 1, 'laravel', 1, '2019-08-30 05:18:41', '2019-08-30 05:18:55'),
(2, 2, 'Angular', '<div>asgasgasg</div>', 4, 'angular', 1, '2019-08-30 05:59:03', '2019-08-30 06:03:24'),
(3, 2, 'PHP', '<div>jiojij</div>', 8, 'php', 1, '2019-08-30 06:03:31', '2019-08-30 06:03:45'),
(5, 1, 'Angular java', '<div>Ovo je tekst</div>', NULL, 'angular-java', 2, '2019-09-20 10:47:59', '2019-09-20 10:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_30_011420_create_discussions_table', 1),
(4, '2019_08_30_011715_create_channels_table', 1),
(5, '2019_08_30_045334_create_replies_table', 1),
(6, '2019_08_30_063548_create_notifications_table', 1),
(7, '2019_08_30_081251_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00032c30-37ba-4e61-801a-252749975811', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 2, '{\"discussion\":{\"id\":3,\"user_id\":2,\"title\":\"PHP\",\"content\":\"<div>jiojij<\\/div>\",\"reply_id\":8,\"slug\":\"php\",\"channel_id\":1,\"created_at\":\"2019-08-30 08:03:31\",\"updated_at\":\"2019-08-30 08:03:45\",\"user\":{\"id\":2,\"name\":\"Marko\",\"email\":\"mark@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:58:54\",\"updated_at\":\"2019-08-30 07:58:54\"}}}', '2019-08-30 06:38:32', '2019-08-30 06:38:21', '2019-08-30 06:38:32'),
('22de69d6-96d9-4aac-857d-abafaf22fc41', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 1, '{\"discussion\":{\"id\":1,\"user_id\":1,\"title\":\"Laravel\",\"content\":\"<div><strong>Lorem Ipsum -&nbsp;<\\/strong>Lorem ipsum<\\/div>\",\"reply_id\":1,\"slug\":\"laravel\",\"channel_id\":1,\"created_at\":\"2019-08-30 07:18:41\",\"updated_at\":\"2019-08-30 07:18:55\",\"user\":{\"id\":1,\"name\":\"Aleksandar Djukic\",\"email\":\"djukicaleks91@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:18:20\",\"updated_at\":\"2019-08-30 07:18:20\"}}}', '2019-08-30 05:23:00', '2019-08-30 05:22:55', '2019-08-30 05:23:00'),
('2a3386d5-c05a-41e4-80a3-54ef5062a3d0', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 2, '{\"discussion\":{\"id\":2,\"user_id\":2,\"title\":\"Angular\",\"content\":\"<div>asgasgasg<\\/div>\",\"reply_id\":null,\"slug\":\"angular\",\"channel_id\":1,\"created_at\":\"2019-08-30 07:59:03\",\"updated_at\":\"2019-08-30 07:59:03\",\"user\":{\"id\":2,\"name\":\"Marko\",\"email\":\"mark@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:58:54\",\"updated_at\":\"2019-08-30 07:58:54\"}}}', '2019-08-30 06:38:32', '2019-08-30 05:59:11', '2019-08-30 06:38:32'),
('3d633a38-3f5d-4ea9-8424-ca8433f40187', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 2, '{\"discussion\":{\"id\":3,\"user_id\":2,\"title\":\"PHP\",\"content\":\"<div>jiojij<\\/div>\",\"reply_id\":null,\"slug\":\"php\",\"channel_id\":1,\"created_at\":\"2019-08-30 08:03:31\",\"updated_at\":\"2019-08-30 08:03:31\",\"user\":{\"id\":2,\"name\":\"Marko\",\"email\":\"mark@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:58:54\",\"updated_at\":\"2019-08-30 07:58:54\"}}}', '2019-08-30 06:38:32', '2019-08-30 06:03:41', '2019-08-30 06:38:32'),
('7cdd5ed2-a8d6-45a2-9c28-0e50afbbbdd4', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 1, '{\"discussion\":{\"id\":1,\"user_id\":1,\"title\":\"Laravel\",\"content\":\"<div><strong>Lorem Ipsum -&nbsp;<\\/strong>Lorem ipsum<\\/div>\",\"reply_id\":1,\"slug\":\"laravel\",\"channel_id\":1,\"created_at\":\"2019-08-30 07:18:41\",\"updated_at\":\"2019-08-30 07:18:55\",\"user\":{\"id\":1,\"name\":\"Aleksandar Djukic\",\"email\":\"djukicaleks91@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:18:20\",\"updated_at\":\"2019-08-30 07:18:20\"}}}', '2019-08-30 05:23:00', '2019-08-30 05:22:57', '2019-08-30 05:23:00'),
('a2d5dc43-9dfc-497c-8408-4a45f0274174', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 2, '{\"discussion\":{\"id\":2,\"user_id\":2,\"title\":\"Angular\",\"content\":\"<div>asgasgasg<\\/div>\",\"reply_id\":null,\"slug\":\"angular\",\"channel_id\":1,\"created_at\":\"2019-08-30 07:59:03\",\"updated_at\":\"2019-08-30 07:59:03\",\"user\":{\"id\":2,\"name\":\"Marko\",\"email\":\"mark@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:58:54\",\"updated_at\":\"2019-08-30 07:58:54\"}}}', '2019-08-30 06:38:32', '2019-08-30 05:59:11', '2019-08-30 06:38:32'),
('b2395a57-873e-4ea7-a38a-581e63c1e9f4', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 1, '{\"discussion\":{\"id\":1,\"user_id\":1,\"title\":\"Laravel\",\"content\":\"<div><strong>Lorem Ipsum -&nbsp;<\\/strong>Lorem ipsum<\\/div>\",\"reply_id\":null,\"slug\":\"laravel\",\"channel_id\":1,\"created_at\":\"2019-08-30 07:18:41\",\"updated_at\":\"2019-08-30 07:18:41\",\"user\":{\"id\":1,\"name\":\"Aleksandar Djukic\",\"email\":\"djukicaleks91@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:18:20\",\"updated_at\":\"2019-08-30 07:18:20\"}}}', '2019-08-30 05:18:57', '2019-08-30 05:18:52', '2019-08-30 05:18:57'),
('e2f2034e-efc3-4310-aa19-7c7851014f22', 'LaravelForum\\Notifications\\NewReplyAdded', 'LaravelForum\\User', 2, '{\"discussion\":{\"id\":3,\"user_id\":2,\"title\":\"PHP\",\"content\":\"<div>jiojij<\\/div>\",\"reply_id\":null,\"slug\":\"php\",\"channel_id\":1,\"created_at\":\"2019-08-30 08:03:31\",\"updated_at\":\"2019-08-30 08:03:31\",\"user\":{\"id\":2,\"name\":\"Marko\",\"email\":\"mark@gmail.com\",\"email_verified_at\":null,\"created_at\":\"2019-08-30 07:58:54\",\"updated_at\":\"2019-08-30 07:58:54\"}}}', '2019-08-30 06:38:32', '2019-08-30 06:03:43', '2019-08-30 06:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `user_id`, `discussion_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '<div>allalal</div>', '2019-08-30 05:18:50', '2019-08-30 05:18:50'),
(2, 1, 1, '<div>pero</div>', '2019-08-30 05:22:54', '2019-08-30 05:22:54'),
(3, 1, 1, '<div>pero</div>', '2019-08-30 05:22:56', '2019-08-30 05:22:56'),
(4, 2, 2, '<pre>asgasgag</pre>', '2019-08-30 05:59:10', '2019-08-30 05:59:10'),
(5, 2, 2, '<pre>asgasgag</pre>', '2019-08-30 05:59:10', '2019-08-30 05:59:10'),
(6, 2, 2, '<pre>asgasgag</pre>', '2019-08-30 05:59:12', '2019-08-30 05:59:12'),
(7, 2, 3, '<div>klklklmkl</div>', '2019-08-30 06:03:38', '2019-08-30 06:03:38'),
(8, 2, 3, '<div>klklklmkl</div>', '2019-08-30 06:03:41', '2019-08-30 06:03:41'),
(9, 2, 3, '<div>asgasgasg</div>', '2019-08-30 06:13:29', '2019-08-30 06:13:29'),
(10, 2, 1, '<div>agasgasg</div>', '2019-08-30 06:38:51', '2019-08-30 06:38:51'),
(11, 2, 2, '<div>asgasg</div>', '2019-08-30 06:39:48', '2019-08-30 06:39:48'),
(12, 2, 2, '<div>asgasg</div>', '2019-08-30 06:40:08', '2019-08-30 06:40:08'),
(13, 2, 2, '<div>asfas</div>', '2019-08-30 06:40:20', '2019-08-30 06:40:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar Djukic', 'djukicaleks91@gmail.com', NULL, '$2y$10$BdoYm3K/yrE0aL1BSZumSOYGhLzkOchPIfp9VaByA3qzUJjB/MdbO', NULL, '2019-08-30 05:18:20', '2019-08-30 05:18:20'),
(2, 'Marko', 'mark@gmail.com', NULL, '$2y$10$WD5nJHU.5ldt8MLwkF5KdOeTniYyS87DAlDGjC3t8MOVA/BY56zhW', NULL, '2019-08-30 05:58:54', '2019-08-30 05:58:54'),
(3, 'Marko', 'baka@gmail.com', NULL, '$2y$10$q359AzMqs8XQ/Qk8sEKc4.zpB0EEZgMKiqBavJwFfYk3kbcFHyxAy', NULL, '2019-08-30 06:45:29', '2019-08-30 06:45:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channels_slug_unique` (`slug`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discussions_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `laravel_cms`
--
CREATE DATABASE IF NOT EXISTS `laravel_cms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_cms`;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_10_162057_create_posts_table', 1),
('2019_06_10_162916_add_is_admin_column_to_posts_table', 1),
('2019_06_14_180549_create_roles_table', 1),
('2019_06_14_180754_create_users_role_table', 1),
('2019_06_14_185911_create_countries_table', 1),
('2019_06_14_185956_add_country_id_column_to_users', 1),
('2019_06_14_192447_create_photos_table', 1),
('2019_06_14_203250_create_videos_table', 1),
('2019_06_14_203313_create_tags_table', 1),
('2019_06_14_203357_create_taggables_table', 1),
('2019_06_20_155823_add_path_column_to_posts', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`, `is_admin`, `path`) VALUES
(1, 0, 'PHP', '', '2019-06-18 16:52:12', '2019-06-18 16:52:12', 0, ''),
(3, 0, 'JavaScript m', '', '2019-06-18 16:55:21', '2019-06-19 12:32:08', 0, ''),
(5, 0, 'Html', '', '2019-06-19 12:10:55', '2019-06-19 12:10:55', 0, ''),
(6, 0, 'css', '', '2019-06-19 12:17:22', '2019-06-19 12:17:22', 0, ''),
(7, 0, 'PHP', '', '2019-06-20 14:02:28', '2019-06-20 14:02:28', 0, 'aco.jpg'),
(8, 0, 'PHP', '', '2019-06-20 14:06:26', '2019-06-20 14:06:26', 0, 'aco.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `country_id`) VALUES
(1, 'Wiliam', 'djukicaleks@gmail.com', '1234', NULL, NULL, '2019-06-20 10:06:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `laravel_login`
--
CREATE DATABASE IF NOT EXISTS `laravel_login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_login`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', 'djukicaleks91@gmail.com', '$2y$10$18TPDdIcJRQq5nRd6WHY/uMgjoKm1ArnV7DUUDPC5UtlFK6QIWn3O', '04I98K0gEeg4hhJ4ufsGyDs6dALtPdkAM48Cw69CWD00doLh0Xy5UzauGH0B', '2019-03-27 17:13:37', '2019-03-27 19:36:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `laravel_middleware`
--
CREATE DATABASE IF NOT EXISTS `laravel_middleware` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_middleware`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_24_144958_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', NULL, NULL),
(2, 'subscriber', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aleksandar', 'djukicaleks91@gmail.com', '$2y$10$uLu/rjJ1jXAiISgRMpdNTO/Cx2ukwcMSyNJZoGZ2e4qLMKF91YPJ6', 'tv8jnMAZO5Re3NbzrWDLOM1uUyM1NxnIZI75yjpLc3EUuel7Sb7GeWJENOSN', '2019-06-24 13:03:50', '2019-06-24 13:36:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', 'djukicaleks91@gmail.com', '$2y$10$wiKxkO1E/fXy1tzI6UXHJez0SHVz3PoC11D2/MsDjh/MV1ZYoBdWC', 'QxsBSSHzbV0W41Mmt1fL1FRspGrHVZ2hKscHCexVyK5ByrY6bU7wn8AlURPC', '2019-06-20 14:23:14', '2019-06-20 14:33:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `mail`
--
CREATE DATABASE IF NOT EXISTS `mail` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mail`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `mania`
--
CREATE DATABASE IF NOT EXISTS `mania` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mania`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `is_active`, `author`, `photo`, `email`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Admin', '1564332113administrator.png', 'admin@gmail.com', 'Laravel je super framework :D', '2019-07-28 14:53:40', '2019-07-28 14:54:55'),
(2, 3, 1, 'Admin', '1564332113administrator.png', 'admin@gmail.com', 'Razmisljas li o ucenju nekih frameworka za php? Pozz', '2019-07-28 14:54:07', '2019-07-28 14:54:57'),
(3, 5, 1, 'Admin', '1564332113administrator.png', 'admin@gmail.com', 'Pozdrav, zanima me koliko dugo vec radis C#?', '2019-07-28 14:54:47', '2019-07-28 14:54:58'),
(4, 1, 1, 'Aleksandar Djukic', '1564331647aco.jpg', 'djukicaleks91@gmail.com', 'Jeste i ja se slazem...pozz', '2019-07-28 14:56:16', '2019-07-28 14:58:53'),
(5, 4, 1, 'Aleksandar Djukic', '1564331647aco.jpg', 'djukicaleks91@gmail.com', 'Potreban nam je java programer, ako si zainteresovan...javi se na mail.', '2019-07-28 14:57:16', '2019-07-29 12:01:17'),
(6, 3, 1, 'Aleksandar Djukic', '1564331647aco.jpg', 'djukicaleks91@gmail.com', 'Koliko dugo vec radis u php?', '2019-07-28 15:01:56', '2019-07-28 15:02:04'),
(7, 3, 1, 'User', '1564332144user.png', 'user@gmail.com', 'Planiram da pocnem sa ucenjem Symphony.Pozz', '2019-07-28 15:08:55', '2019-07-28 15:10:04'),
(8, 5, 1, 'Ana Pavlovic', '1564331740ana.jpg', 'ana@gmail.com', 'Radim vec 3 godine', '2019-07-28 15:10:35', '2019-07-28 15:10:35'),
(9, 4, 1, 'User', '1564332144user.png', 'user@gmail.com', 'Hvala na ponudi, ali radim vec u jednoj firmi.', '2019-07-28 15:11:15', '2019-07-28 15:11:15'),
(11, 2, 1, 'Aleksandar Djukic', '1564331647aco.jpg', 'djukicaleks91@gmail.com', 'Angular je super...pozz', '2019-07-28 20:56:30', '2019-07-28 20:56:46'),
(12, 2, 1, 'User', '1564332144user.png', 'user@gmail.com', 'Slazem se :D', '2019-07-28 20:57:27', '2019-07-28 20:58:50'),
(13, 5, 1, 'Marko Markovic', 'No picture', 'mark@gmail.com', 'Pozdrav', '2019-07-28 21:51:09', '2019-07-28 21:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_07_17_122421_create_posts_table', 1),
('2019_07_17_122612_create_roles_table', 1),
('2019_07_18_164855_create_comments_table', 1),
('2019_07_18_165907_create_photos_table', 1),
('2019_07_18_170225_create_comment_replies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('djukicaleks91@gmail.com', 'e4482a3817b7ac74189fcbc067a15cd6eba755ab4c4b7181684e6022f7d0b01c', '2019-07-28 16:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `path`, `created_at`, `updated_at`) VALUES
(1, '1564331647aco.jpg', '2019-07-28 14:34:07', '2019-07-28 14:34:07'),
(2, '1564331678laravel1.jpg', '2019-07-28 14:34:38', '2019-07-28 14:34:38'),
(3, '1564331716baka.jpg', '2019-07-28 14:35:16', '2019-07-28 14:35:16'),
(4, '1564331740ana.jpg', '2019-07-28 14:35:40', '2019-07-28 14:35:40'),
(5, '1564331760katarina.jpg', '2019-07-28 14:36:00', '2019-07-28 14:36:00'),
(6, '1564331808angular.jpg', '2019-07-28 14:36:48', '2019-07-28 14:36:48'),
(7, '1564332113administrator.png', '2019-07-28 14:41:53', '2019-07-28 14:41:53'),
(8, '1564332144user.png', '2019-07-28 14:42:24', '2019-07-28 14:42:24'),
(9, '1564332278php.jpg', '2019-07-28 14:44:38', '2019-07-28 14:44:38'),
(10, '1564332390java.jpeg', '2019-07-28 14:46:30', '2019-07-28 14:46:30'),
(11, '1564332513csharp.jpg', '2019-07-28 14:48:33', '2019-07-28 14:48:33'),
(12, '1564332694javascript.jpg', '2019-07-28 14:51:34', '2019-07-28 14:51:34'),
(13, '1564332780pyton.jpg', '2019-07-28 14:53:00', '2019-07-28 14:53:00'),
(14, '1564338034c.png', '2019-07-28 16:20:34', '2019-07-28 16:20:34'),
(15, '1564357989internet.jpg', '2019-07-28 21:53:09', '2019-07-28 21:53:09'),
(16, '15644259361024px-PMF_cirilica.png', '2019-07-29 16:45:36', '2019-07-29 16:45:36'),
(17, '156442623055608124_321227735205694_7893735215250538496_n.jpg', '2019-07-29 16:50:30', '2019-07-29 16:50:30'),
(18, '1564433081angular.jpg', '2019-07-29 18:44:41', '2019-07-29 18:44:41'),
(19, '1564440350php.jpg', '2019-07-29 20:45:50', '2019-07-29 20:45:50'),
(20, '1564441316php.jpg', '2019-07-29 21:01:56', '2019-07-29 21:01:56'),
(21, '1564441331php.jpg', '2019-07-29 21:02:11', '2019-07-29 21:02:11'),
(22, '1565965263crossfit-3409475_1280.png', '2019-08-16 12:21:03', '2019-08-16 12:21:03'),
(23, '1565965282danielle-cerullo-782570-unsplash.jpg', '2019-08-16 12:21:22', '2019-08-16 12:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `photo_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 'Laravel', 'Šta je Laravel, da li je on pravi izbor za vaš projekat i odakle da krenete sa učenjem najomiljenijeg framework-a u programerskoj zajednici - Saznajte ovde.', '2019-07-28 14:34:38', '2019-08-16 12:21:22'),
(2, 1, 6, 'Angular', ' Šta je AngularJS? AngularJS je JavaScript MVC framework napravljen od strane Google-a koji vam omogućava da pravite dobro struktuirane, ...', '2019-07-28 14:36:48', '2019-07-28 14:36:48'),
(3, 6, 21, 'PHP', 'PHP (rekurzivni akronim i backronim za „PHP: Hypertext Preprocessor“, prije „Personal Home Page Tools“) je jedan programski jezik koji se orijentira po C i Perl .', '2019-07-28 14:44:38', '2019-07-29 21:02:11'),
(4, 6, 10, 'Java', 'Java je objektno orijentirani programski jezik koji su razvili James Gosling, Patrick Naughton i drugi inženjeri u tvrtci Sun Microsystems. Razvoj je počeo 1991.', '2019-07-28 14:46:30', '2019-07-28 14:46:30'),
(5, 3, 11, 'C#', 'C# je izumljen s ciljem da .NET platforma dobije programski jezik, koji bi maksimalno iskoristio njezine sposobnosti. Sličan je programskim jezicima Java i C++.', '2019-07-28 14:48:33', '2019-07-28 14:48:33'),
(6, 5, 12, 'JavaScript', 'Šta je JavaScript? JavaScript je objektno zasnovan skriptni jezik. Uključujemo ga u web stranicu da bi je učinili dinamičnijom. HTML (osnovni kod web stranica) ...', '2019-07-28 14:51:34', '2019-07-28 14:51:34'),
(7, 5, 13, 'Pyton', 'Python je programski jezik opće namjene, interpretiran i visoke razine kojeg je stvorio Guido van Rossum 1990. godine (prva javna inačica objavljena je u ...', '2019-07-28 14:53:00', '2019-07-28 14:53:00'),
(8, 2, 14, 'C++', 'Zbog velike potražnje za objektno orijentiranim jezicima te izrazitim sposobnostima istih, specifikacija programskog jezika C++ ratificirana je 1998. kao standard ...', '2019-07-28 16:20:34', '2019-07-28 16:20:34'),
(9, 7, 15, 'Internet', 'Internet je javno dostupna globalna paketna podatkovna mreža koja zajedno povezuje računala i računalne mreže korištenjem istoimenog protokola (internetski ', '2019-07-28 21:53:09', '2019-07-28 21:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT '2',
  `is_active` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `is_active`, `name`, `email`, `photo_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Aleksandar Djukic', 'djukicaleks91@gmail.com', 1, '$2y$10$32FvRTiHPRLmkCzjFzLMqO2/0BsApYtcw4bEGchOgUfE9wpuSEIg2', 'X1h482QofQw7HEfs5X2wFhompi7k2QdqDl6lK2Xl1M3drKlkIJAwxx1ZJZ5a', '2019-07-28 14:31:23', '2019-09-20 13:25:06'),
(2, 2, 1, 'Milos Balaban', 'baka@gmail.com', 3, '$2y$10$kphPudz9yRRvZkdiYR6Vne1gQy3gisdzcfIHJkweIV4YnYp46Burm', 'lCZu3pR11dzhnfsabp2qWsl78Vka8WL2lgYE2tDpYPHReghYXBTmIBxYtGG7', '2019-07-28 14:35:16', '2019-07-30 15:09:37'),
(3, 2, 1, 'Ana Pavlovic', 'ana@gmail.com', 4, '$2y$10$tlIT1VMTWHQku5as9UqQUeV156gbJ.xSuuUNk7tB1XOBsVGxXJXFe', 'YD7de2gvq77ZUhoT53C1QK0iN9TRfJ4ZrBgXPGFfzjxwStpxYrfbKymmD8Tq', '2019-07-28 14:35:40', '2019-08-16 12:30:32'),
(4, 2, 1, 'Katarina Markovic', 'kata@gmail.com', 5, '$2y$10$IbGWHy2doYGCfYsVvOOIe.4CNdqpi2ep6hIZQTiDX.xgvtMCLGEQO', NULL, '2019-07-28 14:36:00', '2019-07-28 14:36:00'),
(5, 1, 1, 'Admin', 'admin@gmail.com', 7, '$2y$10$9mOhv9RFvrgEy/OMNu9dJeqU6WiZmw1kLc3RNLPuqcXAIVb2khEmS', 'U9EDclkxm9tF0focie8VtbisChbsnpvE4pUlvqRq4aPXzo4JUneGqe2EdXHu', '2019-07-28 14:41:53', '2019-07-28 14:55:19'),
(6, 2, 1, 'User', 'user@gmail.com', 8, '$2y$10$PDnnEyWqGKjYy3oTGWL7Cej5dqFW1blnU6l0y8POfoEKYCKftVoLS', 'mRSAlyslnm20bsIEQNU1T1sH6FeKumfBs0Vf5n50exLwllzQzPs6h63HZRYn', '2019-07-28 14:42:24', '2019-07-29 21:02:27'),
(7, 2, 0, 'Marko Markovic', 'mark@gmail.com', 0, '$2y$10$7yRwjGr8Xbc4QuQvHZCVfujyz9PX13UzHK1mtIgAY6lqGKJ0UthTK', 'eEGOUqOEj0ochWqaZs2q13vsbte23zLf7f2DQopx7CCSxsZojaR8A4w0OzQx', '2019-07-28 21:40:50', '2019-07-28 21:53:42'),
(9, 1, 1, 'Petar Petrovic', 'pero88@gmail.com', 0, '$2y$10$G2fHfRJCQyxhE31/nWM5R.lkog7XIYBf.g6apR2s/mZgiEjK9a82a', NULL, '2019-07-29 18:35:54', '2019-07-29 18:35:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_index` (`post_id`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_replies_comment_id_index` (`comment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_photo_id_index` (`photo_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD CONSTRAINT `comment_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `manytomany`
--
CREATE DATABASE IF NOT EXISTS `manytomany` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `manytomany`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_15_144853_create_roles_table', 1),
('2019_06_15_145001_create_role_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'subscriber', '2019-06-15 13:05:17', '2019-06-15 13:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', 'djukicaleks81@gmail.com', '111111', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_index` (`user_id`),
  ADD KEY `role_user_role_id_index` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `mojabaza`
--
CREATE DATABASE IF NOT EXISTS `mojabaza` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mojabaza`;

-- --------------------------------------------------------

--
-- Table structure for table `firme`
--

CREATE TABLE `firme` (
  `id` int(11) NOT NULL,
  `naziv` varchar(20) DEFAULT NULL,
  `grad` varchar(20) DEFAULT NULL,
  `dodan_u` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `firme`
--

INSERT INTO `firme` (`id`, `naziv`, `grad`, `dodan_u`) VALUES
(1, 'Infoars', 'Banjaluka', 'Prvi'),
(2, 'Infopuls', 'Srbac', 'drugi'),
(3, 'Infomedia', 'Gradiska', 'Treci'),
(4, '', '', NULL),
(5, 'Infoinfo', 'Bijeljina', NULL),
(6, 'Infoinfo', 'Bijeljina', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `godiste` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `email`, `password`, `godiste`) VALUES
(1, '', '', '0000-00-00'),
(2, 'pero@gmail.com', '1\' or \'1\'=\'1', '0000-00-00'),
(3, 'pero@gmail.com', '1\' or \'1\'=\'1', '0000-00-00'),
(4, 'pero@gmail.com', '1\' or \'1\'=\'1', '0000-00-00'),
(5, 'pero@gmail.com', '1\' or \'1\'=\'1', '0000-00-00'),
(6, 'pero@gmail.com', '1\' or \'1\'=\'1', '0000-00-00'),
(7, 'markomarkovic@gmail.com', 'marko', '2245-12-22'),
(8, 'markomarkovic@gmail.com', 'marko', '2245-12-22'),
(9, 'zoki500@hotmail.com', '45747', '0000-00-00'),
(10, 'djukicaleks91@gmail.com', 'safaf', '2019-12-30'),
(11, 'djukicaleks91@gmail.com', 'safaf', '2019-12-30'),
(12, 'djukicaleks91@gmail.com', 'safaf', '2019-12-30'),
(13, 'asdasd@gmail.com', 'asfdasf', '1111-11-11'),
(14, 'asdasd@gmail.com', 'asfdasf', '1111-11-11'),
(15, '111111@gmail.com', 'safaf', '0011-11-11'),
(16, '111111@gmail.com', 'safaf', '0011-11-11'),
(17, 'djukicaleks91@gmail.com', 'afasfas', '1111-11-11'),
(18, '111111@gmail.com', 'kkkkjkj', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `projekti`
--

CREATE TABLE `projekti` (
  `id` int(11) NOT NULL,
  `naziv` varchar(20) DEFAULT NULL,
  `opis` text,
  `dodan_u` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projekti`
--

INSERT INTO `projekti` (`id`, `naziv`, `opis`, `dodan_u`) VALUES
(1, 'Marketing', 'Internet Marketing', 'Prvi'),
(2, 'Prodaja', 'Internet Prodaja', 'Drugi'),
(3, 'Kupovina', 'Internet Kupovina', 'Treci');

-- --------------------------------------------------------

--
-- Table structure for table `radnici`
--

CREATE TABLE `radnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `zanimanje` text,
  `pol` tinyint(4) DEFAULT NULL,
  `firma` int(11) DEFAULT NULL,
  `dodan_u` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radnici`
--

INSERT INTO `radnici` (`id`, `ime`, `prezime`, `datum_rodjenja`, `zanimanje`, `pol`, `firma`, `dodan_u`, `email`, `password`) VALUES
(1, 'Pero', 'Peric', '1991-10-02', 'Senior programer', 0, 1, 'Prvi', 'pero@gmail.com', 'peropero'),
(2, 'Dragan', 'Draganovic', '1998-10-06', 'Web dizajner', 0, 1, 'Drugi', 'dragan@gmail.com', 'dragandragan'),
(3, 'Maja', 'Markovic', '1994-10-31', 'Graficki dizajner', 1, 2, 'Treci', '', ''),
(4, 'Zeljka', 'Zeljkovic', '2018-10-23', 'Java programer', 1, 2, 'Cetvrti', '', ''),
(5, 'Bojan', 'Bojanovic', '2018-05-08', 'Web dizajner', 0, 3, 'Peti', '', ''),
(6, 'Milan', 'Milanovic', '2018-10-22', 'Php programer', 0, 3, 'Sesti', '', ''),
(15, 'pero', 'petric', NULL, NULL, NULL, NULL, NULL, '', ''),
(18, 'asfasfa', 'asfasfasfasf', NULL, NULL, NULL, NULL, NULL, '', ''),
(19, 'Marko', 'Markovicev', NULL, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rad_pro`
--

CREATE TABLE `rad_pro` (
  `id` int(11) NOT NULL,
  `radnik` int(20) DEFAULT NULL,
  `projekat` int(20) DEFAULT NULL,
  `dodan_u` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rad_pro`
--

INSERT INTO `rad_pro` (`id`, `radnik`, `projekat`, `dodan_u`) VALUES
(1, 2, 1, 'Prvi'),
(2, 1, 2, 'Drugi'),
(3, 3, 3, 'Treci'),
(4, 4, 3, 'Cetvrti'),
(5, 5, 2, 'Peti'),
(6, 6, 1, 'Sesti');

-- --------------------------------------------------------

--
-- Table structure for table `skole`
--

CREATE TABLE `skole` (
  `id` int(11) NOT NULL,
  `naziv` varchar(20) NOT NULL,
  `ucenik` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skole`
--

INSERT INTO `skole` (`id`, `naziv`, `ucenik`) VALUES
(1, 'ETS', 550),
(2, 'ETS', 550),
(3, 'ETS', 550),
(4, 'aaa', 530),
(5, 'bbb', 534),
(6, 'ETS', 550),
(7, 'aaa', 530),
(8, 'bbb', 534),
(9, 'ETS', 550),
(10, 'aaa', 530),
(11, 'bbb', 534),
(12, 'ETS', 550),
(13, 'aaa', 530),
(14, 'bbb', 534),
(15, 'Elektro', 0),
(16, 'ETS', 550),
(17, 'aaa', 530),
(18, 'bbb', 534),
(19, 'Elektro', 0),
(20, 'Elektro', 0),
(21, 'Elektro', 0),
(22, 'Zarko', 0),
(23, 'Zarko', 666),
(24, 'Zarko', 325),
(25, 'Zarko', 325),
(26, 'ETS', 550),
(27, 'aaa', 530),
(28, 'bbb', 534),
(29, 'ETS', 550),
(30, 'aaa', 530),
(31, 'bbb', 534),
(32, 'ETS', 550),
(33, 'aaa', 530),
(34, 'bbb', 534);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firme`
--
ALTER TABLE `firme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projekti`
--
ALTER TABLE `projekti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radnici`
--
ALTER TABLE `radnici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rad_pro`
--
ALTER TABLE `rad_pro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skole`
--
ALTER TABLE `skole`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firme`
--
ALTER TABLE `firme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `projekti`
--
ALTER TABLE `projekti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `radnici`
--
ALTER TABLE `radnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `rad_pro`
--
ALTER TABLE `rad_pro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `skole`
--
ALTER TABLE `skole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Database: `mreze`
--
CREATE DATABASE IF NOT EXISTS `mreze` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mreze`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `adresa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `adresa`) VALUES
(1, 'Pero', 'Peric', 'Gunduliceva'),
(2, 'Marko', 'Markovic', 'Mome Vidovica'),
(3, 'Drago', 'Dragic', 'Mise Stupara'),
(4, 'Ivan', 'Ivanovic', 'Zdravka Celara'),
(5, 'Ivana', 'Cadjo', 'Dubicka');

-- --------------------------------------------------------

--
-- Table structure for table `poruka`
--

CREATE TABLE `poruka` (
  `id` int(11) NOT NULL,
  `id_korisnik_salje` int(11) NOT NULL,
  `id_korisnik_prima` int(11) NOT NULL,
  `vrijeme` date DEFAULT NULL,
  `sadrzaj` text NOT NULL,
  `procitana` smallint(6) NOT NULL,
  `poslana` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poruka`
--

INSERT INTO `poruka` (`id`, `id_korisnik_salje`, `id_korisnik_prima`, `vrijeme`, `sadrzaj`, `procitana`, `poslana`) VALUES
(1, 100, 1000, '2019-02-06', 'Cao profesore, kako ste danas?', 1, 1),
(2, 101, 1001, '2019-02-12', 'Kad je datum ispita?', 0, 1),
(3, 102, 1002, '2019-02-19', 'Jesi mi dobar?', 0, 0),
(4, 103, 1003, '2019-02-11', 'Olaaaa ', 1, 1),
(5, 104, 1004, '2019-02-06', 'asfafasfasfgagafa a faga ga', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poruka`
--
ALTER TABLE `poruka`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `poruka`
--
ALTER TABLE `poruka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poruka`
--
ALTER TABLE `poruka`
  ADD CONSTRAINT `poruka_ibfk_1` FOREIGN KEY (`id`) REFERENCES `korisnik` (`id`);
--
-- Database: `mvcbase`
--
CREATE DATABASE IF NOT EXISTS `mvcbase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mvcbase`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`) VALUES
(1, 0, 'Ovo je naslov prvog posta', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '2019-06-03 21:05:55'),
(2, 0, 'Ovo je naslov drugog posta', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', '2019-06-03 21:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Marko Markovic', 'marko92@gmail.com', '123456', '2019-06-03 21:06:48'),
(2, 'Petar Petrovic', 'petar@hotmail.com', '111111', '2019-06-03 21:06:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `onetomany`
--
CREATE DATABASE IF NOT EXISTS `onetomany` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onetomany`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_15_142012_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', 'djukicaleks91@gmail.com', '123456', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `onetoone`
--
CREATE DATABASE IF NOT EXISTS `onetoone` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onetoone`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_15_131827_create_addresses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar', 'djukicaleks91@gmail.com', '123456', NULL, '2019-06-04 22:00:00', '2019-06-04 22:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `pdologreg`
--
CREATE DATABASE IF NOT EXISTS `pdologreg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pdologreg`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `username`, `password`, `name`, `email`) VALUES
(1, 'admin', '123456', 'Aleksandar Djukic', 'djukicaleks91@gmail.com'),
(2, 'korisnik', '123', 'Marko Markovic', 'marko@hotmail.com'),
(3, 'Pero1', 'acoaco', 'Markovic', 'mark@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `pdoposts`
--
CREATE DATABASE IF NOT EXISTS `pdoposts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pdoposts`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `author`, `is_published`, `created_at`) VALUES
(1, 'Post 1', 'This is updated post', 'Marko Markovic', 1, '2019-05-10 18:22:41'),
(2, 'Post 2', 'Ovo je post broj 2', 'Dragan', 1, '2019-05-10 18:30:34'),
(3, 'Post five', 'This is post five', 'Aleksandar', 1, '2019-05-10 20:37:44'),
(4, 'Post five', 'This is post five', 'Aleksandar', 1, '2019-05-10 20:38:23'),
(5, 'Post five', 'This is post five', 'Aleksandar', 1, '2019-05-10 20:39:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `photo_gallery`
--
CREATE DATABASE IF NOT EXISTS `photo_gallery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `photo_gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'test', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"table_structure[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"table_data[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'bazatest', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"table_structure[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"table_data[]\":[\"narudzbina\",\"narudzbina_proizvod\",\"proizvod\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'database', 'mvcbase', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"posts\",\"users\"],\"table_structure[]\":[\"posts\",\"users\"],\"table_data[]\":[\"posts\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'database', 'calculator', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":\"rezultati\",\"table_structure[]\":\"rezultati\",\"table_data[]\":\"rezultati\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(5, 'root', 'database', 'mania', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"comments\",\"comment_replies\",\"migrations\",\"password_resets\",\"photos\",\"posts\",\"roles\",\"users\"],\"table_structure[]\":[\"comments\",\"comment_replies\",\"migrations\",\"password_resets\",\"photos\",\"posts\",\"roles\",\"users\"],\"table_data[]\":[\"comments\",\"comment_replies\",\"migrations\",\"password_resets\",\"photos\",\"posts\",\"roles\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(6, 'root', 'server', 'todobase', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"antiks\",\"baza\",\"bazaa\",\"bazamania\",\"bazica\",\"blog\",\"calculator\",\"cms-blog\",\"codehacking\",\"cuss_app\",\"cus_app\",\"devtest\",\"ecommerce\",\"ip\",\"ipkol\",\"konj\",\"laravel-forum\",\"laravel_cms\",\"laravel_login\",\"laravel_middleware\",\"login\",\"mail\",\"mania\",\"manytomany\",\"mojabaza\",\"mreze\",\"mvcbase\",\"onetomany\",\"onetoone\",\"pdologreg\",\"pdoposts\",\"photo_gallery\",\"phpmyadmin\",\"polymorphic\",\"polymorphicmanytomany\",\"project1\",\"project2\",\"radnici\",\"shareboard\",\"shareposts\",\"skola\",\"student\",\"test\",\"tmvc\",\"todo\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cms-blog\",\"table\":\"users\"},{\"db\":\"project2\",\"table\":\"users\"},{\"db\":\"cms-blog\",\"table\":\"posts\"},{\"db\":\"cms-blog\",\"table\":\"tags\"},{\"db\":\"mania\",\"table\":\"photos\"},{\"db\":\"mania\",\"table\":\"password_resets\"},{\"db\":\"mania\",\"table\":\"comments\"},{\"db\":\"mania\",\"table\":\"comment_replies\"},{\"db\":\"mania\",\"table\":\"posts\"},{\"db\":\"mania\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'bazamania', 'users', '[]', '2019-02-20 17:21:40'),
('root', 'bazica', 'korisnik', '{\"sorted_col\":\"`id` ASC\"}', '2018-12-11 16:44:56'),
('root', 'codehacking', 'categories', '{\"sorted_col\":\"`categories`.`id` ASC\"}', '2019-07-02 21:02:28'),
('root', 'student', 'dosije', '{\"sorted_col\":\"`dosije`.`godina_rodjenja`  DESC\"}', '2019-01-18 17:50:53'),
('root', 'student', 'ispit', '[]', '2018-12-12 18:57:22'),
('root', 'student', 'ispitni_rok', '{\"sorted_col\":\"`ispitni_rok`.`godina_roka` ASC\"}', '2018-12-12 16:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-09-20 16:27:45', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `polymorphic`
--
CREATE DATABASE IF NOT EXISTS `polymorphic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `polymorphic`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_18_085129_create_staff_table', 1),
('2019_06_18_085142_create_products_table', 1),
('2019_06_18_085154_create_photos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `path`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(5, 'example.jpg', 1, 'App\\Staff', '2019-06-18 07:20:27', '2019-06-18 07:20:27'),
(6, 'novaslika.jpg', 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Laravel kurs', NULL, NULL),
(2, 'Php kurs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Aleksandar Djukic', '2019-06-11 22:00:00', '2019-06-12 22:00:00'),
(2, 'Marko Markovic', '2019-06-18 22:00:00', '2019-06-11 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `polymorphicmanytomany`
--
CREATE DATABASE IF NOT EXISTS `polymorphicmanytomany` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `polymorphicmanytomany`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_06_18_092741_create_posts_table', 1),
('2019_06_18_092749_create_videos_table', 1),
('2019_06_18_092759_create_tags_table', 1),
('2019_06_18_092806_create_taggables_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Myfirst post', '2019-06-18 07:40:28', '2019-06-18 07:40:28'),
(2, 'Myfirst post', '2019-06-18 07:41:27', '2019-06-18 07:41:27'),
(3, 'Myfirst post', '2019-06-18 07:43:12', '2019-06-18 07:43:12'),
(4, 'Myfirst post', '2019-06-18 07:43:41', '2019-06-18 07:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'php', NULL, NULL),
(2, 'laravel', NULL, NULL),
(3, 'oooo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project1`
--
CREATE DATABASE IF NOT EXISTS `project1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project1`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_21_145940_create_to_dos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `descrp` text NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `name`, `descrp`, `completed`, `created_at`, `updated_at`) VALUES
(1, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 0, '2019-09-20 14:10:32', '2019-09-20 14:10:32'),
(2, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 1, '2019-09-20 14:10:41', '2019-09-20 14:11:05'),
(3, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 0, '2019-09-20 14:10:50', '2019-09-20 14:10:50'),
(4, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 0, '2019-09-20 14:11:02', '2019-09-20 14:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project2`
--
CREATE DATABASE IF NOT EXISTS `project2` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `project2`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'News', '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(2, 'Marketing', '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(3, 'Partnerships', '2019-08-29 19:53:07', '2019-08-29 19:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_23_141708_create_posts_table', 1),
(4, '2019_08_23_141744_create_categories_table', 1),
(5, '2019_08_25_140913_add_soft_deletes_to_posts_table', 1),
(6, '2019_08_26_133830_create_tags_table', 1),
(7, '2019_08_26_141454_create_post_tag_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `content`, `image`, `user_id`, `category_id`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'We relocated our office to a new designed garage', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<div><strong><br>The standard Lorem Ipsum passage, used since the 1500s<br></strong><br></div><div>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"<br><br></div>', 'posts/6.jpg', 2, 1, NULL, '2019-08-29 19:53:07', '2019-08-29 22:39:48', '2019-08-29 22:39:48'),
(2, 'Best practices for minimalist design with example', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book. \r\n                         .', '<div>Lorem Ipsum is simply dummy text of the printing and typesetting industry.&nbsp;</div>', 'posts/7.jpg', 2, 1, '2019-08-22 10:00:00', '2019-08-29 19:53:07', '2019-08-29 23:02:11', NULL),
(3, 'New published books to read by a product designer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<div>Lorem Ipsum is simply dummy text of the printing and typesetting industry.&nbsp;</div>', 'posts/8.jpg', 2, 2, '2019-08-07 10:00:00', '2019-08-29 19:53:07', '2019-08-29 23:03:03', NULL),
(4, 'This is why it\'s time to ditch dress codes at work', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<div>knknk</div>', 'posts/6.jpg', 3, 1, '2019-08-13 10:00:00', '2019-08-29 19:53:07', '2019-08-29 23:04:16', NULL),
(5, 'Top 5 brilliant content marketing strategies', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<div>Lorem Ipsum is simply dummy text of the printing and typesetting industry.&nbsp;</div>', 'posts/7.jpg', 3, 2, '2019-08-08 10:00:00', '2019-08-29 19:53:07', '2019-08-29 23:03:14', NULL),
(6, 'Congratulate and thank to Maryam for joining our team', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n                              Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \r\n                              when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<div>Lorem Ipsum is simply dummy text of the printing and typesetting industry.&nbsp;</div>', 'posts/6.jpg', 3, 3, '2019-08-06 10:00:00', '2019-08-29 19:53:07', '2019-08-29 23:03:34', NULL),
(7, 'Laravel', 'Ovo je laravel', '<div>Laravel laravel</div>', 'posts/UhGrUPqunlBQzTSprjUpMLzSVQKtli2B1EzFRmJQ.jpeg', 2, 1, '2019-08-15 10:00:00', '2019-08-29 22:42:18', '2019-08-29 22:42:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 3, 1, NULL, NULL),
(6, 3, 3, NULL, NULL),
(7, 7, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'job', '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(2, 'customize', '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(3, 'record', '2019-08-29 19:53:07', '2019-08-29 19:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('writer','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'writer',
  `about` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `about`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aco', 'aco-djukic@hotmail.com', 'admin', NULL, NULL, '$2y$10$IsLtRgb.KDxxW4Xr4U3rL.fxo9/IJTx6urd3EnY8RP.QHn8n5tPsG', NULL, '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(2, 'Aleksandar', 'djukicaleks91@gmail.com', 'writer', NULL, NULL, '$2y$10$D3Wn8aWjipDzdNoid5xPZOPgo7w359ryUnzE/09UliomXsJshppMq', NULL, '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(3, 'Marko', 'markoo@gmail.com', 'writer', NULL, NULL, '$2y$10$Kt1.JUUew7IOSO38jEgsIuT.9r9wNI4M7D0RB8mNn4AsjucHi823G', NULL, '2019-08-29 19:53:07', '2019-08-29 19:53:07'),
(4, 'Marko', 'mark@gmail.com', 'admin', NULL, NULL, '$2y$10$zDjMdfbb2NJEnR5h92b7puBE95.ShYjjzdT4RHwbWLr0XO/UfI05e', NULL, '2019-08-30 16:50:18', '2019-08-30 16:50:18'),
(5, 'Aleksandar Djukic', 'baka@gmail.com', 'writer', NULL, NULL, '$2y$10$N8dK/5SeKMkgvhMaQ06Bku7a7R2vrRM.y5oMC6xMOb5sWe7s0z69u', NULL, '2019-09-06 10:46:48', '2019-09-06 10:46:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `radnici`
--
CREATE DATABASE IF NOT EXISTS `radnici` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `radnici`;

-- --------------------------------------------------------

--
-- Table structure for table `mjesto`
--

CREATE TABLE `mjesto` (
  `id_mjesta` int(20) NOT NULL,
  `naziv_mjesta` varchar(20) NOT NULL,
  `grad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mjesto`
--

INSERT INTO `mjesto` (`id_mjesta`, `naziv_mjesta`, `grad`) VALUES
(21, 'Svodna', 'Novi_Grad'),
(22, 'Celinac', 'Banjaluka'),
(23, 'Stanari', 'Doboj');

-- --------------------------------------------------------

--
-- Table structure for table `radnik`
--

CREATE TABLE `radnik` (
  `jmbg` int(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `mjesto_rodjenja` varchar(30) NOT NULL,
  `godina_rodjenja` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radnik`
--

INSERT INTO `radnik` (`jmbg`, `ime`, `prezime`, `mjesto_rodjenja`, `godina_rodjenja`) VALUES
(1, 'Marko', 'Markovic', 'Novi_Grad', 1993),
(2, 'Sinisa', 'Marjanovic', 'Doboj', 1991),
(3, 'Dalibor', 'Savicic', 'Banjaluka', 1993);

-- --------------------------------------------------------

--
-- Table structure for table `radno_mjesto`
--

CREATE TABLE `radno_mjesto` (
  `id_radnog` int(20) NOT NULL,
  `jmbg` int(20) NOT NULL,
  `id_mjesta` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radno_mjesto`
--

INSERT INTO `radno_mjesto` (`id_radnog`, `jmbg`, `id_mjesta`) VALUES
(46, 79, 65),
(44, 77, 88),
(45, 78, 94);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mjesto`
--
ALTER TABLE `mjesto`
  ADD PRIMARY KEY (`id_mjesta`);

--
-- Indexes for table `radnik`
--
ALTER TABLE `radnik`
  ADD PRIMARY KEY (`jmbg`);

--
-- Indexes for table `radno_mjesto`
--
ALTER TABLE `radno_mjesto`
  ADD PRIMARY KEY (`id_mjesta`);
--
-- Database: `shareboard`
--
CREATE DATABASE IF NOT EXISTS `shareboard` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shareboard`;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(22) NOT NULL,
  `body` text NOT NULL,
  `link` varchar(22) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`id`, `user_id`, `title`, `body`, `link`, `create_date`) VALUES
(1, 100, 'Naslov', 'Ovo je prvi naslov so sam napravio', '', '2019-04-13 01:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `shareposts`
--
CREATE DATABASE IF NOT EXISTS `shareposts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shareposts`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `skola`
--
CREATE DATABASE IF NOT EXISTS `skola` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `skola`;

-- --------------------------------------------------------

--
-- Table structure for table `dosije`
--

CREATE TABLE `dosije` (
  `indeks` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `mesto_rodjenja` varchar(20) NOT NULL,
  `godina_rodjenja` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ispit`
--

CREATE TABLE `ispit` (
  `indeks` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `godina_roka` int(11) NOT NULL,
  `oznaka_roka` char(20) NOT NULL,
  `ocena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ispitni_rok`
--

CREATE TABLE `ispitni_rok` (
  `godina_roka` int(11) NOT NULL,
  `oznaka_roka` varchar(20) NOT NULL,
  `naziv` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmeta` int(11) NOT NULL,
  `sifra` varchar(20) NOT NULL,
  `naziv` varchar(20) NOT NULL,
  `bodovi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosije`
--
ALTER TABLE `dosije`
  ADD PRIMARY KEY (`indeks`);

--
-- Indexes for table `ispit`
--
ALTER TABLE `ispit`
  ADD PRIMARY KEY (`indeks`,`id_predmeta`,`godina_roka`,`oznaka_roka`),
  ADD KEY `id_predmeta` (`id_predmeta`),
  ADD KEY `godina_roka` (`godina_roka`,`oznaka_roka`);

--
-- Indexes for table `ispitni_rok`
--
ALTER TABLE `ispitni_rok`
  ADD PRIMARY KEY (`godina_roka`,`oznaka_roka`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmeta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosije`
--
ALTER TABLE `dosije`
  MODIFY `indeks` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ispit`
--
ALTER TABLE `ispit`
  ADD CONSTRAINT `ispit_ibfk_1` FOREIGN KEY (`indeks`) REFERENCES `dosije` (`indeks`),
  ADD CONSTRAINT `ispit_ibfk_2` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`),
  ADD CONSTRAINT `ispit_ibfk_3` FOREIGN KEY (`godina_roka`,`oznaka_roka`) REFERENCES `ispitni_rok` (`godina_roka`, `oznaka_roka`);
--
-- Database: `student`
--
CREATE DATABASE IF NOT EXISTS `student` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `student`;

-- --------------------------------------------------------

--
-- Table structure for table `dosije`
--

CREATE TABLE `dosije` (
  `indeks` int(11) NOT NULL,
  `ime` varchar(10) COLLATE utf8_bin NOT NULL,
  `prezime` varchar(15) COLLATE utf8_bin NOT NULL,
  `mesto_rodjenja` varchar(20) COLLATE utf8_bin NOT NULL,
  `godina_rodjenja` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `dosije`
--

INSERT INTO `dosije` (`indeks`, `ime`, `prezime`, `mesto_rodjenja`, `godina_rodjenja`) VALUES
(20100022, 'Marko', 'Markovic', 'Beograd', 1991),
(20100023, 'Dragan', 'Draganovic', 'Banja Luka', 1992),
(20100024, 'Petar', 'Petrovic', 'Srbac', 1993),
(20100025, 'Milos', 'Obrenovic', 'Sabac', 1992),
(20100026, 'Milutin', 'Milutinovic', 'Beograd', 1992),
(20100027, 'Marko', 'Lausevic', 'Gradiska', 1991),
(20100028, 'Milan', 'Milanovic', 'Gradiska', 1994);

-- --------------------------------------------------------

--
-- Table structure for table `ispit`
--

CREATE TABLE `ispit` (
  `indeks` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `godina_roka` smallint(6) NOT NULL,
  `oznaka_roka` char(10) COLLATE utf8_bin NOT NULL,
  `ocena` smallint(6) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ispit`
--

INSERT INTO `ispit` (`indeks`, `id_predmeta`, `godina_roka`, `oznaka_roka`, `ocena`) VALUES
(20100022, 1002, 2017, 'Februarski', 6),
(20100022, 1003, 2016, 'Januarski', 5),
(20100024, 1003, 2017, 'Februarski', 8),
(20100026, 1003, 2017, 'Oktobarski', 5),
(20100026, 1004, 2016, 'Januarski', 8),
(20100026, 1004, 2016, 'Julski', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ispitni_rok`
--

CREATE TABLE `ispitni_rok` (
  `godina_roka` smallint(6) NOT NULL,
  `oznaka_roka` varchar(10) COLLATE utf8_bin NOT NULL,
  `naziv` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ispitni_rok`
--

INSERT INTO `ispitni_rok` (`godina_roka`, `oznaka_roka`, `naziv`) VALUES
(2016, 'Januarski', 'Jan 2016'),
(2016, 'Julski', 'Jul 2017'),
(2016, 'Septembars', 'Sept 2017'),
(2017, 'Februarski', 'Feb 2017'),
(2017, 'Oktobarski', 'Okt 2017');

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmeta` int(11) NOT NULL,
  `sifra` varchar(10) COLLATE utf8_bin NOT NULL,
  `naziv` varchar(10) COLLATE utf8_bin NOT NULL,
  `bodovi` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id_predmeta`, `sifra`, `naziv`, `bodovi`) VALUES
(1001, 'm111', 'Matematika', 5),
(1002, ' m112', 'Fizika', 6),
(1003, ' m113', 'Informatik', 5),
(1004, ' m114', 'Engleski', 5),
(1005, ' m115', 'Tehnicko', 6),
(1006, ' m116', 'Hemija', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosije`
--
ALTER TABLE `dosije`
  ADD PRIMARY KEY (`indeks`);

--
-- Indexes for table `ispit`
--
ALTER TABLE `ispit`
  ADD PRIMARY KEY (`indeks`,`id_predmeta`,`godina_roka`,`oznaka_roka`),
  ADD KEY `godina_roka` (`godina_roka`,`oznaka_roka`),
  ADD KEY `id_predmeta` (`id_predmeta`);

--
-- Indexes for table `ispitni_rok`
--
ALTER TABLE `ispitni_rok`
  ADD PRIMARY KEY (`godina_roka`,`oznaka_roka`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmeta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ispit`
--
ALTER TABLE `ispit`
  ADD CONSTRAINT `ispit_ibfk_1` FOREIGN KEY (`indeks`) REFERENCES `dosije` (`indeks`),
  ADD CONSTRAINT `ispit_ibfk_2` FOREIGN KEY (`godina_roka`,`oznaka_roka`) REFERENCES `ispitni_rok` (`godina_roka`, `oznaka_roka`),
  ADD CONSTRAINT `ispit_ibfk_3` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `narudzbina`
--

CREATE TABLE `narudzbina` (
  `id_narudzbine` int(10) NOT NULL,
  `kod` varchar(10) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `narudzbina_proizvod`
--

CREATE TABLE `narudzbina_proizvod` (
  `id` int(10) NOT NULL,
  `id_narudzbine` int(10) NOT NULL,
  `id_proizvoda` int(10) NOT NULL,
  `kolicina` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE `proizvod` (
  `id_proizvoda` int(10) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  `opis` varchar(100) NOT NULL,
  `cijena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `narudzbina`
--
ALTER TABLE `narudzbina`
  ADD PRIMARY KEY (`id_narudzbine`);

--
-- Indexes for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id_proizvoda`);
--
-- Database: `tmvc`
--
CREATE DATABASE IF NOT EXISTS `tmvc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tmvc`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(266) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`) VALUES
(1, 'NASLOV PRVOG POSTA'),
(2, 'Ovo je post 2'),
(3, 'Ovo je post 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `todo`
--
CREATE DATABASE IF NOT EXISTS `todo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `todo`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
