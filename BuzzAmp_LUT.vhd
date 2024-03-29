 
-- In this example, we're going to map voltage to distance, using a linear 
-- approximation, according to the Sharp GP2Y0A41SK0F datasheet page 4, or 
-- Lab 3 handout page 5. 
-- 
-- The relevant points we will select are:
-- 2.750 V is  4.00 cm (or 2750 mV and  40.0 mm)
-- 0.400 V is 33.00 cm (or  400 mV and 330.0 mm)
-- 
-- Mapping to the scales in our system
-- 2750 (mV) should map to  400 (10^-4 m)
--  400 (mV) should map to 3300 (10^-4 m)
-- and developing a linear equation, we find:
--
-- Distance = -2900/2350 * Voltage + 3793.617
-- Note this code implements linear function, you must map to the 
-- NON-linear relationship in the datasheet. This code is only provided 
-- for reference to help get you started.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY BuzzAmp_Lookup IS
   PORT(
      clk            :  IN    STD_LOGIC;                                
      reset          :  IN    STD_LOGIC;                                
      index      	 :  IN    integer;                           
      Amplitude     :  OUT   integer
		);
END BuzzAmp_Lookup;

ARCHITECTURE behavior OF BuzzAmp_Lookup IS

type array_1d is array (0 to 4095) of integer;

