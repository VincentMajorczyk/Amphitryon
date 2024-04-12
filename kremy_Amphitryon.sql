-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 12 avr. 2024 à 16:33
-- Version du serveur : 10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kremy_Amphitryon`
--

-- --------------------------------------------------------

--
-- Structure de la table `CATEGEORIE_PLAT`
--

CREATE TABLE `CATEGEORIE_PLAT` (
  `IDCATEGPLAT` int(5) NOT NULL,
  `LIBELLE` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `CATEGEORIE_PLAT`
--

INSERT INTO `CATEGEORIE_PLAT` (`IDCATEGPLAT`, `LIBELLE`) VALUES
(1, 'entree'),
(2, 'plat'),
(3, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `COMMANDE`
--

CREATE TABLE `COMMANDE` (
  `IDCOMMANDE` int(5) NOT NULL,
  `DATEE` date NOT NULL,
  `IDSERVICE` int(4) NOT NULL,
  `NOMTABLE` varchar(128) NOT NULL,
  `HEURECOMMANDE` time DEFAULT NULL,
  `ETATCOMMANDE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `COMMANDE`
--

INSERT INTO `COMMANDE` (`IDCOMMANDE`, `DATEE`, `IDSERVICE`, `NOMTABLE`, `HEURECOMMANDE`, `ETATCOMMANDE`) VALUES
(1, '2004-12-22', 1, 'Barbara', '13:13:13', 'a payer'),
(2, '2005-03-03', 2, 'Tom', '14:13:12', 'a payer'),
(3, '2006-03-05', 3, 'Rogers', '11:10:18', 'a payer'),
(4, '2008-04-05', 4, 'Antoine', '18:12:18', 'a payer'),
(5, '2009-08-13', 5, 'Lucie', '10:20:56', 'a payer'),
(6, '2009-09-06', 6, 'Margot', '11:11:11', 'a payer'),
(7, '2011-01-09', 7, 'Jean', '10:10:10', 'a payer'),
(8, '2012-07-05', 8, 'Maxime', '22:22:22', 'a payer'),
(9, '2013-04-03', 9, 'Vincent', '21:21:21', 'a payer'),
(10, '2015-01-15', 10, 'Killian', '20:20:20', 'a payer'),
(11, '2015-01-22', 11, 'Stéphanie', '13:13:13', 'a payer'),
(12, '2015-06-11', 12, 'Laurent', '15:48:12', 'a payer'),
(13, '2015-07-08', 13, 'Nathanaël', '23:59:59', 'a payer'),
(14, '2015-09-18', 14, 'Lily-Rose', '19:19:19', 'a payer'),
(15, '2016-01-03', 15, 'Jonhattan', '18:18:18', 'a payer'),
(16, '2018-09-26', 16, 'Sachianna', '17:17:17', 'a payer'),
(17, '2022-07-24', 17, 'Alexy', '16:16:16', 'a payer'),
(18, '2022-11-10', 18, 'Enthonni', '15:15:15', 'a payer'),
(19, '2022-12-02', 19, 'MAXIMAL', '23:59:59', 'a payer'),
(20, '2023-12-16', 20, 'Stefan', '14:14:14', 'a payer'),
(21, '2015-01-15', 10, 'Killian', '12:12:12', 'a payer'),
(22, '2013-04-03', 9, 'Vincent', '11:11:11', 'a payer'),
(23, '2012-07-05', 8, 'Maxime', '10:11:12', 'a payer'),
(24, '2015-07-08', 13, 'Nathanaël', '23:59:58', 'a payer'),
(25, '2015-09-18', 14, 'Lily-Rose', '11:11:11', 'a payer'),
(26, '2016-01-03', 15, 'Jonhattan', '14:15:16', 'a payer'),
(27, '2018-09-26', 16, 'Sachianna', '19:18:16', 'a payer'),
(28, '2022-07-24', 17, 'Alexy', '12:12:12', 'a payer'),
(29, '2022-11-10', 18, 'Enthonni', '11:12:13', 'a payer'),
(30, '2023-12-16', 20, 'Stefan', '13:14:15', 'a payer');

-- --------------------------------------------------------

--
-- Structure de la table `COMPOSE_DE`
--

