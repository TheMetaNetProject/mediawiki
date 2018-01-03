-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: enmnwiki_pub
-- ------------------------------------------------------
-- Server version	10.0.17-MariaDB-log

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
-- Current Database: `enmnwiki_pub`
--

/*!40000 DROP DATABASE IF EXISTS `enmnwiki_pub`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `enmnwiki_pub` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `enmnwiki_pub`;

--
-- Table structure for table `account_credentials`
--

DROP TABLE IF EXISTS `account_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_credentials` (
  `acd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acd_user_id` int(10) unsigned NOT NULL,
  `acd_real_name` varbinary(255) NOT NULL DEFAULT '',
  `acd_email` tinyblob NOT NULL,
  `acd_email_authenticated` varbinary(14) DEFAULT NULL,
  `acd_bio` mediumblob NOT NULL,
  `acd_notes` mediumblob NOT NULL,
  `acd_urls` mediumblob NOT NULL,
  `acd_ip` varbinary(255) DEFAULT '',
  `acd_xff` varbinary(255) DEFAULT '',
  `acd_agent` varbinary(255) DEFAULT '',
  `acd_filename` varbinary(255) DEFAULT NULL,
  `acd_storage_key` varbinary(64) DEFAULT NULL,
  `acd_areas` mediumblob NOT NULL,
  `acd_registration` varbinary(14) NOT NULL,
  `acd_accepted` varbinary(14) DEFAULT NULL,
  `acd_user` int(10) unsigned NOT NULL DEFAULT '0',
  `acd_comment` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`acd_id`),
  UNIQUE KEY `acd_user_id` (`acd_user_id`,`acd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_credentials`
--

LOCK TABLES `account_credentials` WRITE;
/*!40000 ALTER TABLE `account_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_requests`
--

DROP TABLE IF EXISTS `account_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_requests` (
  `acr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acr_name` varbinary(255) NOT NULL DEFAULT '',
  `acr_real_name` varbinary(255) NOT NULL DEFAULT '',
  `acr_email` varbinary(255) NOT NULL,
  `acr_email_authenticated` varbinary(14) DEFAULT NULL,
  `acr_email_token` binary(32) DEFAULT NULL,
  `acr_email_token_expires` varbinary(14) DEFAULT NULL,
  `acr_bio` mediumblob NOT NULL,
  `acr_notes` mediumblob NOT NULL,
  `acr_urls` mediumblob NOT NULL,
  `acr_ip` varbinary(255) DEFAULT '',
  `acr_xff` varbinary(255) DEFAULT '',
  `acr_agent` varbinary(255) DEFAULT '',
  `acr_filename` varbinary(255) DEFAULT NULL,
  `acr_storage_key` varbinary(64) DEFAULT NULL,
  `acr_type` tinyint(255) unsigned NOT NULL DEFAULT '0',
  `acr_areas` mediumblob NOT NULL,
  `acr_registration` varbinary(14) NOT NULL,
  `acr_deleted` tinyint(1) NOT NULL,
  `acr_rejected` varbinary(14) DEFAULT NULL,
  `acr_held` varbinary(14) DEFAULT NULL,
  `acr_user` int(10) unsigned NOT NULL DEFAULT '0',
  `acr_comment` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`acr_id`),
  UNIQUE KEY `acr_name` (`acr_name`),
  KEY `acr_email` (`acr_email`),
  KEY `acr_email_token` (`acr_email_token`),
  KEY `acr_type_del_reg` (`acr_type`,`acr_deleted`,`acr_registration`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_requests`
--

LOCK TABLES `account_requests` WRITE;
/*!40000 ALTER TABLE `account_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation` (`cl_collation`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,1,'//meta.wikimedia.org/wiki/Help:Contents','http://org.wikimedia.meta./wiki/Help:Contents'),(2,1,'//meta.wikimedia.org/wiki/Help:Contents','https://org.wikimedia.meta./wiki/Help:Contents'),(3,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(4,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(5,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(6,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(7,1,'https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce','https://org.wikimedia.lists./mailman/listinfo/mediawiki-announce'),(8,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','http://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources'),(9,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','https://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` blob,
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `hitcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hitcounter`
--

LOCK TABLES `hitcounter` WRITE;
/*!40000 ALTER TABLE `hitcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hitcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  UNIQUE KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_to`,`il_from_namespace`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','http://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','http://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('docbook','http://wiki.docbook.org/$1','','',0,0),('doi','http://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','','',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),('foldoc','http://foldoc.org/?$1','','',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gej','http://www.esperanto.de/dej.malnova/aktivikio.pl?$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','http://www.google.com/search?q=$1','','',0,0),('googlegroups','http://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('jargonfile','http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1','','',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','http://www.lojban.org/tiki/tiki-index.php?page=$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('lugkr','http://www.lug-kr.de/wiki/$1','','',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','','',0,0),('mediazilla','https://bugzilla.wikimedia.org/$1','','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','','',0,0),('mozillawiki','http://wiki.mozilla.org/$1','','',0,0),('mw','http://www.mediawiki.org/wiki/$1','','',0,0),('oeis','http://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('ppr','http://c2.com/cgi/wiki?$1','','',0,0),('pythoninfo','http://wiki.python.org/moin/$1','','',0,0),('rfc','http://www.rfc-editor.org/rfc/rfc$1.txt','','',0,0),('s23wiki','http://s23.org/wiki/$1','','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','http://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','','',0,0),('sourceforge','http://sourceforge.net/$1','','',0,0),('sourcewatch','http://www.sourcewatch.org/index.php?title=$1','','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('tejo','http://www.tejo.org/vikio/$1','','',0,0),('theopedia','http://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uea','http://uea.org/vikio/index.php/$1','','',0,0),('uncyclopedia','http://en.uncyclopedia.co/wiki/$1','','',0,0),('unreal','http://wiki.beyondunreal.com/$1','','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('webseitzwiki','http://webseitz.fluxent.com/wiki/$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','http://www.wikihow.com/$1','','',0,0),('wikimedia','https://wikimediafoundation.org/wiki/$1','','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','','',0,0),('wikisource','https://wikisource.org/wiki/$1','','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  KEY `lc_lang_key` (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(255) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_resource`
--

DROP TABLE IF EXISTS `msg_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_resource` (
  `mr_resource` varbinary(255) NOT NULL,
  `mr_lang` varbinary(32) NOT NULL,
  `mr_blob` mediumblob NOT NULL,
  `mr_timestamp` binary(14) NOT NULL,
  UNIQUE KEY `mr_resource_lang` (`mr_resource`,`mr_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_resource`
--

LOCK TABLES `msg_resource` WRITE;
/*!40000 ALTER TABLE `msg_resource` DISABLE KEYS */;
INSERT INTO `msg_resource` VALUES ('user.options','en','{}','20150723182605'),('user.tokens','en','{}','20150723182605');
/*!40000 ALTER TABLE `msg_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_resource_links`
--

DROP TABLE IF EXISTS `msg_resource_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_resource_links` (
  `mrl_resource` varbinary(255) NOT NULL,
  `mrl_message` varbinary(255) NOT NULL,
  UNIQUE KEY `mrl_message_resource` (`mrl_message`,`mrl_resource`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_resource_links`
--

LOCK TABLES `msg_resource_links` WRITE;
/*!40000 ALTER TABLE `msg_resource_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_resource_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',1,0,1,0.96840596938,'20150723182344','20150723182344',1,592,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  UNIQUE KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_namespace`,`pl_title`,`pl_from_namespace`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(255) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20150723182344',0,'MediaWiki default',0,'Main_Page','',0,0,1,1,1,0,1,'mw.new',0,'127.0.0.1',0,592,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20150723182344',0,0,592,0,'glba3g2evzm40dqnqxegze66eqibkvb',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'main page',' mediawiki hasu800 been successfully installed. consult theu800 metau82ewikimediau82eorgu800 wiki help contents user user\'su800 guide foru800 information onu800 using theu800 wiki software. getting started getting started getting started wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual configuration_settings configuration settings list wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual faqu800 mediawiki faqu800 mediawiki release mailing list wwwu800u82emediawikiu82eorgu800 wiki special mylanguage localisation#translation_resources localise mediawiki foru800 your language ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned DEFAULT '0',
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,1,1,0,1,1,0,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_concept_cache`
--

DROP TABLE IF EXISTS `smw_concept_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_concept_cache` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_concept_cache`
--

LOCK TABLES `smw_concept_cache` WRITE;
/*!40000 ALTER TABLE `smw_concept_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_concept_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_blob`
--

DROP TABLE IF EXISTS `smw_di_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_blob` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_blob`
--

LOCK TABLES `smw_di_blob` WRITE;
/*!40000 ALTER TABLE `smw_di_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_blob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_bool`
--

DROP TABLE IF EXISTS `smw_di_bool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_bool` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_value` tinyint(1) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_bool`
--

LOCK TABLES `smw_di_bool` WRITE;
/*!40000 ALTER TABLE `smw_di_bool` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_bool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_coords`
--

DROP TABLE IF EXISTS `smw_di_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_coords` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_lat` double DEFAULT NULL,
  `o_lon` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_serialized`),
  KEY `o_lat` (`o_lat`,`o_lon`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_coords`
--

LOCK TABLES `smw_di_coords` WRITE;
/*!40000 ALTER TABLE `smw_di_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_number`
--

DROP TABLE IF EXISTS `smw_di_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_number` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_number`
--

LOCK TABLES `smw_di_number` WRITE;
/*!40000 ALTER TABLE `smw_di_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_time`
--

DROP TABLE IF EXISTS `smw_di_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_time` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_time`
--

LOCK TABLES `smw_di_time` WRITE;
/*!40000 ALTER TABLE `smw_di_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_uri`
--

DROP TABLE IF EXISTS `smw_di_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_uri` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_uri`
--

LOCK TABLES `smw_di_uri` WRITE;
/*!40000 ALTER TABLE `smw_di_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_wikipage`
--

DROP TABLE IF EXISTS `smw_di_wikipage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_wikipage` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_wikipage`
--

LOCK TABLES `smw_di_wikipage` WRITE;
/*!40000 ALTER TABLE `smw_di_wikipage` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_wikipage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_ask`
--

DROP TABLE IF EXISTS `smw_fpt_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_ask` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_ask`
--

LOCK TABLES `smw_fpt_ask` WRITE;
/*!40000 ALTER TABLE `smw_fpt_ask` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askde`
--

DROP TABLE IF EXISTS `smw_fpt_askde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askde` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askde`
--

LOCK TABLES `smw_fpt_askde` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askde` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askdu`
--

DROP TABLE IF EXISTS `smw_fpt_askdu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askdu` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askdu`
--

LOCK TABLES `smw_fpt_askdu` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askdu` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askdu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askfo`
--

DROP TABLE IF EXISTS `smw_fpt_askfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askfo` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askfo`
--

LOCK TABLES `smw_fpt_askfo` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_asksi`
--

DROP TABLE IF EXISTS `smw_fpt_asksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_asksi` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_asksi`
--

LOCK TABLES `smw_fpt_asksi` WRITE;
/*!40000 ALTER TABLE `smw_fpt_asksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_asksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askst`
--

DROP TABLE IF EXISTS `smw_fpt_askst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askst` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askst`
--

LOCK TABLES `smw_fpt_askst` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askst` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_conc`
--

DROP TABLE IF EXISTS `smw_fpt_conc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_conc` (
  `s_id` int(8) unsigned NOT NULL,
  `concept_txt` mediumblob,
  `concept_docu` mediumblob,
  `concept_features` int(11) DEFAULT NULL,
  `concept_size` int(11) DEFAULT NULL,
  `concept_depth` int(11) DEFAULT NULL,
  `cache_date` int(8) unsigned DEFAULT NULL,
  `cache_count` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_conc`
--

LOCK TABLES `smw_fpt_conc` WRITE;
/*!40000 ALTER TABLE `smw_fpt_conc` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_conc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_conv`
--

DROP TABLE IF EXISTS `smw_fpt_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_conv` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_conv`
--

LOCK TABLES `smw_fpt_conv` WRITE;
/*!40000 ALTER TABLE `smw_fpt_conv` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_conv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_impo`
--

DROP TABLE IF EXISTS `smw_fpt_impo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_impo` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_impo`
--

LOCK TABLES `smw_fpt_impo` WRITE;
/*!40000 ALTER TABLE `smw_fpt_impo` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_impo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_inst`
--

DROP TABLE IF EXISTS `smw_fpt_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_inst` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_inst`
--

LOCK TABLES `smw_fpt_inst` WRITE;
/*!40000 ALTER TABLE `smw_fpt_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_list`
--

DROP TABLE IF EXISTS `smw_fpt_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_list` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_list`
--

LOCK TABLES `smw_fpt_list` WRITE;
/*!40000 ALTER TABLE `smw_fpt_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_mdat`
--

DROP TABLE IF EXISTS `smw_fpt_mdat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_mdat` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_mdat`
--

LOCK TABLES `smw_fpt_mdat` WRITE;
/*!40000 ALTER TABLE `smw_fpt_mdat` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_mdat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_pval`
--

DROP TABLE IF EXISTS `smw_fpt_pval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_pval` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_pval`
--

LOCK TABLES `smw_fpt_pval` WRITE;
/*!40000 ALTER TABLE `smw_fpt_pval` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_pval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_redi`
--

DROP TABLE IF EXISTS `smw_fpt_redi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_redi` (
  `s_title` varbinary(255) NOT NULL,
  `s_namespace` int(11) NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_title` (`s_title`,`s_namespace`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_redi`
--

LOCK TABLES `smw_fpt_redi` WRITE;
/*!40000 ALTER TABLE `smw_fpt_redi` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_redi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_serv`
--

DROP TABLE IF EXISTS `smw_fpt_serv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_serv` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_serv`
--

LOCK TABLES `smw_fpt_serv` WRITE;
/*!40000 ALTER TABLE `smw_fpt_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_serv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_sobj`
--

DROP TABLE IF EXISTS `smw_fpt_sobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_sobj` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_sobj`
--

LOCK TABLES `smw_fpt_sobj` WRITE;
/*!40000 ALTER TABLE `smw_fpt_sobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_sobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_subc`
--

DROP TABLE IF EXISTS `smw_fpt_subc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_subc` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_subc`
--

LOCK TABLES `smw_fpt_subc` WRITE;
/*!40000 ALTER TABLE `smw_fpt_subc` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_subc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_subp`
--

DROP TABLE IF EXISTS `smw_fpt_subp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_subp` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_subp`
--

LOCK TABLES `smw_fpt_subp` WRITE;
/*!40000 ALTER TABLE `smw_fpt_subp` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_subp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_type`
--

DROP TABLE IF EXISTS `smw_fpt_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_type` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_serialized` (`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_type`
--

LOCK TABLES `smw_fpt_type` WRITE;
/*!40000 ALTER TABLE `smw_fpt_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_unit`
--

DROP TABLE IF EXISTS `smw_fpt_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_unit` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_unit`
--

LOCK TABLES `smw_fpt_unit` WRITE;
/*!40000 ALTER TABLE `smw_fpt_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_uri`
--

DROP TABLE IF EXISTS `smw_fpt_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_uri` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_serialized` (`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_uri`
--

LOCK TABLES `smw_fpt_uri` WRITE;
/*!40000 ALTER TABLE `smw_fpt_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_object_ids`
--

DROP TABLE IF EXISTS `smw_object_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_object_ids` (
  `smw_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `smw_namespace` int(11) NOT NULL,
  `smw_title` varbinary(255) NOT NULL,
  `smw_iw` varbinary(32) NOT NULL,
  `smw_subobject` varbinary(255) NOT NULL,
  `smw_sortkey` varbinary(255) NOT NULL,
  `smw_proptable_hash` mediumblob,
  PRIMARY KEY (`smw_id`),
  KEY `smw_id` (`smw_id`,`smw_sortkey`),
  KEY `smw_title` (`smw_title`,`smw_namespace`,`smw_iw`,`smw_subobject`),
  KEY `smw_sortkey` (`smw_sortkey`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_object_ids`
--

LOCK TABLES `smw_object_ids` WRITE;
/*!40000 ALTER TABLE `smw_object_ids` DISABLE KEYS */;
INSERT INTO `smw_object_ids` VALUES (1,102,'_TYPE','','','Has type',NULL),(2,102,'_URI','','','Equivalent URI',NULL),(4,102,'_INST',':smw-intprop','','',NULL),(7,102,'_UNIT','','','Display units',NULL),(8,102,'_IMPO','','','Imported from',NULL),(12,102,'_CONV','','','Corresponds to',NULL),(13,102,'_SERV','','','Provides service',NULL),(14,102,'_PVAL','','','Allows value',NULL),(15,102,'_REDI',':smw-intprop','','',NULL),(17,102,'_SUBP','','','Subproperty of',NULL),(18,102,'_SUBC','','','Subcategory of',NULL),(19,102,'_CONC',':smw-intprop','','',NULL),(22,102,'_ERRP','','','Has improper value for',NULL),(28,102,'_LIST','','','Has fields',NULL),(29,102,'_MDAT','','','Modification date',NULL),(30,102,'_CDAT','','','Creation date',NULL),(31,102,'_NEWP','','','Is a new page',NULL),(32,102,'_LEDT','','','Last editor is',NULL),(33,102,'_ASK','','','Has query',NULL),(34,102,'_ASKST','','','Query string',NULL),(35,102,'_ASKFO','','','Query format',NULL),(36,102,'_ASKSI','','','Query size',NULL),(37,102,'_ASKDE','','','Query depth',NULL),(50,0,'',':smw-border','','',NULL);
/*!40000 ALTER TABLE `smw_object_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_prop_stats`
--

DROP TABLE IF EXISTS `smw_prop_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_prop_stats` (
  `p_id` int(8) unsigned DEFAULT NULL,
  `usage_count` int(8) unsigned DEFAULT NULL,
  UNIQUE KEY `p_id` (`p_id`),
  KEY `usage_count` (`usage_count`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_prop_stats`
--

LOCK TABLES `smw_prop_stats` WRITE;
/*!40000 ALTER TABLE `smw_prop_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_prop_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  UNIQUE KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_namespace`,`tl_title`,`tl_from_namespace`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been successfully installed.</strong>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` binary(14) DEFAULT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('DeleteDefaultMessages',NULL),('account_requests-acr_email-/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-alter-acr_email-index.sql',NULL),('cl_fields_update',NULL),('convert transcache field',NULL),('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('fix protocol-relative URLs in externallinks',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('mime_minor_length',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('populate *_from_namespace',NULL),('populate category',NULL),('populate fa_sha1',NULL),('populate img_sha1',NULL),('populate log_search',NULL),('populate log_usertext',NULL),('populate rev_len and ar_len',NULL),('populate rev_parent_id',NULL),('populate rev_sha1',NULL),('updatelist-1.24.2-1437675878','a:184:{i:0;a:1:{i:0;s:26:\"disableContentHandlerUseDB\";}i:1;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:6:\"ipb_id\";i:3;s:18:\"patch-ipblocks.sql\";}i:2;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:10:\"ipb_expiry\";i:3;s:20:\"patch-ipb_expiry.sql\";}i:3;a:1:{i:0;s:17:\"doInterwikiUpdate\";}i:4;a:1:{i:0;s:13:\"doIndexUpdate\";}i:5;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"hitcounter\";i:2;s:20:\"patch-hitcounter.sql\";}i:6;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:7:\"rc_type\";i:3;s:17:\"patch-rc_type.sql\";}i:7;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:18:\"new_name_timestamp\";i:3;s:21:\"patch-rc-newindex.sql\";}i:8;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_real_name\";i:3;s:23:\"patch-user-realname.sql\";}i:9;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"querycache\";i:2;s:20:\"patch-querycache.sql\";}i:10;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"objectcache\";i:2;s:21:\"patch-objectcache.sql\";}i:11;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"categorylinks\";i:2;s:23:\"patch-categorylinks.sql\";}i:12;a:1:{i:0;s:16:\"doOldLinksUpdate\";}i:13;a:1:{i:0;s:22:\"doFixAncientImagelinks\";}i:14;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:15:\"patch-rc_ip.sql\";}i:15;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:7:\"PRIMARY\";i:3;s:28:\"patch-image_name_primary.sql\";}i:16;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_id\";i:3;s:15:\"patch-rc_id.sql\";}i:17;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_patrolled\";i:3;s:19:\"patch-rc-patrol.sql\";}i:18;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"logging\";i:2;s:17:\"patch-logging.sql\";}i:19;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:10:\"user_token\";i:3;s:20:\"patch-user_token.sql\";}i:20;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:24:\"wl_notificationtimestamp\";i:3;s:28:\"patch-email-notification.sql\";}i:21;a:1:{i:0;s:17:\"doWatchlistUpdate\";}i:22;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:33:\"user_emailauthenticationtimestamp\";i:3;s:30:\"patch-email-authentication.sql\";}i:23;a:1:{i:0;s:21:\"doSchemaRestructuring\";}i:24;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:10:\"log_params\";i:3;s:20:\"patch-log_params.sql\";}i:25;a:4:{i:0;s:8:\"checkBin\";i:1;s:7:\"logging\";i:2;s:9:\"log_title\";i:3;s:23:\"patch-logging-title.sql\";}i:26;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:9:\"ar_rev_id\";i:3;s:24:\"patch-archive-rev_id.sql\";}i:27;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:8:\"page_len\";i:3;s:18:\"patch-page_len.sql\";}i:28;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"revision\";i:2;s:17:\"inverse_timestamp\";i:3;s:27:\"patch-inverse_timestamp.sql\";}i:29;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_text_id\";i:3;s:21:\"patch-rev_text_id.sql\";}i:30;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_deleted\";i:3;s:21:\"patch-rev_deleted.sql\";}i:31;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:9:\"img_width\";i:3;s:19:\"patch-img_width.sql\";}i:32;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:12:\"img_metadata\";i:3;s:22:\"patch-img_metadata.sql\";}i:33;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:16:\"user_email_token\";i:3;s:26:\"patch-user_email_token.sql\";}i:34;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_text_id\";i:3;s:25:\"patch-archive-text_id.sql\";}i:35;a:1:{i:0;s:15:\"doNamespaceSize\";}i:36;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:14:\"img_media_type\";i:3;s:24:\"patch-img_media_type.sql\";}i:37;a:1:{i:0;s:17:\"doPagelinksUpdate\";}i:38;a:4:{i:0;s:9:\"dropField\";i:1;s:5:\"image\";i:2;s:8:\"img_type\";i:3;s:23:\"patch-drop_img_type.sql\";}i:39;a:1:{i:0;s:18:\"doUserUniqueUpdate\";}i:40;a:1:{i:0;s:18:\"doUserGroupsUpdate\";}i:41;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_pages\";i:3;s:27:\"patch-ss_total_articles.sql\";}i:42;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"user_newtalk\";i:2;s:22:\"patch-usernewtalk2.sql\";}i:43;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"transcache\";i:2;s:20:\"patch-transcache.sql\";}i:44;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:8:\"iw_trans\";i:3;s:25:\"patch-interwiki-trans.sql\";}i:45;a:1:{i:0;s:15:\"doWatchlistNull\";}i:46;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:5:\"times\";i:3;s:29:\"patch-logging-times-index.sql\";}i:47;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_range_start\";i:3;s:25:\"patch-ipb_range_start.sql\";}i:48;a:1:{i:0;s:18:\"doPageRandomUpdate\";}i:49;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_registration\";i:3;s:27:\"patch-user_registration.sql\";}i:50;a:1:{i:0;s:21:\"doTemplatelinksUpdate\";}i:51;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"externallinks\";i:2;s:23:\"patch-externallinks.sql\";}i:52;a:3:{i:0;s:8:\"addTable\";i:1;s:3:\"job\";i:2;s:13:\"patch-job.sql\";}i:53;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_images\";i:3;s:19:\"patch-ss_images.sql\";}i:54;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"langlinks\";i:2;s:19:\"patch-langlinks.sql\";}i:55;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"querycache_info\";i:2;s:24:\"patch-querycacheinfo.sql\";}i:56;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"filearchive\";i:2;s:21:\"patch-filearchive.sql\";}i:57;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:13:\"ipb_anon_only\";i:3;s:23:\"patch-ipb_anon_only.sql\";}i:58;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:14:\"rc_ns_usertext\";i:3;s:31:\"patch-recentchanges-utindex.sql\";}i:59;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_user_text\";i:3;s:28:\"patch-rc_user_text-index.sql\";}i:60;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_newpass_time\";i:3;s:27:\"patch-user_newpass_time.sql\";}i:61;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"redirect\";i:2;s:18:\"patch-redirect.sql\";}i:62;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"querycachetwo\";i:2;s:23:\"patch-querycachetwo.sql\";}i:63;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:20:\"ipb_enable_autoblock\";i:3;s:32:\"patch-ipb_optional_autoblock.sql\";}i:64;a:1:{i:0;s:26:\"doBacklinkingIndicesUpdate\";}i:65;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_old_len\";i:3;s:16:\"patch-rc_len.sql\";}i:66;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_editcount\";i:3;s:24:\"patch-user_editcount.sql\";}i:67;a:1:{i:0;s:20:\"doRestrictionsUpdate\";}i:68;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:6:\"log_id\";i:3;s:16:\"patch-log_id.sql\";}i:69;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:13:\"rev_parent_id\";i:3;s:23:\"patch-rev_parent_id.sql\";}i:70;a:4:{i:0;s:8:\"addField\";i:1;s:17:\"page_restrictions\";i:2;s:5:\"pr_id\";i:3;s:35:\"patch-page_restrictions_sortkey.sql\";}i:71;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:7:\"rev_len\";i:3;s:17:\"patch-rev_len.sql\";}i:72;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_deleted\";i:3;s:20:\"patch-rc_deleted.sql\";}i:73;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:11:\"log_deleted\";i:3;s:21:\"patch-log_deleted.sql\";}i:74;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_deleted\";i:3;s:20:\"patch-ar_deleted.sql\";}i:75;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_deleted\";i:3;s:21:\"patch-ipb_deleted.sql\";}i:76;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:10:\"fa_deleted\";i:3;s:20:\"patch-fa_deleted.sql\";}i:77;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:6:\"ar_len\";i:3;s:16:\"patch-ar_len.sql\";}i:78;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_block_email\";i:3;s:22:\"patch-ipb_emailban.sql\";}i:79;a:1:{i:0;s:28:\"doCategorylinksIndicesUpdate\";}i:80;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"oldimage\";i:2;s:11:\"oi_metadata\";i:3;s:21:\"patch-oi_metadata.sql\";}i:81;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:18:\"usertext_timestamp\";i:3;s:28:\"patch-archive-user-index.sql\";}i:82;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:22:\"img_usertext_timestamp\";i:3;s:26:\"patch-image-user-index.sql\";}i:83;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"oldimage\";i:2;s:21:\"oi_usertext_timestamp\";i:3;s:29:\"patch-oldimage-user-index.sql\";}i:84;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_page_id\";i:3;s:25:\"patch-archive-page_id.sql\";}i:85;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:8:\"img_sha1\";i:3;s:18:\"patch-img_sha1.sql\";}i:86;a:3:{i:0;s:8:\"addTable\";i:1;s:16:\"protected_titles\";i:2;s:26:\"patch-protected_titles.sql\";}i:87;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_by_text\";i:3;s:21:\"patch-ipb_by_text.sql\";}i:88;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"page_props\";i:2;s:20:\"patch-page_props.sql\";}i:89;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"updatelog\";i:2;s:19:\"patch-updatelog.sql\";}i:90;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"category\";i:2;s:18:\"patch-category.sql\";}i:91;a:1:{i:0;s:20:\"doCategoryPopulation\";}i:92;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:12:\"ar_parent_id\";i:3;s:22:\"patch-ar_parent_id.sql\";}i:93;a:4:{i:0;s:8:\"addField\";i:1;s:12:\"user_newtalk\";i:2;s:19:\"user_last_timestamp\";i:3;s:29:\"patch-user_last_timestamp.sql\";}i:94;a:1:{i:0;s:18:\"doPopulateParentId\";}i:95;a:4:{i:0;s:8:\"checkBin\";i:1;s:16:\"protected_titles\";i:2;s:8:\"pt_title\";i:3;s:27:\"patch-pt_title-encoding.sql\";}i:96;a:1:{i:0;s:28:\"doMaybeProfilingMemoryUpdate\";}i:97;a:1:{i:0;s:26:\"doFilearchiveIndicesUpdate\";}i:98;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:15:\"ss_active_users\";i:3;s:25:\"patch-ss_active_users.sql\";}i:99;a:1:{i:0;s:17:\"doActiveUsersInit\";}i:100;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:18:\"ipb_allow_usertalk\";i:3;s:28:\"patch-ipb_allow_usertalk.sql\";}i:101;a:1:{i:0;s:14:\"doUniquePlTlIl\";}i:102;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"change_tag\";i:2;s:20:\"patch-change_tag.sql\";}i:103;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"tag_summary\";i:2;s:21:\"patch-tag_summary.sql\";}i:104;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"valid_tag\";i:2;s:19:\"patch-valid_tag.sql\";}i:105;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"user_properties\";i:2;s:25:\"patch-user_properties.sql\";}i:106;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"log_search\";i:2;s:20:\"patch-log_search.sql\";}i:107;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:13:\"log_user_text\";i:3;s:23:\"patch-log_user_text.sql\";}i:108;a:1:{i:0;s:23:\"doLogUsertextPopulation\";}i:109;a:1:{i:0;s:21:\"doLogSearchPopulation\";}i:110;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"l10n_cache\";i:2;s:20:\"patch-l10n_cache.sql\";}i:111;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"log_search\";i:2;s:12:\"ls_field_val\";i:3;s:33:\"patch-log_search-rename-index.sql\";}i:112;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"change_tag\";i:2;s:17:\"change_tag_rc_tag\";i:3;s:28:\"patch-change_tag-indexes.sql\";}i:113;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"redirect\";i:2;s:12:\"rd_interwiki\";i:3;s:22:\"patch-rd_interwiki.sql\";}i:114;a:1:{i:0;s:23:\"doUpdateTranscacheField\";}i:115;a:1:{i:0;s:22:\"doUpdateMimeMinorField\";}i:116;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"iwlinks\";i:2;s:17:\"patch-iwlinks.sql\";}i:117;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_title_from\";i:3;s:27:\"patch-rename-iwl_prefix.sql\";}i:118;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"updatelog\";i:2;s:8:\"ul_value\";i:3;s:18:\"patch-ul_value.sql\";}i:119;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:6:\"iw_api\";i:3;s:27:\"patch-iw_api_and_wikiid.sql\";}i:120;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"iwlinks\";i:2;s:10:\"iwl_prefix\";i:3;s:25:\"patch-kill-iwl_prefix.sql\";}i:121;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:40:\"patch-categorylinks-better-collation.sql\";}i:122;a:1:{i:0;s:16:\"doClFieldsUpdate\";}i:123;a:1:{i:0;s:17:\"doCollationUpdate\";}i:124;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"msg_resource\";i:2;s:22:\"patch-msg_resource.sql\";}i:125;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"module_deps\";i:2;s:21:\"patch-module_deps.sql\";}i:126;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"archive\";i:2;s:13:\"ar_page_revid\";i:3;s:36:\"patch-archive_kill_ar_page_revid.sql\";}i:127;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:8:\"ar_revid\";i:3;s:26:\"patch-archive_ar_revid.sql\";}i:128;a:1:{i:0;s:23:\"doLangLinksLengthUpdate\";}i:129;a:1:{i:0;s:29:\"doUserNewTalkTimestampNotNull\";}i:130;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"user\";i:2;s:10:\"user_email\";i:3;s:26:\"patch-user_email_index.sql\";}i:131;a:4:{i:0;s:11:\"modifyField\";i:1;s:15:\"user_properties\";i:2;s:11:\"up_property\";i:3;s:21:\"patch-up_property.sql\";}i:132;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"uploadstash\";i:2;s:21:\"patch-uploadstash.sql\";}i:133;a:3:{i:0;s:8:\"addTable\";i:1;s:18:\"user_former_groups\";i:2;s:28:\"patch-user_former_groups.sql\";}i:134;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:11:\"type_action\";i:3;s:35:\"patch-logging-type-action-index.sql\";}i:135;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:8:\"rev_sha1\";i:3;s:18:\"patch-rev_sha1.sql\";}i:136;a:1:{i:0;s:20:\"doMigrateUserOptions\";}i:137;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:12:\"user_options\";i:3;s:27:\"patch-drop-user_options.sql\";}i:138;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:7:\"ar_sha1\";i:3;s:17:\"patch-ar_sha1.sql\";}i:139;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"page\";i:2;s:27:\"page_redirect_namespace_len\";i:3;s:37:\"patch-page_redirect_namespace_len.sql\";}i:140;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:12:\"us_chunk_inx\";i:3;s:27:\"patch-uploadstash_chunk.sql\";}i:141;a:4:{i:0;s:8:\"addfield\";i:1;s:3:\"job\";i:2;s:13:\"job_timestamp\";i:3;s:28:\"patch-jobs-add-timestamp.sql\";}i:142;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"revision\";i:2;s:19:\"page_user_timestamp\";i:3;s:34:\"patch-revision-user-page-index.sql\";}i:143;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:29:\"patch-ipb-parent-block-id.sql\";}i:144;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:35:\"patch-ipb-parent-block-id-index.sql\";}i:145;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"category\";i:2;s:10:\"cat_hidden\";i:3;s:20:\"patch-cat_hidden.sql\";}i:146;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:18:\"rev_content_format\";i:3;s:37:\"patch-revision-rev_content_format.sql\";}i:147;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:17:\"rev_content_model\";i:3;s:36:\"patch-revision-rev_content_model.sql\";}i:148;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:17:\"ar_content_format\";i:3;s:35:\"patch-archive-ar_content_format.sql\";}i:149;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:16:\"ar_content_model\";i:3;s:34:\"patch-archive-ar_content_model.sql\";}i:150;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_content_model\";i:3;s:33:\"patch-page-page_content_model.sql\";}i:151;a:1:{i:0;s:25:\"enableContentHandlerUseDB\";}i:152;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_admins\";i:3;s:24:\"patch-drop-ss_admins.sql\";}i:153;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:17:\"rc_moved_to_title\";i:3;s:18:\"patch-rc_moved.sql\";}i:154;a:3:{i:0;s:8:\"addTable\";i:1;s:5:\"sites\";i:2;s:15:\"patch-sites.sql\";}i:155;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:7:\"fa_sha1\";i:3;s:17:\"patch-fa_sha1.sql\";}i:156;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:9:\"job_token\";i:3;s:19:\"patch-job_token.sql\";}i:157;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:12:\"job_attempts\";i:3;s:22:\"patch-job_attempts.sql\";}i:158;a:1:{i:0;s:17:\"doEnableProfiling\";}i:159;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:8:\"us_props\";i:3;s:30:\"patch-uploadstash-us_props.sql\";}i:160;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"user_groups\";i:2;s:8:\"ug_group\";i:3;s:38:\"patch-ug_group-length-increase-255.sql\";}i:161;a:4:{i:0;s:11:\"modifyField\";i:1;s:18:\"user_former_groups\";i:2;s:9:\"ufg_group\";i:3;s:39:\"patch-ufg_group-length-increase-255.sql\";}i:162;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"page_props\";i:2;s:16:\"pp_propname_page\";i:3;s:40:\"patch-page_props-propname-page-index.sql\";}i:163;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:14:\"img_media_mime\";i:3;s:30:\"patch-img_media_mime-index.sql\";}i:164;a:1:{i:0;s:23:\"doIwlinksIndexNonUnique\";}i:165;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_from_title\";i:3;s:34:\"patch-iwlinks-from-title-index.sql\";}i:166;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:5:\"ar_id\";i:3;s:23:\"patch-archive-ar_id.sql\";}i:167;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"externallinks\";i:2;s:5:\"el_id\";i:3;s:29:\"patch-externallinks-el_id.sql\";}i:168;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:9:\"rc_source\";i:3;s:19:\"patch-rc_source.sql\";}i:169;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:23:\"log_user_text_type_time\";i:3;s:43:\"patch-logging_user_text_type_time_index.sql\";}i:170;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:18:\"log_user_text_time\";i:3;s:38:\"patch-logging_user_text_time_index.sql\";}i:171;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_links_updated\";i:3;s:28:\"patch-page_links_updated.sql\";}i:172;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:21:\"user_password_expires\";i:3;s:30:\"patch-user_password_expire.sql\";}i:173;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"page_props\";i:2;s:10:\"pp_sortkey\";i:3;s:20:\"patch-pp_sortkey.sql\";}i:174;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:11:\"rc_cur_time\";i:3;s:26:\"patch-drop-rc_cur_time.sql\";}i:175;a:4:{i:0;s:8:\"addIndex\";i:1;s:9:\"watchlist\";i:2;s:29:\"wl_user_notificationtimestamp\";i:3;s:52:\"patch-watchlist-user-notificationtimestamp-index.sql\";}i:176;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:9:\"page_lang\";i:3;s:19:\"patch-page_lang.sql\";}i:177;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"pagelinks\";i:2;s:17:\"pl_from_namespace\";i:3;s:27:\"patch-pl_from_namespace.sql\";}i:178;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"templatelinks\";i:2;s:17:\"tl_from_namespace\";i:3;s:27:\"patch-tl_from_namespace.sql\";}i:179;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"imagelinks\";i:2;s:17:\"il_from_namespace\";i:3;s:27:\"patch-il_from_namespace.sql\";}i:180;a:4:{i:0;s:11:\"modifyField\";i:1;s:5:\"image\";i:2;s:14:\"img_major_mime\";i:3;s:33:\"patch-img_major_mime-chemical.sql\";}i:181;a:4:{i:0;s:11:\"modifyField\";i:1;s:8:\"oldimage\";i:2;s:13:\"oi_major_mime\";i:3;s:32:\"patch-oi_major_mime-chemical.sql\";}i:182;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"filearchive\";i:2;s:13:\"fa_major_mime\";i:3;s:32:\"patch-fa_major_mime-chemical.sql\";}i:183;a:1:{i:0;s:20:\"SMWStore::setupStore\";}}'),('updatelist-1.24.2-1437675964','a:192:{i:0;a:1:{i:0;s:26:\"disableContentHandlerUseDB\";}i:1;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:6:\"ipb_id\";i:3;s:18:\"patch-ipblocks.sql\";}i:2;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:10:\"ipb_expiry\";i:3;s:20:\"patch-ipb_expiry.sql\";}i:3;a:1:{i:0;s:17:\"doInterwikiUpdate\";}i:4;a:1:{i:0;s:13:\"doIndexUpdate\";}i:5;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"hitcounter\";i:2;s:20:\"patch-hitcounter.sql\";}i:6;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:7:\"rc_type\";i:3;s:17:\"patch-rc_type.sql\";}i:7;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:18:\"new_name_timestamp\";i:3;s:21:\"patch-rc-newindex.sql\";}i:8;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_real_name\";i:3;s:23:\"patch-user-realname.sql\";}i:9;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"querycache\";i:2;s:20:\"patch-querycache.sql\";}i:10;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"objectcache\";i:2;s:21:\"patch-objectcache.sql\";}i:11;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"categorylinks\";i:2;s:23:\"patch-categorylinks.sql\";}i:12;a:1:{i:0;s:16:\"doOldLinksUpdate\";}i:13;a:1:{i:0;s:22:\"doFixAncientImagelinks\";}i:14;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:15:\"patch-rc_ip.sql\";}i:15;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:7:\"PRIMARY\";i:3;s:28:\"patch-image_name_primary.sql\";}i:16;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_id\";i:3;s:15:\"patch-rc_id.sql\";}i:17;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_patrolled\";i:3;s:19:\"patch-rc-patrol.sql\";}i:18;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"logging\";i:2;s:17:\"patch-logging.sql\";}i:19;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:10:\"user_token\";i:3;s:20:\"patch-user_token.sql\";}i:20;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:24:\"wl_notificationtimestamp\";i:3;s:28:\"patch-email-notification.sql\";}i:21;a:1:{i:0;s:17:\"doWatchlistUpdate\";}i:22;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:33:\"user_emailauthenticationtimestamp\";i:3;s:30:\"patch-email-authentication.sql\";}i:23;a:1:{i:0;s:21:\"doSchemaRestructuring\";}i:24;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:10:\"log_params\";i:3;s:20:\"patch-log_params.sql\";}i:25;a:4:{i:0;s:8:\"checkBin\";i:1;s:7:\"logging\";i:2;s:9:\"log_title\";i:3;s:23:\"patch-logging-title.sql\";}i:26;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:9:\"ar_rev_id\";i:3;s:24:\"patch-archive-rev_id.sql\";}i:27;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:8:\"page_len\";i:3;s:18:\"patch-page_len.sql\";}i:28;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"revision\";i:2;s:17:\"inverse_timestamp\";i:3;s:27:\"patch-inverse_timestamp.sql\";}i:29;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_text_id\";i:3;s:21:\"patch-rev_text_id.sql\";}i:30;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_deleted\";i:3;s:21:\"patch-rev_deleted.sql\";}i:31;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:9:\"img_width\";i:3;s:19:\"patch-img_width.sql\";}i:32;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:12:\"img_metadata\";i:3;s:22:\"patch-img_metadata.sql\";}i:33;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:16:\"user_email_token\";i:3;s:26:\"patch-user_email_token.sql\";}i:34;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_text_id\";i:3;s:25:\"patch-archive-text_id.sql\";}i:35;a:1:{i:0;s:15:\"doNamespaceSize\";}i:36;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:14:\"img_media_type\";i:3;s:24:\"patch-img_media_type.sql\";}i:37;a:1:{i:0;s:17:\"doPagelinksUpdate\";}i:38;a:4:{i:0;s:9:\"dropField\";i:1;s:5:\"image\";i:2;s:8:\"img_type\";i:3;s:23:\"patch-drop_img_type.sql\";}i:39;a:1:{i:0;s:18:\"doUserUniqueUpdate\";}i:40;a:1:{i:0;s:18:\"doUserGroupsUpdate\";}i:41;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_pages\";i:3;s:27:\"patch-ss_total_articles.sql\";}i:42;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"user_newtalk\";i:2;s:22:\"patch-usernewtalk2.sql\";}i:43;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"transcache\";i:2;s:20:\"patch-transcache.sql\";}i:44;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:8:\"iw_trans\";i:3;s:25:\"patch-interwiki-trans.sql\";}i:45;a:1:{i:0;s:15:\"doWatchlistNull\";}i:46;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:5:\"times\";i:3;s:29:\"patch-logging-times-index.sql\";}i:47;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_range_start\";i:3;s:25:\"patch-ipb_range_start.sql\";}i:48;a:1:{i:0;s:18:\"doPageRandomUpdate\";}i:49;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_registration\";i:3;s:27:\"patch-user_registration.sql\";}i:50;a:1:{i:0;s:21:\"doTemplatelinksUpdate\";}i:51;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"externallinks\";i:2;s:23:\"patch-externallinks.sql\";}i:52;a:3:{i:0;s:8:\"addTable\";i:1;s:3:\"job\";i:2;s:13:\"patch-job.sql\";}i:53;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_images\";i:3;s:19:\"patch-ss_images.sql\";}i:54;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"langlinks\";i:2;s:19:\"patch-langlinks.sql\";}i:55;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"querycache_info\";i:2;s:24:\"patch-querycacheinfo.sql\";}i:56;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"filearchive\";i:2;s:21:\"patch-filearchive.sql\";}i:57;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:13:\"ipb_anon_only\";i:3;s:23:\"patch-ipb_anon_only.sql\";}i:58;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:14:\"rc_ns_usertext\";i:3;s:31:\"patch-recentchanges-utindex.sql\";}i:59;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_user_text\";i:3;s:28:\"patch-rc_user_text-index.sql\";}i:60;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_newpass_time\";i:3;s:27:\"patch-user_newpass_time.sql\";}i:61;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"redirect\";i:2;s:18:\"patch-redirect.sql\";}i:62;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"querycachetwo\";i:2;s:23:\"patch-querycachetwo.sql\";}i:63;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:20:\"ipb_enable_autoblock\";i:3;s:32:\"patch-ipb_optional_autoblock.sql\";}i:64;a:1:{i:0;s:26:\"doBacklinkingIndicesUpdate\";}i:65;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_old_len\";i:3;s:16:\"patch-rc_len.sql\";}i:66;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_editcount\";i:3;s:24:\"patch-user_editcount.sql\";}i:67;a:1:{i:0;s:20:\"doRestrictionsUpdate\";}i:68;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:6:\"log_id\";i:3;s:16:\"patch-log_id.sql\";}i:69;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:13:\"rev_parent_id\";i:3;s:23:\"patch-rev_parent_id.sql\";}i:70;a:4:{i:0;s:8:\"addField\";i:1;s:17:\"page_restrictions\";i:2;s:5:\"pr_id\";i:3;s:35:\"patch-page_restrictions_sortkey.sql\";}i:71;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:7:\"rev_len\";i:3;s:17:\"patch-rev_len.sql\";}i:72;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_deleted\";i:3;s:20:\"patch-rc_deleted.sql\";}i:73;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:11:\"log_deleted\";i:3;s:21:\"patch-log_deleted.sql\";}i:74;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_deleted\";i:3;s:20:\"patch-ar_deleted.sql\";}i:75;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_deleted\";i:3;s:21:\"patch-ipb_deleted.sql\";}i:76;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:10:\"fa_deleted\";i:3;s:20:\"patch-fa_deleted.sql\";}i:77;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:6:\"ar_len\";i:3;s:16:\"patch-ar_len.sql\";}i:78;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_block_email\";i:3;s:22:\"patch-ipb_emailban.sql\";}i:79;a:1:{i:0;s:28:\"doCategorylinksIndicesUpdate\";}i:80;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"oldimage\";i:2;s:11:\"oi_metadata\";i:3;s:21:\"patch-oi_metadata.sql\";}i:81;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:18:\"usertext_timestamp\";i:3;s:28:\"patch-archive-user-index.sql\";}i:82;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:22:\"img_usertext_timestamp\";i:3;s:26:\"patch-image-user-index.sql\";}i:83;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"oldimage\";i:2;s:21:\"oi_usertext_timestamp\";i:3;s:29:\"patch-oldimage-user-index.sql\";}i:84;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_page_id\";i:3;s:25:\"patch-archive-page_id.sql\";}i:85;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:8:\"img_sha1\";i:3;s:18:\"patch-img_sha1.sql\";}i:86;a:3:{i:0;s:8:\"addTable\";i:1;s:16:\"protected_titles\";i:2;s:26:\"patch-protected_titles.sql\";}i:87;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_by_text\";i:3;s:21:\"patch-ipb_by_text.sql\";}i:88;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"page_props\";i:2;s:20:\"patch-page_props.sql\";}i:89;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"updatelog\";i:2;s:19:\"patch-updatelog.sql\";}i:90;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"category\";i:2;s:18:\"patch-category.sql\";}i:91;a:1:{i:0;s:20:\"doCategoryPopulation\";}i:92;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:12:\"ar_parent_id\";i:3;s:22:\"patch-ar_parent_id.sql\";}i:93;a:4:{i:0;s:8:\"addField\";i:1;s:12:\"user_newtalk\";i:2;s:19:\"user_last_timestamp\";i:3;s:29:\"patch-user_last_timestamp.sql\";}i:94;a:1:{i:0;s:18:\"doPopulateParentId\";}i:95;a:4:{i:0;s:8:\"checkBin\";i:1;s:16:\"protected_titles\";i:2;s:8:\"pt_title\";i:3;s:27:\"patch-pt_title-encoding.sql\";}i:96;a:1:{i:0;s:28:\"doMaybeProfilingMemoryUpdate\";}i:97;a:1:{i:0;s:26:\"doFilearchiveIndicesUpdate\";}i:98;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:15:\"ss_active_users\";i:3;s:25:\"patch-ss_active_users.sql\";}i:99;a:1:{i:0;s:17:\"doActiveUsersInit\";}i:100;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:18:\"ipb_allow_usertalk\";i:3;s:28:\"patch-ipb_allow_usertalk.sql\";}i:101;a:1:{i:0;s:14:\"doUniquePlTlIl\";}i:102;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"change_tag\";i:2;s:20:\"patch-change_tag.sql\";}i:103;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"tag_summary\";i:2;s:21:\"patch-tag_summary.sql\";}i:104;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"valid_tag\";i:2;s:19:\"patch-valid_tag.sql\";}i:105;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"user_properties\";i:2;s:25:\"patch-user_properties.sql\";}i:106;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"log_search\";i:2;s:20:\"patch-log_search.sql\";}i:107;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:13:\"log_user_text\";i:3;s:23:\"patch-log_user_text.sql\";}i:108;a:1:{i:0;s:23:\"doLogUsertextPopulation\";}i:109;a:1:{i:0;s:21:\"doLogSearchPopulation\";}i:110;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"l10n_cache\";i:2;s:20:\"patch-l10n_cache.sql\";}i:111;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"log_search\";i:2;s:12:\"ls_field_val\";i:3;s:33:\"patch-log_search-rename-index.sql\";}i:112;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"change_tag\";i:2;s:17:\"change_tag_rc_tag\";i:3;s:28:\"patch-change_tag-indexes.sql\";}i:113;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"redirect\";i:2;s:12:\"rd_interwiki\";i:3;s:22:\"patch-rd_interwiki.sql\";}i:114;a:1:{i:0;s:23:\"doUpdateTranscacheField\";}i:115;a:1:{i:0;s:22:\"doUpdateMimeMinorField\";}i:116;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"iwlinks\";i:2;s:17:\"patch-iwlinks.sql\";}i:117;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_title_from\";i:3;s:27:\"patch-rename-iwl_prefix.sql\";}i:118;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"updatelog\";i:2;s:8:\"ul_value\";i:3;s:18:\"patch-ul_value.sql\";}i:119;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:6:\"iw_api\";i:3;s:27:\"patch-iw_api_and_wikiid.sql\";}i:120;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"iwlinks\";i:2;s:10:\"iwl_prefix\";i:3;s:25:\"patch-kill-iwl_prefix.sql\";}i:121;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:40:\"patch-categorylinks-better-collation.sql\";}i:122;a:1:{i:0;s:16:\"doClFieldsUpdate\";}i:123;a:1:{i:0;s:17:\"doCollationUpdate\";}i:124;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"msg_resource\";i:2;s:22:\"patch-msg_resource.sql\";}i:125;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"module_deps\";i:2;s:21:\"patch-module_deps.sql\";}i:126;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"archive\";i:2;s:13:\"ar_page_revid\";i:3;s:36:\"patch-archive_kill_ar_page_revid.sql\";}i:127;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:8:\"ar_revid\";i:3;s:26:\"patch-archive_ar_revid.sql\";}i:128;a:1:{i:0;s:23:\"doLangLinksLengthUpdate\";}i:129;a:1:{i:0;s:29:\"doUserNewTalkTimestampNotNull\";}i:130;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"user\";i:2;s:10:\"user_email\";i:3;s:26:\"patch-user_email_index.sql\";}i:131;a:4:{i:0;s:11:\"modifyField\";i:1;s:15:\"user_properties\";i:2;s:11:\"up_property\";i:3;s:21:\"patch-up_property.sql\";}i:132;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"uploadstash\";i:2;s:21:\"patch-uploadstash.sql\";}i:133;a:3:{i:0;s:8:\"addTable\";i:1;s:18:\"user_former_groups\";i:2;s:28:\"patch-user_former_groups.sql\";}i:134;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:11:\"type_action\";i:3;s:35:\"patch-logging-type-action-index.sql\";}i:135;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:8:\"rev_sha1\";i:3;s:18:\"patch-rev_sha1.sql\";}i:136;a:1:{i:0;s:20:\"doMigrateUserOptions\";}i:137;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:12:\"user_options\";i:3;s:27:\"patch-drop-user_options.sql\";}i:138;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:7:\"ar_sha1\";i:3;s:17:\"patch-ar_sha1.sql\";}i:139;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"page\";i:2;s:27:\"page_redirect_namespace_len\";i:3;s:37:\"patch-page_redirect_namespace_len.sql\";}i:140;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:12:\"us_chunk_inx\";i:3;s:27:\"patch-uploadstash_chunk.sql\";}i:141;a:4:{i:0;s:8:\"addfield\";i:1;s:3:\"job\";i:2;s:13:\"job_timestamp\";i:3;s:28:\"patch-jobs-add-timestamp.sql\";}i:142;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"revision\";i:2;s:19:\"page_user_timestamp\";i:3;s:34:\"patch-revision-user-page-index.sql\";}i:143;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:29:\"patch-ipb-parent-block-id.sql\";}i:144;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:35:\"patch-ipb-parent-block-id-index.sql\";}i:145;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"category\";i:2;s:10:\"cat_hidden\";i:3;s:20:\"patch-cat_hidden.sql\";}i:146;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:18:\"rev_content_format\";i:3;s:37:\"patch-revision-rev_content_format.sql\";}i:147;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:17:\"rev_content_model\";i:3;s:36:\"patch-revision-rev_content_model.sql\";}i:148;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:17:\"ar_content_format\";i:3;s:35:\"patch-archive-ar_content_format.sql\";}i:149;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:16:\"ar_content_model\";i:3;s:34:\"patch-archive-ar_content_model.sql\";}i:150;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_content_model\";i:3;s:33:\"patch-page-page_content_model.sql\";}i:151;a:1:{i:0;s:25:\"enableContentHandlerUseDB\";}i:152;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_admins\";i:3;s:24:\"patch-drop-ss_admins.sql\";}i:153;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:17:\"rc_moved_to_title\";i:3;s:18:\"patch-rc_moved.sql\";}i:154;a:3:{i:0;s:8:\"addTable\";i:1;s:5:\"sites\";i:2;s:15:\"patch-sites.sql\";}i:155;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:7:\"fa_sha1\";i:3;s:17:\"patch-fa_sha1.sql\";}i:156;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:9:\"job_token\";i:3;s:19:\"patch-job_token.sql\";}i:157;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:12:\"job_attempts\";i:3;s:22:\"patch-job_attempts.sql\";}i:158;a:1:{i:0;s:17:\"doEnableProfiling\";}i:159;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:8:\"us_props\";i:3;s:30:\"patch-uploadstash-us_props.sql\";}i:160;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"user_groups\";i:2;s:8:\"ug_group\";i:3;s:38:\"patch-ug_group-length-increase-255.sql\";}i:161;a:4:{i:0;s:11:\"modifyField\";i:1;s:18:\"user_former_groups\";i:2;s:9:\"ufg_group\";i:3;s:39:\"patch-ufg_group-length-increase-255.sql\";}i:162;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"page_props\";i:2;s:16:\"pp_propname_page\";i:3;s:40:\"patch-page_props-propname-page-index.sql\";}i:163;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:14:\"img_media_mime\";i:3;s:30:\"patch-img_media_mime-index.sql\";}i:164;a:1:{i:0;s:23:\"doIwlinksIndexNonUnique\";}i:165;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_from_title\";i:3;s:34:\"patch-iwlinks-from-title-index.sql\";}i:166;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:5:\"ar_id\";i:3;s:23:\"patch-archive-ar_id.sql\";}i:167;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"externallinks\";i:2;s:5:\"el_id\";i:3;s:29:\"patch-externallinks-el_id.sql\";}i:168;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:9:\"rc_source\";i:3;s:19:\"patch-rc_source.sql\";}i:169;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:23:\"log_user_text_type_time\";i:3;s:43:\"patch-logging_user_text_type_time_index.sql\";}i:170;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:18:\"log_user_text_time\";i:3;s:38:\"patch-logging_user_text_time_index.sql\";}i:171;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_links_updated\";i:3;s:28:\"patch-page_links_updated.sql\";}i:172;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:21:\"user_password_expires\";i:3;s:30:\"patch-user_password_expire.sql\";}i:173;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"page_props\";i:2;s:10:\"pp_sortkey\";i:3;s:20:\"patch-pp_sortkey.sql\";}i:174;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:11:\"rc_cur_time\";i:3;s:26:\"patch-drop-rc_cur_time.sql\";}i:175;a:4:{i:0;s:8:\"addIndex\";i:1;s:9:\"watchlist\";i:2;s:29:\"wl_user_notificationtimestamp\";i:3;s:52:\"patch-watchlist-user-notificationtimestamp-index.sql\";}i:176;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:9:\"page_lang\";i:3;s:19:\"patch-page_lang.sql\";}i:177;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"pagelinks\";i:2;s:17:\"pl_from_namespace\";i:3;s:27:\"patch-pl_from_namespace.sql\";}i:178;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"templatelinks\";i:2;s:17:\"tl_from_namespace\";i:3;s:27:\"patch-tl_from_namespace.sql\";}i:179;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"imagelinks\";i:2;s:17:\"il_from_namespace\";i:3;s:27:\"patch-il_from_namespace.sql\";}i:180;a:4:{i:0;s:11:\"modifyField\";i:1;s:5:\"image\";i:2;s:14:\"img_major_mime\";i:3;s:33:\"patch-img_major_mime-chemical.sql\";}i:181;a:4:{i:0;s:11:\"modifyField\";i:1;s:8:\"oldimage\";i:2;s:13:\"oi_major_mime\";i:3;s:32:\"patch-oi_major_mime-chemical.sql\";}i:182;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"filearchive\";i:2;s:13:\"fa_major_mime\";i:3;s:32:\"patch-fa_major_mime-chemical.sql\";}i:183;a:4:{i:0;s:8:\"addTable\";i:1;s:16:\"account_requests\";i:2;s:120:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/ConfirmAccount.sql\";i:3;b:1;}i:184;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"account_requests\";i:2;s:12:\"acr_filename\";i:3;s:124:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-acr_filename.sql\";i:4;b:1;}i:185;a:4:{i:0;s:8:\"addTable\";i:1;s:19:\"account_credentials\";i:2;s:131:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-account_credentials.sql\";i:3;b:1;}i:186;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"account_requests\";i:2;s:9:\"acr_areas\";i:3;s:121:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-acr_areas.sql\";i:4;b:1;}i:187;a:5:{i:0;s:11:\"modifyField\";i:1;s:16:\"account_requests\";i:2;s:9:\"acr_email\";i:3;s:133:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-alter-acr_email-index.sql\";i:4;b:1;}i:188;a:5:{i:0;s:8:\"addIndex\";i:1;s:16:\"account_requests\";i:2;s:9:\"acr_email\";i:3;s:123:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-email-index.sql\";i:4;b:1;}i:189;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"account_requests\";i:2;s:9:\"acr_agent\";i:3;s:121:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-acr_agent.sql\";i:4;b:1;}i:190;a:5:{i:0;s:9:\"dropIndex\";i:1;s:16:\"account_requests\";i:2;s:15:\"acr_deleted_reg\";i:3;s:138:\"/xa/metanet/services/mediawiki/pub/mediawiki-1.24.2-en/extensions/ConfirmAccount/backend/schema/mysql/patch-drop-acr_deleted_reg-index.sql\";i:4;b:1;}i:191;a:1:{i:0;s:20:\"SMWStore::setupStore\";}}'),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mnadmin','',':pbkdf2:sha256:10000:128:ZWPNAxJDLRuy5Gm00atnsA==:FM95kcziWY2lBa9RPMsOn9pAdU73kMqu7sRMlAKHtAdQ3uz+UzKjSQm5xK3TGajgDfpDndkuctp30vHu5OSWLhfIgWbqkfe3VR+ThO9fCwibUwajUB8U72ceJs/upy8oe3+ASvZcMuMy9kI/pLZ8uUKNnZClIn/dBcCj6BWK+tU=','',NULL,'','20150723182349','385b4c36f3433aa6cb325bb78fdbe92a',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20150723182344',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat'),(1,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-23 11:26:05