constant BuzzAmps : array_1d := (				
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(0),
(2),
(4),
(5),
(7),
(8),
(10),
(11),
(13),
(15),
(16),
(18),
(19),
(21),
(22),
(24),
(26),
(27),
(29),
(30),
(32),
(33),
(35),
(37),
(38),
(40),
(41),
(43),
(45),
(46),
(48),
(49),
(51),
(52),
(54),
(56),
(57),
(59),
(60),
(62),
(63),
(65),
(67),
(68),
(70),
(71),
(73),
(74),
(76),
(78),
(79),
(81),
(82),
(84),
(85),
(87),
(89),
(90),
(92),
(93),
(95),
(96),
(98),
(100),
(101),
(103),
(104),
(106),
(108),
(109),
(111),
(112),
(114),
(115),
(117),
(119),
(120),
(122),
(123),
(125),
(126),
(128),
(130),
(131),
(133),
(134),
(136),
(137),
(139),
(141),
(142),
(144),
(145),
(147),
(148),
(150),
(152),
(153),
(155),
(156),
(158),
(160),
(161),
(163),
(164),
(166),
(167),
(169),
(171),
(172),
(174),
(175),
(177),
(178),
(180),
(182),
(183),
(185),
(186),
(188),
(189),
(191),
(193),
(194),
(196),
(197),
(199),
(200),
(202),
(204),
(205),
(207),
(208),
(210),
(211),
(213),
(215),
(216),
(218),
(219),
(221),
(223),
(224),
(226),
(227),
(229),
(230),
(232),
(234),
(235),
(237),
(238),
(240),
(241),
(243),
(245),
(246),
(248),
(249),
(251),
(252),
(254),
(256),
(257),
(259),
(260),
(262),
(263),
(265),
(267),
(268),
(270),
(271),
(273),
(275),
(276),
(278),
(279),
(281),
(282),
(284),
(286),
(287),
(289),
(290),
(292),
(293),
(295),
(297),
(298),
(300),
(301),
(303),
(304),
(306),
(308),
(309),
(311),
(312),
(314),
(315),
(317),
(319),
(320),
(322),
(323),
(325),
(326),
(328),
(330),
(331),
(333),
(334),
(336),
(338),
(339),
(341),
(342),
(344),
(345),
(347),
(349),
(350),
(352),
(353),
(355),
(356),
(358),
(360),
(361),
(363),
(364),
(366),
(367),
(369),
(371),
(372),
(374),
(375),
(377),
(378),
(380),
(382),
(383),
(385),
(386),
(388),
(390),
(391),
(393),
(394),
(396),
(397),
(399),
(401),
(402),
(404),
(405),
(407),
(408),
(410),
(412),
(413),
(415),
(416),
(418),
(419),
(421),
(423),
(424),
(426),
(427),
(429),
(430),
(432),
(434),
(435),
(437),
(438),
(440),
(441),
(443),
(445),
(446),
(448),
(449),
(451),
(453),
(454),
(456),
(457),
(459),
(460),
(462),
(464),
(465),
(467),
(468),
(470),
(471),
(473),
(475),
(476),
(478),
(479),
(481),
(482),
(484),
(486),
(487),
(489),
(490),
(492),
(493),
(495),
(497),
(498),
(500),
(501),
(503),
(505),
(506),
(508),
(509),
(511),
(512),
(514),
(516),
(517),
(519),
(520),
(522),
(523),
(525),
(527),
(528),
(530),
(531),
(533),
(534),
(536),
(538),
(539),
(541),
(542),
(544),
(545),
(547),
(549),
(550),
(552),
(553),
(555),
(557),
(558),
(560),
(561),
(563),
(564),
(566),
(568),
(569),
(571),
(572),
(574),
(575),
(577),
(579),
(580),
(582),
(583),
(585),
(586),
(588),
(590),
(591),
(593),
(594),
(596),
(597),
(599),
(601),
(602),
(604),
(605),
(607),
(608),
(610),
(612),
(613),
(615),
(616),
(618),
(620),
(621),
(623),
(624),
(626),
(627),
(629),
(631),
(632),
(634),
(635),
(637),
(638),
(640),
(642),
(643),
(645),
(646),
(648),
(649),
(651),
(653),
(654),
(656),
(657),
(659),
(660),
(662),
(664),
(665),
(667),
(668),
(670),
(672),
(673),
(675),
(676),
(678),
(679),
(681),
(683),
(684),
(686),
(687),
(689),
(690),
(692),
(694),
(695),
(697),
(698),
(700),
(701),
(703),
(705),
(706),
(708),
(709),
(711),
(712),
(714),
(716),
(717),
(719),
(720),
(722),
(723),
(725),
(727),
(728),
(730),
(731),
(733),
(735),
(736),
(738),
(739),
(741),
(742),
(744),
(746),
(747),
(749),
(750),
(752),
(753),
(755),
(757),
(758),
(760),
(761),
(763),
(764),
(766),
(768),
(769),
(771),
(772),
(774),
(775),
(777),
(779),
(780),
(782),
(783),
(785),
(787),
(788),
(790),
(791),
(793),
(794),
(796),
(798),
(799),
(801),
(802),
(804),
(805),
(807),
(809),
(810),
(812),
(813),
(815),
(816),
(818),
(820),
(821),
(823),
(824),
(826),
(827),
(829),
(831),
(832),
(834),
(835),
(837),
(838),
(840),
(842),
(843),
(845),
(846),
(848),
(850),
(851),
(853),
(854),
(856),
(857),
(859),
(861),
(862),
(864),
(865),
(867),
(868),
(870),
(872),
(873),
(875),
(876),
(878),
(879),
(881),
(883),
(884),
(886),
(887),
(889),
(890),
(892),
(894),
(895),
(897),
(898),
(900),
(902),
(903),
(905),
(906),
(908),
(909),
(911),
(913),
(914),
(916),
(917),
(919),
(920),
(922),
(924),
(925),
(927),
(928),
(930),
(931),
(933),
(935),
(936),
(938),
(939),
(941),
(942),
(944),
(946),
(947),
(949),
(950),
(952),
(953),
(955),
(957),
(958),
(960),
(961),
(963),
(965),
(966),
(968),
(969),
(971),
(972),
(974),
(976),
(977),
(979),
(980),
(982),
(983),
(985),
(987),
(988),
(990),
(991),
(993),
(994),
(996),
(998),
(999),
(1001),
(1002),
(1004),
(1005),
(1007),
(1009),
(1010),
(1012),
(1013),
(1015),
(1017),
(1018),
(1020),
(1021),
(1023),
(1024),
(1026),
(1028),
(1029),
(1031),
(1032),
(1034),
(1035),
(1037),
(1039),
(1040),
(1042),
(1043),
(1045),
(1046),
(1048),
(1050),
(1051),
(1053),
(1054),
(1056),
(1057),
(1059),
(1061),
(1062),
(1064),
(1065),
(1067),
(1069),
(1070),
(1072),
(1073),
(1075),
(1076),
(1078),
(1080),
(1081),
(1083),
(1084),
(1086),
(1087),
(1089),
(1091),
(1092),
(1094),
(1095),
(1097),
(1098),
(1100),
(1102),
(1103),
(1105),
(1106),
(1108),
(1109),
(1111),
(1113),
(1114),
(1116),
(1117),
(1119),
(1120),
(1122),
(1124),
(1125),
(1127),
(1128),
(1130),
(1132),
(1133),
(1135),
(1136),
(1138),
(1139),
(1141),
(1143),
(1144),
(1146),
(1147),
(1149),
(1150),
(1152),
(1154),
(1155),
(1157),
(1158),
(1160),
(1161),
(1163),
(1165),
(1166),
(1168),
(1169),
(1171),
(1172),
(1174),
(1176),
(1177),
(1179),
(1180),
(1182),
(1184),
(1185),
(1187),
(1188),
(1190),
(1191),
(1193),
(1195),
(1196),
(1198),
(1199),
(1201),
(1202),
(1204),
(1206),
(1207),
(1209),
(1210),
(1212),
(1213),
(1215),
(1217),
(1218),
(1220),
(1221),
(1223),
(1224),
(1226),
(1228),
(1229),
(1231),
(1232),
(1234),
(1235),
(1237),
(1239),
(1240),
(1242),
(1243),
(1245),
(1247),
(1248),
(1250),
(1251),
(1253),
(1254),
(1256),
(1258),
(1259),
(1261),
(1262),
(1264),
(1265),
(1267),
(1269),
(1270),
(1272),
(1273),
(1275),
(1276),
(1278),
(1280),
(1281),
(1283),
(1284),
(1286),
(1287),
(1289),
(1291),
(1292),
(1294),
(1295),
(1297),
(1299),
(1300),
(1302),
(1303),
(1305),
(1306),
(1308),
(1310),
(1311),
(1313),
(1314),
(1316),
(1317),
(1319),
(1321),
(1322),
(1324),
(1325),
(1327),
(1328),
(1330),
(1332),
(1333),
(1335),
(1336),
(1338),
(1339),
(1341),
(1343),
(1344),
(1346),
(1347),
(1349),
(1350),
(1352),
(1354),
(1355),
(1357),
(1358),
(1360),
(1362),
(1363),
(1365),
(1366),
(1368),
(1369),
(1371),
(1373),
(1374),
(1376),
(1377),
(1379),
(1380),
(1382),
(1384),
(1385),
(1387),
(1388),
(1390),
(1391),
(1393),
(1395),
(1396),
(1398),
(1399),
(1401),
(1402),
(1404),
(1406),
(1407),
(1409),
(1410),
(1412),
(1414),
(1415),
(1417),
(1418),
(1420),
(1421),
(1423),
(1425),
(1426),
(1428),
(1429),
(1431),
(1432),
(1434),
(1436),
(1437),
(1439),
(1440),
(1442),
(1443),
(1445),
(1447),
(1448),
(1450),
(1451),
(1453),
(1454),
(1456),
(1458),
(1459),
(1461),
(1462),
(1464),
(1465),
(1467),
(1469),
(1470),
(1472),
(1473),
(1475),
(1477),
(1478),
(1480),
(1481),
(1483),
(1484),
(1486),
(1488),
(1489),
(1491),
(1492),
(1494),
(1495),
(1497),
(1499),
(1500),
(1502),
(1503),
(1505),
(1506),
(1508),
(1510),
(1511),
(1513),
(1514),
(1516),
(1517),
(1519),
(1521),
(1522),
(1524),
(1525),
(1527),
(1529),
(1530),
(1532),
(1533),
(1535),
(1536),
(1538),
(1540),
(1541),
(1543),
(1544),
(1546),
(1547),
(1549),
(1551),
(1552),
(1554),
(1555),
(1557),
(1558),
(1560),
(1562),
(1563),
(1565),
(1566),
(1568),
(1569),
(1571),
(1573),
(1574),
(1576),
(1577),
(1579),
(1581),
(1582),
(1584),
(1585),
(1587),
(1588),
(1590),
(1592),
(1593),
(1595),
(1596),
(1598),
(1599),
(1601),
(1603),
(1604),
(1606),
(1607),
(1609),
(1610),
(1612),
(1614),
(1615),
(1617),
(1618),
(1620),
(1621),
(1623),
(1625),
(1626),
(1628),
(1629),
(1631),
(1632),
(1634),
(1636),
(1637),
(1639),
(1640),
(1642),
(1644),
(1645),
(1647),
(1648),
(1650),
(1651),
(1653),
(1655),
(1656),
(1658),
(1659),
(1661),
(1662),
(1664),
(1666),
(1667),
(1669),
(1670),
(1672),
(1673),
(1675),
(1677),
(1678),
(1680),
(1681),
(1683),
(1684),
(1686),
(1688),
(1689),
(1691),
(1692),
(1694),
(1696),
(1697),
(1699),
(1700),
(1702),
(1703),
(1705),
(1707),
(1708),
(1710),
(1711),
(1713),
(1714),
(1716),
(1718),
(1719),
(1721),
(1722),
(1724),
(1725),
(1727),
(1729),
(1730),
(1732),
(1733),
(1735),
(1736),
(1738),
(1740),
(1741),
(1743),
(1744),
(1746),
(1747),
(1749),
(1751),
(1752),
(1754),
(1755),
(1757),
(1759),
(1760),
(1762),
(1763),
(1765),
(1766),
(1768),
(1770),
(1771),
(1773),
(1774),
(1776),
(1777),
(1779),
(1781),
(1782),
(1784),
(1785),
(1787),
(1788),
(1790),
(1792),
(1793),
(1795),
(1796),
(1798),
(1799),
(1801),
(1803),
(1804),
(1806),
(1807),
(1809),
(1811),
(1812),
(1814),
(1815),
(1817),
(1818),
(1820),
(1822),
(1823),
(1825),
(1826),
(1828),
(1829),
(1831),
(1833),
(1834),
(1836),
(1837),
(1839),
(1840),
(1842),
(1844),
(1845),
(1847),
(1848),
(1850),
(1851),
(1853),
(1855),
(1856),
(1858),
(1859),
(1861),
(1862),
(1864),
(1866),
(1867),
(1869),
(1870),
(1872),
(1874),
(1875),
(1877),
(1878),
(1880),
(1881),
(1883),
(1885),
(1886),
(1888),
(1889),
(1891),
(1892),
(1894),
(1896),
(1897),
(1899),
(1900),
(1902),
(1903),
(1905),
(1907),
(1908),
(1910),
(1911),
(1913),
(1914),
(1916),
(1918),
(1919),
(1921),
(1922),
(1924),
(1926),
(1927),
(1929),
(1930),
(1932),
(1933),
(1935),
(1937),
(1938),
(1940),
(1941),
(1943),
(1944),
(1946),
(1948),
(1949),
(1951),
(1952),
(1954),
(1955),
(1957),
(1959),
(1960),
(1962),
(1963),
(1965),
(1966),
(1968),
(1970),
(1971),
(1973),
(1974),
(1976),
(1977),
(1979),
(1981),
(1982),
(1984),
(1985),
(1987),
(1989),
(1990),
(1992),
(1993),
(1995),
(1996),
(1998),
(2000),
(2001),
(2003),
(2004),
(2006),
(2007),
(2009),
(2011),
(2012),
(2014),
(2015),
(2017),
(2018),
(2020),
(2022),
(2023),
(2025),
(2026),
(2028),
(2029),
(2031),
(2033),
(2034),
(2036),
(2037),
(2039),
(2041),
(2042),
(2044),
(2045),
(2047),
(2048),
(2050),
(2052),
(2053),
(2055),
(2056),
(2058),
(2059),
(2061),
(2063),
(2064),
(2066),
(2067),
(2069),
(2070),
(2072),
(2074),
(2075),
(2077),
(2078),
(2080),
(2081),
(2083),
(2085),
(2086),
(2088),
(2089),
(2091),
(2093),
(2094),
(2096),
(2097),
(2099),
(2100),
(2102),
(2104),
(2105),
(2107),
(2108),
(2110),
(2111),
(2113),
(2115),
(2116),
(2118),
(2119),
(2121),
(2122),
(2124),
(2126),
(2127),
(2129),
(2130),
(2132),
(2133),
(2135),
(2137),
(2138),
(2140),
(2141),
(2143),
(2144),
(2146),
(2148),
(2149),
(2151),
(2152),
(2154),
(2156),
(2157),
(2159),
(2160),
(2162),
(2163),
(2165),
(2167),
(2168),
(2170),
(2171),
(2173),
(2174),
(2176),
(2178),
(2179),
(2181),
(2182),
(2184),
(2185),
(2187),
(2189),
(2190),
(2192),
(2193),
(2195),
(2196),
(2198),
(2200),
(2201),
(2203),
(2204),
(2206),
(2208),
(2209),
(2211),
(2212),
(2214),
(2215),
(2217),
(2219),
(2220),
(2222),
(2223),
(2225),
(2226),
(2228),
(2230),
(2231),
(2233),
(2234),
(2236),
(2237),
(2239),
(2241),
(2242),
(2244),
(2245),
(2247),
(2248),
(2250),
(2252),
(2253),
(2255),
(2256),
(2258),
(2259),
(2261),
(2263),
(2264),
(2266),
(2267),
(2269),
(2271),
(2272),
(2274),
(2275),
(2277),
(2278),
(2280),
(2282),
(2283),
(2285),
(2286),
(2288),
(2289),
(2291),
(2293),
(2294),
(2296),
(2297),
(2299),
(2300),
(2302),
(2304),
(2305),
(2307),
(2308),
(2310),
(2311),
(2313),
(2315),
(2316),
(2318),
(2319),
(2321),
(2323),
(2324),
(2326),
(2327),
(2329),
(2330),
(2332),
(2334),
(2335),
(2337),
(2338),
(2340),
(2341),
(2343),
(2345),
(2346),
(2348),
(2349),
(2351),
(2352),
(2354),
(2356),
(2357),
(2359),
(2360),
(2362),
(2363),
(2365),
(2367),
(2368),
(2370),
(2371),
(2373),
(2374),
(2376),
(2378),
(2379),
(2381),
(2382),
(2384),
(2386),
(2387),
(2389),
(2390),
(2392),
(2393),
(2395),
(2397),
(2398),
(2400),
(2401),
(2403),
(2404),
(2406),
(2408),
(2409),
(2411),
(2412),
(2414),
(2415),
(2417),
(2419),
(2420),
(2422),
(2423),
(2425),
(2426),
(2428),
(2430),
(2431),
(2433),
(2434),
(2436),
(2438),
(2439),
(2441),
(2442),
(2444),
(2445),
(2447),
(2449),
(2450),
(2452),
(2453),
(2455),
(2456),
(2458),
(2460),
(2461),
(2463),
(2464),
(2466),
(2467),
(2469),
(2471),
(2472),
(2474),
(2475),
(2477),
(2478),
(2480),
(2482),
(2483),
(2485),
(2486),
(2488),
(2489),
(2491),
(2493),
(2494),
(2496),
(2497),
(2499),
(2501),
(2502),
(2504),
(2505),
(2507),
(2508),
(2510),
(2512),
(2513),
(2515),
(2516),
(2518),
(2519),
(2521),
(2523),
(2524),
(2526),
(2527),
(2529),
(2530),
(2532),
(2534),
(2535),
(2537),
(2538),
(2540),
(2541),
(2543),
(2545),
(2546),
(2548),
(2549),
(2551),
(2553),
(2554),
(2556),
(2557),
(2559),
(2560),
(2562),
(2564),
(2565),
(2567),
(2568),
(2570),
(2571),
(2573),
(2575),
(2576),
(2578),
(2579),
(2581),
(2582),
(2584),
(2586),
(2587),
(2589),
(2590),
(2592),
(2593),
(2595),
(2597),
(2598),
(2600),
(2601),
(2603),
(2605),
(2606),
(2608),
(2609),
(2611),
(2612),
(2614),
(2616),
(2617),
(2619),
(2620),
(2622),
(2623),
(2625),
(2627),
(2628),
(2630),
(2631),
(2633),
(2634),
(2636),
(2638),
(2639),
(2641),
(2642),
(2644),
(2645),
(2647),
(2649),
(2650),
(2652),
(2653),
(2655),
(2656),
(2658),
(2660),
(2661),
(2663),
(2664),
(2666),
(2668),
(2669),
(2671),
(2672),
(2674),
(2675),
(2677),
(2679),
(2680),
(2682),
(2683),
(2685),
(2686),
(2688),
(2690),
(2691),
(2693),
(2694),
(2696),
(2697),
(2699),
(2701),
(2702),
(2704),
(2705),
(2707),
(2708),
(2710),
(2712),
(2713),
(2715),
(2716),
(2718),
(2720),
(2721),
(2723),
(2724),
(2726),
(2727),
(2729),
(2731),
(2732),
(2734),
(2735),
(2737),
(2738),
(2740),
(2742),
(2743),
(2745),
(2746),
(2748),
(2749),
(2751),
(2753),
(2754),
(2756),
(2757),
(2759),
(2760),
(2762),
(2764),
(2765),
(2767),
(2768),
(2770),
(2771),
(2773),
(2775),
(2776),
(2778),
(2779),
(2781),
(2783),
(2784),
(2786),
(2787),
(2789),
(2790),
(2792),
(2794),
(2795),
(2797),
(2798),
(2800),
(2801),
(2803),
(2805),
(2806),
(2808),
(2809),
(2811),
(2812),
(2814),
(2816),
(2817),
(2819),
(2820),
(2822),
(2823),
(2825),
(2827),
(2828),
(2830),
(2831),
(2833),
(2835),
(2836),
(2838),
(2839),
(2841),
(2842),
(2844),
(2846),
(2847),
(2849),
(2850),
(2852),
(2853),
(2855),
(2857),
(2858),
(2860),
(2861),
(2863),
(2864),
(2866),
(2868),
(2869),
(2871),
(2872),
(2874),
(2875),
(2877),
(2879),
(2880),
(2882),
(2883),
(2885),
(2886),
(2888),
(2890),
(2891),
(2893),
(2894),
(2896),
(2898),
(2899),
(2901),
(2902),
(2904),
(2905),
(2907),
(2909),
(2910),
(2912),
(2913),
(2915),
(2916),
(2918),
(2920),
(2921),
(2923),
(2924),
(2926),
(2927),
(2929),
(2931),
(2932),
(2934),
(2935),
(2937),
(2938),
(2940),
(2942),
(2943),
(2945),
(2946),
(2948),
(2950),
(2951),
(2953),
(2954),
(2956),
(2957),
(2959),
(2961),
(2962),
(2964),
(2965),
(2967),
(2968),
(2970),
(2972),
(2973),
(2975),
(2976),
(2978),
(2979),
(2981),
(2983),
(2984),
(2986),
(2987),
(2989),
(2990),
(2992),
(2994),
(2995),
(2997),
(2998),
(3000),
(3001),
(3003),
(3005),
(3006),
(3008),
(3009),
(3011),
(3013),
(3014),
(3016),
(3017),
(3019),
(3020),
(3022),
(3024),
(3025),
(3027),
(3028),
(3030),
(3031),
(3033),
(3035),
(3036),
(3038),
(3039),
(3041),
(3042),
(3044),
(3046),
(3047),
(3049),
(3050),
(3052),
(3053),
(3055),
(3057),
(3058),
(3060),
(3061),
(3063),
(3065),
(3066),
(3068),
(3069),
(3071),
(3072),
(3074),
(3076),
(3077),
(3079),
(3080),
(3082),
(3083),
(3085),
(3087),
(3088),
(3090),
(3091),
(3093),
(3094),
(3096),
(3098),
(3099),
(3101),
(3102),
(3104),
(3105),
(3107),
(3109),
(3110),
(3112),
(3113),
(3115),
(3117),
(3118),
(3120),
(3121),
(3123),
(3124),
(3126),
(3128),
(3129),
(3131),
(3132),
(3134),
(3135),
(3137),
(3139),
(3140),
(3142),
(3143),
(3145),
(3146),
(3148),
(3150),
(3151),
(3153),
(3154),
(3156),
(3157),
(3159),
(3161),
(3162),
(3164),
(3165),
(3167),
(3168),
(3170),
(3172),
(3173),
(3175),
(3176),
(3178),
(3180),
(3181),
(3183),
(3184),
(3186),
(3187),
(3189),
(3191),
(3192),
(3194),
(3195),
(3197),
(3198),
(3200),
(3202),
(3203),
(3205),
(3206),
(3208),
(3209),
(3211),
(3213),
(3214),
(3216),
(3217),
(3219),
(3220),
(3222),
(3224),
(3225),
(3227),
(3228),
(3230),
(3232),
(3233),
(3235),
(3236),
(3238),
(3239),
(3241),
(3243),
(3244),
(3246),
(3247),
(3249),
(3250),
(3252),
(3254),
(3255),
(3257),
(3258),
(3260),
(3261),
(3263),
(3265),
(3266),
(3268),
(3269),
(3271),
(3272),
(3274),
(3276),
(3277),
(3279),
(3280),
(3282),
(3283),
(3285),
(3287),
(3288),
(3290),
(3291),
(3293),
(3295),
(3296),
(3298),
(3299),
(3301),
(3302),
(3304),
(3306),
(3307),
(3309),
(3310),
(3312),
(3313),
(3315),
(3317),
(3318),
(3320),
(3321),
(3323),
(3324),
(3326),
(3328),
(3329),
(3331),
(3332),
(3334),
(3335),
(3337),
(3339),
(3340),
(3342),
(3343),
(3345),
(3347),
(3348),
(3350),
(3351),
(3353),
(3354),
(3356),
(3358),
(3359),
(3361),
(3362),
(3364),
(3365),
(3367),
(3369),
(3370),
(3372),
(3373),
(3375),
(3376),
(3378),
(3380),
(3381),
(3383),
(3384),
(3386),
(3387),
(3389),
(3391),
(3392),
(3394),
(3395),
(3397),
(3398),
(3400),
(3402),
(3403),
(3405),
(3406),
(3408),
(3410),
(3411),
(3413),
(3414),
(3416),
(3417),
(3419),
(3421),
(3422),
(3424),
(3425),
(3427),
(3428),
(3430),
(3432),
(3433),
(3435),
(3436),
(3438),
(3439),
(3441),
(3443),
(3444),
(3446),
(3447),
(3449),
(3450),
(3452),
(3454),
(3455),
(3457),
(3458),
(3460),
(3462),
(3463),
(3465),
(3466),
(3468),
(3469),
(3471),
(3473),
(3474),
(3476),
(3477),
(3479),
(3480),
(3482),
(3484),
(3485),
(3487),
(3488),
(3490),
(3491),
(3493),
(3495),
(3496),
(3498),
(3499),
(3501),
(3502),
(3504),
(3506),
(3507),
(3509),
(3510),
(3512),
(3513),
(3515),
(3517),
(3518),
(3520),
(3521),
(3523),
(3525),
(3526),
(3528),
(3529),
(3531),
(3532),
(3534),
(3536),
(3537),
(3539),
(3540),
(3542),
(3543),
(3545),
(3547),
(3548),
(3550),
(3551),
(3553),
(3554),
(3556),
(3558),
(3559),
(3561),
(3562),
(3564),
(3565),
(3567),
(3569),
(3570),
(3572),
(3573),
(3575),
(3577),
(3578),
(3580),
(3581),
(3583),
(3584),
(3586),
(3588),
(3589),
(3591),
(3592),
(3594),
(3595),
(3597),
(3599),
(3600),
(3602),
(3603),
(3605),
(3606),
(3608),
(3610),
(3611),
(3613),
(3614),
(3616),
(3617),
(3619),
(3621),
(3622),
(3624),
(3625),
(3627),
(3629),
(3630),
(3632),
(3633),
(3635),
(3636),
(3638),
(3640),
(3641),
(3643),
(3644),
(3646),
(3647),
(3649),
(3651),
(3652),
(3654),
(3655),
(3657),
(3658),
(3660),
(3662),
(3663),
(3665),
(3666),
(3668),
(3669),
(3671),
(3673),
(3674),
(3676),
(3677),
(3679),
(3680),
(3682),
(3684),
(3685),
(3687),
(3688),
(3690),
(3692),
(3693),
(3695),
(3696),
(3698),
(3699),
(3701),
(3703),
(3704),
(3706),
(3707),
(3709),
(3710),
(3712),
(3714),
(3715),
(3717),
(3718),
(3720),
(3721),
(3723),
(3725),
(3726),
(3728),
(3729),
(3731),
(3732),
(3734),
(3736),
(3737),
(3739),
(3740),
(3742),
(3744),
(3745),
(3747),
(3748),
(3750),
(3751),
(3753),
(3755),
(3756),
(3758),
(3759),
(3761),
(3762),
(3764),
(3766),
(3767),
(3769),
(3770),
(3772),
(3773),
(3775),
(3777),
(3778),
(3780),
(3781),
(3783),
(3784),
(3786),
(3788),
(3789),
(3791),
(3792),
(3794),
(3795),
(3797),
(3799),
(3800),
(3802),
(3803),
(3805),
(3807),
(3808),
(3810),
(3811),
(3813),
(3814),
(3816),
(3818),
(3819),
(3821),
(3822),
(3824),
(3825),
(3827),
(3829),
(3830),
(3832),
(3833),
(3835),
(3836),
(3838),
(3840),
(3841),
(3843),
(3844),
(3846),
(3847),
(3849),
(3851),
(3852),
(3854),
(3855),
(3857),
(3859),
(3860),
(3862),
(3863),
(3865),
(3866),
(3868),
(3870),
(3871),
(3873),
(3874),
(3876),
(3877),
(3879),
(3881),
(3882),
(3884),
(3885),
(3887),
(3888),
(3890),
(3892),
(3893),
(3895),
(3896),
(3898),
(3899),
(3901),
(3903),
(3904),
(3906),
(3907),
(3909),
(3910),
(3912),
(3914),
(3915),
(3917),
(3918),
(3920),
(3922),
(3923),
(3925),
(3926),
(3928),
(3929),
(3931),
(3933),
(3934),
(3936),
(3937),
(3939),
(3940),
(3942),
(3944),
(3945),
(3947),
(3948),
(3950),
(3951),
(3953),
(3955),
(3956),
(3958),
(3959),
(3961),
(3962),
(3964),
(3966),
(3967),
(3969),
(3970),
(3972),
(3974),
(3975),
(3977),
(3978),
(3980),
(3981),
(3983),
(3985),
(3986),
(3988),
(3989),
(3991),
(3992),
(3994),
(3996),
(3997),
(3999),
(4000),
(4002),
(4003),
(4005),
(4007),
(4008),
(4010),
(4011),
(4013),
(4014),
(4016),
(4018),
(4019),
(4021),
(4022),
(4024),
(4025),
(4027),
(4029),
(4030),
(4032),
(4033),
(4035),
(4037),
(4038),
(4040),
(4041),
(4043),
(4044),
(4046),
(4048),
(4049),
(4051),
(4052),
(4054),
(4055),
(4057),
(4059),
(4060),
(4062),
(4063),
(4065),
(4066),
(4068),
(4070),
(4071),
(4073),
(4074),
(4076),
(4077),
(4079),
(4081),
(4082),
(4084),
(4085),
(4087),
(4089),
(4090),
(4092),
(4093),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095),
(4095)
);


begin
    -- This is the only statement required. It looks up the converted value of 
	-- the voltage input (in mV) in the v2d_LUT look-up table, and outputs the 
	-- distance (in 10^-4 m) in std_logic_vector format.
		yeet : process(index)
	begin
	if(rising_edge(clk)) then
		if(index < 0) then
			Amplitude <= 4095;
		elsif (index > 4095) then
			Amplitude <= 4095;
		else
			Amplitude <= BuzzAmps(index);
		end if;
	end if;
	end process;
--   distance <= std_logic_vector(to_unsigned(v2d_LUTshort(to_integer(unsigned(voltage))),distance'length));
--   distance <= std_logic_vector(to_unsigned(v2d_LUT(to_integer(unsigned(voltage))),distance'length));

end behavior;
