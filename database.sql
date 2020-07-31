-- EXAMPLE DATA NOT FOR USE!

-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2018 at 03:11 PM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 5.6.36-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `keyxchange`
--

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `ID` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `publickey` char(64) NOT NULL,
  `ip` varchar(80) NOT NULL,
  `port` smallint(5) unsigned NOT NULL,
  `hood_ID` int(10) unsigned NOT NULL DEFAULT '1',
  `contact` varchar(100) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`ID`, `active`, `name`, `publickey`, `ip`, `port`, `hood_ID`, `contact`, `timestamp`) VALUES
(2, 1, 'vm3fffgwcd1', '373cf6dca701a8b1516b816a13c91dc9df29ac5a822d12331b503982d655399b', '144.76.70.186', 10007, 0, 'a@b.com', '2017-09-27 07:15:09'),
(7, 1, 'fff-nue2-gw2', '07be3d18b703e6e040a6920afb3e226ded6aa474961d8eecbb77b623bdd21059', '81.95.4.187', 10000, 2, 'b@a.net', '2017-10-28 05:45:51'),
(8, 1, 'vm3fffgwcd1', '373cf6dca701a8b1516b816a13c91dc9df29ac5a822d12331b503982d655399b', '144.76.70.186', 10006, 1, '', '2017-09-27 07:15:09'),
(9, 1, 'vm3fffgwcd1', '373cf6dca701a8b1516b816a13c91dc9df29ac5a822d12331b503982d655399b', '144.76.70.186', 10005, 30, '', '2017-09-27 07:15:09'),
(46, 1, 'fff-neptun', '3834e45fa33c048f975e81042c1e93bb11dac82d9f03a0b24071bb72205247a8', '84.23.95.3', 10011, 31, '', '2018-09-02 09:00:59'),
(47, 1, 'fff-neptun', '3834e45fa33c048f975e81042c1e93bb11dac82d9f03a0b24071bb72205247a8', '84.23.95.3', 10012, 0, '', '2018-09-02 14:36:14'),
(49, 1, 'fff-neptun', '3834e45fa33c048f975e81042c1e93bb11dac82d9f03a0b24071bb72205247a8', '84.23.95.3', 10013, 1, '', '2018-09-02 14:36:14');


-- --------------------------------------------------------

--
-- Table structure for table `hoods`
--

CREATE TABLE `hoods` (
  `ID` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `prefix` varchar(50) NOT NULL,
  `ntp_ip` varchar(50) NOT NULL,
  `ESSID_AP` varchar(32) NOT NULL,
  `ESSID_MESH` varchar(32) NOT NULL,
  `BSSID_MESH` varchar(17) NOT NULL,
  `protocol` varchar(50) NOT NULL DEFAULT 'batman-adv-v15',
  `channel2` tinyint(3) unsigned NOT NULL DEFAULT '13',
  `mode2` char(4) NOT NULL DEFAULT 'ht20',
  `mesh_type2` varchar(10) NOT NULL DEFAULT '802.11s',
  `channel5` tinyint(3) unsigned NOT NULL DEFAULT '40',
  `mode5` char(5) NOT NULL DEFAULT 'ht20',
  `mesh_type5` varchar(10) NOT NULL DEFAULT '802.11s',
  `upgrade_path` varchar(100) NOT NULL,
  `changedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoods`
--

INSERT INTO `hoods` (`ID`, `active`, `name`, `lat`, `lon`, `prefix`, `ntp_ip`, `ESSID_AP`, `ESSID_MESH`, `BSSID_MESH`, `protocol`, `channel2`, `mode2`, `mesh_type2`, `channel5`, `mode5`, `mesh_type5`, `upgrade_path`, `changedOn`) VALUES
(0, 1, 'TrainstationV2', NULL, NULL, 'fd43:5602:29bd:0:/64', 'fd43:5602:29bd:ffff::1', 'trainstation.freifunk', 'mesh.trainstation.freifunk', 'ca:ff:ee:ba:be:00', 'batman-adv-v15', 13, 'ht20', '802.11s', 40, 'ht20', '802.11s', '', '2017-11-22 13:08:54'),
(1, 1, 'NuernbergV2', 49.444, 11.05, 'fd43:5602:29bd:3:/64', 'fd43:5602:29bd:ffff::1', 'nuernberg.freifunk', 'mesh.nuernberg.freifunk', 'ca:ff:ee:ba:be:03', 'batman-adv-v15', 13, 'ht20', '802.11s', 40, 'ht20', '802.11s', '', '2017-10-22 01:47:41'),
(2, 1, 'FuerthV2', 49.4814, 10.966, 'fd43:5602:29bd:4:/64', 'fd43:5602:29bd:ffff::1', 'fuerth.freifunk', 'mesh.fue.fff', 'ca:ff:ee:ba:be:02', 'batman-adv-v15', 13, 'ht20', '802.11s', 40, 'ht20', '802.11s', '', '2018-08-05 08:01:24'),
(31, 1, 'ErlangenStadt', NULL, NULL, '1234', '1234', 'ErlangenStadt#AP', 'ErlangenStadt#MESH', '', 'batman-adv-v15', 13, 'ht20', '802.11s', 40, 'ht20', '802.11s', '', '2018-10-24 12:19:14'),
(32, 1, 'FuerthStadt', NULL, NULL, '1234', '1234', 'FuerthStadt#AP', 'FuerthStadt#MESH', '', 'batman-adv-v15', 13, 'ht20', '802.11s', 40, 'ht20', '802.11s', '', '2018-10-24 10:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `polyhood`
--

CREATE TABLE `polyhoods` (
  `polyid` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `hoodid` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polyhoods`
--

INSERT INTO `polyhoods` (`polyid`, `active`, `hoodid`) VALUES
(1, 1, 31),
(2, 1, 32);

-- --------------------------------------------------------

--
-- Table structure for table `polygons`
--

CREATE TABLE `polygons` (
  `ID` int(10) unsigned NOT NULL,
  `polyid` int(10) unsigned NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polyhood`
--

INSERT INTO `polygons` (`ID`, `polyid`, `lat`, `lon`) VALUES
(18, 1, 49.58982152, 10.99503994),
(19, 1, 49.58940422, 11.01199150),
(20, 1, 49.59685950, 11.01787090),
(21, 1, 49.60270052, 11.01722717),
(22, 1, 49.60712255, 10.99988937),
(24, 2, 49.46979740, 11.01302147),
(25, 2, 49.47983623, 10.99259377),
(26, 2, 49.48569126, 10.98083496),
(27, 2, 49.45546063, 10.97740173),
(28, 2, 49.44798376, 10.99851608),
(29, 2, 49.45395418, 11.00915909);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
 ADD PRIMARY KEY (`ID`),
 ADD KEY `hood_ID` (`hood_ID`);

--
-- Indexes for table `hoods`
--
ALTER TABLE `hoods`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `polyhoods`
--
ALTER TABLE `polyhoods`
 ADD PRIMARY KEY (`polyid`);

--
-- Indexes for table `polygons`
--
ALTER TABLE `polygons`
 ADD PRIMARY KEY (`ID`),
 ADD KEY `polyid` (`polyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `polyhood`
--
ALTER TABLE `polygons`
  MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--- Updates for productive database

-- ALTER TABLE `hoods` CHANGE `key` `publickey` char(64) NOT NULL;
