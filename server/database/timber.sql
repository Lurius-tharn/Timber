-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 16 juil. 2022 à 17:00
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `timber`
--

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `num` int NOT NULL,
  `nom` varchar(25) NOT NULL,
  `ville` varchar(25) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`num`, `nom`, `ville`) VALUES
(75, 'Paris', 'Levallois'),
(93, 'Saint Denis', 'Aubervilliers'),
(95500, 'Val d\'oise', 'Cergy');

-- --------------------------------------------------------

--
-- Structure de la table `liked`
--

DROP TABLE IF EXISTS `liked`;
CREATE TABLE IF NOT EXISTS `liked` (
  `membre` int NOT NULL,
  `likedProfil` int NOT NULL,
  PRIMARY KEY (`membre`,`likedProfil`),
  KEY `likedProfil` (`likedProfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `liked`
--

INSERT INTO `liked` (`membre`, `likedProfil`) VALUES
(1, 1),
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `dept` int NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `description` varchar(155) NOT NULL,
  `pictures` varchar(355) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_dept` (`dept`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `photo`, `dept`, `login`, `password`, `description`, `pictures`) VALUES
(1, 'Huscarl', 'Lydia', 'Lydia_Housecarl.png', 95500, 'Lydia', 'Lydia', 'i am sworn to carry your burdens', 'lydia_01.png,lydia_02.png,lydia_03.png'),
(2, 'Dovahkiir', 'Dovahkiin', 'Dovahkiin.png', 95500, 'Dovah', 'Dovah', 'Fus.', ''),
(3, 'Dovah', 'Paarthurnax', 'Paarthurnax.png', 75, 'Parthy', 'Parthy', 'Drem Yol Lok', '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`membre`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`likedProfil`) REFERENCES `membre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `membre_ibfk_1` FOREIGN KEY (`dept`) REFERENCES `departement` (`num`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
