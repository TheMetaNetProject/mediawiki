-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: esmnwiki_dev
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.17-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `user`
--
-- WHERE:  user_id>1

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (2,'Lucag','Luca Gilardi',':B:5d5b8855:db024658b3d46ced2cacb7cebf80dd11',':B:a2267cac:278e739ff9103b4a1ae0f04f912718c5','20110425191516','lucag@icsi.berkeley.edu','20120216002358','a9a1b22a41d0c7d8e619708371448607','20110408232818','9fd07abc47ef6971541d29584ae3ec64','20110415224230','20110408224230',2,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (3,'Admin','',':B:ffd1f271:1151536002a5aed74af78f6e3833ad7c','',NULL,'','20120824224913','4bf4cfed8d2da5011249ef5dce3350d7',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20110408231819',1125,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (4,'Test','Luca',':B:3ab0bada:98743d80efa49644239ae35221c5b195','',NULL,'lucag@berkeley.edu','20110425185249','0ec49a0db2310965d44d816c8f421b58','20110425180918','7c6d9330cbf3c1a46a3e211f900279be','20110502180853','20110425180853',1,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (5,'Luca','Luca',':B:f443a695:76c54fe33399473dc7475a4432ad8dca','',NULL,'lucag@berkeley.edu','20110425191833','0d3ab8f647f0905761c7494963a6c65e','20110425191423','7e4a03bc7694a6b1366215a8c60e763a','20110525191407','20110425191730',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (6,'David Johnson','David Johnson',':B:bf33f339:5dd345d68e699a1afb3de8efecf8f6a5','',NULL,'Davidj@icsi.berkeley.edu','20110518023930','b60ebc7fa9dc2ddb057945048953e2f6','20110506001756','fda11f40fa8f3da2b39a12f289c7f5eb','20110605001715','20110517001853',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (7,'Oana','Oana',':B:927bd2c5:9f32bd831936438678b6951fee135c5e','',NULL,'oanadavid@berkeley.edu','20150501225401','049f14d71f627cdbadbcef183c971b09','20120517190850','d1f59c2f805ec3ecd04abfb56193b508','20120101204359','20111202210353',1416,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (8,'Matt Goss','Matt Goss','',':B:0f0e75db:483c3397022e335646a45d410ae12645','20111202210403','matthew.goss@berkeley.edu','20111202210408','2d5104198b167645059c42991e59582c','20111117024309','beeec2dce8733859da47483340f2efb2','20111217024135','20111202210403',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (9,'MetaNet','Feldman',':B:633080c6:f30c78cff5cd3f24e88a3e6741bfd23f',':B:b582fc43:32e70f9b20ba67499f26283d76e53943','20120411223205','feldman@icsi.berkeley.edu','20120513155255','234a4df76ae52cc1600f7fda1645d4b7','20120330215352','f8a5694c8bc14122c2c860b355dbd7c9','20120406215216','20120215224515',78,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (10,'Collin F. Baker','Collin F. Baker',':B:e2668c9d:9b7a4f534d45fd650b377e7182d0949c','',NULL,'collinb@icsi.berkeley.edu','20120820171715','56ed5b14ff1a2eb6a716afdb6080ce57','20120216065605','3254b65beba3074c02374c91713ddef7','20120317064332','20120216182704',153,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (11,'Davidj','davidj','',':B:fff4abdf:b0129a24f8506672c68b2bcf8450cf7f','20120229231117','davidj@icsi.berkeley.edu','20120229231123','2c908e762ac02dffdc9fbe1c9557c056','20120224033516','a7d2b9da51830edc775b91b73168ebec','20120325033403','20120229231117',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (12,'Cleaper','Christine Leper',':B:e96050b3:78c2b5e64512ac3ba41af1409e8059de','',NULL,'christine.leper@gmail.com','20120322181751','a63f6878f92a27b6123aeb1228f0a425',NULL,'11fec7d0b1453371dc0b2afc3509920a','20120329181745','20120322181745',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (13,'Cleper','Christine Leper',':B:85654f75:e5e07a1ac8169d94b63f7b5ad66a1269','',NULL,'christine.leper@gmail.com','20120815214415','19f56bdc218fe490d7131725a597dc8c','20120327173947','3c56f74ac17cb4da7f78aabfb64cf68a','20120329182211','20120322182211',20,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (14,'Omoju Test Account','Omoju Test Account',':B:51bf304f:b27dde3b1af1a74065de7f044dae6e82','',NULL,'omojumiller@gmail.com','20120328205954','1883919b747be3859cf3012435ed5b91','20120328205735','317f8582da9decc7bbdd57f4d8e5b32b','20120427205721','20120328205813',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (15,'George.lakoff','George Lakoff',':B:6b2c245a:a47e99f19c8a74ba0504f2e87739a1a5','',NULL,'george.lakoff@gmail.com','20130701193842','bf2c80eaad5dbe7c8842fc8c1093bd68','20120426145353','e4cfd0a7557bc4cb3febc50f9c24e692','20120503060949','20120328211523',2,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (16,'Feldman','Jerry Feldman',':B:a009d83d:c8c01bc733014dcc5f8840df98d71ebf','',NULL,'feldman@icsi.berkeley.edu','20120514173342','e0260519804c554f30deeee57348bef2','20120329204514','b4aaacbaed0e7abb3ad995a128c4c0ef','20120404211706','20120328211706',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (17,'Snarayan','Srini Narayanan',':B:a9eff9e3:54f60d7e4f24eab36055034f8bf30700','',NULL,'snarayan@berkeley.icsi.edu','20130328091808','157a72a2515dda2f282e659cbbb4b106',NULL,'f16c21d2c47ca47c10142de67ac3f1a1','20120404211831','20120328211831',28,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (18,'Lazizzad','Lisa Aziz-Zadeh',':B:260fb133:855a1ff5cf6d3678cfb8a375f11254a7','',NULL,'lazizzad@usc.edu','20120412212229','6ec104fb0fdb8ea15fd37de935d34f16','20120329211948','3afc3c2f863351cfd1d62e7bca354e72','20120404212013','20120328212013',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (19,'Fillmore','Chuck Fillmore',':B:76a9eeaf:31435eef150ef9c583d52a81cc283e89','',NULL,'cjfillmore@gmail.com','20120414001319','eb428249883001c2578c244efeb1b63e','20120328221118','55be6b10617c991d25ec69acc308a7af','20120404212131','20120328212131',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (20,'Katia','Ekaterina Shutova',':B:15fd66c1:e4788813541f620b1cde0bc37dcbf170','',NULL,'katia@icsi.berkeley.edu','20120817194403','2f0c3e3c9d576a1beff4559de0a801d9','20120330220125','d23582fc4532940f1fea2610d5f0b086','20120406220103','20120328212250',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (21,'Tmatlock','Teenie Matlock',':B:98c9b966:d6e9279a05669f336ae082cb0b6b54f5',':B:319c3ef3:9cbcfb1756a4d5ad8c181deba3f51de2','20120528183126','tmatlock@ucmerced.edu','20120528183131','df16fbd94b130615270bd61f097b6377','20120328220744','4eb10462902b8dbba8ea52bd894a4251','20120404214428','20120328214428',3,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (22,'Lera','Lera Boroditsky',':B:63bbc020:03b64c3c052690cb64dcde692e088cd1','',NULL,'lera@stanford.edu','20120426210507','078d2c3054da45cbf5df08652565b096','20120328215630','9ce58f223d5c239457b303951dd7b1ea','20120404215304','20120328215304',4,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (23,'Bkbergen','Benjamin Bergen',':B:b2b15eb2:4657307400c0f9be28eb3532d3b58f75','',NULL,'bkbergen@cogsci.ucsd.edu','20120424154637','221951097662a74537e1f5f465483051','20120412211910','d48dc352751efa243a1f1b73f270c907','20120405185151','20120329185151',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (24,'Infinity','Michael Ellsworth',':B:ba46ada8:c430114c92eb7a585aeca895e870a7f0','',NULL,'infinity@icsi.berkeley.edu','20130701202717','dbb4ed4bc8c280f84dd33ac05a6e2fa1','20120402160108','d4800cbacfe598ca0bb095c27ccfe9dc','20120405185246','20120329185246',110,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (25,'Behrang','Behrang Mohit',':B:0dd1f3e5:9bc3226d756fc0288704bda18dbe29ea','',NULL,'behrang@cmu.edu','20120801003201','68cc5d864d1c4dc2edab6e8d89588461',NULL,'f9af661d40898325c85cf2febbacddd6','20120405231933','20120329231933',4,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (26,'EllenDodge','Ellen Dodgr',':pbkdf2:sha256:10000:128:2ycWv8zpLk+uicq0XR51BA==:Pm1SDvTCh8fCDbfLCEGo54ucC7q+Zy76wP8x2/lE9SV3hYcuCYtB7xVYvuqKurXSjqWO4WJZoRTDLq8Q/QFV39zOKPNBh9b2u6byI4nIpy9j5L5DBiqzwqGs/dD42octvLCz2U5ParVG/xF/8BMl++v4+yatMEwcyeBYu1/hHEk=','',NULL,'Ebadodge@pacbell.net','20150527225341','fe17e5cb5aca505937969aaaa5b33b42','20120411234353','888a9baf82df3a62cc28245f1f6cc17f','20120418233702','20120411233702',158,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (27,'Inna Skrynnikova','Inna Skrynnikova',':B:91686cfb:b76a4a98a6e96a99059c12111ac6f951','',NULL,'innavskr@berkeley.edu','20131204220659','d1693d27d8e0a8a76b6c9f088bc9ae46','20120411052141','f78512eeb48c80f459090a548dec883d','20120511051913','20120412182754',1,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (28,'Hannah Phinney','Hannah Phinney',':B:6becf146:020f5ca2337d5a1cc2a6b5289d4281ee','',NULL,'hannahphin@gmail.com','20120426185439','634b60f5e7a5f059da836ce4f4d7c9d3','20120416191638','bb75a5555d324a6843879000e8f1e7e6','20120516191600','20120419122935',5,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (29,'Hernan Rosas','Hernan Rosas','',':B:02c9c717:d01b2760d00cd0b6717a2cb2eedf7666','20120419123009','hrosas@berkeley.edu','20120419123014','321a3807dcd9bcdc2003da6ceb02440a',NULL,'c7df0659fb42d7eaca962f89e5952d1a','20120513214221','20120419123009',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (30,'Agnieszka Pluwak','Agnieszka Pluwak',':B:25b52fa4:91d073ce9b02086ff0749bcfc15008fe','',NULL,'agnieszka.pluwak@gmail.com','20120419170726','6e6a44cd8d25aa45330f92463566520e','20120413214444','98c613cc616dd715ebf385126c3d3539','20120513214202','20120419123044',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (31,'Adam Vega','Adam Vega','',':B:1aa2df73:e2e301110c42ff52ae691234495e86f6','20120419123112','mradamvega@gmail.com','20120419123118','a9b9c6e3937ca7100e1be97141bb67c0','20120416183146','6d5dea85ee0dc099ace0518c88b26558','20120513214153','20120419123112',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (32,'Gerard de Melo','Gerard de Melo',':B:09a86565:eff6542cab9a6c3296e9e511a56758fd','',NULL,'demelo@icsi.berkeley.edu','20130704060931','099cf86d34050ec973d260bfdd2beba6','20120427040250','2b1228ec9512671f85221c4aa55dc7cf','20120527032355','20120427212625',2,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (33,'Aria','Aria',':B:a54c2305:03d848910eebdaea61b71b62d42f400f','',NULL,'apakatchi@berkeley.edu','20140805091036','e5f049982f734eb52049b10fc0c46368','20120429221424','1a1bdafc67eacc001ba7afb7a122c1ea','20120529095142','20120502201142',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (34,'Elstickles','Elise',':B:e3e28a68:30796d1ae2d7fc2e63270e61f2cef9c8','',NULL,'elstickles@berkeley.edu','20150223031235','5880f5535154c69e8e51c3183fd5223b','20120522004923','18c8759c1f626b9012bd076a4738a6d1','20120528182728','20120521182728',438,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (35,'Jhong','Jisup',':pbkdf2:sha256:10000:128:kXAS9eO7Za1TByYxnrWpPQ==:YMnwF4VrrBXZ0ON0oqIGiZFhVUYzPZRSqEQsIYmYMIsXovqG0SygxM/UjyzHiqB3Az1lmZO1qpeHSfXP4cJewJ6gKhwW0fMl0eC4GUFfdtpo0wahyBAuuwZIPMXTKvdcmbymWV2/UJZXV0xCP/hZHxkF3lDh+Ktk4+pvbv5IWkY=','',NULL,'jhong@icsi.berkeley.edu','20150514194007','ab473722aaeedf0e87357a2c5f547532','20120830174404','bdade26c8c24c0a295853d5b8d34cb75','20120528182835','20120521182835',1567,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (36,'Sanam','Sanam Janamian',':B:7200ade3:d690b7912e6f8a7e52295b557767e8b9','',NULL,'sanam.janamian@gmail.com','20141122001820','4ccf3ec11bbfd0690511803cb40e82fd',NULL,'f94c188264518855017366fba87e7f2b','20120802182520','20120726182520',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (37,'Ariapakat','Aria Pakatchi',':B:cf4abb94:55f0dcd8949f44c535109eee272ffa5c','',NULL,'ariapakat@gmail.com','20120726182735','59e78b536796a3cf7dbee71cd6444e5a',NULL,'8ebbe396fef5b3835a74d37b4d8f0964','20120802182730','20120726182730',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (38,'Jisup Hong','Jisup Hong',':B:c0990383:10d0b2179b96d7407f275fcc5ec5289a','',NULL,'hjisup@gmail.com','20120830050123','d413c38ae74d9e638f1162846c4482cc','20120830044127','99e080efc7180d75be92d17c428e38c6','20120929044044','20120830044259',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (40,'Jason Bourne','','',':B:0a873536:65cca96f7fdd81466aa880bb5516c76d',NULL,'jisup@me.com','20120830050240','eddd9d7bfb52a37fa4d966029ce08296',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20120830050235',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (41,'Eve Sweetser','Eve Sweetser',':B:26165981:7070cdfbbbf421e3c8d8620e4a824c00','',NULL,'sweetser@berkeley.edu','20131101172146','0cdef714006c4b11fc36c9fbe03dedc0','20120830050810','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20120830050450',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (42,'Metabot','',':pbkdf2:sha256:10000:128:UHZhGMGzXiF10FytortJ2g==:L2Ux5u54D9zWECea04fZ3SI9TbJlRBRHFWt/JVs3Pk39s81NoKO1niz/k4Vm2vi9Y1MzVV7IMKFR1LYLWNPBqcnKhDCYmaU3GZNs6i9yYHzBBWD0G9LUO+cBoM5hneeLjKSxwmX1s4wvEghj8yFXsDmTMUFFcetgSIfTbGO9b/0=','',NULL,'jhong@icsi.berkeley.edu','20150511171433','da437d79142367130501802185d31ca2',NULL,'0ec5cd5a5aa723267b861d0ecc37065d','20121030205518','20121023205518',5113,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (43,'Collinb','Collin Baker',':B:cc0245ed:981debb65d7084f4d11c31bf07b9a071','',NULL,'collinb@icsi.berkeley.edu','20150107080413','3f1f378988bdeaf357b337e69d3f2234','20121105182915','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20121031211840',1,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (44,'Sysbot','',':B:bdad65dd:2adca53925c4b07ae7b211a760102410','',NULL,'jhong@icsi.berkeley.edu','20121203105939','12699048b5a37d75b498b99acf5f5ae8',NULL,'8763206c42edd52d06f32ea8cd447ecb','20121210081920','20121203081920',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (45,'PatriciaL','Patricia Lichtenstein',':B:27e1d636:064840b8a2e3c201ab1c68936d8b25d6','',NULL,'tricia1@uchicago.edu','20130207183947','f486cfc5a7d2ed55d535d56287d53577','20121217175658',NULL,NULL,'20121217174752',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (46,'Karie.moorman','Karie Moorman',':B:1d1ab83c:d89388c8086b2b5c38ca8883f0a8a1cf','',NULL,'karie.moorman@berkeley.edu','20150306190916','cc3a013bd82b83663d2d7a967aa1fe49','20130213164731',NULL,NULL,'20130206214152',3750,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (47,'Elisabethwehling','Elisabeth Wehling','',':B:63a5826c:34a2cadc89c5f3ae771ca74889943a39',NULL,'elisabethwehling@hotmail.com','20130206215218','fdd8276c23fcb00f1a8a8a5b53c7e6f0',NULL,NULL,NULL,'20130206215213',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (48,'Jpgiroux','Joseph Giroux',':B:cae64045:94d5cf923e550df5069be19daa31bbda','',NULL,'jpgiroux@berkeley.edu','20130920202728','df54b395e899f1276c440b80295d6a76','20130207002815',NULL,NULL,'20130206233420',594,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (49,'Wooters','Chuck Wooters',':B:ac1e3df2:ecbf228b14eaac9acff82cc78dc727b1','',NULL,'wooters@icsi.berkeley.edu','20130218234755','8858e052317b90342a5c775c2a553728','20130218234702',NULL,NULL,'20130215205421',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (50,'IARPA','IARPA Account',':B:2609d9af:39b3cbea2b55f49c35ad9ea21f241841','',NULL,'jhong@icsi.berkeley.edu','20130304201059','ec91af8a620b7169a58d477b96c4562f',NULL,'3133eaf22647716c0816c16ad74a3e0c','20130311181538','20130304181538',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (51,'Aucher','Aucher Serr',':B:a188a246:0e185d2a5bedfee03347f7d716872ff5','',NULL,'aucher.serr@gmail.com','20130318061214','85170fe832445e2604213a19a0b0589c','20130318061159',NULL,NULL,'20130315213422',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (52,'Edg','Dario Gutierrez',':B:4f77b96c:9ebe82db0f85e221c2ca301ded6e8098','',NULL,'edg2103@gmail.com','20140429012435','7cee0fc8f5178b4c9ce61c5f49199f14','20130423023101',NULL,NULL,'20130422185621',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (53,'Rostrand','Rachel Ostrand',':B:167a32da:76b2615286db3611a4a94fbfff4faf3f','',NULL,'rostrand@cogsci.ucsd.edu','20130422230524','0264e077658f821ddfa6b836f3304618','20130422230507',NULL,NULL,'20130422204252',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (54,'Andrew.Dombrowski','Andrew Dombrowski','',':B:8091b4d2:c9d0587c993ae32d24030969e7f06512',NULL,'adombrow@uchicago.edu','20130424231950','4b6994ec2c3f67e36a0340d559a7937b',NULL,NULL,NULL,'20130424231944',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (55,'Ely.Matos','Ely Matos',':B:1f59ea2c:2f0b24d9f29019ebb49078f116b8be4c','',NULL,'ely.matos@gmail.com','20130429172146','a2324e7a94664a7e23d369d118cc8313','20130429172129',NULL,NULL,'20130429165614',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (56,'Tiago.torrent','Tiago Torrent','',':B:555a99cb:28bba74a0f1833d8f724c5a0b05fab08',NULL,'tiago.torrent@ufjf.edu.br','20130717225925','f00f8fe338963ce4e2c533e9f681a548',NULL,NULL,NULL,'20130717225920',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (57,'Karen Sullivan','Karen Sullivan',':B:695cff1f:5a6b175161bb4cb018d09bc61e450bc1','',NULL,'ksull@uq.edu.au','20130905054407','6ef976b3dfa7ce3bbc3ac0387b1dbd47','20130905054337',NULL,NULL,'20130903235617',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (58,'Michael.gonzalez','Michael Gonzalez',':B:dda5be21:e8b8d2d72f783bd5aea3d8f00dbf0313','',NULL,'michael.gonzalez@berkeley.edu','20140129235340','77c7c3dad82cba0a9b5000095dbf38dd','20130924015919',NULL,NULL,'20130920203630',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (59,'Ariafani','Aria Fani',':B:035e5d82:3afff9f441a4a25b604f6d127234cd0d','',NULL,'ariafani@berkeley.edu','20140307011342','bd3e6438ef656909c7f5cc06e23a8d45','20140307011319','e1e02b44899afadb4f6f183419af222a','20140310194821','20140303194821',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (60,'Reza246','Reza Ghahramani',':B:6ab08012:37508a3a3a4146ace9e75e07054da012','',NULL,'r_ghahramani@yahoo.com','20140731015608','c721b35166b23e9e2b891512991163d3',NULL,'64846d43a1a2454e2da088275c269f09','20140310231954','20140303231953',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (61,'Sjdayday','Steve Doubleday',':B:a4d301ef:56ae6bbbbad82384bf9eac6973c6a8f4','',NULL,'sjdayday@icsi.berkeley.edu','20140326213210','11c50506f55cd689ef2897c7f605c02b','20140326213147',NULL,NULL,'20140326193251',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (62,'Nika.Allahverdi','Nika Allahverdi',':B:7fa83513:d295197e2ca5a56cc2c4d4bb99df49c9','',NULL,'nikaallahverdi@berkeley.edu','20140407154806','24b700d7093008cb28785cba3d570a22','20140407154736',NULL,NULL,'20140404185913',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (63,'Seantrott','Sean Trott',':B:55f2f48f:6fcd9557cabd6646ce3bda2a2952b50b','',NULL,'seantrott@berkeley.edu','20140730190508','f0ca9514bc7c050b63e8ba9b18718063',NULL,'965560c6de2e764a68127556d077c283','20140609185350','20140602185349',0,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (64,'Coneglian','Andre Coneglian',':B:49f42b30:b0655788b57f0824c3f29fb414a17e5a','',NULL,'coneglian@berkeley.edu','20150305012019','f89f6e532c2d62841dd805a08f958dce','20140906010612','0def2e06d01677af00047ae07043aa82','20140912215701','20140905215700',6,NULL);
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES (65,'Dekaiwu','Dekai Wu','',':B:61730d24:9805e4c08beac4a9ebdeb9131bfa4f26','20150107081835','dekai@cs.ust.hk','20150107081840','b50f290970ae7b1c53233de8c3fc52bf',NULL,NULL,NULL,'20141219002839',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-21 14:25:38
