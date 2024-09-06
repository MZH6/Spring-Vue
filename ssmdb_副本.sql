/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.38 : Database - ssmdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssmdb`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `type` int DEFAULT '2',
  `adminid` int DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `admin` */

insert  into `admin`(`id`,`account`,`password`,`phone`,`gender`,`type`,`adminid`,`oper_time`) values 
(1,'admin','96e79218965eb72c92a549dd5a330112','1871034027','男',1,NULL,'2024-07-12 17:02:30'),
(2,'zhuguan','96e79218965eb72c92a549dd5a330112','18711111111','男',2,1,'2024-07-18 17:14:11'),
(3,'bianji','e3ceb5881a0a1fdaad01296d7554868d','18722222222','女',2,1,'2024-07-12 18:57:55');

/*Table structure for table `admin_menu` */

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adminid` int DEFAULT NULL,
  `menuid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`adminid`,`menuid`) values 
(4,3,5),
(5,3,6),
(6,3,7),
(7,1,1),
(8,1,2),
(21,2,3),
(22,2,4),
(23,2,8),
(24,2,5),
(25,2,6),
(26,2,7),
(27,2,9);

/*Table structure for table `comment_reply` */

DROP TABLE IF EXISTS `comment_reply`;

CREATE TABLE `comment_reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `content` text,
  `commentid` int DEFAULT NULL,
  `state` int DEFAULT '1',
  `reply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `comment_reply` */

insert  into `comment_reply`(`id`,`userid`,`content`,`commentid`,`state`,`reply_time`) values 
(1,1,'哇，这就是最强大驱嘛！',1,1,'2024-07-20 09:19:39'),
(2,1,'蓝星最强驱逐舰',1,1,'2024-07-20 09:19:41'),
(4,1,'哇！！！！！055不愧是蓝星最强驱逐舰',1,1,'2024-07-20 14:59:52'),
(5,1,'075也好雄伟',1,1,'2024-07-20 15:01:13'),
(7,1,'那必须的啊',5,1,'2024-07-20 15:38:44'),
(8,1,'哇！！！！！！',6,1,'2024-07-21 06:03:06'),
(9,1,'哇!!!',3,1,'2024-07-21 08:51:51');

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `newsid` int DEFAULT NULL,
  `content` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*Data for the table `comments` */

insert  into `comments`(`id`,`userid`,`newsid`,`content`,`time`) values 
(1,1,6,'哇，055真帅啊！！！！','2024-07-19 18:50:56'),
(2,1,6,'哇，075真雄伟啊！！！！','2024-07-19 18:50:59'),
(3,1,7,'哇！！！！','2024-07-19 20:43:41'),
(4,1,7,'哇！！！！！','2024-07-19 20:45:47'),
(5,1,2,'佩德里真帅！！！！！','2024-07-20 15:38:30'),
(6,1,9,'哇！！！！！！','2024-07-21 06:02:58');

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `adminid` int DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `link` */

insert  into `link`(`id`,`name`,`url`,`state`,`adminid`,`oper_time`) values 
(1,'百度','http://www.baidu.com',1,2,'2024-07-18 17:21:13'),
(2,'腾讯','http://www.tencent.com',1,1,'2024-07-16 11:45:00');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`url`,`type`) values 
(1,'管理员管理','/adminList',1),
(2,'系统管理','/systeminfoList',1),
(3,'新闻类型管理','/newstypeList',2),
(4,'新闻管理','/newsList',2),
(5,'用户审核','/',2),
(6,'评论审核','/',2),
(7,'新闻统计','/newscount',2),
(8,'敏感词管理','/',2),
(9,'友情链接','/friendlinkList',2);

/*Table structure for table `new_type` */

DROP TABLE IF EXISTS `new_type`;

CREATE TABLE `new_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `adminid` int DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*Data for the table `new_type` */

insert  into `new_type`(`id`,`name`,`adminid`,`oper_time`) values 
(1,'国内新闻',2,'2024-07-16 10:04:43'),
(2,'国际新闻',2,'2024-07-16 10:06:11'),
(3,'军事观察',2,'2024-07-16 14:37:12'),
(5,'科技创新',2,'2024-07-17 20:40:00');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `content` text,
  `state` int DEFAULT NULL,
  `adminid` int DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`introduction`,`img`,`type`,`content`,`state`,`adminid`,`oper_time`) values 
