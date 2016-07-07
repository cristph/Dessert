DROP TABLE IF EXISTS `dim_time_2014`;
CREATE TABLE `dim_time_2014`(
`timeid` int(10) NOT NULL,
`year` char(5) default NULL COMMENT 'lookup',
`quarter` char(2) default NULL COMMENT 'lookup',
`month` char(3) default NULL COMMENT 'lookup',
`day` char(3) default NULL COMMENT 'lookup',
`week` char(3) default NULL COMMENT 'lookup',
`hour` char(3) default NULL COMMENT 'lookup',
`minute` char(3) default NULL COMMENT 'lookup'
);

DROP TABLE IF EXISTS `dim_time_2015`;
CREATE TABLE `dim_time_2015`(
`timeid` int(10) NOT NULL,
`year` char(5) default NULL COMMENT 'lookup',
`quarter` char(2) default NULL COMMENT 'lookup',
`month` char(3) default NULL COMMENT 'lookup',
`day` char(3) default NULL COMMENT 'lookup',
`week` char(3) default NULL COMMENT 'lookup',
`hour` char(3) default NULL COMMENT 'lookup',
`minute` char(3) default NULL COMMENT 'lookup'
);

DROP TABLE IF EXISTS `dim_region`;  
CREATE TABLE `dim_region` (  
  `regionid` char(6) NOT NULL COMMENT 'lookup',
  `province` char(7) default NULL COMMENT 'lookup',
  `city` char(7) default NULL COMMENT 'lookup',
  `district` char(20) default NULL,
  `building` char(30) default NULL
);


DROP TABLE IF EXISTS `dim_shop`;  
CREATE TABLE `dim_shop` (  
  `shopid` char(6) NOT NULL COMMENT 'lookup',  
  `shopname` char(30) default NULL,  
  `shopauth` char(10) default NULL,  
  `contact` char(30) default NULL,
  `province` char(7) default NULL COMMENT 'lookup',
  `city` char(7) default NULL COMMENT 'lookup',
  `district` char(20) default NULL,
  `building` char(30) default NULL,
  `opendate` char(15) default NULL
);

DROP TABLE IF EXISTS `dim_product_2014`;  
CREATE TABLE `dim_product_2014` (  
  `productid` int(10) NOT NULL,
  `plabelid` int(10) default NULL,
  `productname` char(50) default NULL,  
  `category` char(7) default NULL COMMENT 'lookup',
  `descriptiopn` char(255) default NULL,
  `picpath` char(100) default NULL,
  `cost` float default NULL,
  `sellprice` float default NULL,
  `daysellnum` smallint NOT NULL,
  `begindate` char(15) default NULL COMMENT 'lookup',
  `enddate` char(15) default NULL COMMENT 'lookup'
);

DROP TABLE IF EXISTS `dim_product_2015`;  
CREATE TABLE `dim_product_2015` (  
  `productid` int(10) NOT NULL,
  `plabelid` int(10) default NULL,
  `productname` char(50) default NULL,  
  `category` char(7) default NULL COMMENT 'lookup',
  `descriptiopn` char(255) default NULL,
  `picpath` char(100) default NULL,
  `cost` float default NULL,
  `sellprice` float default NULL,
  `daysellnum` smallint NOT NULL,
  `begindate` char(15) default NULL COMMENT 'lookup',
  `enddate` char(15) default NULL COMMENT 'lookup'
);

DROP TABLE IF EXISTS `dim_customer`;  
CREATE TABLE `dim_customer` (  
  `customerid` int(10) NOT NULL,
  `customername` char(50) default NULL,
  `sex` char(7) default NULL COMMENT 'lookup',
  `age` char(3) default NULL COMMENT 'lookup',
  
  `viplevel` char(2) default NULL COMMENT 'lookup',
  `vipstate` char(15) default NULL COMMENT 'lookup',
  `vipbegindate` char(15) default NULL,
  `vipyear` char(2) default NULL COMMENT 'lookup',
  `vipmoney` float default NULL,
  `chargemoney` float default NULL,
  `discount` float default NULL,
  `score` smallint default NULL,
  
  `firstbuydate` char(15) default NULL,
  `lastbuydate` char(15) default NULL,
  `buyfrequency` char(15) default NULL,
  `buystrength` char(15) default NULL,
  `consumemoney` float default NULL,
  
  `province` char(7) default NULL COMMENT 'lookup',
  `city` char(7) default NULL COMMENT 'lookup',
  `district` char(20) default NULL,
  `building` char(30) default NULL
);

DROP TABLE IF EXISTS `dim_waiter`;  
CREATE TABLE `dim_waiter` (
  `waiterid` char(6) NOT NULL COMMENT 'lookup',
  `waitername` char(50) default NULL,
  `waiterauth` char(15) default NULL COMMENT 'lookup',
  `sex` char(7) default NULL COMMENT 'lookup',
  `age` char(3) default NULL COMMENT 'lookup',
  
  `province` char(7) default NULL COMMENT 'lookup',
  `city` char(7) default NULL COMMENT 'lookup',
  `district` char(20) default NULL,
  `building` char(30) default NULL,
  
  `indate` char(15) default NULL,
  `shopid` int(10) NOT NULL
  );

