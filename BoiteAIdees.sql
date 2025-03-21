-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : mariadb
-- Généré le : ven. 21 fév. 2025 à 01:31
-- Version du serveur : 11.7.2-MariaDB-ubu2404
-- Version de PHP : 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `BoiteAIdees`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluations`
--

CREATE TABLE `evaluations` (
  `id_note` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `evaluations`
--

INSERT INTO `evaluations` (`id_note`, `libelle`) VALUES
(0, 'aucune note'),
(1, 'Passable'),
(2, 'Bonne'),
(3, 'Excellente');

-- --------------------------------------------------------

--
-- Structure de la table `idees`
--

CREATE TABLE `idees` (
  `id_idee` int(11) NOT NULL,
  `idee` varchar(2000) NOT NULL,
  `date_idee` datetime NOT NULL DEFAULT current_timestamp(),
  `id_note` int(11) DEFAULT 0,
  `id_statut` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `idees`
--

INSERT INTO `idees` (`id_idee`, `idee`, `date_idee`, `id_note`, `id_statut`) VALUES
(172, 'trzr fzq feza feza feza feza', '2025-02-18 17:54:58', 3, 1),
(175, 'dssdq sqdqd', '2025-02-18 18:36:57', 0, 2),
(176, 'dsqcsq xcsq  dsq fsq', '2025-02-18 18:37:02', 0, 1),
(177, ' dsqd sqddzsq dsq', '2025-02-18 18:37:05', 2, 2),
(178, ' ezae zadsqdsqdsqdsqdsq', '2025-02-18 18:42:39', 2, 1),
(193, 'dsDFZ dqDAdz dz DZA', '2025-02-21 01:22:59', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statuts`
--

CREATE TABLE `statuts` (
  `id_statut` int(11) NOT NULL,
  `statut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `statuts`
--

INSERT INTO `statuts` (`id_statut`, `statut`) VALUES
(0, 'Non_lu'),
(1, 'Rejeté'),
(2, 'Validé');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `log_in` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `log_in`, `pass_word`) VALUES
(24, 'optuser', '$2b$10$1AoVJKHaxfM4EDg32bZ6UeVriMqVy28RhbTWYDAEzwZC.AdMt3Vz2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id_note`) USING BTREE;

--
-- Index pour la table `idees`
--
ALTER TABLE `idees`
  ADD PRIMARY KEY (`id_idee`),
  ADD KEY `id_note` (`id_note`),
  ADD KEY `fk_id_statut` (`id_statut`);

--
-- Index pour la table `statuts`
--
ALTER TABLE `statuts`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `log_in` (`log_in`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `idees`
--
ALTER TABLE `idees`
  MODIFY `id_idee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `idees`
--
ALTER TABLE `idees`
  ADD CONSTRAINT `fk_id_note` FOREIGN KEY (`id_note`) REFERENCES `evaluations` (`id_note`),
  ADD CONSTRAINT `fk_id_statut` FOREIGN KEY (`id_statut`) REFERENCES `statuts` (`id_statut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