(1,'阿根廷卫冕美洲杯冠军！！！','绝杀！阿根廷1-0哥伦比亚，阿根廷卫冕美洲杯冠军，梅西伤退。','https://hangsproject.oss-cn-beijing.aliyuncs.com/e2957a536cb64c9dbffc0c769fabcfbd.jpg',2,'34岁夺美洲杯、35岁世界杯、37岁卫冕美洲杯。或许即便是梅西自己，也未曾想过在渐入足球生涯暮年之际，能够与国家队的队友们团结一致，共同创造队史大赛又一次辉煌时期。\r\n\r\n四年豪夺大赛三冠，阿根廷队顺利卫冕美洲杯冠军，成功开启潘帕斯时代！\r\n\r\n\r\n\r\n7月15日上午，2024美洲杯决赛在美国迈阿密举行，阿根廷队与哥伦比亚队展开激烈对决。\r\n\r\n此战本应在北京时间8点开赛，但因大量没买票的球迷涌入球场引发混乱，导致在9点20分才正式开球。\r\n\r\n\r\n\r\n上半场两队拼抢对抗激烈，梅西领衔的阿根廷队，J罗代表的哥伦比亚队也展现了不俗的状态。37岁的梅西遭遇对手重点盯防，双方难解难分因此陷入僵局。\r\n\r\n\r\n\r\n下半场再战，来到第66分钟，梅西跑动中突然滑倒，无法继续坚持比赛，右脚踝伤势加重+右腿腿筋不适。阿根廷队只好进行换人，尼古拉斯-冈萨雷斯替补上阵。\r\n\r\n梅西受伤离场动情落泪，在国家队的关键一战无法继续为国出战，曾经在场上风驰电掣的梅西，也已不再年轻了。\r\n\r\n\r\n\r\n当梅西难抵岁月沧桑，幸运的是阿根廷队年轻人们早已能挑起大梁，这一回队友相当给力！\r\n\r\n梅西离场后，阿根廷队全员团结一致面对同样拼劲十足的哥伦比亚队，将比赛拖入加时赛。\r\n\r\n进行至第112分钟，洛塞尔索送出传球，劳塔罗-马丁内斯突入禁区劲射得分！阿根廷队打破僵局，比分1-0！\r\n\r\n\r\n\r\n第117分钟，阿根廷队进行最后一次换人，奥塔门迪换下36岁的迪马利亚，天使就此结束国家队生涯，曾经的阿根廷大腿不禁泪洒赛场。\r\n\r\n\r\n\r\n全场战罢，阿根廷队1-0战胜哥伦比亚队，豪取6战5胜1平不败卫冕，梅西率队捧得2024美洲杯冠军！\r\n\r\n潘帕斯雄鹰问鼎队史第16座美洲杯冠军，就此超越乌拉圭队的15冠，独享美洲杯历史夺冠次数最多球队！\r\n\r\n四年时间，阿根廷队成功实现连续三届大赛夺冠，分别是2021美洲杯、2022世界杯和2024美洲杯，成为西班牙队后足球历史上第二支大赛三连冠的球队！\r\n\r\n\r\n\r\n当阿根廷85后球星梅西和迪马利亚老去，年轻一代成功挑起大梁，劳塔罗-马丁内斯成为球队关键锋霸，也是世界足坛亿元先生。\r\n\r\n24岁的阿尔瓦雷斯堪称超级锦鲤，足球生涯迄今260场比赛收获15座冠军，平均17场可得1冠，冠军奖杯拿到手软！\r\n\r\n\r\n\r\n33岁的J罗踢出1球6助，成功获得美洲杯最佳球员与助攻王。劳塔罗-马丁内斯攻入5粒进球，阿根廷制胜功臣当选美洲杯金靴！\r\n\r\n达米安-马丁内斯成为首位单届美洲杯收获5次零封的阿根廷门将，力保球队6战仅失1球，当选美洲杯最佳门将，已连续三届大赛获得最佳门将。\r\n\r\n\r\n\r\n从失声痛哭到微笑躺赢，虽早已入生涯暮年告别欧洲足坛，不复巅峰的梅西却成功见证了阿根廷后辈的强势崛起，问鼎足坛开启王朝的关键时刻。\r\n\r\n\r\n\r\n阿根廷队四年三夺大赛冠军，梅西收获足球生涯第45座冠军，继续稳坐足球历史上夺冠次数最多的球员！\r\n\r\n\r\n\r\n2024欧洲杯冠军和2024美洲杯冠军相继产生，2025年南美欧洲超级杯对阵确认，阿根廷队VS西班牙队，届时梅西将与亚马尔碰面！\r\n\r\n\r\n\r\n阿根廷队正式开启潘帕斯王朝，无论厚实的阵容还是成熟的踢法，都无愧为当前世界排名第1。或许在2年后的2026世界杯，潘帕斯雄鹰依旧是夺冠大热。\r\n\r\n恭喜阿根廷队勇夺2024美洲杯冠军！',2,2,'2024-07-16 10:06:35'),
(2,'西班牙欧洲杯全胜夺冠！！！','2024欧洲杯的终章，西班牙7战全胜！隔12年以拔山盖世之势再次夺冠','https://hangsproject.oss-cn-beijing.aliyuncs.com/BB1q1A7Y.jpg',2,'在2024年的欧洲杯决赛之夜，西班牙和英格兰展开了一场令人瞩目的巅峰对决。如果用一句话来概括西班牙和英格兰的决赛之旅，我会这样形容：一路战胜强敌，经验丰富的教练巧妙布局，最终挺进决赛；只有在落后时才展现实力，英格兰的韧性坚不可摧，艰难跻身决赛圈。\r\n\r\n这场比赛不仅是两支足球豪门的较量，更是荣誉与梦想的激烈碰撞。\r\n\r\n球场上，双方队员都展现出了卓越的竞技水平和不屈不挠的战斗意志。\r\n\r\n上半场，卢克-肖的表现格外抢眼，而下半场罗德里因伤离场，17岁的亚马尔贡献了精彩助攻，以4次助攻领跑助攻榜。\r\n\r\n尼科为球队打破了僵局，帕尔默作为替补登场扳平比分，奥亚萨瓦尔在第86分钟完成了绝杀。\r\n\r\n最终，西班牙以2-1战胜了英格兰，对他们来说，这个结果无疑是对他们长期坚持和不懈努力的最好奖励，以全胜战绩赢得了队史上第四座欧洲杯冠军，创造了历史新高。\r\n\r\n2024欧洲杯的终章，西班牙7战全胜！隔12年以拔山盖世之势再次夺冠\r\n2024欧洲杯的终章，西班牙7战全胜！隔12年以拔山盖世之势再次夺冠\r\n© 由 体育大队长 提供\r\n西班牙夺冠之路\r\n小组赛3-0克罗地亚.1-0意大利.1-0阿尔巴尼亚.三战全胜.小组第一出线.\r\n\r\n16进8的比赛中.4-1格鲁吉亚.\r\n\r\n8进4的比赛中.2-1德国.90分钟二队战平.加时赛最后几分钟.梅里诺完成绝杀.\r\n\r\n半决赛2-1法国\r\n\r\n决赛2-1英格兰\r\n\r\n在本届欧洲足球锦标赛中，西班牙队凭借其卓越表现赢得了全球的关注。\r\n\r\n他们通过一系列关键对决的杰出发挥，证明了球队的实力和坚定的决心。\r\n\r\n在面对强队的比赛中，西班牙队员们之间的无缝配合以及个别球员的出色表现，成为了他们夺冠旅程中的决定性因素。\r\n\r\n尤其是半决赛中那场充满悬念的胜利，不仅展示了团队的整体实力，还体现了在关键时刻的冷静与坚韧。这个冠军不只是一个荣耀的象征，更是西班牙足球精神和团队合作的典范。七连战无不胜！连续击败意大利、德国、法国、英格兰，毫无畏惧！实至名归，荣获最具价值的冠军荣誉！',2,2,'2024-07-16 11:58:29'),
(3,'成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐','AC米兰希望能够找到一位特点类似的射手。目前来看，AC米兰已经正式敲定了西班牙国脚莫拉塔。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721133307553BB1q4qwT.jpg',2,'对于AC米兰来说，在吉鲁离队之后，他们在锋线上的引援就成为了这个转会期的重中之重。这位法国射手过去几个赛季有着出色的进球率以及不错的支点策应作用，并且和两侧的莱奥以及普利西奇有着良好的化学反应，因此AC米兰希望能够找到一位特点类似的射手。目前来看，AC米兰已经正式敲定了西班牙国脚莫拉塔。\r\n\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n© 由 体育大队长 提供\r\n原本AC米兰的引援首选并不是莫拉塔，而是荷兰国脚齐尔克泽。后者是上赛季意甲联赛表现最出色的锋线球员之一，有13个进球入账，展现出了极为出色的潜力。AC米兰一度和齐尔克泽就个人合同完全达成了一致，也已经做好了激活球员4000万欧元违约金的准备。然而，“半路杀出程咬金”，齐尔克泽的经纪人突然大幅提高了佣金的数额，这让AC米兰方面感到非常不满，进而选择退出了转会谈判。之后，齐尔克泽迅速和曼联达成了一致，下赛季将转投英超赛场。\r\n\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n© 由 体育大队长 提供\r\n之后，AC米兰才将目光投向了莫塔拉。此前莫拉塔已经宣布继续留在马竞，但是当得知AC米兰的兴趣之后，莫拉塔改变了决定，开启了和红黑军团的转会谈判。为此，他也惹恼了很多了马竞球迷，后者认为他对球队缺乏足够的忠诚度。目前来看，莫拉塔和AC米兰之间的沟通非常顺利。据转会专家罗马诺等多个信息源表示，在和莫拉塔谈妥合同之后，AC米兰将激活球员合同当中1300万欧元的违约金条款。AC米兰将立即安排莫拉塔的体检事宜，最快在24小时后就会正式签约这位西班牙国脚。\r\n\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n© 由 体育大队长 提供\r\n据悉，莫拉塔获得了一份为期4年的合同以及500万欧元的年薪。在合同期满之后，他将年满35岁，很可能在圣西罗球员结束自己的职业生涯。对于AC米兰来说，莫拉塔作为意甲联赛的“老熟人”，有望实现“即插即用”的效果。他曾经在尤文先后效力过4个赛季，在意甲联赛打进了35个进球，还为队友送出了28次助攻，体现了作为一名全能前锋的优秀属性。上赛季，莫拉塔在马竞的表现也相当不错，在各项赛事里出场48次，打进了21个进球，还贡献了4次助攻。在这届欧洲杯上，作为西班牙国家队的主力，莫拉塔出场7次，收获了1个进球和1次助攻。\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n© 由 体育大队长 提供\r\n可以说，在31岁的年纪，莫拉塔依旧保持着非常出色的身体状态和竞技水准。在AC米兰看来，莫塔拉传射俱佳的特点有望让他无缝融入球队的战术体系当中。从前锋线的纸面配置来看，AC米兰和西班牙国家队有一些相似之处，那就是两个边路拥有突破能力和得分效率都很出色的边锋球员，因此，球队的进攻在很大程度上并不主要依赖中锋。球队的战术风格要求中锋球员具备足够出色的策应能力，能够为两侧的攻击手“作嫁衣裳”。从这一点上来看，莫拉塔无疑非常合适。\r\n\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n成了！AC米兰24小时后正式签约西国脚！“超级替补”遭驱逐\r\n© 由 体育大队长 提供\r\n在敲定莫拉塔的转会之后，AC米兰在中锋位置上的调整仍在继续。他们同时和德国国脚菲尔克鲁格进行了接触，希望将莫拉塔和他作为锋线上的“双保险”。目前来看，菲尔克鲁格对于前往AC米兰效力很感兴趣。不过，这也意味着球队的“超级替补”约维奇的处境变得非常艰难。上赛季，约维奇为球队贡献了9个进球和1次助攻，很好地完成了任务。虽然AC米兰和他续约了一个赛季，但是并未将他视作未来计划的一员。一旦球队敲定菲尔克鲁格的转会，他们将会立即驱逐约维奇。',2,2,'2024-07-16 18:21:55'),
(5,'中俄“海上联合-2024”军演开幕','中俄“海上联合-2024”军事演习开幕式在广东湛江某军港举行。同日，中国国防部证实中俄两国海军舰艇编队开展第四次海上联合巡航。','https://hangsproject.oss-cn-beijing.aliyuncs.com/172120918526916324542_86332f73a955c6a88ec5301845e94eef.jpg',3,'7月14日上午，中俄“海上联合-2024”军事演习开幕式在广东湛江某军港举行。军港码头，中俄两国国旗飘扬，参演官兵士气高昂，舰机整装待发。![16324542_7e4aec33f4651f17eddd04f84b6672a1.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/172120923000016324542_7e4aec33f4651f17eddd04f84b6672a1.jpg)\n7月14日，中俄“海上联合-2024”军事演习位湛江某军港举行开幕式。图为开幕式现场。（无人机航拍）刘基 摄7月14日，中俄“海上联合-2024”军事演习位湛江某军港举行开幕式。图为开幕式现场。解放军报记者栾铖 摄\n![16324542_c4f405976184ac6bf096547dcd49fb7f.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/172120934592616324542_c4f405976184ac6bf096547dcd49fb7f.jpg)\n“我宣布，中俄‘海上联合-2024’军事演习开幕！”随着中方总导演一声令下，联合演习正式拉开序幕。开幕式结束后，图上推演和战术协同随即展开。混合编组的联合指挥部成员围绕海上演练阶段中重点演练课目进行了深入研讨，共同敲定协同要点，进一步加强指挥融合度、行动联合度。下一步，中俄海上舰艇编队将赴湛江附近海空域组织锚地防御、联合侦察预警、联合搜救、联合防空反导等多个课目演练，并开展实际使用武器训练。\n\n开幕式上，中俄双方总导演分别致辞。中方总导演表示，两国海军始终秉持高起点、高效率发展策略，务实合作的规范化和体系化水平高位运行，双方专业领域交流广泛、海上联演联训机制日趋完备，两国海军遂行海上联合军事行动能力不断提升。俄方总导演表示，举行海上联合军事演习，能够有效提升双方参演部队联合协作和专业技术水平，对共同维护地区安全发挥重要作用。\n![16324542_42ebd2ddeecf07e95aca3fabb0d6495b.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/172120935575516324542_42ebd2ddeecf07e95aca3fabb0d6495b.jpg)\n7月14日，中俄“海上联合-2024”军事演习位湛江某军港举行开幕式。图为开幕式现场。解放军报记者栾铖 摄![16324542_86332f73a955c6a88ec5301845e94eef.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/172120937949816324542_86332f73a955c6a88ec5301845e94eef.jpg)\n7月14日，中俄“海上联合-2024”军事演习位湛江某军港举行开幕式。图为开幕式现场。解放军报记者栾铖 摄\n\n此前，参加中俄“海上联合-2024” 军事演习的俄方舰艇编队已于7月12日抵达广东湛江某军港。在港岸筹划阶段，双方进行了联合筹划和专业研讨交流、舰艇参观，并穿插组织了太极拳交流、球类友谊赛、甲板招待会等交流活动。\n\n自2012年以来，“海上联合”系列演习已经成为两国海军合作的主要平台，全方位带动海上联合军事行动水平，不断增强共同应对安全威胁和挑战的能力。\n\n来源：中国军号、学习军团\n\n作者：杜 娟、李伟欣、姚博文、王小敏、杨 捷、王 健、姜海涛',2,2,'2024-07-17 17:43:10'),
(6,' 重磅 | 历史首次！海军三型主战舰艇，交接入列！','4月23日，海军三型主战舰艇——长征18号艇、大连舰、海南舰在海南三亚某军港集中交接入列，中共中央总书记、国家主席、中央军委主席习近平出席交接入列活动并登上舰艇视察。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721209580096963.jpg',3,'4月23日，海军三型主战舰艇——长征18号艇、大连舰、海南舰在海南三亚某军港集中交接入列，中共中央总书记、国家主席、中央军委主席习近平出席交接入列活动并登上舰艇视察。\n\n这次集中入列创下三个“首次”：国家最高统帅首次同时为三艘大型主战舰艇入列授旗；海军首次同一天一次性入列三艘主战舰艇；一支舰队同天接收三艘水面、水下大型主战装备也是首次。\n\n视频来源：新闻联播\n\n南海舰队一次性入列三艘新装备\n\n专家：凸显国家经略南海的决心和意志\n\n这次交接入列的三型主战舰艇分别命名为：中国人民解放军海军长征18号艇、舷号421，中国人民解放军海军大连舰、舷号105，中国人民解放军海军海南舰、舷号31。\n\n《环球时报》记者了解到，长征18号艇是最新型的战略核潜艇，海南舰是首艘075型两栖攻击舰，大连舰是055大型驱逐舰。\n![936.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721209631230936.jpg)视频截图\n\n一位匿名的军事专家对《环球时报》表示，国家最高统帅同时为三艘大型主战舰艇入列授旗是首次，也很罕见，这三艘舰艇是海军装备信息化、数字化的最高水平，也是世界一流水平。专家同时表示，同一天一次性入列三艘新装备也是首次，而且是三艘不同型号的大型新式舰艇，其中两艘水面舰艇排水量都在一万吨以上。\n\n南海舰队在同一天接受水面、水下三艘大型主战装备也是首次，专家认为，这说明中国对南海的重视，“这三艘舰艇都是大国重器，同一天部署南海的意义不同凡响，此次入列凸显了南海的重要性，也表明国家经略南海的决心和意志。尤其在当前复杂的国际背景下，这些新式装备进一步加强了解放军维护国家领土和领海主权的能力。”\n\n长征18号艇入列\n\n专家：解放军二次核反击能力大大增强\n\n军事专家宋忠平对《环球时报》表示，根据潜艇命名规则，长城代表常规潜艇，长征代表核潜艇，因此可以判断出长征18号艇是最新型的战略核潜艇。\n\n![941.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721209658390941.jpg)视频截图\n\n一位匿名军事专家表示，新型潜艇的入列意味着海上连续战略巡航时间和在航数量的增长，以及对敌反击能力和威力的增大。\n\n大连舰：\n\n南海舰队入列的首艘055型大型驱逐舰\n\n大连舰是在南海舰队入列的首艘055型大型驱逐舰，在国产航母山东舰部署南海之后，大连舰的部署进一步提升了南海舰队的军事能力。![947.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721209675189947.jpg)视频截图\n\n055型大型驱逐舰首舰南昌舰和2号舰拉萨舰此前已经入列北海舰队。专家表示，该型舰的入列，不但标志着中国海军驱逐舰实现由第三代向第四代的跨越，也意味着中国现役装备主力战舰已经处于世界先进行列。\n\n海南舰为075型两栖攻击舰：\n\n可与航母形成特混编队 具备很强夺岛能力\n\n按照中国舰艇命名规则，航空母舰、巡洋舰以行政省(区)或词组命名，首艘075型两栖攻击舰被命名为海南舰，这是第三个以省份命名的舰艇，此前两艘分别为航母辽宁舰和山东舰。“直通甲板，还有舰岛，像一艘小航空母舰，一眼就看出新入列舰艇中有075两栖攻击舰。”宋忠平说。![953.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721209689757953.jpg)视频截图\n\n2020年8月，国防部新闻发言人吴谦曾在例行记者会上证实，中国海军首艘075型两栖攻击舰已顺利完成第一阶段航行试验。该舰是我国自主研制的首型两栖攻击舰，具有较强的两栖作战和执行多样化任务能力。\n\n宋忠平表示，075两栖攻击舰是中国最新一代两栖作战的武器装备，此前的071船坞登陆舰侧重于海上登陆，且搭载的直升机数量及垂直登陆能力有限。而075两栖攻击舰更注重舰载直升机的垂直登陆以及舰载航空兵的火力打击能力，相比071船坞登陆舰，其携带的海上登陆装备相对而言少一些。因此如果075两栖攻击舰和071船坞登陆舰形成两栖打击群，一起发力会形成强大的两栖打击能力，可在岛屿作战及两栖投送中发挥重大作用。',2,2,'2024-07-17 17:48:20'),
(7,'正式完成续约后，莫德里奇将在新赛季担任皇马队长','皇家马德里官方宣布与莫德里奇续约一年，这样一来，莫德里奇将在下赛季担任皇马队长。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269416810BB1q9aEx.jpg',2,'皇家马德里官方宣布与莫德里奇续约一年，这样一来，莫德里奇将在下赛季担任皇马队长。![BB1q9aEx.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269423414BB1q9aEx.jpg)皇马上赛季的队长是纳乔，莫德里奇是副队长。目前纳乔已经离开皇家马德里登陆沙特，而莫德里奇和皇马完成了续约，38岁的他将在下赛季担任皇马一号队长。\n\n莫德里奇于2012年加盟皇家马德里，出战534场比赛，曾随皇家马德里队赢得26个冠军：6次欧洲冠军联赛、5次世俱杯、4次欧洲超级杯、4次西甲联赛、2次国王杯和5次西班牙超级杯。',2,2,'2024-07-17 23:11:11'),
(8,'巴萨官方：蒂亚戈临时加入一线队教练组，将接受教练培训','巴塞罗那官方消息，33岁的蒂亚戈回归俱乐部，加入一线队教练组，并作为弗里克教练组的一员接受教练培训。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269493446BB1q8TxY.jpg',2,'巴塞罗那官方消息，33岁的蒂亚戈回归俱乐部，加入一线队教练组，并作为弗里克教练组的一员接受教练培训。![BB1q8TxY.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269504895BB1q8TxY.jpg)\n**# 巴塞罗那官方公告**\n33岁的蒂亚戈最近宣布结束自己的职业生涯，他将在接下来的几周内作为弗里克教练组的一员接受教练培训。这位俱乐部旧将将在夏天留在男足一线队，并参加在美国的季前赛。\n\n蒂亚戈出自拉玛西亚，他与新任巴萨主帅在拜仁慕尼黑赢得三冠王的那个赛季建立了密切的关系。\n\n（公告完）\n![BB1q90lR.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269539730BB1q90lR.jpg)蒂亚戈在2005年加入拉玛西亚青训，2009年进入巴萨一线队，代表巴萨出场100次，取得11粒进球和20次助攻，随队赢得了1次欧冠冠军、4次西甲冠军、1次国王杯冠军、1次世俱杯冠军、1次欧超杯冠军和2次西超杯冠军。\n\n2019-20赛季，蒂亚戈与弗里克在拜仁慕尼黑共事，他们一起赢得了三冠王的荣誉。',2,2,'2024-07-17 23:13:04'),
(9,'每体：巴萨可能加一名中卫球员进入梅里诺的交易','据《每日体育报》报道，巴萨有意引进梅里诺，可能在交易中加入球员。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269653423BB1q8BKp.jpg',2,'据《每日体育报》报道，巴萨有意引进梅里诺，可能在交易中加入球员。![BB1q8BKp.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721269610324BB1q8BKp.jpg)巴塞罗那中后卫可能被纳入梅里诺的可能交易中，皇家社会正在寻找一名中后卫，因为勒诺尔芒将离开。如无意外，梅里诺将离开皇家社会。\n\n朗格莱、埃里克-加西亚、伊尼戈-马丁内斯和米卡伊尔-法耶都是可选人选，具体取决于皇家社会的要求。朗格莱的问题在于他的薪水太高，而其他三人的未来还不明朗。巴勃罗-托雷是另一个选择。\n\n报道表示，包括一名球员进交易将使梅里诺的固定价格至少便宜2500万欧元。\n\n梅里诺的随行人员知道巴萨对他的兴趣，但目前还没有正式的报价。阿森纳和马德里竞技也想要他。当巴萨解决了左边锋的问题后，他们将专注于签下一名中场球员。',2,2,'2024-07-17 23:14:14'),
(10,'38岁莫德里奇与皇马续约，恩佐向切尔西全队道歉','姆巴佩亮相伯纳乌24小时后，17日下午，皇马俱乐部官宣和莫德里奇达成续约协议，克罗地亚中场的合同延长至2025年6月30日。美洲杯决赛，阿根廷击败哥伦比亚夺得冠军。赛后在球队大巴上，恩佐开启个人直播，直播中恩佐以及阿根廷多名球员唱起了针对法国队的种族歧视歌曲。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721282295419BB1qb0YF.jpg',2,'![BB1qb0YF.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721282343728BB1qb0YF.jpg)莫德里奇与皇马续约。\n\n38岁莫德里奇与皇马续约\n\n姆巴佩亮相伯纳乌24小时后，17日下午，皇马俱乐部官宣和莫德里奇达成续约协议，克罗地亚中场的合同延长至2025年6月30日。\n\n莫德里奇于2012年加入皇家马德里，在球队效力的12个赛季中，他赢得了26座冠军，包括6次欧冠、5次世俱杯、4次欧洲超级杯、4次西甲、2次国王杯和5次西班牙超级杯。莫德里奇是赢得6次欧冠的五位球员之一，并且拥有俱乐部历史上最多的冠军头衔。\n\n在个人荣誉方面，莫德里奇于2018年获得金球奖、国际足联最佳球员奖和欧洲最佳球员奖。他6次入选国际足联年度最佳阵容，并两次被评为欧冠最佳中场。\n\n同时，他曾在世俱杯分别获得1次金球奖和1次银球奖。克罗地亚国家队层面，他赢得了2018年世界杯金球奖和2022年世界杯铜球奖。\n\n2012年夏窗，皇马花费3500万欧元转会费从热刺引进莫德里奇。迄今莫德里奇为皇马出战了534场比赛，打进39粒进球并送出了86次助攻。\n\n如无意外，莫德里奇肯定将超越普斯卡什，成为皇马队史最年长的出场球员。目前皇马的最年长出场球员纪录，是由普斯卡什在上世纪60年代创下的39岁零36天。\n\n出生于1985年9月9日的莫德里奇，即将迎来自己的39岁生日。如果莫德里奇在2024年10月能再为皇马出场，他将打破普斯卡什的纪录。![BB1qb0YH.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721282363676BB1qb0YH.jpg)恩佐\n\n恩佐向切尔西全队道歉\n\n美洲杯决赛，阿根廷击败哥伦比亚夺得冠军。赛后在球队大巴上，恩佐开启个人直播，直播中恩佐以及阿根廷多名球员唱起了针对法国队的种族歧视歌曲。\n\n此事引发轩然大波，北京时间7月17日，恩佐在社交媒体上公开道歉：\n\n“我想为在国家队庆祝活动期间的一段视频真诚道歉。这首歌包含了极具攻击性的语言，这些话绝对没有任何借口。我反对一切形式的歧视，并为我们沉浸在美洲杯庆祝活动的喜悦中而道歉。”\n“那个视频和那些话，并不反映我的信仰或我的性格。我真的很抱歉。”\n\n据英国媒体《每日电讯报》披露，除了为自己在视频中的行为公开道歉外，恩佐还在整个切尔西队内群聊中向队友道歉。切尔西俱乐部已经就此事启动了内部纪律程序，可能会对费尔南德斯处以罚款。\n\n不过，恩佐公开和私下的道歉是否足以安抚他的切尔西队友，还有待观察，包括福法纳、恩昆库、古斯托和迪萨西等切尔西球员，都在社交媒体上取消了对恩佐的关注。\n\n恩佐最早要到月底才会再次与切尔西全队见面，这件事也将是对新主教练马雷斯卡管理球队的一次巨大考验。',2,2,'2024-07-18 13:59:33'),
(11,'曼城不是巴萨，拿一个卖不掉的人，去换曼城大将，简直是异想天开','这个夏天的转会交易市场，可以充分证明了，现在的经济形势并不乐观，哪怕是豪门俱乐部，都需要深思熟虑，好钢要用在刀刃上，而不是头脑一热就会拍板，每个俱乐部的收入，其实都不太可观，所以今年夏天，并没有太多的重磅交易。','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721618008943BB1qnK6e.jpg',2,'这个夏天的转会交易市场，可以充分证明了，现在的经济形势并不乐观，哪怕是豪门俱乐部，都需要深思熟虑，好钢要用在刀刃上，而不是头脑一热就会拍板，每个俱乐部的收入，其实都不太可观，所以今年夏天，并没有太多的重磅交易。\n\n在引援方面，很多俱乐部都倾向于违约金，或者球员交易，或者分期支付，而不是一次性全款，就如同巴萨一样，现在的财政状态，确实能够看出不如往昔，但是为了球队的成绩和俱乐部的发展，巴萨必须利用各种方法，不择手段去签约球员。![BB1qnK6e.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721618020442BB1qnK6e.jpg)但是一些高薪和高价值的球员，巴萨还是无能为力，就比如马竞金童菲利克斯，在巴萨租借了一年之久，也是兢兢业业，表现非常出色，尤其是在和马竞的比赛中，打进一球，他的庆祝动作也表示了，他不会再回到马竞，因为他会接受全场球迷的嘘声。\n\n不过，菲利克斯忽略了一点，他的转会身价应该在7000万欧元以上，巴萨即便是想要签约，也无能为力，现在搞的菲利克斯是左右为难，一边是马竞不要，另一边是巴萨无力。![BB1qnK63.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721618033708BB1qnK63.jpg)巴萨想出了一个折中的办法，那就是再租借菲利克斯一年，这样会根据他的表现再定夺，但是马竞方面却执意不肯，恐怕夜长梦多，所以菲利克斯这个赛季，如果有更好的去处，马竞肯定不希望巴萨再行租借事宜。\n\n所以在菲利克斯的转会上，马竞也是费尽了心思，不过有些时候，球员的价值，一定会体现在球场上，而不是一两句甜言蜜语，就能够让对方掏出这么庞大数字的转会费。就如同这条消息一样。![BB1qnP7I.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721618046901BB1qnP7I.jpg)据媒体HITCfootball报道，马德里竞技意图在朱利安·阿尔瓦雷斯的转会中提供若昂·费利克斯作为交换。\n\n当这条消息出现之后，球迷第一感觉，这是真的？如果是媒体杜撰，那么媒体为了流量，几乎不会在意逻辑和准确性，哪怕编的有理有据也是可以有一部分被相信，如果是马竞有意为之，那么马竞也太异想天开了。这样的消息，除了假，更准确的说，马竞还是有梦想的，万一实现了呢？\n对于球迷而言，这则交易如果成功，那么曼城可能要脱粉很多，马竞拿一个外租两年都卖不掉的球员，去换曼城大将，这不是异想天开是什么。\n\n菲利克斯在切尔西和巴萨两家俱乐部租借，打出的效果其实并不出彩，如果说3000万到5000万欧元，还算适中，但是如果和阿尔瓦雷斯交换的话，那么马竞太自以为是，因为现在阿尔瓦雷斯的身价在9000万，而曼城最低报价也不会低于7000万，之前菲利克斯的身价在1.2亿欧元，但是现在，有5000万，已经是非常不易。![BB1qnP7K.jpg](https://hangsproject.oss-cn-beijing.aliyuncs.com/1721618063768BB1qnP7K.jpg)总结\n\n总结来说，这条消息从某种意义上来说，也符合马竞一贯的做事风格，尤其是在和巴萨做交易的时候，马竞总能够有便宜可占，就比如1.2亿卖掉格里兹曼，然后2000万买回来，甚至苏亚雷斯，巴萨还要倒贴。但是曼城不是巴萨，他们也不会让阿尔瓦雷斯和菲利克斯交换。马竞还是省省力气吧。',2,2,'2024-07-21 08:18:38');

