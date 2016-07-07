drop table if exists `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `auth` varchar(45) NOT NULL,
  `sex` int(11) default 0,
  `birth` date default '1990-1-1',
  `address` varchar(45) default '',
  `vid` varchar(45) NOT NULL,
  `selfintro` varchar(45) default '',
  `contact` varchar(45) default '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `vip`;
create table `vip`(
`vid` varchar(45) NOT NULL,
`email` varchar(45) NOT NULL,
`level` int(11) not null,
`vipstate` varchar(45) not null,
`signindate` date not null,
`deadline` date default null,
`money` double not null,
`discount` double not null,
`score` int(11) not null,
`chargemoney` double not null,
primary key(`vid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `bankcard`;
create table `bankcard`(
`bid` int(11) not null,
`pswd` varchar(45) not null,
`money` double not null,
primary key(`bid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into bankcard values(1,1,1000000);

drop table if exists `chargerecord`;
create table `chargerecord`(
`chargeid` int(11) not null auto_increment,
`email`varchar(45) not null,
`time` datetime not null,
`money` double not null,
primary key(`chargeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `good`;
create table `good`(
`gid` int(11) not null auto_increment,
`gname` varchar(45) not null,
`category` varchar(45) not null,
`description` varchar(255) not null,
`pic` varchar(100) not null,
`price` double not null,
primary key(`gid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


select * from good;

drop table if exists `saleorder`;
create table `saleorder`(
`soid` int(11) not null auto_increment,
`time` varchar(45) not null,
`totalprice` double not null,
`email` varchar(45) not null,
`shopid` int(11) not null,
`wemail` varchar(45) not null,
`online` varchar(45) not null,
`payway` varchar(45) not null,
primary key(`soid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `sorderitem`;
create table `sorderitem`(
`sorderitemid` int(11) not null auto_increment,
`gid` int(11) not null,
`sgid` int(11) not null,
`qty` int(11) not null,
`tprice` double not null,
`soid` int(11) not null,
primary key(`sorderitemid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `shop`;
create table `shop`(
`shopid` int(11) not null auto_increment,
`shopname` varchar(45) not null,
`shopauth` varchar(45) not null,
`contact` varchar(45) not null,
`address` varchar(45) not null,
`opendate` date not null,
`shoppic` varchar(45) not null,
primary key(`shopid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `waiter`;
create table `waiter`(
`wid` int(11) not null auto_increment,
`wemail` varchar(45) not null,
`wname` varchar(45) not null,
`shopid` int(11) not null,
`indate` date not null,
primary key(`wid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists `saleplan`;
create table `saleplan`(
`planid` int(11) not null auto_increment,
`wemail` varchar(45) not null,
`shopid` int(11) not null,
`permission` varchar(45) not null,
`createDate` varchar(45) not null,
primary key(`planid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists `salegood`;
create table `salegood`(
`sgid` int(11) not null auto_increment,
`planid` int(11) not null,
`gid` int(11) not null,
`gname` varchar(45) not null,
`category` varchar(45) not null,
`description` varchar(255) not null,
`pic` varchar(100) not null,
`num` int(11) not null,
`price` double not null,
`beginDate` varchar(45) not null,
`deadline` varchar(45) not null,
primary key(`sgid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into user values(1,'q@q','qq','qqq','administrator',1,'2015-5-5','/','/','/','/');
insert into user values(2,'w@w','ww','www','manager',1,'2015-5-5','/','/','/','/');
insert into user values(3, 'xiaoming@z.com', '总店小明', 'zdxm', 'waiter_sp', '1', '2016-05-06', 'JiangSu', '//', '我是总店服务员小明', '13306237695');
insert into waiter values(1,'xiaoming@z.com', '总店小明',1,'2015-6-2');
insert into shop values(1,'总店','sp','0512-52321555','JiangSu DessertRoad Num.222','2016-6-7','/Dessert/upload/甜品工房.jpg');