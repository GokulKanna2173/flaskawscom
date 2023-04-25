/*
SQLyog Community Edition- MySQL GUI v7.01 
MySQL - 5.0.27-community-nt : Database - 29polarity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`29polarity` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `29polarity`;

/*Table structure for table `addproducts` */

DROP TABLE IF EXISTS `addproducts`;

CREATE TABLE `addproducts` (
  `pid` int(255) NOT NULL auto_increment,
  `pname` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `descrp` longtext NOT NULL,
  `img` longtext NOT NULL,
  `stock` varchar(255) NOT NULL,
  `offers` longtext NOT NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addproducts` */

insert  into `addproducts`(`pid`,`pname`,`price`,`descrp`,`img`,`stock`,`offers`) values (1,'rose','456','kadbkad','../static/addprod/b2.jpg','778','kajbsckja'),(2,'rose','874','amncadbkadb','../static/addprod/b2.jpg','876','akbdkcjbakdjbc'),(3,'T-shirt','550','cotton | color: balck | washable','../static/addprod/t1.jpg','100','akjdkab'),(4,'watch','5500','analog watch | color: black | dial: medium size','../static/addprod/top2.jpg','10','Na'),(5,'Jeans','550','color black | cotton | elsatic ','../static/addprod/m5.jpg','10','Na'),(11,'t shirt','890','fffffffffffffff','static/uploads\\client-img.png','50','no offer'),(12,'blue top','1000','dddddd','static/uploads\\client-img1.png','50','no offer');

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `userid` int(255) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `address` */

insert  into `address`(`userid`,`username`,`email`,`address`,`postcode`,`mobile`) values (1,'a','a@gmail.com','ahgdfa','84654','987654321'),(2,'s','s@gmail.com','ahcka','68435','9874563210'),(4,'yash','y@gmail.com','navi mumbai','4000701','8974563210'),(7,'pihu','pihu@gmail.com','Pune','1111','8888777710');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `Id` int(255) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`Id`,`username`,`email`,`pass`) values (1,'Nutan Cloth Shop dalo','n@gmail.com','n');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `categoryId` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categories` */

insert  into `categories`(`categoryId`,`name`) values (1,'mens'),(2,'womens'),(3,'bags'),(4,'footwear'),(5,'others');

/*Table structure for table `creditinfo` */

DROP TABLE IF EXISTS `creditinfo`;

CREATE TABLE `creditinfo` (
  `id` int(255) NOT NULL auto_increment,
  `username` varbinary(255) NOT NULL,
  `credit_card` varchar(255) NOT NULL,
  `exp_date` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `creditinfo` */

insert  into `creditinfo`(`id`,`username`,`credit_card`,`exp_date`,`cvv`) values (1,'asd','56478932012','05/20','665'),(2,'yash','235442545','05/05','123'),(3,'yash','235442545','05/05','123'),(4,'yash','235442545','05/05','123'),(5,'yash','235442545','05/05','123'),(6,'yash','235442545','05/05','123'),(7,'yash','235442545','05/05','123'),(8,'yash','235442545','05/05','123'),(9,'yash','235442545','05/05','123'),(10,'sdfds','356356563','05/02','455'),(11,'sdfds','356356563','05/02','455'),(12,'','','',''),(13,'dsgfd','3455636536','05/06','547'),(14,'jahsvfjhavf','87348678','06/22','456'),(15,'emrald','132654684651','05/03','321'),(16,'abcd','654123987021','05/23','654'),(17,'abcd','654123987021','05/23','654'),(18,'kmjn','96587423','05/02','365'),(19,'akjdbckj','29485','1341','6876'),(20,'skbkjs','3748282','05/24','984'),(21,'skbkjs','3748282','05/24','984'),(22,'aniket','8466516','05/06','654'),(23,'aniket','8466516','05/06','654'),(24,'aniket','8466516','05/06','654'),(25,'aniket','8466516','05/06','654'),(26,'aniket','8466516','05/06','654'),(27,'aniket','8466516','05/06','654'),(28,'akjdbck','9846656','05/06','654'),(29,'akjdbck','9846656','05/06','654'),(30,'akjdbck','9846656','05/06','654'),(31,'akjdbck','9846656','05/06','654'),(32,'akjdbck','9846656','05/06','654'),(33,'akjdbck','9846656','05/06','654'),(34,'akjdbck','9846656','05/06','654'),(35,'aniket','28727384238','05/23','654'),(36,'saloni','82674872468','05/23','698'),(37,'saloni','82674872468','05/23','698'),(38,'saloni','82674872468','05/23','698'),(39,'yash','283642364923','05/23','987'),(40,'abc','8263842692','05/24','965'),(41,'yash','8764','05/24','965'),(42,'yash','8764','05/24','965'),(43,'Aniket','276354254234','05/24','521'),(44,'Aniket','276354254234','05/24','521');

/*Table structure for table `final_score` */

DROP TABLE IF EXISTS `final_score`;

CREATE TABLE `final_score` (
  `id` int(255) NOT NULL auto_increment,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `ipadd` varchar(255) NOT NULL,
  `nb_real_fake` varchar(255) NOT NULL,
  `svm_real_fake` varchar(255) NOT NULL,
  `rf_real_fake` varchar(255) NOT NULL,
  `time_stmp` varchar(255) NOT NULL,
  `buy1_not0` varchar(255) NOT NULL,
  `report` varchar(255) NOT NULL,
  `final_sum` varchar(255) NOT NULL,
  `final_tag` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `final_score` */

insert  into `final_score`(`id`,`product_id`,`product_name`,`uname`,`comments`,`ipadd`,`nb_real_fake`,`svm_real_fake`,`rf_real_fake`,`time_stmp`,`buy1_not0`,`report`,`final_sum`,`final_tag`) values (1,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(2,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(3,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(4,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(5,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(6,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(7,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(8,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(9,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(10,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(11,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(12,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(13,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(14,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(15,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(16,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(17,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(18,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(19,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(20,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(21,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(22,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(23,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(24,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(25,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(26,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(27,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(28,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(29,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(30,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(31,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0','0','Real'),(32,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0','0','Real'),(33,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Real'),(34,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Real'),(35,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Real'),(36,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Real'),(37,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Real'),(38,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Real'),(39,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0','0','Real'),(40,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0','0','Real'),(41,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:27','0','0','0','Real'),(42,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:39','0','0','0','Real'),(43,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Negative'),(44,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Negative'),(45,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Negative'),(46,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Negative'),(47,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Negative'),(48,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Negative'),(49,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0','0','Negative'),(50,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0','0','Negative'),(51,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:27','0','0','0','Negative'),(52,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:39','0','0','0','Negative'),(53,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Negative'),(54,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Negative'),(55,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Negative'),(56,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Negative'),(57,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Negative'),(58,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Negative'),(59,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0','0','Negative'),(60,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0','0','Negative'),(61,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:27','0','0','0','Negative'),(62,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:39','0','0','0','Negative'),(63,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1','0','Negative'),(64,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1','40','Negative'),(65,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1','40','Negative'),(66,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1','40','Negative'),(67,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3','0','Negative'),(68,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0','0','Negative'),(69,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0','0','Negative'),(70,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0','0','Negative'),(71,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:27','0','0','0','Negative'),(72,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:39','0','0','0','Negative');

/*Table structure for table `kart` */

DROP TABLE IF EXISTS `kart`;

CREATE TABLE `kart` (
  `userId` int(10) default NULL,
  `username` varchar(255) default '',
  `productId` int(255) default NULL,
  `quantity` int(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kart` */

insert  into `kart`(`userId`,`username`,`productId`,`quantity`) values (7,'pihu',18,2),(4,'yash',29,3);

/*Table structure for table `kart1` */

DROP TABLE IF EXISTS `kart1`;

CREATE TABLE `kart1` (
  `Id` int(255) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `Price` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `img` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kart1` */

insert  into `kart1`(`Id`,`username`,`email`,`address`,`postcode`,`mobile`,`prd_name`,`Price`,`description`,`img`,`status`) values (1,'s','s@gmail.com','ahcka','68435','9874563210','Gray Sport Shoes','856','100% Cotton,Imported,Pull On closure,Machine Wash,Gildan Platinum uses ring spun cotton for softer fabric,COOLSPIRE technology used to keep you drier, cooler, and more comfortable,Covered seams at neck and shoulders for added comfort','m4.jpg','ordering'),(2,'a','a@gmail.com','ahgdfa','84654','987654321','Black men\'s sports jacket','455','Bamboo Fiber Short Sleeved Dress Shirts for Mens. Multiple color options for choice,Imported,Button Up closure,Hand Wash Only,\r\n1---HIGH QUALITY FIBER MATERIAL: This button down short sleeved shirts for men is made from bamboo fiber which is soft and comfortable. Perfect for summer and hot weather,\r\n2---DESIGN: This stylish formal/casual shirts features a button down collar and short sleeves. The collar fabric is thicken for a sharp looking. This shirt embraces both modern and traditional style to embody the confidence and coolness of men\'s fashion,\r\n3---OCCASION: Great alternative of t-shirt. Suitable for both casual and formal occasion in hot weather/summer, such as meeting and party. For casual occasion? Just take the shirts in bright colors and just let the collar open. More dressy? Take them in classic colors, such as black and white,\r\n4---WASH CARE: Machine/ hand wash in water below 30 degrees. Low iron. Please wash it with similar colors,\r\n5---SIZE GUIDE: all the size data are about garment measurements| NOT body measurements. Please choose the one a bit larger than your own measurement when you refer to size chart','m1.jpg','ordering'),(3,'s','s@gmail.com','ahcka','68435','9874563210','women\'s black sports jacket','455','50% Cotton, 50% Polyester,\r\nImported,\r\nMachine Wash,\r\nCozy 7.8-ounce fleece made with up to 5 percent polyester created from recycled plastic,\r\nPill-resistant fabric with high-stitch density for durability,\r\nLay flat collar keeps its shape wash after wash,\r\nAll the comfort of Hanes with our famous tag-free collar,\r\nEither tagless or with easily remove the tear away tag for comfort','m2.jpg','ordering'),(4,'yash','pranalibscproject@gmail.com','navi mumbai','4000701','8974563210','Black Sports bag','430','50% Leather, 50% Polyurethane,\r\nImported,\r\nBelt closure,\r\nHand Wash Only,\r\nThe Steve Madden\'s men\'s casual dress belt is the ideal belt to transition your outfit from casual daywear to work wear or dressy occasion,\r\nPerfect men\'s casual dress belt that will soon become your favorite go-to everyday belt,\r\nThe perfect men\'s belt for jeans that can also convert into a men\'s dress belt and work belt,\r\nMadden makes fashionable and functional belts for men that are designed to look great and last long,\r\nWe stand by our product and believe you will too. Our Madden Men\'s bonded reversible leather belt is the best belt for all occasions and combines practicality and fashion,\r\nNote: Belt size should be measure from inside of the buckle to the third hole from belt tip','m6.jpg','ordered'),(5,'aniket','pranalibscproject@gmail.com','thane','625410','9874563210','rose','456','kadbkad','../static/addprod/b2.jpg','ordered'),(8,'aniket','pranalibscproject@gmail.com','thane','625410','9874563210','rose','456','kadbkad','../static/addprod/b2.jpg','ordered'),(9,'yash','y@gmail.com','navi mumbai','4000701','8974563210','Dark Blue Sports Bag ','840','100% Polyester,\r\nImported,\r\nZipper closure,\r\nMachine Wash,\r\nMen\'s tapered track pants for versatile wear,\r\nRegular tapered fit is not tight and not loose, with a close fit on the legs,\r\nMoisture-absorbing AEROREADY helps you stay dry,\r\nFront zip pockets for storage and ankle zips for easy on and off,\r\nThis product is made with Primegreen|a series of high-performance recycled materials','m3.jpg','ordering'),(10,'saloni','pranalibscproject@gmail.com','Thane','400604','8569745213','T-shirt','550','cotton | color: balck | washable','../static/addprod/t1.jpg','ordered'),(11,'yash','y@gmail.com','navi mumbai','4000701','8974563210','Black men\'s sports jacket','455','Bamboo Fiber Short Sleeved Dress Shirts for Mens. Multiple color options for choice,Imported,Button Up closure,Hand Wash Only,\r\n1---HIGH QUALITY FIBER MATERIAL: This button down short sleeved shirts for men is made from bamboo fiber which is soft and comfortable. Perfect for summer and hot weather,\r\n2---DESIGN: This stylish formal/casual shirts features a button down collar and short sleeves. The collar fabric is thicken for a sharp looking. This shirt embraces both modern and traditional style to embody the confidence and coolness of men\'s fashion,\r\n3---OCCASION: Great alternative of t-shirt. Suitable for both casual and formal occasion in hot weather/summer, such as meeting and party. For casual occasion? Just take the shirts in bright colors and just let the collar open. More dressy? Take them in classic colors, such as black and white,\r\n4---WASH CARE: Machine/ hand wash in water below 30 degrees. Low iron. Please wash it with similar colors,\r\n5---SIZE GUIDE: all the size data are about garment measurements| NOT body measurements. Please choose the one a bit larger than your own measurement when you refer to size chart','m1.jpg','ordering'),(12,'yash','y@gmail.com','navi mumbai','4000701','8974563210','women\'s black sports jacket','455','50% Cotton, 50% Polyester,\r\nImported,\r\nMachine Wash,\r\nCozy 7.8-ounce fleece made with up to 5 percent polyester created from recycled plastic,\r\nPill-resistant fabric with high-stitch density for durability,\r\nLay flat collar keeps its shape wash after wash,\r\nAll the comfort of Hanes with our famous tag-free collar,\r\nEither tagless or with easily remove the tear away tag for comfort','m2.jpg','ordering'),(13,'abc','pranalibscproject@gmail.com','mumbai','400702','8974563210','watch','5500','analog watch | color: black | dial: medium size','../static/addprod/top2.jpg','ordered'),(15,'yash','y@gmail.com','navi mumbai','4000701','8974563210','T-shirt','550','cotton | color: balck | washable','../static/addprod/t1.jpg','ordering'),(16,'yash','pranalibscproject@gmail.com','navi mumbai','4000701','8974563210','T-shirt','550','cotton | color: balck | washable','../static/addprod/t1.jpg','ordered'),(17,'yash','y@gmail.com','navi mumbai','4000701','8974563210','women\'s black sports jacket','455','50% Cotton, 50% Polyester,\r\nImported,\r\nMachine Wash,\r\nCozy 7.8-ounce fleece made with up to 5 percent polyester created from recycled plastic,\r\nPill-resistant fabric with high-stitch density for durability,\r\nLay flat collar keeps its shape wash after wash,\r\nAll the comfort of Hanes with our famous tag-free collar,\r\nEither tagless or with easily remove the tear away tag for comfort','../static/images/m2.jpg','ordering');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` longtext NOT NULL,
  `stock` varchar(255) NOT NULL,
  `categoryId` varchar(255) NOT NULL,
  `offers` longtext,
  PRIMARY KEY  (`productId`),
  UNIQUE KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productId`,`name`,`price`,`description`,`image`,`stock`,`categoryId`,`offers`) values (1,'Formal Blue Shirt','455','Bamboo Fiber Short Sleeved Dress Shirts for Mens. Multiple color options for choice,Imported,Button Up closure,Hand Wash Only,\r\n1---HIGH QUALITY FIBER MATERIAL: This button down short sleeved shirts for men is made from bamboo fiber which is soft and comfortable. Perfect for summer and hot weather,\r\n2---DESIGN: This stylish formal/casual shirts features a button down collar and short sleeves. The collar fabric is thicken for a sharp looking. This shirt embraces both modern and traditional style to embody the confidence and coolness of men\'s fashion,\r\n3---OCCASION: Great alternative of t-shirt. Suitable for both casual and formal occasion in hot weather/summer, such as meeting and party. For casual occasion? Just take the shirts in bright colors and just let the collar open. More dressy? Take them in classic colors, such as black and white,\r\n4---WASH CARE: Machine/ hand wash in water below 30 degrees. Low iron. Please wash it with similar colors,\r\n5---SIZE GUIDE: all the size data are about garment measurements| NOT body measurements. Please choose the one a bit larger than your own measurement when you refer to size chart','m1.jpg','50','1',NULL),(2,'Black Basic Shorts','120','100% Polyester,\r\nImported,\r\nDrawstring closure,\r\nMachine Wash,\r\nRoomy fit through hip| thigh| and leg,\r\nLightweight| moisture-wicking, breathable active stretch fabric,\r\nInternal drawcord at waist,\r\nSide panel pockets,\r\nAn Amazon brand','w4.jpg','20','2',NULL),(3,'Laptop Backpack','120','?LOTS OF STORAGE SPACE&POCKETS: One separate laptop compartment hold 15.6 Inch Laptop as well as 15 Inch,14 Inch and 13 Inch Laptop. One spacious packing compartment roomy for daily necessities,tech electronics accessories. Front compartment with many pockets| pen pockets and key fob hook,\r\n?COMFY&STURDY: Comfortable soft padded back design with thick but soft multi-panel ventilated padding | gives you maximum back support. Breathable and adjustable shoulder straps relieve the stress of shoulder. Foam padded top handle for a long time carry on,\r\n?FUNCTIONAL&SAFE: A luggage strap allows backpack fit on luggage/suitcase| slide over the luggage upright handle tube for easier carrying. With a hidden anti theft pocket on the back protect your valuable items from thieves. Well made for international airplane travel and day trip as a travel gift for men,\r\n?USB PORT DESIGN: With built in USB charger outside and built in charging cable inside | this usb backpack offers you a more convenient way to charge your phone while walking. It\'s a great tech gift for him from wife| daughter and son. Please noted that this backpack doesn\'t power itself| usb charging port only offers an easy access to charge,\r\n?DURABLE MATERIAL&SOLID: Made of Water Resistant and Durable Polyester Fabric with metal zippers. Ensure a secure & long-lasting usage everyday & weekend.Serve you well as professional office work bag|slim USB charging bagpack|college high school big students backpacks for boys|girls|teens','b3.jpg','30','3',NULL),(4,'Travel Duffel Bag','190','?Large & Easy to Store?Large size duffle bag:21 x 11 x 14 inches with 65 liters capacity. Folded size: 10 x 9 inches | easy to store. This foldable duffle bag weights only 0.9 pounds| lightweight carry on bag,\r\n?Premium Quality?This travel bags for men made of 300D polyester fabric | water & tear resistant. Featured with high duty metal SBS zipper and soft padded handle | safe and comfortable to carry,\r\n?Multi-Use?A good duffle bag for travel| sport and entertainment. The large duffle bag can be used as a travel bag| gym bag| sports duffle bag| overnight bag| weekender bag| camp duffle bag | carry on bags for airplanes or a just-in-case bag. Also can be used at home as a dirty laundry compartment,\r\n?Perfect Design?Side shoe pocket has two exclusive ventilated air vents| promoting air circulation. A RFID zipper pocket on the back to slip it over luggage handles offers you better usage experience. The adjustable & removable padded shoulder strap makes you free from uncomfortable when the duffle is full,\r\n?Customer Service?Our travel duffle bag has been checked one by one before delivery.If you have received a problem duffle|please feel free contact us for after service|we will reply your message within 24 hours.We guarantee 1 years protection for free from the date of its original purchase. ORDER NOW WITH NO CONSIDERATION!','b4.jpg','30','3',NULL),(5,'Hand-held Bag','190','Polyester,\r\n?High Quality?This handbag is made of good quality PU leather fabric and polyester lining, equipped with gold tone shiny hardware and smooth stitching, which makes the women bag more durable,\r\n?Fashionable Design?Designed with smooth top zipper closure, the simple handle satchel bag comes with a long removable shoulder strap and unique flower pendant| show elegant lady charm,\r\n?Enough Space?This leather tote handbag has 2 interior zipper pocket| 2 interior open pockets and one small back zipper bag | which can hold an iPad mini| phone| wallet and some small stuffs,\r\n?Versatile Usage?The easy-matching shoulder bags will be a fantastic addition to any collection in your wardrobe, perfect for dating | shopping| working| traveling| vocation| party and other occasions,\r\n?Delicate Gift ?With classic design and elegant style | this trendy women purses and handbags can be an outstanding gift for your relatives or friends on birthday and anniversary.','b5.jpg','30','3',NULL),(6,'Butterflies Bag','190','Polyester,\r\n?High Quality?This handbag is made of good quality PU leather fabric and polyester lining, equipped with gold tone shiny hardware and smooth stitching, which makes the women bag more durable,\r\n?Fashionable Design?Designed with smooth top zipper closure, the simple handle satchel bag comes with a long removable shoulder strap and unique flower pendant| show elegant lady charm,\r\n?Enough Space?This leather tote handbag has 2 interior zipper pocket| 2 interior open pockets and one small back zipper bag, which can hold an iPad mini| phone| wallet and some small stuffs,\r\n?Versatile Usage?The easy-matching shoulder bags will be a fantastic addition to any collection in your wardrobe | perfect for dating | shopping| working| traveling| vocation| party and other occasions,\r\n?Delicate Gift ?With classic design and elegant style | this trendy women purses and handbags can be an outstanding gift for your relatives or friends on birthday and anniversary.','b6.jpg','30','3',NULL),(7,'Costa Swiss Bag','290','100% Brand New Neoprene bag|High Quality Printing on Both Side of The Sleeve with Handle & Soft Inner Lining. Zipper Closure with External Pocket for Mouse| Adapter | USB etc,\r\nSUPER SOFT NEOPRENE MATERIAL:Outside Soft Handle and Adjustable Shoulder Strap for Easy Carrying | Same Image on Both sides|soft|Waterproof|Light and comfortable|Washable|easy to Dry| Never Fade,\r\nDOUBLE ZIPPER DESIGN: External Pocket for Adapter and Mouse|Double Zipper Design for the Main Compartment | Reinforced Dual Zipper to Secure Your Device & D ring Hook (eyelets) For Shoulder Strap,\r\nSHOULDER BAG MESSENGER BAG DIMENSION :About 33.5cm(13.2 inch) x 25.5cm( 10 inch) | Please Measure from side to side|not Diagonal. Compatible with : Most of 13\"/ 13.1\"/ 13.3.\"/ laptops Tablets,\r\nCOMPLETE SATISFACTION: Our Shoulder Bag Messenger Bag Case Bag is Available in a Variety of Wonderful colors| However If You aren\'t Completely with our RICHEN Laptop Shoulder Bag | Simply Return (Doesn\'t affect secondary sales) Them Within 30 days For a Full Refund.','b7.jpg','30','3',NULL),(8,'Noble Designs Bag','120','100% Brand New Neoprene bag|High Quality Printing on Both Side of The Sleeve with Handle & Soft Inner Lining. Zipper Closure with External Pocket for Mouse| Adapter,USB etc,\r\nSUPER SOFT NEOPRENE MATERIAL:Outside Soft Handle and Adjustable Shoulder Strap for Easy Carrying | Same Image on Both sides|soft|Waterproof|Light and comfortable|Washable|easy to Dry| Never Fade,\r\nDOUBLE ZIPPER DESIGN: External Pocket for Adapter and Mouse|Double Zipper Design for the Main Compartment,Reinforced Dual Zipper to Secure Your Device & D ring Hook (eyelets) For Shoulder Strap,\r\nSHOULDER BAG MESSENGER BAG DIMENSION :About 33.5cm(13.2 inch) x 25.5cm( 10 inch) | Please Measure from side to side|not Diagonal. Compatible with : Most of 13\"/ 13.1\"/ 13.3.\"/ laptops Tablets,\r\nCOMPLETE SATISFACTION: Our Shoulder Bag Messenger Bag Case Bag is Available in a Variety of Wonderful colors| However If You aren\'t Completely with our RICHEN Laptop Shoulder Bag | Simply Return (Doesn\'t affect secondary sales) Them Within 30 days For a Full Refund.','b8.jpg','30','3',NULL),(10,'Gabi Full Sleeve Sweatshirt','455','50% Cotton, 50% Polyester,\r\nImported,\r\nMachine Wash,\r\nCozy 7.8-ounce fleece made with up to 5 percent polyester created from recycled plastic,\r\nPill-resistant fabric with high-stitch density for durability,\r\nLay flat collar keeps its shape wash after wash,\r\nAll the comfort of Hanes with our famous tag-free collar,\r\nEither tagless or with easily remove the tear away tag for comfort','m2.jpg','30','1',NULL),(11,'Dark Blue Track Pants','840','100% Polyester,\r\nImported,\r\nZipper closure,\r\nMachine Wash,\r\nMen\'s tapered track pants for versatile wear,\r\nRegular tapered fit is not tight and not loose, with a close fit on the legs,\r\nMoisture-absorbing AEROREADY helps you stay dry,\r\nFront zip pockets for storage and ankle zips for easy on and off,\r\nThis product is made with Primegreen|a series of high-performance recycled materials','m3.jpg','20','1',NULL),(12,'Round Neck Black T-Shirt','856','100% Cotton,Imported,Pull On closure,Machine Wash,Gildan Platinum uses ring spun cotton for softer fabric,COOLSPIRE technology used to keep you drier, cooler, and more comfortable,Covered seams at neck and shoulders for added comfort','m4.jpg','30','1',NULL),(13,'Men\'s Black Jeans','960','90% Cotton, 10% Spandex,\r\nZipper closure,\r\nZipper closure,\r\nMaterial: 95% Cotton.5%Spandex?,\r\nHigh stretch fabric. Soft and comfortable. Retro washed jeans with holes. Very stylish and easy to match,\r\nThe pockets are all used. Convenient to store items such as keys and mobile phones,\r\n100% Money Back Guarantee: If you are not satisfied with the clothes you received, please return them within 30 days for a full refund,\r\nWe strive to provide the highest possible value and service.','m5.jpg','30','1',NULL),(14,'Analog Watch','160','Brand Name : Timex,\r\nModel number : TW4B04700,\r\nPart Number : TW4B047009J,\r\nItem Shape : Round,\r\nDial window material type : Mineral,\r\nDisplay Type : Analog,\r\nClasp : Buckle,\r\nCase material : Brass,\r\nCase diameter : 40 millimeters,\r\nCase Thickness : 11 millimeters,\r\nBand Material : Fabric,\r\nBand size : Mens Standard,\r\nBand width : 20 millimeters,\r\nBand Color : Green,\r\nDial color : Black,\r\nBezel material : Brass,\r\nBezel function : Stationary,\r\nCalendar : Date,\r\nSpecial features : includes a seconds-hand, Water Resistant, Luminous,\r\nItem weight : 2.24 Ounces,\r\nMovement : Quartz,\r\nWater resistant depth : 50 Meters,\r\nWarranty : Manufacturer’s warranty can be requested from customer service. Click here to make a request to customer service.','m7.jpg','30','1',NULL),(15,'Reversible Belt','430','50% Leather, 50% Polyurethane,\r\nImported,\r\nBelt closure,\r\nHand Wash Only,\r\nThe Steve Madden\'s men\'s casual dress belt is the ideal belt to transition your outfit from casual daywear to work wear or dressy occasion,\r\nPerfect men\'s casual dress belt that will soon become your favorite go-to everyday belt,\r\nThe perfect men\'s belt for jeans that can also convert into a men\'s dress belt and work belt,\r\nMadden makes fashionable and functional belts for men that are designed to look great and last long,\r\nWe stand by our product and believe you will too. Our Madden Men\'s bonded reversible leather belt is the best belt for all occasions and combines practicality and fashion,\r\nNote: Belt size should be measure from inside of the buckle to the third hole from belt tip','m6.jpg','30','1',NULL),(16,'Party Men\'s Blazer','260','100% Polyester,\r\nButton closure,\r\nDo Not Bleach,\r\nMATERIAL --- Polyester; Dry Clean Only(Recommended); Hand washes max temperature 40°C; Do not bleach; Iron max 110°C,\r\nSUIT BLAZER DESIGN --- Modern fashion lightweight suit jacket blazer with notch lapel; one button closure| left chest real pocket; two front flap real pockets; inside a real pocket,\r\nCASUAL AND ELEGANT LOOKING --- Finished by excellent stitching; the stylish sport coat blazer has a linen texture specially designed for western men; will really make you minimalistic; elegant; and generous and in the crowd,\r\nRECOMMENDED PAIRING --- Match with a white tee shirt| a pair of casual shoes and your daily pants maximum help improve your public image and leave an unforgettable impression on people around you then,\r\nBEST OCCASIONS --- This is the best blazer in men\'s wardrobe | suitable for banquet | wedding | graduation | nightclub| disco| ceremony| dating| meeting| yacht party| prom| celebration| festival| etc.','m8.jpg','30','1',NULL),(17,'A-line Black Skirt','130','Care Instructions: Machine Wash, \r\nFitting Measurements: Waist - 28 Inches | Hips - 38 Inches, \r\nPrint & Pattern Type: Floral Print, \r\nItem Length: High-Low, \r\nStyle Description: White Floral Print Elasticated Skirt For Women','w1.jpg','20','2','5% Instant Discount on HSBC Cashback Card Transactions, \r\nNo cost EMI available on select cards. Please check \'EMI options\' above for more details,\r\nGet GST invoice and save up to 28% on business purchases. Sign up for free,\r\nGet free delivery on this item when you purchase 1 or more Qualifying items offered by Zink London.'),(18,'Sleeveless Solid Blue Top','140','Cotton Blend,\r\nHand Wash Only,\r\n?MATERIAL:Cotton blend| 100%brand new| super soft and breathable,\r\n?PADDED SHOULDER TEE: This simple and stylish tank top features broad padded shoulder|loose sleeveless muscle tank|loose tube vrdt,classic O neck to make this vintage and fashion tee top,\r\n?FASHION DESIGN:This vintange tank tee is easy for casual,workout|outside|formal occasion.Lean into neutral tones by pairing a boxy white tee with beige trousers and statement heels.Dress it with high waist jeans|trousers|pants|shorts|skirts for different look,\r\n?LOOK: Plain solid tank top is great for any occasion. Perfect for daily wear| Street Shot| beach| school|cocktail party|project|shopping| street|club|vocation|party| home life and travel. Great to pair with skirts and heels for a chic look,\r\n?GARMENT CARE:Handwash suggested.Cotton Tee TANK Top. Color may be a little vary due to different monitor display.Please choose the size you fit.','w2.jpg','20','2',NULL),(19,'Skinny Jeans','150','69% Cotton|30% Polyester| 1% Elastane,\r\nImported,\r\nZipper closure,\r\nMachine Wash,\r\nSuper stretch lasts from day to night; Snug fit doesn\'t lose shape,\r\nVintage, worn-in look,\r\nMid-rise comfort waistband,\r\nSkinny through hip and thig; Skinny leg opening','w3.jpg','20','2',NULL),(20,'Pink Track Pants','620','Polyester,Cotton,Velvet,\r\nButton closure,\r\n? 60% cotton + 40% polyester -- Soft, comfortable and breathable| perfect for spring| fall and winter,\r\n? Velour fabric outfit tracksuit set include: hoodie & sweatpants - Hoodie: full zip-up hoodie| 2 half-kangaroo pocket design is convenient for storage| long sleeve and ribbed cuff, drawstring tie to adjust to grasp the comfort,\r\n? Velour fabric outfit tracksuit set include: hoodie & sweatpants - Sweatpants: 2 slant pockets and 2 back velcro flap pockets| drawstring tie can be adjust when it’s too tight for you belly | loose fit sweatpants are comfortable wearing,\r\n? Fit for many occasions - gym| jogging| running| hiking| and other indoor or outdoor activities,\r\n? For size|please check the left image (size chart) before you ordering; Any inquires| please feel free to contact us.','w5.jpg','20','2',NULL),(21,'Analog Watch','320','Brand Name : Timex,\r\nModel number : TW4B04700,\r\nPart Number : TW4B047009J,\r\nItem Shape : Round,\r\nDial window material type : Mineral,\r\nDisplay Type : Analog,\r\nClasp : Buckle,\r\nCase material : Brass,\r\nCase diameter : 40 millimeters,\r\nCase Thickness : 11 millimeters,\r\nBand Material : Fabric,\r\nBand size : Mens Standard,\r\nBand width : 20 millimeters,\r\nBand Color : Green,\r\nDial color : Black,\r\nBezel material : Brass,\r\nBezel function : Stationary,\r\nCalendar : Date,\r\nSpecial features : includes a seconds-hand, Water Resistant, Luminous,\r\nItem weight : 2.24 Ounces,\r\nMovement : Quartz,\r\nWater resistant depth : 50 Meters,\r\nWarranty : Manufacturer’s warranty can be requested from customer service. Click here to make a request to customer service.','w6.jpg','20','2',NULL),(22,'Ankle Length Socks','100','97% Polyester | 2% Spandex| 1% Other Fibers,\r\nImported,\r\nPull On closure,\r\nMachine Wash,\r\nFits Women\'s shoe size 5-9,\r\nPack of 6 pairs of ankle socks,\r\nBREATHABLE lightweight construction with mesh panels for ventilation,\r\nArch support for a better fit around the foot,\r\nX-Temp technology adapts to your body temperature for all day comfort,\r\nMoisture Wicking Cool Comfort fabric keeps you cool and dry,','w7.jpg','20','2',NULL),(23,'Reebok Women\'s Tights','130','88% Polyester|12% Spandex,\r\nVersatile: These workout pants are perfect for yoga| running| and everything in between, Never miss a beat with these bottoms. We provide the pants| you provide the lifestyle,\r\nKeep Going: The exercise pants are crafted with quick dry fabric, that is specifically designed to wick moisture from your skin. Stay dry and comfortable during high endurance workouts and never have to stop or slow down again because of sweat,\r\nCompression Fit: Fit to support you, these activewear tights are designed to hug your legs and move with you through your workout. Supportive compression material can help increase blood flow and circulation | support muscles movement and reduce muscle fatigue,\r\nYou, But Better: Crafted to reduce slipping | restriction| and chafing| these athletic leggings will have you improving your flow| all while looking great doing it,\r\nMaterials: Made with a polyspan material that is lightweight and moisture wicking. No more sweating through your clothes during intense training. The tights are cut 29\" inseam.','w8.jpg','20','2',NULL),(24,'Laptop Messenger Bag','140','MATERIAL: The laptop briefcase is made of environment-friendly canvas poly fabric which is durable and water-repellent; Dimensions: 18”x12.8”x7.5”/9.5”; Weight:2.88LBS,\r\nMULTI-FUNCTIONAL COMPARTMENT: Roomy compartments provide separated space for your 17.3” computer| iPad| files| pens| wallet| notebooks and all your items. RFID pockets with identity protection function| protects date encoded on most IDs |credit cards and passports. Padded laptop compartment offers perfect protection for your laptop from accidental bumps and shocks,\r\nEXPANDABLE CAPACITY: The expansion zipper will extend the main compartment space greatly | in which there will be more space for your clothing and files,\r\nCOMFORTABLE & COMPATIBLE DESIGN: Removable and adjustable padded shoulder strap and sturdy PU handles assure you comfort carrying for a long time,\r\nGREAT CONVENIENCE: A well-knitted luggage strap is quite easy to fix the laptop bag on the trolley of your luggage| making your journey and business traveling more convenient.','b1.jpg','30','3',NULL),(25,'Puma Backpack','127','Adjustable straps,\r\nPadded back panels,\r\nFront zip pocket,\r\nQuilted detail,\r\nSide pockets,\r\nInterior sleeve\r\n','b2.jpg','30','3',NULL),(26,'samsung galaxi','12000','Samsung Galaxy S22 5G (Phantom White, 8GB RAM, 128GB Storage) ','images_1.jpg','50','5','no offer'),(27,'Long Dress','3000','Black long top','product-7.jpg','20','2','no offer'),(28,'sandal','890','new colour','s8.jpeg','40','4','no offer'),(29,'men stylish shoes','900','casual mens shoes','d3.jpg','40','4','no offer'),(30,'sandal','1000','juti,pink colour,three colours available','s5.jpg','40','4','no offer');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(10) NOT NULL auto_increment,
  `review` varchar(200) default NULL,
  `uname` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review` */

/*Table structure for table `user_analysis` */

DROP TABLE IF EXISTS `user_analysis`;

CREATE TABLE `user_analysis` (
  `id` int(255) NOT NULL auto_increment,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `comments` longtext NOT NULL,
  `ipadd` varchar(255) NOT NULL,
  `nb_real_fake` varchar(255) NOT NULL,
  `svm_real_fake` varchar(25) NOT NULL,
  `rf_real_fake` varchar(255) NOT NULL default '',
  `time_stmp` varchar(255) NOT NULL,
  `buy1_not0` varchar(255) NOT NULL default '',
  `report` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_analysis` */

insert  into `user_analysis`(`id`,`product_id`,`product_name`,`uname`,`comments`,`ipadd`,`nb_real_fake`,`svm_real_fake`,`rf_real_fake`,`time_stmp`,`buy1_not0`,`report`) values (1,'1','Formal Blue Shirt','s','hgfhhhg','169.254.164.231','','','Real','13:09:09','1','1'),(2,'1','Formal Blue Shirt','s','jajhdka','169.254.164.231','','','Real','13:12:15','0','1'),(3,'3','Laptop Backpack','yash','Bkwas bag','169.254.164.231','','','Real','16:48:03','0','1'),(4,'11','Dark Blue Track Pants','a','ajja caakdn','169.254.164.231','','','Real','14:22:55','0','1'),(5,'10','Gabi Full Sleeve Sweatshirt','yash','This product is too good','169.254.164.231','','','Real','12:09:02','0','3'),(9,'11','Dark Blue Track Pants','a','this product is too good','169.254.164.231','Real','Real','Fake','13:17:14','0','0'),(10,'10','Gabi Full Sleeve Sweatshirt','yash','When least you think so, this product will save the day. Just keep it around just in case you need it for something.','169.254.164.231','Real','Real','Fake','23:42:14','0','0'),(11,'14','Analog Watch','a','rctctfvfvdctycc','169.254.164.231','Real','Real','Fake','16:26:33','0','0'),(12,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:27','0','0'),(13,'12','Round Neck Black T-Shirt','a','This product is too good','169.254.164.231','Real','Real','Fake','10:05:39','0','0');

/*Table structure for table `user_analysis1` */

DROP TABLE IF EXISTS `user_analysis1`;

CREATE TABLE `user_analysis1` (
  `id` int(255) NOT NULL auto_increment,
  `uname` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `ipadd` varchar(255) NOT NULL,
  `real_fake` varchar(255) NOT NULL,
  `time_stmp` varchar(255) NOT NULL,
  `report` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_analysis1` */

insert  into `user_analysis1`(`id`,`uname`,`comments`,`ipadd`,`real_fake`,`time_stmp`,`report`) values (1,'yash','hello user','169.254.164.231','Real','10:58:42','0'),(2,'yash','hello user','169.254.164.231','Real','11:00:52','0'),(3,'yash','hello user','169.254.164.231','Real','11:03:21','0'),(4,'yash','hello user','169.254.164.231','Real','11:04:57','0'),(5,'yash','hello user','169.254.164.231','Real','11:05:27','0'),(6,'yash','hello user\r\n','169.254.164.231','Real','11:06:08','0');

/*Table structure for table `user_prod_details` */

DROP TABLE IF EXISTS `user_prod_details`;

CREATE TABLE `user_prod_details` (
  `userId` int(20) NOT NULL,
  `date` date default NULL,
  `category` varchar(50) default NULL,
  `quantity` int(50) default NULL,
  `id` int(50) NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_prod_details` */

insert  into `user_prod_details`(`userId`,`date`,`category`,`quantity`,`id`) values (1,'2022-12-28','2',3,1),(3,'0000-00-00','2',4,2),(4,'2022-12-29','2',3,3),(5,'0000-00-00','2',4,4),(6,'2022-12-29','2',4,5),(3,'2022-12-29','2',4,6),(3,'2022-12-29','2',4,7),(5,'2022-12-29','5',8,8),(5,'2022-12-29','5',8,9),(1,'2022-12-29','2',1,10),(1,'2022-12-29','1',1,11),(1,'2022-12-29','1',2,12),(1,'2022-12-29','2',1,13),(1,'2022-12-29','1',1,14),(1,'2022-12-29','1',2,15),(1,'2022-12-29','2',1,16),(1,'2022-12-29','1',1,17),(1,'2022-12-29','1',2,18),(1,'2022-12-29','2',1,19),(1,'2022-12-29','1',1,20),(1,'2022-12-29','1',2,21),(1,'2022-12-29','2',1,22),(1,'2022-12-29','1',1,23),(1,'2022-12-29','1',2,24),(1,'2022-12-29','1',1,25),(4,'2022-12-29','1',1,26),(4,'2022-12-29','1',2,27),(4,'2022-12-29','1',2,28),(4,'2022-12-29','1',2,29),(1,'2022-12-29','1',2,30),(4,'2022-12-29','1',2,31),(1,'2022-12-29','2',4,32),(4,'2022-12-30','1',3,33),(4,'2022-12-30','4',3,34),(4,'2022-12-30','4',3,35),(4,'2022-12-30','4',3,36),(4,'2022-12-30','4',3,37),(4,'2022-12-30','4',3,38),(4,'2022-12-30','4',3,39),(4,'2022-12-30','4',3,40),(4,'2022-12-30','4',3,41),(1,'2022-12-30','1',1,42),(1,'2022-12-30','1',1,43),(1,'2022-12-30','1',3,44),(1,'2022-12-30','1',3,45),(1,'2022-12-30','1',4,46),(1,'2022-12-30','1',4,47),(1,'2022-12-30','1',2,48);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(255) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`pass`) values (1,'a','a@gmail.com','a'),(2,'s','pranalibscproject@gmail.com','s'),(4,'yash','y@gmail.com','y'),(7,'pihu','pihu@gmail.com','pihu');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