/*Table structure for table `systeminfo` */

DROP TABLE IF EXISTS `systeminfo`;

CREATE TABLE `systeminfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `icp` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `adminid` int DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `systeminfo` */

insert  into `systeminfo`(`id`,`name`,`img`,`phone`,`icp`,`address`,`adminid`,`oper_time`) values 
(1,'新闻快讯','https://hangsproject.oss-cn-beijing.aliyuncs.com/17212819856849815.jpg_wh860.jpg','1333234123','陕备案号：1232131','西安市临潼区',1,'2024-07-18 13:53:07');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `account` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `state` int DEFAULT '1',
  `reg_time` datetime DEFAULT NULL,
  `adminid` int DEFAULT NULL,
  `aud_time` datetime DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`account`,`password`,`gender`,`img`,`phone`,`state`,`reg_time`,`adminid`,`aud_time`,`birthday`,`address`) values 
(1,'某高中生','3109005786@qq.com','96e79218965eb72c92a549dd5a330112','男','https://hangsproject.oss-cn-beijing.aliyuncs.com/1721654725801微信图片_20240719192027.jpg','1871034027',1,'2024-07-19 04:38:19',NULL,NULL,NULL,'陕西省西安市临潼区');

/*Table structure for table `user_news_sc` */

DROP TABLE IF EXISTS `user_news_sc`;

CREATE TABLE `user_news_sc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `newsid` int DEFAULT NULL,
  `sc_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user_news_sc` */

insert  into `user_news_sc`(`id`,`userid`,`newsid`,`sc_time`) values 
(6,1,6,'2024-07-20 13:29:08'),
(7,1,3,'2024-07-20 13:29:17'),
(11,1,8,'2024-07-21 05:53:02'),
(12,1,9,'2024-07-21 06:02:52'),
(14,1,10,'2024-07-21 08:29:18'),
(15,1,11,'2024-07-21 08:51:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