DROP TABLE IF EXISTS `fact_profit_2014`;
CREATE TABLE `fact_profit_2014` (
`timeid` int(10) NOT NULL ,
`regionid` char(6) NOT NULL COMMENT 'lookup',
`shopid` char(6) NOT NULL COMMENT 'lookup',
`productid` int(10) NOT NULL,
`customerid` int(10) NOT NULL,
`waiterid` char(6) NOT NULL COMMENT 'lookup',
`online` char(7) default NULL COMMENT 'lookup',
`payway` char(5) default NULL COMMENT 'lookup',
`salenum` tinyint default NULL,
`totalcost` float default NULL,
`totalprice` float default NULL,
`totalprofit` float NOT NULL);

CREATE TABLE `fact_historydata` (
  `year` char(5) DEFAULT NULL COMMENT 'lookup',
  `month` char(3) DEFAULT NULL COMMENT 'lookup',
  `day` char(3) DEFAULT NULL COMMENT 'lookup',
  `totalprofit` float NOT NULL
) ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8;


CREATE TABLE `fact_historyonlinedata` (
  `online` char(7) DEFAULT NULL COMMENT 'lookup',
  `year` char(5) DEFAULT NULL COMMENT 'lookup',
  `month` char(3) DEFAULT NULL COMMENT 'lookup',
  `day` char(3) DEFAULT NULL COMMENT 'lookup',
  `totalprofit` float NOT NULL,
  `totalprice` float DEFAULT NULL,
  `totalcost` float DEFAULT NULL
) ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8;


CREATE TABLE `sanpshot_sale_2014` (
  `online` char(7) DEFAULT NULL COMMENT 'lookup',
  `payway` char(5) DEFAULT NULL COMMENT 'lookup',
  `sex` char(7) DEFAULT NULL COMMENT 'lookup',
  `category` char(7) DEFAULT NULL COMMENT 'lookup',
  `province` char(7) DEFAULT NULL COMMENT 'lookup',
  `shopname` char(30) DEFAULT NULL COMMENT 'lookup',
  `year` char(5) DEFAULT NULL COMMENT 'lookup',
  `month` char(3) DEFAULT NULL COMMENT 'lookup',
  `totalprofit` double NOT NULL,
  `totalprice` double DEFAULT NULL,
  `totalcost` double DEFAULT NULL
) ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8;

drop table if exists `sanpshot_customer_sale`;
create table `sanpshot_customer_sale`(
`customerid` int(10) NOT NULL,
`sex` char(7) default NULL COMMENT 'lookup',
`age` char(6) default NULL COMMENT 'lookup',
`shopname` char(30) DEFAULT NULL COMMENT 'lookup',
`category` char(7) DEFAULT NULL COMMENT 'lookup',
`small_category` char(15) DEFAULT NULL COMMENT 'lookup',
`year` char(5) DEFAULT NULL COMMENT 'lookup',
`month` char(3) DEFAULT NULL COMMENT 'lookup',
`R` char(1) DEFAULT NULL COMMENT 'lookup',
`F` char(1) DEFAULT NULL COMMENT 'lookup',
`M` char(1) DEFAULT NULL COMMENT 'lookup',
`RFM` char(3) DEFAULT NULL COMMENT 'lookup',
`descriptiopn` char(35) DEFAULT NULL COMMENT 'lookup',
`totalprice` double NOT NULL,
`totalprofit` double NOT NULL
)ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8;
;


drop table if exists `snapshot_sale_shop_1`;
create table `snapshot_sale_shop_1`(
`year` char(5) DEFAULT NULL COMMENT 'lookup',
`month` char(3) DEFAULT NULL COMMENT 'lookup',
`week` char(3) DEFAULT NULL COMMENT 'lookup',
`goodid` char(5) DEFAULT NULL COMMENT 'lookup',
`goodname` char(30) DEFAULT NULL COMMENT 'lookup',
`category` char(7) DEFAULT NULL COMMENT 'lookup',
`num` smallint DEFAULT NULL,
`totalprice` double DEFAULT NULL,
`totalprofit` double DEFAULT NULL
);

drop table if exists `snapshot_sale_shop_2`;
create table `snapshot_sale_shop_2`(
`year` char(5) DEFAULT NULL COMMENT 'lookup',
`month` char(3) DEFAULT NULL COMMENT 'lookup',
`week` char(3) DEFAULT NULL COMMENT 'lookup',
`goodid` char(5) DEFAULT NULL COMMENT 'lookup',
`goodname` char(30) DEFAULT NULL COMMENT 'lookup',
`category` char(7) DEFAULT NULL COMMENT 'lookup',
`num` smallint DEFAULT NULL,
`totalprice` double DEFAULT NULL,
`totalprofit` double DEFAULT NULL
);

drop table if exists `trainingData`;
create table `trainingData`(
`age` int DEFAULT NULL,
`sex` varchar(8) DEFAULT NULL COMMENT 'lookup',
`marriage` varchar(12) DEFAULT NULL COMMENT 'lookup',
`time` varchar(15) DEFAULT NULL COMMENT 'lookup',
`cream_cake` varchar(2) DEFAULT NULL COMMENT 'lookup',
`chocolate_cake` varchar(2) DEFAULT NULL COMMENT 'lookup',
`sweet_bread` varchar(2) DEFAULT NULL COMMENT 'lookup',
`salty_bread` varchar(2) DEFAULT NULL COMMENT 'lookup',
`biscuit` varchar(2) DEFAULT NULL COMMENT 'lookup',
`milky_tea` varchar(2) DEFAULT NULL COMMENT 'lookup',
`black_tea` varchar(2) DEFAULT NULL COMMENT 'lookup',
`milk` varchar(2) DEFAULT NULL COMMENT 'lookup'
);