CREATE TABLE `COMPOSE_DE` (
  `IDCOMMANDE` int(5) NOT NULL,
  `IDPLAT` int(4) NOT NULL,
  `ETATPLAT` varchar(40) DEFAULT NULL,
  `INFOSUPPLEMENTAIRE` varchar(256) DEFAULT NULL,
  `QUANTITE` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `COMPOSE_DE`
--

INSERT INTO `COMPOSE_DE` (`IDCOMMANDE`, `IDPLAT`, `ETATPLAT`, `INFOSUPPLEMENTAIRE`, `QUANTITE`) VALUES
(1, 1, 'commande', 'trop de verdure', 1),
(2, 2, 'deservi', 'Tom ate this', 8),
(14, 3, 'servi', 'il n\'y a jamais trop de vodka.', 99999);

-- --------------------------------------------------------

--
-- Structure de la table `PLAT`
--

CREATE TABLE `PLAT` (
  `IDPLAT` int(4) NOT NULL,
  `IDCATEGPLAT` int(5) NOT NULL,
  `NOMPLAT` varchar(128) DEFAULT NULL,
  `DESCRIPTIF` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `PLAT`
--

INSERT INTO `PLAT` (`IDPLAT`, `IDCATEGPLAT`, `NOMPLAT`, `DESCRIPTIF`) VALUES
(1, 1, 'salade', 'salade verte'),
(2, 1, 'tomate', 'tomate rouge'),
(3, 2, 'pate a la vodka', 'Le plat de Lily.'),
(4, 1, 'Curry Wurst', 'Star de la street food à Berlin par excellence, la curry wurst est aussi délicieuse faite maison !'),
(5, 2, 'Boeuf Wagyu', 'Race originaire du Japon, le boeuf Waguy est la coqueluche des belles tables.'),
(6, 2, 'Bibimbap', 'Le bibimbap, c\'est le plat de base coréen, à vos baguettes !'),
(7, 1, 'Bo Bun', 'Plat culte vietnamien, le bobun fait courir toutes les foodistas.'),
(8, 1, 'camembert au four', 'Célèbre pâte molle à croûte fleurie et star des produits laitiers, le camembert a plus d\'un tour gourmand dans sa boite, passé au grill !'),
(9, 1, 'Anguille fumee', 'Poisson d\'une grande finesse, l\'anguille fumée fait voyager les papilles. A vous d\'essayer ! '),
(10, 1, 'Ceviche de Daurade et clementine', 'Le ceviche, c\'est le tartare made in Pérou !'),
(11, 3, 'Churris sauce chocolat', 'Le churros c\'est ce long beignet espagnol, saupoudré de sucre qu’on peut tremper dans du chocolat fondu. Olé !'),
(12, 2, 'Coquillettes jambon et truffe noire', 'Régressives et toujours réconfortantes les coquillettes; mais accoquinées à de la truffe noire, elles déchirent et font courir tout Paris.'),
(13, 3, 'Dulce de leche ', 'Avec sa saveur caramélisée, la confiture de lait? appelée dulce de leche en Argentine? est un délice qui s\'invite dans beaucoup de desserts mais s\'apprécie aussi à la petite cuillère !'),
(14, 1, 'Falafels', 'Viva les falafels, ces boulettes branchées, veggies et faciles à faire  !'),
(15, 1, 'Gyozas', 'Impossible de ne pas tester les gyozas, ces petits raviolis farcis savoureux et sexy, pilliers de la gastronomie chinoise. '),
(16, 2, 'Homard grille', 'On en pince pour le homard et grillé au bbq il s\'impose comme le roi des tables d\'été!'),
(17, 2, 'Dim Sum', 'Prenez le pli et faites vous-mêmes vos dim sum, spécialités emblématiques de la cuisine chinoise.'),
(18, 2, 'Goulash a la roumaine', 'Plat paysan hongrois devenu bourgeois, il revigore et réchauffe les jours d\'hiver.'),
(19, 3, 'Cheesecake', 'Impossible de résister au mythique gâteau new- yorkais.'),
(20, 2, 'kebab', 'Star de la street food, le kebab ou chawarma déchire quand il est préparé home-made.'),
(21, 1, 'Keftas a la tomate', 'Keftas boulettes qui en jettent!'),
(22, 3, 'baba au rhum', 'Ventru et imbibé de rhum, on est tous forcément baba du baba au rhum'),
(23, 3, 'le baba ghanoush de nicole', 'Coqueluche des brunchs libanais, la crème d\'aubergine au tahini nous fait tous craquer.'),
(24, 1, 'Xiao Long Bao', 'Voir notre recette de xiao lang bao, l\'autre dim sum, fermée comme une bourse et garnie d’une farce et d’un délicieux bouillon juteux qui fait le bonheur des foodies.'),
(25, 1, 'Lobster Rolls', 'La vague du lobster roll ne déferle pas seulement à New York.'),
(26, 2, 'Boudin Noir ', 'Grand classique du terroir français, le boudin noir fait partie de ces plats vintage, rétro et régressif qui fait du bien au corps et à l\'âme.'),
(27, 1, 'oeufs benedict', 'Classique du brunch américain, il continue de faire courir les foodistas même s\'il est en perte de vitesse depuis l\'arrivée de l\'avocado toast.'),
(28, 1, 'Pad Thai', 'Plat traditionnel thaïlandais, on se laisse tenter par l\'expérience exotique.'),
(29, 3, 'Pasteis de Nata', 'Petit flan onctueux que l\'on déguste tiède saupoudré d\'un peu de cannelle est un succès à Lisbonne qui s\'exporte à l\'international.'),
(30, 3, 'Pavlova aux fraises', 'Aérien et sublime, ce dessert qui doit son nom à la célèbre ballerine russe Anne Pavlova est irrésistible.'),
(31, 2, 'Pho', 'Allumez le pho !'),
(32, 1, 'poulet tikka', 'Populaire en Inde et au Pakistan, le poulet tikka fait partie de ces plats exotiques et colorés qui s\'inscrivent aujourd\'hui dans notre quotidien.'),
(33, 3, 'KOUIGN AMANN !!! ', 'LE MEILLEUR !!!\nIl y a tellement de beurre à l\'intérieur qu\'il n\'est pas catégorisé comme gâteau mais comme un type de beurre (salé évidemment). ça veut dire Gateau Beurre en Breton.'),
(34, 2, 'Fondu Chinoise', 'Plat ancestral, convivial et peu calorique, la fondue chinoise a conquis le monde entier.'),
(35, 2, 'Bao Porc et chou', 'On fond pour le bao, cette petite brioche chinoise moelleuse et généreusement fourrée de viande, de crevettes, de légumes ou de pâte sucrée de haricots rouges, cuite à la vapeur.'),
(36, 3, 'souffle', 'Gonflé et léger, le soufflé fait toujours son effet !\r\nVoir nos recettes de soufflés bien gonflés'),
(37, 2, 'Tacos de poulet aux radis', 'Obsession des instagrammeurs, le tacos a la côte et se décline de 1001 façons. Vous allez pleurer sur le poulet avec ça.'),
(38, 2, 'Tajine de poulet aux olives et citrons confits', 'Le Maghreb est un vrai concentré de gastronomie dont l’un des plats phares est sans sourciller le tajine qui ensoleille la tablée et se partage à plusieurs.'),
(39, 2, 'Tchoutchouka', 'Plat populaire de la cuisine israélienne, la tchoutchouka est un plat facile dont il existe mille et une variante mais qui fait toujours l\'unanimité.'),
(40, 2, 'Tortilla Moelleuse', 'Facile, simple et rapide la tortilla espagnole se coupe en carré pour l\'apéritif ou se savoure entière accompagnée d\'une salade verte, et fait toujours l\'unanimité à table !'),
(41, 1, 'Poireaux Vinaigrette', 'Une entrée de bistro qui n\'a rien perdu de son charme!'),
(42, 2, 'Ribs croustillats a l\'ail', 'Plat texan, les barbaques caramélisées et cuites au barbecue, mondialisation oblige, ont la gnaque chez les foodistas !'),
(43, 2, 'Chou fleur roti au four', 'Moins fade et ennuyeux, le chou-fleur rôti au four ou passé au grill est une superstar aux Etats Unis.'),
(44, 3, 'Cronut', 'De passage à New-York, impossible de ne pas croquer dans le cronut de Dominique Ansel, le pâtissier français superstar qui s\'amuse à croiser viennoiseries, pâtisseries au nom du goût !'),
(45, 2, 'Os a moelle', 'Classique du bistrot français, l\'os à moelle réveille les papilles des connaisseurs.'),
(46, 1, 'Pastrami du deli', 'Très populaire aux Etats-Unis, le pastrami n’est rien d’autre que du boeuf mariné, séché et fumé, comme un jambon qu\'on mange le plus souvent en sandwich mais aussi dans une choucroute, avec du houmous ou dans une quiche.'),
(47, 1, 'empanadas', 'Originaires d’Espagne, ces petits chaussons fourrés à la viande, au poisson ou au légume se déclinent dans de nombreuses régions du monde à l\'heure de l\'apéro, en entrée ou en plat.');

-- --------------------------------------------------------

--
-- Structure de la table `PROPOSERPLAT`
--

CREATE TABLE `PROPOSERPLAT` (
  `IDPLAT` int(4) NOT NULL,
  `IDSERVICE` int(4) NOT NULL,
  `DATEE` date NOT NULL,
  `QUANTITEPROPOSEE` int(5) DEFAULT NULL,
  `PRIXVENTE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `PROPOSERPLAT`
--

INSERT INTO `PROPOSERPLAT` (`IDPLAT`, `IDSERVICE`, `DATEE`, `QUANTITEPROPOSEE`, `PRIXVENTE`) VALUES
(8, 12, '2025-12-25', 1, '12.50');

-- --------------------------------------------------------

--
-- Structure de la table `SERVICE`
--

CREATE TABLE `SERVICE` (
  `IDSERVICE` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `SERVICE`
--

INSERT INTO `SERVICE` (`IDSERVICE`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- --------------------------------------------------------

--
-- Structure de la table `TABLEE`
--

CREATE TABLE `TABLEE` (
  `DATEE` date NOT NULL,
  `IDSERVICE` int(4) NOT NULL,
  `NOMTABLE` varchar(128) NOT NULL,
  `IDUTILISATEUR` int(3) NOT NULL,
  `NBPLACE` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `TABLEE`
--

INSERT INTO `TABLEE` (`DATEE`, `IDSERVICE`, `NOMTABLE`, `IDUTILISATEUR`, `NBPLACE`) VALUES
('2004-12-22', 1, 'Barbara', 1, 808),
('2005-03-03', 2, 'Tom', 3, 152),
('2006-03-05', 3, 'Rogers', 2, 1),
('2008-04-05', 4, 'Antoine', 1, 157),
('2009-08-13', 5, 'Lucie', 2, 357),
('2009-09-06', 6, 'Margot', 3, 12),
('2011-01-09', 7, 'Jean', 3, 734),
('2012-07-05', 8, 'Maxime', 1, 2),
('2013-04-03', 9, 'Vincent', 3, 3),
('2015-01-15', 10, 'Killian', 2, 1),
('2015-01-22', 11, 'Stéphanie', 1, 56),
('2015-06-11', 12, 'Laurent', 2, 9),
('2015-07-08', 13, 'Nathanaël', 2, 78),
('2015-09-18', 14, 'Lily-Rose', 1, 4),
('2016-01-03', 15, 'Jonhattan', 1, 5),
('2018-09-26', 16, 'Sachianna', 2, 6),
('2022-07-24', 17, 'Alexy', 2, 7),
('2022-11-10', 18, 'Enthonni', 3, 8),
('2022-12-02', 19, 'MAXIMAL', 2, 9),
('2023-12-16', 20, 'Stefan', 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `IDUTILISATEUR` int(3) NOT NULL,
  `PRENOM` varchar(128) DEFAULT NULL,
  `NOM` varchar(128) DEFAULT NULL,
  `MDP` varchar(128) DEFAULT NULL,
  `MAIL` varchar(128) DEFAULT NULL,
  `POSTE` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`IDUTILISATEUR`, `PRENOM`, `NOM`, `MDP`, `MAIL`, `POSTE`) VALUES
(1, 'bob', 'leponge', 'bob', 'bob', 'ChefCuisinier'),
(2, 'Ricou', 'Qi', 'estpetit', 'mais.il@est.gentil', 'Serveur'),
(3, 'Jean', 'Lassalle', 'password', 'jean.lassalle@gmail.com', 'ChefSalle');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CATEGEORIE_PLAT`
--
ALTER TABLE `CATEGEORIE_PLAT`
  ADD PRIMARY KEY (`IDCATEGPLAT`);

--
-- Index pour la table `COMMANDE`
--
ALTER TABLE `COMMANDE`
  ADD PRIMARY KEY (`IDCOMMANDE`),
  ADD KEY `I_FK_COMMANDE_TABLEE` (`DATEE`,`IDSERVICE`,`NOMTABLE`);

--
-- Index pour la table `COMPOSE_DE`
--
ALTER TABLE `COMPOSE_DE`
  ADD PRIMARY KEY (`IDCOMMANDE`,`IDPLAT`),
  ADD KEY `I_FK_COMPOSE_DE_COMMANDE` (`IDCOMMANDE`),
  ADD KEY `I_FK_COMPOSE_DE_PLAT` (`IDPLAT`);

--
-- Index pour la table `PLAT`
--
ALTER TABLE `PLAT`
  ADD PRIMARY KEY (`IDPLAT`),
  ADD KEY `I_FK_PLAT_CATEGEORIE_PLAT` (`IDCATEGPLAT`);

--
-- Index pour la table `PROPOSERPLAT`
--
ALTER TABLE `PROPOSERPLAT`
  ADD PRIMARY KEY (`IDPLAT`,`IDSERVICE`,`DATEE`),
  ADD KEY `I_FK_PROPOSERPLAT_PLAT` (`IDPLAT`),
  ADD KEY `I_FK_PROPOSERPLAT_SERVICE` (`IDSERVICE`);

--
-- Index pour la table `SERVICE`
--
ALTER TABLE `SERVICE`
  ADD PRIMARY KEY (`IDSERVICE`);

--
-- Index pour la table `TABLEE`
--
ALTER TABLE `TABLEE`
  ADD PRIMARY KEY (`DATEE`,`IDSERVICE`,`NOMTABLE`),
  ADD KEY `I_FK_TABLEE_SERVICE` (`IDSERVICE`),
  ADD KEY `I_FK_TABLEE_UTILISATEUR` (`IDUTILISATEUR`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`IDUTILISATEUR`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CATEGEORIE_PLAT`
--
ALTER TABLE `CATEGEORIE_PLAT`
  MODIFY `IDCATEGPLAT` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `COMMANDE`
--
ALTER TABLE `COMMANDE`
  MODIFY `IDCOMMANDE` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `PLAT`
--
ALTER TABLE `PLAT`
  MODIFY `IDPLAT` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `SERVICE`
--
ALTER TABLE `SERVICE`
  MODIFY `IDSERVICE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  MODIFY `IDUTILISATEUR` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `COMMANDE`
--
ALTER TABLE `COMMANDE`
  ADD CONSTRAINT `FK_COMMANDE_TABLEE` FOREIGN KEY (`DATEE`,`IDSERVICE`,`NOMTABLE`) REFERENCES `TABLEE` (`DATEE`, `IDSERVICE`, `NOMTABLE`);

--
-- Contraintes pour la table `COMPOSE_DE`
--
ALTER TABLE `COMPOSE_DE`
  ADD CONSTRAINT `FK_COMPOSE_DE_COMMANDE` FOREIGN KEY (`IDCOMMANDE`) REFERENCES `COMMANDE` (`IDCOMMANDE`),
  ADD CONSTRAINT `FK_COMPOSE_DE_PLAT` FOREIGN KEY (`IDPLAT`) REFERENCES `PLAT` (`IDPLAT`);

--
-- Contraintes pour la table `PLAT`
--
ALTER TABLE `PLAT`
  ADD CONSTRAINT `FK_PLAT_CATEGEORIE_PLAT` FOREIGN KEY (`IDCATEGPLAT`) REFERENCES `CATEGEORIE_PLAT` (`IDCATEGPLAT`);

--
-- Contraintes pour la table `PROPOSERPLAT`
--
ALTER TABLE `PROPOSERPLAT`
  ADD CONSTRAINT `FK_PROPOSERPLAT_PLAT` FOREIGN KEY (`IDPLAT`) REFERENCES `PLAT` (`IDPLAT`),
  ADD CONSTRAINT `FK_PROPOSERPLAT_SERVICE` FOREIGN KEY (`IDSERVICE`) REFERENCES `SERVICE` (`IDSERVICE`);

--
-- Contraintes pour la table `TABLEE`
--
ALTER TABLE `TABLEE`
  ADD CONSTRAINT `FK_TABLEE_SERVICE` FOREIGN KEY (`IDSERVICE`) REFERENCES `SERVICE` (`IDSERVICE`),
  ADD CONSTRAINT `FK_TABLEE_UTILISATEUR` FOREIGN KEY (`IDUTILISATEUR`) REFERENCES `UTILISATEUR` (`IDUTILISATEUR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
