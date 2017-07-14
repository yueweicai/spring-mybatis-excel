# Host: localhost  (Version 5.5.40)
# Date: 2017-07-14 11:34:09
# Generator: MySQL-Front 6.0  (Build 1.164)


#
# Structure for table "info"
#

DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `money` float(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "info"
#

