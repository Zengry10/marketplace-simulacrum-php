-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2022 at 10:17 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gajc9642_tmh`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(9, 'Salon'),
(10, 'Cuisine'),
(11, 'Salle de bain'),
(13, 'Chambre'),
(17, 'Ammeublements');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `commandDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `nightPrice` int(11) NOT NULL,
  `sqrtMeters` int(11) NOT NULL,
  `description` text NOT NULL,
  `dpe` varchar(1) NOT NULL,
  `ges` varchar(1) NOT NULL,
  `nbOfRooms` int(11) NOT NULL,
  `nbOfChambers` int(11) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`id`, `city`, `nightPrice`, `sqrtMeters`, `description`, `dpe`, `ges`, `nbOfRooms`, `nbOfChambers`, `image1`, `image2`, `image3`) VALUES
(1, 'Paris - Charron', 225, 120, 'Cette belle maison de ville, adaptée aux terrains étroits, se distingue par son architecture élancée!\nDéclinable de 120m²\n3 chambres dont suite parentale\nAvec un garage accolé\nTous nos partenaires ont aménagés les maisons témoins. Venez découvrir et testez', 'B', 'B', 5, 2, 'paris1.jpg', 'paris2.jpg', 'paris3.jpg'),
(2, 'Bordeaux - Audace', 180, 110, 'Aventurez-vous avec la série AUDACE !\nSa silhouette mélange habilement matériaux contemporains et chaleur du bois. Au rez-de-chaussée, de généreuses baies vitrées brouillent la frontière entre l’intérieur et l’extérieur…  Ainsi, l’espace de vie est vaste, lumineux et extensible!\nTous nos partenaires ont aménagés les maisons témoins. Venez découvrir et testez', 'B', 'A', 6, 2, 'bordeaux1.jpg', 'bordeaux2.jpg', 'paris3.jpg'),
(3, 'Clermont-Ferrand - Exception K2', 165, 120, 'La maison K2, c’est un dialogue entre l’espace « intime » des chambres et l’espace « public » de la maison avec de vastes espaces à vivre, qui s’étale en longueur suivant vos souhaits.\nDans votre maison K2, la lumière pénètre de tous côtés pour sublimer un intérieur spacieux à la personnalité affirmée.\nTous nos partenaires ont aménagés les maisons témoins. Venez découvrir et testez', 'A', 'B', 6, 2, 'clermont1.jpg', 'clermont2.jpg', 'paris3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `description`, `price`, `image1`, `image2`, `image3`) VALUES
(31, 'Radio Thomson Vintage 50’S', 'Salon', 'Témoins de notre histoire, nos radios des années 30 à 60 trouveront leur place dans un salon chic, moderne ou vintage.\r\nElles représentent le savoir-faire d\'Absolument, les enceintes connectées les plus uniques au monde alliant design et qualité de son audiophile grâce à la performance des haut-parleurs Focal et son amplificateur analogique 50W permettant de retranscrire la sonorité des amplis à lampes en profitant d’un dynamisme moderne\r\nAfin de garder le charme de ces vieux postes, nous intégrons des ampoules de rétro-éclairage du cadran, et nous conservons le bouton de volume d’origine, vous permettant de voyager dans le temps à chaque musique.\r\nAmplificateur analogique de 50w (class A/B) :\r\nToutes nos radios sont équipées d’un amplificateur analogique de 50 W permettant de retranscrire la sonorité des amplis à lampes en profitant d’une dynamique moderne.\r\nHaut-parleur Focal :\r\nToutes nos radios sont équipées de haut-parleurs Focal Performance Coaxial 120W, référence mondiale dans le secteur de la haute fidélité.\r\nBluetooth 5.0 aptX : \r\nNous installons un système Bluetooth 5.0 afin que vous puissiez écouter librement toutes vos musiques préférées depuis votre téléphone, ordinateur ou tablette sur votre radio vintage A.bsolument !\r\nEntrée Jack 3.5mm : \r\nLa prise Jack vous permet de brancher n’importe quel appareil compatible (platine vinyle, lecteur CD, ipod..) à votre radio. Vous pourrez ainsi diffuser votre musique via votre radio A.bsolument.\r\nRétro-éclairage de l\'écran : \r\nEn restaurant votre poste nous veillons à installer des ampoules de rétro-éclairage sur votre cadran afin que votre radio s’éclaire lorsque vous l’allumez !\r\nBouton On/Off d\'origine fonctionnel : \r\nAfin de garder le charme de l’ancien nous veillons à garder le maximum d’élément d’origine. De ce fait, le bouton d’origine est configuré pour allumer et éteindre la radio et aussi pour régler le volume sonore !', 750, 'enceinte1.png', 'enceinte2.png', 'enceinte3.png'),
(32, 'Matelas Prestige - ferme', 'Chambre', 'La composition :\r\nProfitez du confort exceptionnel des plus belles matières naturelles : cachemire, duvet de chameau, latex naturel, fibre de coco.\r\nLe latex naturel et la fibre de coco s\'unissent pour offrir un soutien ferme de votre dos. Les faces été et hiver se complètent pour un confort très agréable et adapté toute l\'année : chaud l\'hiver avec le cachemire et frais l\'été grâce au duvet de chameau. Conçu dans notre atelier à La Ferté Bernard, votre matelas prestige ferme bénéficie d\'une durée de vie très conséquente.\r\n \r\nOrigine du latex naturel :\r\nSri-Lanka / 97 % de pureté (certifié GOLS, meilleur taux)\r\nDensité du latex :\r\n75-85 kg/m3, en fonction des zones de confort\r\nDensité de la fibre de coco :\r\n4000 gr/m²\r\nComposition de la face été :\r\n900 gr/m² : chameau (500 gr/m²) + base naturelle laine (500gr/m²)\r\nComposition de la face hiver :\r\n900 gr/m² : cachemire (500 gr/m²) + base naturelle laine (500gr/m²)\r\nTissu :\r\nCoton bio - certifié GOTS (320 gr/m²)\r\nPoignées :\r\n4 poignées par matelas\r\nCertifications :\r\nBIO EU, GOLS, Oeko-tex, GOTS\r\nAdapté au sommier relevable :\r\nOui, si l\'utilisation est occasionnelle\r\n \r\nL’entretien :\r\nAfin d\'entretenir votre matelas Cosme, nous vous conseillons simplement d\'aérer votre chambre 15 minutes par jour. Au contact de l\'air pur, les fibres naturelles se vident de l\'humidité captée pendant la nuit et deviennent ainsi naturellement anti-acarien. \r\nPour conserver une très bonne durée de vie au matelas, nous vous recommandons de le retourner tous les 6 mois. Ainsi, le garnissage peut évacuer complètement l\'humidité et reprendre son gonflant initial.', 1270, 'matelas1.png', 'matelas2.png', 'matelas3.png'),
(33, 'HORTENSE CANAPÉ', 'Salon', 'Le petit canapé bridge Hortense s’est vu décerné Label VIA (Valorisation de l’Innovation dans l’Ameublement) pour l’innovation et la qualité de son design.\r\nLa structure très fine du châssis donne toute son élégance au modèle et lui confère modernité et fonctionnalité.\r\nElégant, ce petit canapé, de faible encombrement, trouvera sa place aussi bien dans une pièce à vivre que dans une entrée ou un bureau.\r\nLe soin apporté par les artisans selliers à la confection du canapé Hortense vous séduiront sans aucun doute et souligne tout le raffinement de ce petit canapé style bridge.\r\nLe canapé Hortense se décline également dans une version très confortable de fauteuil bridge.\r\n\r\nTaille du canape :\r\nLongueur : 143cm\r\nProfondeur : 72 cm\r\nHauteur : 70 cm', 3840, 'canape1.png', 'canape2.png', 'canape3.png'),
(34, 'Bibliothèque Etagère Chêne blanchi et laqué', 'Salon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue ex nunc, a efficitur justo porttitor ut. Sed feugiat, ipsum ac malesuada volutpat, est nibh vulputate ipsum, et varius ipsum felis sed dui. Praesent pellentesque consectetur enim. Nullam fringilla gravida nulla, et auctor nibh rhoncus a. Vestibulum vestibulum lacus urna, non porta erat interdum nec. Aliquam molestie, urna a venenatis imperdiet, diam felis consectetur sem, in bibendum tellus erat eu odio. Nullam in enim at sapien porta fringilla vel nec quam. Pellentesque eget molestie justo, ut feugiat tellus. Sed arcu urna, mollis ac urna quis, porta pretium ex. Cras nec lacinia mauris, nec laoreet lacus. Quisque non lacus eu nisi euismod porttitor. Fusce feugiat mattis volutpat. Cras vel dignissim lacus. Vestibulum scelerisque lorem vel augue venenatis sodales. ', 1240, 'biblio.png', '', ''),
(35, 'Sommier tapissier ', 'Chambre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue ex nunc, a efficitur justo porttitor ut. Sed feugiat, ipsum ac malesuada volutpat, est nibh vulputate ipsum, et varius ipsum felis sed dui. Praesent pellentesque consectetur enim. Nullam fringilla gravida nulla, et auctor nibh rhoncus a. Vestibulum vestibulum lacus urna, non porta erat interdum nec. Aliquam molestie, urna a venenatis imperdiet, diam felis consectetur sem, in bibendum tellus erat eu odio. Nullam in enim at sapien porta fringilla vel nec quam. Pellentesque eget molestie justo, ut feugiat tellus. Sed arcu urna, mollis ac urna quis, porta pretium ex. Cras nec lacinia mauris, nec laoreet lacus. Quisque non lacus eu nisi euismod porttitor. Fusce feugiat mattis volutpat. Cras vel dignissim lacus. Vestibulum scelerisque lorem vel augue venenatis sodales. ', 520, 'sommier.png', '', ''),
(36, 'Buffet TV Chêne wengé noir,  laqué et métal', 'Ammeublements', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue ex nunc, a efficitur justo porttitor ut. Sed feugiat, ipsum ac malesuada volutpat, est nibh vulputate ipsum, et varius ipsum felis sed dui. Praesent pellentesque consectetur enim. Nullam fringilla gravida nulla, et auctor nibh rhoncus a. Vestibulum vestibulum lacus urna, non porta erat interdum nec. Aliquam molestie, urna a venenatis imperdiet, diam felis consectetur sem, in bibendum tellus erat eu odio. Nullam in enim at sapien porta fringilla vel nec quam. Pellentesque eget molestie justo, ut feugiat tellus. Sed arcu urna, mollis ac urna quis, porta pretium ex. Cras nec lacinia mauris, nec laoreet lacus. Quisque non lacus eu nisi euismod porttitor. Fusce feugiat mattis volutpat. Cras vel dignissim lacus. Vestibulum scelerisque lorem vel augue venenatis sodales. ', 450, 'meuble1.png', '', ''),
(37, 'Table basse rectangulaire Chêne blanchi et laqué', 'Ammeublements', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue ex nunc, a efficitur justo porttitor ut. Sed feugiat, ipsum ac malesuada volutpat, est nibh vulputate ipsum, et varius ipsum felis sed dui. Praesent pellentesque consectetur enim. Nullam fringilla gravida nulla, et auctor nibh rhoncus a. Vestibulum vestibulum lacus urna, non porta erat interdum nec. Aliquam molestie, urna a venenatis imperdiet, diam felis consectetur sem, in bibendum tellus erat eu odio. Nullam in enim at sapien porta fringilla vel nec quam. Pellentesque eget molestie justo, ut feugiat tellus. Sed arcu urna, mollis ac urna quis, porta pretium ex. Cras nec lacinia mauris, nec laoreet lacus. Quisque non lacus eu nisi euismod porttitor. Fusce feugiat mattis volutpat. Cras vel dignissim lacus. Vestibulum scelerisque lorem vel augue venenatis sodales. ', 400, 'meuble2.png', '', ''),
(38, 'Vaisselier Noyer naturel et laqué , pied métal', 'Ammeublements', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue ex nunc, a efficitur justo porttitor ut. Sed feugiat, ipsum ac malesuada volutpat, est nibh vulputate ipsum, et varius ipsum felis sed dui. Praesent pellentesque consectetur enim. Nullam fringilla gravida nulla, et auctor nibh rhoncus a. Vestibulum vestibulum lacus urna, non porta erat interdum nec. Aliquam molestie, urna a venenatis imperdiet, diam felis consectetur sem, in bibendum tellus erat eu odio. Nullam in enim at sapien porta fringilla vel nec quam. Pellentesque eget molestie justo, ut feugiat tellus. Sed arcu urna, mollis ac urna quis, porta pretium ex. Cras nec lacinia mauris, nec laoreet lacus. Quisque non lacus eu nisi euismod porttitor. Fusce feugiat mattis volutpat. Cras vel dignissim lacus. Vestibulum scelerisque lorem vel augue venenatis sodales. ', 560, 'meuble3.png', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `reason`
--

CREATE TABLE `reason` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `administrator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `phoneNumber`, `reason_id`, `administrator`) VALUES
(4, 'Luis', 'Teixeira Lima', 'luis.teixeira-lima@epitech.digital', '$2y$10$P8zLNR2zj4j7A.OHdCNOi.EI4rWj8pij/bTNR17AePWBV6Z5gLewe', 767472227, 0, 1),
(9, 'Remi', 'Lemoust', 'remi@outlook.fr', '$2y$10$Pecw./GwkTgF4Crrg9RtgO3hn5p8XT.yTooVk25RazgAaPfLIE/k2', 783374192, 0, 1),
(10, 'larze', 'larze', 'larze@outlook.fr', '$2y$10$N8uPahinnI0MmiRcUL.ZIO0W92Ucv8I0y40zuPNaUf2XA92qHzkAO', 9765456, 0, 0),
(11, 'Ko,ioij', 'ojiojioj', 'aeae@gm.com', '$2y$10$.vxasR1vMnFOeUW/Meu6ROiNlE25MA7AG0Xf9tHp9qxpvfqwGHPdG', 980809, 0, 0),
(12, 'Luis', 'Teixeira Lima', 'luislima003.ll@gmail.com', '$2y$10$q41GzUkmjJ4ig4Ncol4r5Oro2s7ztRtYtoRGYj6rqL0Hh8m1QKQ4G', 767472227, 0, 0),
(13, 'dezdzedz', 'dzdzdzd', 'remidede@outlook.fr', '$2y$10$3QJr8cdm.AgcKYQ26aJYtO7mPggyAK.fik5W7ErgYucURjj13QX9G', 0, 0, 0),
(14, 'myriam', 'myriam', 'myriam@outlook.fr', '$2y$10$IQW1qqGrASdLTBbo0zRILODGUjctz2kDTjHXF74vbXxmvRpLgFLP2', 98765678, 0, 0),
(15, 'luis', 'oiuoi', 'aqwxszedcvf@gmail.com', '$2y$10$0kjFYXVub.HyiqkNmXuxjeR9J.Z/JGCnDG0w2Csj7WFOHJ6tZh/Q2', 798789789, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_cart`
--

CREATE TABLE `user_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_cart`
--
ALTER TABLE `user_cart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_cart`
--
ALTER TABLE `user_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
