/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.7.21-log : Database - ysuria
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ysuria`;

USE `ysuria`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` longtext,
  `attachment` varchar(300) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category` (`creator`),
  CONSTRAINT `FK_category` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`title`,`content`,`attachment`,`creator`,`datecreated`) values (1,'Newest Technology',
'<p>Predicting the future requires hubris, and it should therefore be met with more than a terabyte of skepticism.
 In past years, I&rsquo;ve made some calls that have proved prescient like predicting way back in 2011 that social
 media would determine the U.S. presidential election. Meanwhile, some took decades longer than I had foreseen such
 as my 1992 prediction that this new thing called the Internet would lead Hollywood studios to merge with
 telecommunications companies.</p>\r\n\r\n<p>Over the years, I&rsquo;ve learned that the best way to predict the
 future is to hang out with the people creating it. When you work with a top consultancy and have leading technology
 innovators as clients, it&rsquo;s pretty easy to recognize trends that have the greatest potential impact.</p>\r\n',
 'https://drive.google.com/open?id=155xvmeUroiK0bSWS9foaqFSTYhUoDCIqOtBy9Xwb4_I',1,'2018-03-16 11:59:15'),(2,'IoT',
 '<p>There are 2 major items that I wanted to mention this week. First is IoT Fuse: Conference 2018. The IoT Fuse:
 Conference is our yearly conference to unite accomplished doers, makers and hackers with the brightest executives,
 entrepreneurs and innovators.</p>\r\n<p>Last year we had more than 1100 registrations for the conference with 60+
 sessions and 40+ sponsors supporting the event. This year will prove to be even larger and more exciting with two
 days of technical workshops and an even larger presence across multiple industries. This conference will sell out,
 so register today and join the largest community of IoT professionals in the upper Midwest!</p>\r\n<p>Additionally,
 I posted a new article on Why the Time is Now for the Internet of Things. It\'s a follow-up article after being the
 keynote at the University of Minnesota Law School Symposium. Enjoy!</p>\r\n<p>Finally, myself and the team at IoT
 Fuse is putting on an awesome IoT event this week on Disrupting Logistics and Transportation Using IoT Technologies.
 If you are in the cities, you\'ll definitely want to attend this event with me. There will be great perspectives
 from experts in the field.</p>','http://iotweeklynews.com/',1,'2018-03-16 12:01:31'),(7,'REACT TECH','<p>&nbsp;</p>\r\n\r\n<p>You
 .i TV has announced that it is extending the benefits of the React Native development framework to streaming
 devices, consoles and smart TVs, increasing the utility of the open source JavaScript project. At CES 2018,
 You.i TV will show how You.i Engine One can bring superior user experiences to 10-foot platforms
 - including Roku - using the same code portability and efficiency that React Native enables on mobile platforms.
 During the January 9-12 event, You.i TV will be demonstrating how integrating You.i Engine One and React Native
 can simplify development at its C-Space exhibit at the Aria Hotel and Casino Resort.<br />\r\n<br />\r\n&ldquo;While
 React Native is proving its worth in mobile, limitations on app scope, device reach and UX workflows lessen
 its value in&nbsp;<a href=\"https://appdevelopermagazine.com/5704/2017/11/27/CircleCI-2.0-now-available-for-Apple-cross-
 platform-apps/\" target=\"_blank\">broader cross-platform environments</a>,&rdquo; said Andrew Emmons,
 VP of Product for You.i TV. &ldquo;Adding the power of You.i Engine One opens the door to nimbly and cost-effectively
 creating and updating richer, more flexible apps that drive engagement, monetization and brand consistency.&rdquo;
 <br />\r\n<br />\r\nYou.i TV&rsquo;s core technology eliminates a key issue in how React Native provides abstractions
 to operating system native controls for iOS and Android: the need to write different code for different platforms.
 By porting React Native to You.i Engine One, developers benefit from You.i Engine One&rsquo;s single codebase approach,
 performance and workflow, so they can create graphically and functionally superior apps.<br />\r\n<br />\r\nThe combination
 of RN and You.i Engine One breaks new ground by placing all supported platforms on an equal playing field for developers,
 and by allowing them to leverage existing investments in React, React Native and ecosystem enhancements. Additional
 benefits include gaming engine-type performance and integration with You.i TV&rsquo;s designer workflow.<br />\r\n<br />\r\n&ldquo;Roku stands as an integral part of any successful direct-to-consumer strategy,&rdquo; said Jason Flick, CEO and co-founder of You.i TV. &ldquo;We believe that bringing React Native and Roku together is a breakthrough for 10-foot&nbsp;<a href=\"https://appdevelopermagazine.com/5445/2017/8/15/Xojo-2017-cross-platform-tool-updates-are-now-available/\" target=\"_blank\">cross platform strategies</a>&nbsp;that can immediately improve the consumer experience.&rdquo;<br />\r\n&nbsp;</p>\r\n','TITLEIDREACT DOCUMENT 2018ID1Cq96JCQ3iRbe529Lj1ZGoaZevCFc_ZRfTITLEIDREACT NATIVE CHARTID1PbP8rhyDAblgYG-_qTiZaCBGQjCAAurE',1,'2018-03-19 20:16:34');

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (2),(2),(2);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `categoryid` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_news` (`categoryid`),
  KEY `FK_news_user` (`creator`),
  CONSTRAINT `FK_news` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_news_user` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`categoryid`,`link`,`datecreated`,`creator`) values (1,'When BlockChain meets IoT','About 20% of all IoT enabled devices shall have basic level Blockchain services enabled in them in 2019. That said, there would be more devices that will be will be able to send data to private ledgers. This is an obvious hint at how the two most futuristic technologies have started converging, and most importantly, heralding a new world where companies are introducing new blockchain-based initiatives left, right and center!\r\nWith the help of some use-cases, let’s understand how blockchain has already begun disrupting industries that are using IoT.\r\nThe earliest and the most practical application of a blockchain was to create the cryptocurrency Bitcoin. Today, it has gone beyond finance with some great applications in the offing. Recently, Nokia launched a blockchain-powered IoT sensing as a service for smart cities, paving the way for mobile network operators to monetize their existing infrastructure. These operators already use Nokia cell site equipment and will be able to sell the infrastructure such as towers. This can be done by selling the live environmental sensor data.\r\nMake Way for Security\r\nTake the instance of IBM’s Watson IoT Platform. It has a “built-in capability that lets users add selected IoT data to a private blockchain.” Moreover, this secure data is shared only with the partners who are involved in the transaction. Ergo, by using blockchain, devices will be able to send data to private ledgers giving rise to transactions with tamper-resistant records.\r\nFor those who were in the search for a more secure IoT system are in for a pleasant surprise. If IBM can make this possible, so can other firms. For example, a Taiwanese company known as OwlTing has taken food safety up many notches by integrating blockchain technology in its supply chain infrastructure. In an unprecedented move, the Ethereum-based technology called OwlChain will come up with a tamper-resistant system, which will offer consumers information on each step of the production and distribution process. This will introduce better transparency in the food supply chains and push for enhanced food control.\r\nNo More Flawed Systems\r\nAt present, the IoT solutions are expensive because of the cost of the tools, networking equipment and maintenance of centralized clouds. When the devices expand, the cost will also shoot up drastically. Moreover, IoT devices will get smaller and have limited computing power, which will limit the encryption capabilities. Less storage and the need for immense power consumption is another roadblock, which can restrict the entire blockchain mechanism that largely depends on authenticity and transferring, storing the information in real-time. When a device will function as a node, it should have the copies of all the transactions, starting from the first block.\r\nA solution to this lies in DAG or Direct Acyclic Graph, a concept brought forth by SPECTRE. It builds the blockchain from the bottom and aims to correct the flaws of blockchain development. According to the concept, 10 blocks are created per second and are referenced in a DAG. As a result, several threads of blocks arise, which are entwined together. Post this, the most valid transaction history is chosen by the miners (most inter-referential block graph). Transaction storage will be temporary, which will be removed once it has been validated.\r\nSupporting Transactions with High-Quality Wallets\r\nThe Hdac Technology AG is doing great on the IoT front. It is in the middle of organizing the release of Hdac token and that’s going to be a major step for the future of IoT. The platform is a group of Blockchain projects that involve the Hyundai Corporation via Hyundai Pay.\r\nA section of the website content states that “Our goal is to harness that opportunity to help you go “Beyond the Human Pay”. Through secure Blockchain technology, Hdac can assign contracts to all your smart devices to fit your life pattern. In layman’s terms, we make your life easier.” They are basically addressing privacy, which is a leading challenge IoT faces. By configuring unique Hybrid Blockchain Networks for its users, the platform aims to support several transactions with high-quality wallets that are not vulnerable to security flaws.\r\nConclusion\r\nAs we move towards a future that’s more connected than ever, blockchain and IoT will play a massive role in offering speedier tasks, trust and reliability. Together, they will form a definitive solution for various problems and it will not be long before they evolve into a ubiquitous technology.',2,'https://insidebigdata.com/2018/03/10/blockchain-meets-iot-lowdown-need/?utm_campaign=IoT%2BWeekly%2BNews&utm_medium=web&utm_source=IoT_Weekly_News_116','2018-03-16 12:05:33',1),(2,'5 tech trends that will change the world in 2017','<p>2016 was a year many would rather forget. From the never-ending stream of bad news to a brutal election that seemed like it would never end to the dozens of celebrities &mdash; including a few in the tech world &mdash; that passed on, it was a tough year. But 2016 also had its share of important technological breakthroughs that changed how we live, work, and play. Virtual reality made a big comeback in 2016 and is sure to get even hotter this year. Virtual assistants moved out of our cell phones and into our homes, and smart home technologies may have finally broken through to the mainstream. So what do we expect in the new year? There&rsquo;s a myriad of tech trends we&rsquo;re watching that will change the world once again in 2017; here&rsquo;s the top five you should keep an eye on. The Internet of Things has been on just about everybody&rsquo;s list for years. So why hasn&rsquo;t it caught on? The issue lies in interoperability. In theory, the IoT is supposed to connect all our devices together, making them sing in a glorious technological harmony. Thing is, we&rsquo;re not at that point yet &mdash; at least in a usable manner, and in a way that doesn&rsquo;t make you want to pull your hair out. We&rsquo;ll use the smart home as an example here. Much of the work in the past several years has revolved around the idea of a &ldquo;smart hub,&rdquo; in layman&rsquo;s terms a souped-up wireless router with extra communications technologies built in. But ask any smart home system owner, and they&rsquo;ll tell you it&rsquo;s not a perfect solution. A multitude of wireless technologies now exist to serve your smart home needs &mdash; Zigbee, Z-Wave, Bluetooth, Wi-Fi, and more. And there&rsquo;s more smart home platforms to consider than ever before too &mdash; Wink, SmartThings, Iris by Lowe&rsquo;s, even systems from security providers like ADT and big brands like Comcast. While centralization in theory should make things easier, it&rsquo;s made it worse. Some smart home gadgets won&rsquo;t work with certain smart home platforms &mdash; for example, your Philips Hue lights won&rsquo;t work with your Iris by Lowe&rsquo;s system (likely a business decision as Lowe&rsquo;s doesn&rsquo;t carry the Hue product line). Plus if your smart hub goes down, your entire system typically goes with it. Expect a refocus this year when it comes to smart homes. Wi-Fi is a tested and true wireless networking technology, and routers are serving up ever larger amounts of bandwidth, so there&rsquo;s plenty of space to handle your connected home. Also, new smart home devices are choosing Wi-Fi to maximize compatibility. Instead of using a centralized hub, device manufacturers will focus on interoperability between themselves. This might have the consequence of shrinking the number of directly compatible devices, but it may not matter. Ither technologies can take the place of the hub, and likely do a better job of it. IFTTT can connect those devices in any way you see fit, and Amazon&rsquo;s Alexa and Google Home can control them by voice. The hub just isn&rsquo;t necessary anymore, and that might be a good thing. Automation is nothing new &mdash; at least on the business side. Our experiences with automated technologies primarily comes in the form of those pesky automated customer service systems we&rsquo;re forced to call every time we need help. But it&rsquo;s only going to get more commonplace this year. Automated customer service won&rsquo;t go away, but it will get better. At the same time, online customer service will be automated as well, thanks to better AI and chatbots that understand context a whole lot better than ever before. More and more jobs will also be automated &mdash; even journalist&rsquo;s work on writing the news (don&rsquo;t worry, we aren&rsquo;t going anywhere). We&rsquo;ll also see smart devices gain from increased automation, learning your patterns and preferences without you needing to tell them and making better and more accurate suggestions and recommendations. Here&rsquo;s one interesting area to watch: fast food. 2016 saw a lot of talk of removing the human component from food service; will self-serve kiosks make an appearance in the year ahead? On top of that, automated drone delivery should also see wider-scale testing by the end of the year &mdash; especially by Amazon. Are there negatives? Of course. We&rsquo;ve heard complaints for a long time about the lack of interpersonal communication these days. And jobs may be lost as a result of the move away from humans. No doubt, the discussion surrounding how far we&rsquo;ll let automation run our lives will only get louder in the New Year.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"blob:http://localhost:8080/697d58ac-b1b7-49c2-a23a-bd51d31ff653\" width=\"5184\" />\r\n<figcaption></figcaption>\r\n</figure>\r\n',2,'https://www.digitaltrends.com/cool-tech/technology-trends-2017/','2018-03-16 12:07:36',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`phone`) values (1,'quang','123','quangdad123@yahoo.com','01659432579');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
