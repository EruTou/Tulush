#
# TABLE STRUCTURE FOR: Categories
#

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Categories` (`id_category`, `name`) VALUES (1, 'quasi');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (2, 'iste');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (3, 'aliquid');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (4, 'voluptas');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (5, 'rem');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (6, 'officiis');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (7, 'voluptatem');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (8, 'sed');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (9, 'vero');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (10, 'fugiat');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (11, 'modi');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (12, 'laborum');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (13, 'similique');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (14, 'ab');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (15, 'officia');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (16, 'et');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (17, 'dolore');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (18, 'maiores');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (19, 'nulla');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (20, 'sit');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (21, 'eveniet');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (22, 'numquam');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (23, 'ut');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (24, 'vel');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (25, 'corrupti');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (26, 'et');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (27, 'deleniti');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (28, 'fuga');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (29, 'rerum');
INSERT INTO `Categories` (`id_category`, `name`) VALUES (30, 'non');


#
# TABLE STRUCTURE FOR: Deliveries
#

DROP TABLE IF EXISTS `Deliveries`;

CREATE TABLE `Deliveries` (
  `id_delivery` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_datetime` datetime NOT NULL,
  `Providers_id_provider` int(11) NOT NULL,
  `Warehouses_id_warehouse` int(11) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `fk_Deliveries_Providers_idx` (`Providers_id_provider`),
  KEY `fk_Deliveries_Warehouses1_idx` (`Warehouses_id_warehouse`),
  CONSTRAINT `fk_Deliveries_Providers` FOREIGN KEY (`Providers_id_provider`) REFERENCES `Providers` (`id_provider`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deliveries_Warehouses1` FOREIGN KEY (`Warehouses_id_warehouse`) REFERENCES `Warehouses` (`id_warehouse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (1, '2022-06-01 11:33:41', 9, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (2, '2009-07-09 01:38:02', 4, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (3, '1990-05-10 03:13:37', 4, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (4, '1999-10-21 17:55:35', 5, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (5, '2022-11-20 04:09:49', 3, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (6, '2009-04-21 00:04:26', 9, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (7, '2006-01-14 03:11:59', 5, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (8, '1989-02-04 13:29:49', 1, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (9, '1985-04-19 06:53:04', 10, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (10, '2021-06-01 15:52:00', 1, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (11, '2002-04-25 10:51:04', 6, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (12, '2015-12-09 13:03:51', 7, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (13, '2009-04-28 21:05:04', 7, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (14, '1970-11-27 08:38:07', 7, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (15, '2011-06-17 03:18:47', 8, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (16, '2012-02-18 04:53:02', 6, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (17, '1995-03-17 12:37:34', 5, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (18, '2021-03-02 19:42:52', 10, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (19, '1981-07-26 13:26:12', 4, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (20, '2016-08-16 14:40:04', 9, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (21, '1995-12-07 02:12:22', 8, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (22, '1991-10-24 01:02:27', 5, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (23, '1973-11-13 04:20:23', 2, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (24, '1989-02-16 03:56:30', 3, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (25, '1978-01-09 08:41:03', 7, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (26, '1979-03-26 09:50:12', 2, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (27, '1989-07-08 23:38:57', 4, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (28, '2017-07-22 16:14:02', 8, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (29, '1998-09-03 10:42:29', 5, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (30, '1985-08-03 16:17:18', 4, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (31, '2022-11-10 23:24:03', 4, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (32, '2017-08-01 02:14:44', 7, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (33, '2018-12-24 09:34:08', 3, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (34, '2018-11-08 05:56:31', 2, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (35, '1973-02-10 01:27:22', 3, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (36, '2004-01-27 17:26:55', 5, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (37, '2014-03-06 19:34:26', 10, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (38, '1994-07-01 12:22:57', 9, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (39, '2006-10-02 18:53:28', 1, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (40, '1995-12-10 16:25:34', 5, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (41, '1977-10-20 19:52:05', 2, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (42, '2019-07-23 19:45:23', 5, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (43, '2015-07-21 13:09:04', 8, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (44, '1977-05-05 22:31:15', 5, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (45, '2008-12-20 00:00:22', 1, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (46, '1974-01-30 17:50:07', 6, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (47, '2013-02-11 04:20:16', 6, 1);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (48, '1984-09-26 10:33:48', 3, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (49, '1982-05-16 13:49:17', 2, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (50, '1985-03-18 22:11:34', 10, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (51, '1994-04-12 22:16:09', 3, 4);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (52, '2004-12-18 06:15:23', 9, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (53, '1986-02-27 19:40:36', 4, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (54, '1997-07-12 21:58:50', 8, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (55, '2003-09-16 21:41:21', 10, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (56, '1973-08-26 10:43:26', 7, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (57, '1994-10-02 12:31:10', 5, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (58, '2022-09-21 23:50:18', 5, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (59, '1987-11-07 14:53:53', 1, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (60, '1992-08-04 02:06:48', 10, 7);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (61, '1976-02-27 17:21:50', 6, 3);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (62, '1998-10-13 13:06:03', 2, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (63, '2018-08-10 03:43:36', 7, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (64, '2002-02-09 05:53:50', 8, 2);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (65, '1993-05-12 12:17:51', 4, 6);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (66, '1989-11-02 06:30:00', 2, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (67, '2009-07-16 06:50:06', 8, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (68, '1998-10-04 21:37:46', 2, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (69, '1972-08-29 01:39:27', 5, 5);
INSERT INTO `Deliveries` (`id_delivery`, `delivery_datetime`, `Providers_id_provider`, `Warehouses_id_warehouse`) VALUES (70, '2014-01-02 08:46:58', 7, 3);


#
# TABLE STRUCTURE FOR: Employees
#

DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (1, 'Ms. Margot Ledner', '924 Lemke Island Apt. 160\nLuettgenburgh, CA 84450-0677', '89188144213', 'non', '1979-11-28', '57230');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (2, 'Liliane Corkery', '82549 Stokes Haven\nNorth Rocio, HI 24455', '89403616114', 'odio', '2012-05-08', '65232');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (3, 'Dr. Jamal Daniel II', '7716 Gerhold Brooks\nEast Bethelfort, WV 75964-5227', '89832715288', 'eveniet', '2004-05-05', '32325');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (4, 'Janice Bergnaum', '9772 Malika Radial\nNew Chelsieside, ME 44516', '89146864037', 'quas', '2015-07-23', '59693');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (5, 'Jeffry McDermott', '70873 Weber Fall Apt. 366\nPort Garnettside, LA 73777', '89720255561', 'nisi', '1983-02-25', '39250');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (6, 'Thora Ebert', '4581 Raquel Falls Suite 760\nWest Erwinbury, MT 19851', '89614838461', 'aut', '1994-06-03', '40353');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (7, 'Adeline Fritsch', '87869 Brooke Lakes\nBeatricechester, WY 01470-6237', '89121179653', 'minus', '1979-06-04', '29558');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (8, 'Modesta Stroman', '3150 Hintz Grove\nWest Nevaport, IL 37292-1082', '89891856286', 'veniam', '1998-10-25', '35047');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (9, 'Tianna Gusikowski', '443 Karson Plaza\nNorth Leilanitown, SD 07861-8348', '89022120524', 'iusto', '1981-06-21', '69170');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (10, 'Sheldon Gleason', '7460 Beier Key Suite 060\nSouth Naomi, NV 12142', '89277350739', 'velit', '2000-02-29', '53580');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (11, 'Hellen Schmidt', '4629 Loma Crescent Apt. 565\nJazminbury, CT 09787', '89929445688', 'iste', '1974-08-24', '27321');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (12, 'Prof. Lucious Bashirian III', '8469 Blanche Alley\nCyrusport, AK 44195', '89076712408', 'nulla', '2000-08-10', '39913');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (13, 'Elfrieda Moore V', '014 Harvey Street Suite 565\nNew Kristianside, WV 33692', '89333578673', 'doloremque', '1972-10-23', '53887');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (14, 'Dallin Kuhn', '9763 Richie Meadows Suite 310\nNicolasberg, AK 94235', '89422386960', 'saepe', '1973-12-07', '50785');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (15, 'Karlee Bogan', '44227 Madisyn Fort Apt. 612\nEast Annaburgh, SD 47046', '89464485946', 'dicta', '1987-12-18', '39569');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (16, 'Julian Wintheiser', '342 Bradtke Radial Suite 886\nLake Nonastad, SC 83537-9502', '89435005224', 'perferendis', '1978-09-10', '54375');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (17, 'Aubree Strosin', '58348 Senger Pines Suite 490\nClaudieport, OH 93750', '89436522025', 'quis', '1991-09-23', '37402');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (18, 'Prof. Isidro Greenfelder', '346 Arch Shoals Apt. 886\nOliverberg, GA 80033-9300', '89809449711', 'architecto', '1995-05-03', '32139');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (19, 'Sandrine Reynolds II', '684 Kelly Shoal\nDickinsonside, TN 10610', '89221568072', 'omnis', '1976-12-19', '75651');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (20, 'Cale Boehm', '72072 Marjory Via\nPort Daishatown, KS 57435', '89959610722', 'dicta', '1977-02-23', '62996');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (21, 'Mr. Lexus Turcotte Jr.', '940 Richie Crescent Apt. 778\nHebermouth, DC 09518-8870', '89243144915', 'voluptatibus', '1989-02-04', '75693');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (22, 'Obie Gutmann', '51273 Anahi Unions Apt. 015\nGutmannmouth, DE 21284', '89721065641', 'eveniet', '2015-04-11', '50306');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (23, 'Mitchel Lindgren', '6812 Kris Tunnel\nWeissnatside, RI 39394-6349', '89095077461', 'laudantium', '1976-06-29', '51552');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (24, 'Dr. Wyman Wilderman PhD', '3870 Paolo Glen\nSouth Neldamouth, VA 00106-8862', '89978337752', 'et', '1985-05-11', '41071');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (25, 'Prof. Frederic Funk', '06622 Langworth Junction\nEast Charlottetown, WY 76719', '89419539912', 'quae', '2020-11-28', '41800');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (26, 'Milo Goldner IV', '95654 Mason Plaza\nGiovannyshire, AZ 23488', '89233732501', 'at', '1987-12-18', '53893');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (27, 'Prof. Leanne Skiles', '4249 Vivianne Mountains\nNew Rolandofurt, VT 54452', '89764118131', 'nesciunt', '2021-09-14', '43456');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (28, 'Ezra Pfeffer', '10720 Kreiger Islands Suite 870\nBergstromshire, ID 64347', '89684281829', 'ut', '2020-04-17', '64047');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (29, 'Daniella Abshire III', '567 Haley Haven\nNorth Ike, WY 73783-4152', '89914330724', 'animi', '2011-08-16', '28581');
INSERT INTO `Employees` (`id_employee`, `name`, `address`, `phone`, `post`, `birthday`, `salary`) VALUES (30, 'Mr. Vincenzo O\'Connell', '4184 Collins Expressway\nTownestad, IA 70889', '89833108191', 'excepturi', '1999-04-06', '32709');


#
# TABLE STRUCTURE FOR: Orders
#

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `sum_price` float NOT NULL,
  `address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_datetime` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `Users_id_user` int(11) NOT NULL,
  `Warehouses_id_warehouse` int(11) NOT NULL,
  `Shops_id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_Orders_Users1_idx` (`Users_id_user`),
  KEY `fk_Orders_Warehouses1_idx` (`Warehouses_id_warehouse`),
  KEY `fk_Orders_Shops1_idx` (`Shops_id_shop`),
  CONSTRAINT `fk_Orders_Shops1` FOREIGN KEY (`Shops_id_shop`) REFERENCES `Shops` (`id_shop`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Users1` FOREIGN KEY (`Users_id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Warehouses1` FOREIGN KEY (`Warehouses_id_warehouse`) REFERENCES `Warehouses` (`id_warehouse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (1, '183.734', '040 Osinski Overpass Suite 888\nJacyntheville, MD 93170-3989', '1984-08-17 23:02:16', 31, 0, 8, 1, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (2, '99.2352', '497 Yundt Islands\nBeckerfurt, GA 57073-7375', '1974-02-27 15:44:05', 45, 1, 47, 3, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (3, '25.2569', '5874 Shakira Cove Suite 354\nNew Stephenhaven, ID 98615-9719', '1996-08-15 18:15:28', 29, 0, 17, 6, 3);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (4, '1493120', '905 Delta Via Apt. 658\nTellyfort, MO 66489', '1982-01-05 20:52:49', 3, 0, 46, 3, 9);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (5, '889.477', '780 Sam Freeway\nStarkhaven, ME 11067-4725', '1979-01-01 13:35:04', 38, 1, 40, 1, 13);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (6, '91.78', '751 Jairo Lake Apt. 353\nPort Annabellefurt, IL 97319', '1974-08-01 02:13:45', 12, 1, 16, 3, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (7, '662480', '101 Annetta Burgs\nYasmeenberg, FL 99482', '1985-02-17 14:57:39', 29, 0, 13, 6, 2);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (8, '352.251', '907 Fritsch Drive Apt. 680\nSkyemouth, NE 60493', '2015-01-18 09:45:04', 25, 0, 22, 5, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (9, '96.8612', '470 Hauck Motorway\nAddieside, MO 81206-5727', '2014-03-02 15:55:45', 21, 0, 1, 2, 13);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (10, '67831300', '83305 O\'Keefe Neck\nBergebury, KY 64468-1626', '2015-05-09 03:22:48', 40, 0, 36, 5, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (11, '99.3112', '28979 Konopelski Streets Suite 619\nWelchton, FL 39358', '1981-05-02 04:50:21', 15, 0, 10, 2, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (12, '511.572', '034 Alfred Creek Apt. 479\nNew Abigail, ID 82550', '2006-03-30 16:11:05', 13, 0, 7, 7, 7);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (13, '2360930', '1843 Mia Points Apt. 994\nSouth Sigmundburgh, MI 90235-7337', '2000-01-26 06:25:09', 48, 1, 40, 3, 11);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (14, '92.1853', '7719 Hackett Stream\nSouth Valentinhaven, KY 78051-2503', '2013-09-28 19:10:13', 3, 1, 33, 3, 5);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (15, '171972', '41889 Nicolette Motorway Suite 470\nEast Mauricioburgh, AZ 32389-0708', '1991-04-21 09:45:41', 10, 0, 33, 7, 14);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (16, '21.4943', '8099 Elna Squares Apt. 154\nPort Ramonaland, MN 66102-2063', '2015-08-10 23:10:10', 40, 1, 35, 1, 11);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (17, '430.972', '9223 Ullrich Fork\nAlicefurt, CO 63724-3409', '1975-10-01 15:50:18', 18, 0, 23, 5, 14);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (18, '2100.26', '80873 Alexandrine Stravenue Suite 432\nJanaeberg, UT 83279-1312', '2018-05-23 07:25:27', 12, 0, 44, 7, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (19, '34131200', '5211 Tevin Coves Apt. 096\nPort Tyree, AL 77484', '2004-04-12 08:06:01', 41, 1, 2, 3, 2);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (20, '478.68', '89988 O\'Hara Plain\nNehaside, DC 96931', '1987-04-08 05:48:03', 39, 1, 39, 5, 7);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (21, '127500000', '0068 Joanne Shoals\nCorwinborough, DE 41730-8679', '1981-09-29 10:53:20', 43, 0, 8, 3, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (22, '26957100', '3176 Stanton Manor Suite 753\nPort Jaylanmouth, AR 05388', '1972-04-22 02:11:48', 50, 1, 22, 6, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (23, '105666', '055 Uriel Squares\nPowlowskistad, KY 59486', '1978-07-21 19:00:04', 4, 0, 24, 7, 2);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (24, '5525360', '6543 Citlalli Lodge Apt. 366\nPort Santa, LA 55907-7218', '2016-05-23 10:00:22', 43, 1, 43, 5, 6);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (25, '1044540', '14551 Veum Walks Suite 507\nCormierville, LA 38290', '2007-01-11 13:13:12', 5, 0, 23, 5, 7);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (26, '97.8655', '3237 Bahringer Lakes\nNew Devanhaven, SC 06553', '2004-11-25 21:03:35', 20, 1, 21, 4, 10);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (27, '56.6114', '93355 Cristobal Turnpike\nNew Danland, WY 86154-4952', '1986-01-25 14:46:03', 2, 1, 41, 3, 15);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (28, '85.2025', '909 Khalid Flat Suite 899\nBinsview, IN 22217', '2003-05-15 15:39:05', 44, 1, 42, 4, 1);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (29, '507953', '03087 Skyla Lane\nSchmidtstad, NH 52741', '2009-03-13 19:38:50', 30, 0, 40, 5, 14);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (30, '54.8636', '2483 Janessa Dam\nEast Ubaldoton, NM 50594', '1985-09-16 05:11:13', 42, 1, 11, 4, 5);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (31, '474214', '7801 Bernier Brooks\nZitamouth, TX 10346', '1988-08-13 03:11:58', 30, 0, 23, 6, 3);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (32, '177.212', '16246 Tremblay Squares Apt. 666\nPort Novella, ME 82261', '1986-11-18 01:13:26', 20, 1, 34, 1, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (33, '24.1963', '95582 Rusty Squares\nPort Alvisville, AR 75808', '2005-01-02 09:03:47', 50, 1, 13, 5, 12);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (34, '77.8224', '6773 Leffler Way\nNorth Fredaton, GA 63309-6795', '2010-06-12 14:01:44', 44, 1, 2, 1, 9);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (35, '48.2723', '5601 Ephraim Hill Suite 573\nLake Elvie, NE 57777-5403', '1986-03-11 23:50:58', 22, 1, 25, 3, 6);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (36, '3079690', '012 Eugene Ferry\nPort Justynberg, CT 86792-5584', '1973-10-07 04:06:45', 38, 1, 5, 7, 1);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (37, '37629000', '28633 Clair Summit\nNew Bo, MD 76099', '2017-12-10 21:58:24', 29, 0, 35, 5, 6);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (38, '74.9338', '782 Citlalli Avenue\nTerrystad, LA 98353', '2014-02-08 15:49:03', 14, 0, 8, 7, 15);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (39, '4654910', '4981 Monte Camp\nJeanstad, FL 96812', '1998-04-06 01:36:08', 37, 1, 25, 7, 4);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (40, '2964.18', '4118 Everett Mountain\nWest Kaelynstad, MA 35639-6249', '2008-07-14 08:41:46', 37, 1, 20, 5, 2);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (41, '4193580', '6445 Cletus Creek Apt. 508\nLake Marietta, OH 14814-6012', '2002-11-26 12:37:10', 27, 1, 35, 7, 13);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (42, '2939.56', '111 Ledner Spur Apt. 599\nLake Burniceton, IN 43643-8307', '2009-05-09 06:15:39', 10, 1, 40, 6, 7);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (43, '527.676', '87208 Tony Roads Apt. 408\nDavishaven, AK 97175', '1986-02-27 17:06:20', 29, 0, 7, 6, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (44, '144.277', '662 Abe Springs\nPort Jarrett, IL 70751-6526', '1998-09-06 00:48:24', 34, 0, 28, 7, 2);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (45, '84.7162', '287 Dallin Inlet Apt. 630\nLehnershire, NE 85610', '1979-12-01 10:32:59', 17, 1, 1, 5, 7);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (46, '14733000', '6553 Botsford Shoal\nEast Lavonside, TN 75754', '2005-08-08 08:01:37', 39, 1, 41, 4, 4);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (47, '51.5071', '28148 Meggie Square Apt. 728\nNorth Catalinamouth, MN 86159-2453', '1995-12-25 04:15:07', 46, 0, 28, 1, 5);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (48, '3.85258', '0814 Fahey Ford\nMurrayborough, WV 84479', '1971-06-08 23:07:37', 30, 1, 39, 6, 5);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (49, '181.367', '667 Bergstrom Divide Suite 336\nIzabellabury, MT 27677', '1987-04-01 16:31:51', 30, 0, 23, 4, 8);
INSERT INTO `Orders` (`id_order`, `sum_price`, `address`, `order_datetime`, `amount`, `status`, `Users_id_user`, `Warehouses_id_warehouse`, `Shops_id_shop`) VALUES (50, '74.8492', '011 Toy Dale\nWolftown, CO 44754', '1987-03-01 10:19:01', 38, 1, 10, 3, 13);


#
# TABLE STRUCTURE FOR: Products
#

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `expiration_date` datetime NOT NULL,
  `Categories_id_category` int(11) NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_Products_Categories1_idx` (`Categories_id_category`),
  CONSTRAINT `fk_Products_Categories1` FOREIGN KEY (`Categories_id_category`) REFERENCES `Categories` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (1, 'incidunt', '1493', '2022-04-02 09:20:51', 2);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (2, 'vero', '603', '1970-12-17 07:51:59', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (3, 'odit', '1210', '1991-09-09 21:22:20', 18);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (4, 'possimus', '1333', '1975-03-15 14:36:46', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (5, 'enim', '885', '1974-04-30 13:01:54', 5);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (6, 'ut', '802', '2015-07-22 07:15:15', 2);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (7, 'sunt', '310', '2003-08-26 00:04:08', 27);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (8, 'vel', '1142', '2016-08-06 03:29:58', 28);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (9, 'voluptas', '480', '2005-09-21 03:05:19', 8);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (10, 'ut', '361', '1971-02-22 02:39:42', 20);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (11, 'sit', '1395', '2014-02-12 09:46:52', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (12, 'quis', '726', '2021-06-17 03:01:20', 14);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (13, 'sed', '817', '1985-11-11 09:42:44', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (14, 'eaque', '313', '1978-03-11 17:29:52', 29);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (15, 'animi', '636', '1973-03-15 16:26:52', 29);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (16, 'eligendi', '746', '2003-08-19 20:37:10', 19);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (17, 'nisi', '439', '1991-11-14 17:18:00', 5);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (18, 'incidunt', '246', '2013-10-09 00:05:25', 19);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (19, 'deleniti', '877', '1999-12-10 08:52:10', 2);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (20, 'at', '834', '2006-02-21 13:31:18', 5);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (21, 'vel', '478', '2016-07-02 18:40:25', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (22, 'iusto', '161', '1997-10-19 10:46:15', 29);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (23, 'modi', '1083', '2019-03-29 00:14:46', 13);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (24, 'eos', '842', '1993-02-22 06:59:23', 18);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (25, 'quo', '728', '1979-10-22 00:28:57', 18);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (26, 'repudiandae', '155', '2006-12-15 23:44:51', 12);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (27, 'beatae', '174', '2019-02-07 12:23:06', 21);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (28, 'repellat', '1221', '1989-07-16 12:26:59', 11);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (29, 'placeat', '1412', '1973-10-22 06:39:33', 21);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (30, 'minima', '1280', '1971-10-11 22:56:06', 8);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (31, 'modi', '1266', '1996-03-29 05:32:37', 29);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (32, 'dicta', '644', '1984-07-23 03:14:05', 5);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (33, 'voluptas', '1387', '2022-09-02 05:26:24', 21);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (34, 'odit', '255', '2016-01-09 17:57:47', 8);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (35, 'omnis', '1136', '2002-05-08 18:59:56', 1);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (36, 'vel', '1228', '2016-03-10 08:46:25', 10);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (37, 'accusamus', '1122', '2017-11-01 11:19:22', 21);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (38, 'repudiandae', '754', '1986-05-25 21:47:43', 4);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (39, 'quia', '833', '2005-03-14 13:28:29', 19);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (40, 'est', '468', '1979-05-25 10:48:51', 4);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (41, 'dolorem', '309', '2004-10-13 22:04:03', 19);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (42, 'deleniti', '1455', '2011-03-28 04:30:36', 19);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (43, 'nam', '390', '2005-02-10 07:51:45', 22);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (44, 'exercitationem', '1108', '1995-01-31 17:48:36', 23);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (45, 'voluptas', '1062', '1976-02-20 23:07:17', 28);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (46, 'neque', '1438', '1984-04-03 04:34:42', 2);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (47, 'accusamus', '871', '2007-08-28 02:05:50', 23);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (48, 'impedit', '948', '1989-09-19 17:03:00', 11);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (49, 'voluptatem', '158', '2012-03-28 07:15:59', 8);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (50, 'id', '488', '2009-12-29 02:49:40', 15);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (51, 'aliquam', '882', '2000-11-14 10:47:06', 12);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (52, 'consequatur', '1378', '2018-06-04 17:21:33', 1);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (53, 'officia', '405', '1980-12-09 23:31:53', 30);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (54, 'quod', '536', '1986-11-30 18:18:13', 26);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (55, 'suscipit', '317', '2003-12-15 07:21:03', 28);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (56, 'qui', '1070', '2022-10-09 03:18:20', 18);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (57, 'magni', '921', '1996-06-26 22:31:33', 2);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (58, 'maiores', '308', '1991-04-23 17:40:36', 9);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (59, 'earum', '1478', '1979-01-25 16:08:00', 29);
INSERT INTO `Products` (`id_product`, `name`, `price`, `expiration_date`, `Categories_id_category`) VALUES (60, 'maxime', '1267', '2013-07-05 20:23:28', 29);


#
# TABLE STRUCTURE FOR: Providers
#

DROP TABLE IF EXISTS `Providers`;

CREATE TABLE `Providers` (
  `id_provider` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_provider`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (1, 'Jerde Group', '96646 Haven Groves Apt. 761\nBrandynbury, TN 70299-8734', '89256847335');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (2, 'Conn-Armstrong', '85334 Beier Glen Suite 338\nNorth Quinnview, IA 52642', '89661863057');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (3, 'Prosacco-Fay', '05570 Marks Tunnel\nKreigerborough, RI 03371-0079', '89742717016');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (4, 'Hahn LLC', '3137 Sylvia Mills Apt. 367\nBrennanville, NJ 96259', '89419766491');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (5, 'Pagac, Johnston and West', '6067 Mayer Junctions\nRickmouth, DE 89224-5919', '89547440284');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (6, 'Jones Group', '860 Wendy Squares\nNew Ernestinaberg, FL 17625-6998', '89307265077');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (7, 'Strosin Inc', '58357 Candida Fort\nNorth Kayaside, IN 97188-2499', '89725111473');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (8, 'Schowalter Inc', '245 Susie Trafficway Suite 634\nClaudieborough, KS 29923-3053', '89416566059');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (9, 'Kuhic, Wuckert and Kunze', '0354 Tierra Knolls Suite 878\nJosianefurt, AL 57101-2279', '89255495318');
INSERT INTO `Providers` (`id_provider`, `name`, `address`, `phone`) VALUES (10, 'Wilderman, Feest and O\'Kon', '09045 Kemmer Mission Suite 461\nNorth Dorthafort, DE 39476-1507', '89947702735');


#
# TABLE STRUCTURE FOR: Shops
#

DROP TABLE IF EXISTS `Shops`;

CREATE TABLE `Shops` (
  `id_shop` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Employees_id_employee` int(11) NOT NULL,
  PRIMARY KEY (`id_shop`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_Shops_Employees1_idx` (`Employees_id_employee`),
  CONSTRAINT `fk_Shops_Employees1` FOREIGN KEY (`Employees_id_employee`) REFERENCES `Employees` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (1, 'Dibbert Inc', '81330 Corkery Oval Apt. 310\nLindstad, UT 36300', '89953284989', 14);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (2, 'Huel, Harber and Franecki', '30707 Sally Branch\nNew Rosemary, IN 37471-8368', '89433136179', 5);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (3, 'Lind-Reynolds', '528 Kunze Squares Suite 355\nVolkmanport, CO 36703', '89576374685', 15);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (4, 'Littel, Sawayn and Hermann', '46628 Farrell Knoll Suite 542\nMadilynhaven, AL 04536', '89691949838', 6);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (5, 'Dach-Padberg', '167 Sauer Orchard\nMicheleton, TX 53676-0885', '89170193538', 25);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (6, 'Wiza-Rohan', '86042 Raynor Stravenue\nMargaretteport, DE 81015', '89743635608', 30);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (7, 'Goodwin-Marks', '0100 Candice Forks\nHalvorsonland, PA 60112-0306', '89476646817', 7);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (8, 'Wiegand-Walker', '070 Savanna Divide\nSelinaville, OK 43100-2385', '89893294275', 9);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (9, 'Gusikowski-Bartoletti', '3437 Larkin Freeway\nNew Maxime, NM 09732-8013', '89195614742', 23);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (10, 'Volkman-Schulist', '517 Spencer Flat\nNew Karlieview, AK 63886-9216', '89812150238', 24);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (11, 'Dickens, Metz and Schultz', '94808 Maxwell Avenue\nLake Henriette, CT 32029', '89831633849', 4);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (12, 'O\'Conner-Waters', '514 Reinger Wall\nTabithaville, NH 99051-9244', '89382617101', 30);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (13, 'Thompson, Ullrich and Turcotte', '7792 Torphy Extensions\nNorth Brennonstad, MT 52770-7060', '89016858615', 29);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (14, 'Howell, Wyman and Corkery', '69283 Gorczany Vista Suite 195\nWest Lilianatown, VT 84769', '89018350410', 10);
INSERT INTO `Shops` (`id_shop`, `name`, `address`, `phone`, `Employees_id_employee`) VALUES (15, 'Osinski-Rosenbaum', '1137 Schaden Lane\nEast Marciaton, NM 50179-2489', '89426806388', 7);


#
# TABLE STRUCTURE FOR: Statuses
#

DROP TABLE IF EXISTS `Statuses`;

CREATE TABLE `Statuses` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `Orders_id_order` int(11) NOT NULL,
  PRIMARY KEY (`id_status`,`Orders_id_order`),
  KEY `fk_Statuses_Orders1_idx` (`Orders_id_order`),
  CONSTRAINT `fk_Statuses_Orders1` FOREIGN KEY (`Orders_id_order`) REFERENCES `Orders` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (1, 3);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (2, 34);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (3, 4);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (4, 31);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (5, 21);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (6, 24);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (7, 34);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (8, 5);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (9, 39);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (10, 26);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (11, 12);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (12, 32);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (13, 6);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (14, 16);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (15, 8);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (16, 22);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (17, 26);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (18, 33);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (19, 11);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (20, 21);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (21, 30);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (22, 12);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (23, 38);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (24, 19);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (25, 50);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (26, 36);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (27, 30);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (28, 12);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (29, 15);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (30, 28);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (31, 3);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (32, 6);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (33, 33);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (34, 49);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (35, 42);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (36, 15);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (37, 24);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (38, 10);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (39, 47);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (40, 14);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (41, 16);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (42, 15);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (43, 17);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (44, 28);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (45, 46);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (46, 46);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (47, 42);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (48, 47);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (49, 49);
INSERT INTO `Statuses` (`id_status`, `Orders_id_order`) VALUES (50, 35);


#
# TABLE STRUCTURE FOR: Users
#

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (1, 'Mackenzie Klein', 'b35f0188a955970d6d2f8d6a28bb79b695a8254e', '89783390407');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (2, 'Jayson Gulgowski', 'a82f30e2b36f9a83a1f3eeb3a04cef5536a21738', '89351690995');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (3, 'Dr. Kaia Feil', 'cc7b8a70cf646accfd738c01d76956358ec377c6', '89470389059');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (4, 'Elda Kulas', 'b6a379f1fe393013916e337ff053f2e07c753748', '89017507200');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (5, 'Mrs. Ines Morar', '29eb2b27203432a492abadbefb477df8226048ae', '89448094165');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (6, 'Dr. Andy Hauck V', '9b31414236d17d870adff7bf87dce38a272dbbc3', '89756092493');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (7, 'Miss Abbey Hansen', 'f12e098ab3ca8f2ff8add5e7c866347b95bdab69', '89089329709');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (8, 'Watson Donnelly', '218746deca3c22061281955e08a1c1c454be576e', '89515909708');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (9, 'Dr. Herbert Simonis V', '81c7115820ddbe0bd05fa86a0cdee0b44aa5485a', '89832637506');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (10, 'Dr. Dejon Greenfelder I', '54e67953600a030bc74c7d7251771cb79c4f67e6', '89634815474');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (11, 'Dr. Cyrus Simonis DVM', '5cc36704f5d209529b743998c57bc3f291eb3127', '89624284017');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (12, 'Ulices Gutmann', '976aecb5cac6b0e6d8fd8bbfb4abac1f17341e7a', '89956529801');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (13, 'Royce Ziemann', '235c4f57aeeaca725da6385dce2f36f803f959c8', '89996679666');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (14, 'Norval Mante', 'f5ceeee36797c5764cdb0b309f47d34ca6f45dfb', '89102413267');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (15, 'Philip Schuster', 'b6b7909cfe3201fa5ada5dc9f14238d57f7f520e', '89844179398');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (16, 'Maurice Cassin', '8833aa3365859693a1636ec931bb4a16be1057b8', '89004465643');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (17, 'Margarette Wunsch IV', 'f51416126dab46d28eedcb477941c80ca477a017', '89152311013');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (18, 'Brisa Renner V', '22a9af75da08b5bd81aefb91ed87fbb25125a448', '89006529280');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (19, 'Jocelyn Kreiger', '650cefc84fc6be56c9b2168e63d066fad984f1fe', '89549103863');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (20, 'Candice Reichel', '42ed2cfc40430e4cdd81d53e57c200d5809dded6', '89073288701');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (21, 'Donnie Macejkovic', 'd8b446ee36100334b53ec3ad9c6b220f5e2d8228', '89324744551');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (22, 'Sylvia Ullrich PhD', '06398e95294ff1e86dea39315ce56bd7cf76c9dc', '89418066956');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (23, 'Dr. Sammie Cremin PhD', 'd274673d50801a0aed639ff672cc7b033031605c', '89045134179');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (24, 'Rachael VonRueden', '3d9505428ec86a828802b13493819c96050994cd', '89246839242');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (25, 'Jadon Feest DDS', 'dbebaed6272a03914a8f61916696c68c4f36ec0d', '89138052072');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (26, 'Tyrique Harris I', 'a56a5a4e7130ea024751842ad1ebe3cdb7a3f984', '89230794780');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (27, 'Elbert Grady', '6ea9de780af86b75ca462fc29a7e002dc3ed25ec', '89793474370');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (28, 'Ms. Chyna Kassulke', 'bb327ae740fc0d01dee4ddc682e4e29444360215', '89101865084');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (29, 'Dolores Zieme', '5dbe30c462f42decf24eea4aa126719ccf432a41', '89743390913');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (30, 'Candace D\'Amore', 'e4a4cdfec1057b878b477259189e7bf2791ef469', '89079843648');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (31, 'Willis Rice', '002d88fd244d644d657d6d51f6e1b29c43d3b4b7', '89524180999');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (32, 'Moses Cummerata III', 'fe4dc9c43f1664a86b7fb295e95dbf7b0459a620', '89397130707');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (33, 'Etha Friesen V', 'c3cb60fd09f021fb877f688a0a261a7b45b57154', '89613400108');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (34, 'Prof. Carissa Tromp I', 'b10bc08789a3ea04bdae79422ec81b27056f40d5', '89317339756');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (35, 'Ms. Ashley Hansen DDS', '2208e9bb1412417b548e3d91ff20e7e99d210571', '89381893830');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (36, 'Dr. Darlene Farrell MD', '4c8abb05647e20387e1abe3981dfd2bf99f74512', '89658306802');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (37, 'Marion Champlin', '1f836140bc4afd8170e65be1d16f3b271c0e6c35', '89218569137');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (38, 'Josiane Tremblay', '573e202f9db3b4adfe52d6d0a453e81b0c893fd4', '89882092419');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (39, 'Ms. Marisol Koelpin', '40cb8724db8a502d6dc4136a980b711bcbb583cc', '89835013251');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (40, 'Shany Adams', 'd758aeb29542091a61b31fbae4932d28df60c502', '89718803483');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (41, 'Virgil Hodkiewicz', 'd2780f3818958dee57a5c646eb3f2a6c5f9346d5', '89143426165');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (42, 'Prof. Cynthia Morar III', '9877731233344ad31155cd4f0e222ffae221d579', '89673597315');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (43, 'Raleigh Heathcote II', '8605996da94b2cd6466fce7de6f2960987f3b7f2', '89209853138');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (44, 'Felicia Bednar', '2cf5b979b475311c7e1c09c1e2bb62bebe7eb0d7', '89979747948');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (45, 'Miss Retha Kuhn', '3a58dba5615e7b0f7df55a901d8a80a50100bb0e', '89841094097');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (46, 'Mac Rempel DDS', '2d803dfa8def9d8e8f7c6d75fcf894dcdea58732', '89034394664');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (47, 'Krystel Kreiger', 'b5605352c4e1b4a71e02ab409192ed6478ee7f36', '89544501315');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (48, 'Lucie Treutel', 'f5fbadcc3e8542b8e2e47f2dfe70ac448def151c', '89451643607');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (49, 'Dr. Yoshiko Vandervort', '0cb6e2f9e17acdd74a476ff422a3aee5024e1694', '89028299968');
INSERT INTO `Users` (`id_user`, `login`, `pass`, `phone`) VALUES (50, 'Tyrell Wunsch', '1c30bfccb1e8d6959ee06b4177c76d52b7483204', '89094552826');


#
# TABLE STRUCTURE FOR: Warehouses
#

DROP TABLE IF EXISTS `Warehouses`;

CREATE TABLE `Warehouses` (
  `id_warehouse` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `Products_id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  KEY `fk_Warehouses_Products1_idx` (`Products_id_product`),
  CONSTRAINT `fk_Warehouses_Products1` FOREIGN KEY (`Products_id_product`) REFERENCES `Products` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (1, 0, 54);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (2, 54, 56);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (3, 52, 55);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (4, 7, 38);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (5, 27, 53);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (6, 5, 17);
INSERT INTO `Warehouses` (`id_warehouse`, `amount`, `Products_id_product`) VALUES (7, 76, 49);


