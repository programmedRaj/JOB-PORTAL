-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES ('SK001','Web Development','Development'),('SK002','Data Science','Development'),('SK003','Mobile Apps','Development'),('SK004','Programming Languages','Development'),('SK005','Game Development','Development'),('SK006','Databases','Development'),('SK007','Software Engineering ','Development'),('SK008','Software Testing','Development'),('SK009','Development Tools','Development'),('SK010','E-commerce','Development'),('SK011','Finance','Business'),('SK012','Entrepreneurship','Business'),('SK013','Communications','Business'),('SK014','Manageement','Business'),('SK015','Sales','Business'),('SK016','Strategy','Business'),('SK017','Operations','Business'),('SK018','Project Management','Business'),('SK019','Business Law','Business'),('SK020','Data & Analytics','Business'),('SK021','Home Business','Business'),('SK022','Human Resources','Business'),('SK023','Industry','Business'),('SK024','Media','Business'),('SK025','Real Estate','Business'),('SK026','QuickBooks Online','Business'),('SK027','PowerPoint','Business'),('SK028','Grant Writing','Business'),('SK029','Freelance Writing','Business'),('SK030','Procurement','Business'),('SK031','Supply Chain','Business'),('SK032','Stock Trading','Business'),('SK033','Investing','Business'),('SK034','Options Trading','Business'),('SK035','Accounting & Bookkeeping','Finance & Accounting'),('SK036','Compliance','Finance & Accounting'),('SK037','Cryptocurrency & Blockchain','Finance & Accounting'),('SK038','Economics','Finance & Accounting'),('SK039','Finance','Finance & Accounting'),('SK040','Finance Cert & Exam Prep','Finance & Accounting'),('SK041','Financial Modeling & Analysis','Finance & Accounting'),('SK042','Investing & Trading ','Finance & Accounting'),('SK043','Money Management Tools','Finance & Accounting'),('SK044','Taxes','Finance & Accounting'),('SK045','IT Certification ','It & Software'),('SK046','Network & Security','It & Software'),('SK047','Hardware','It & Software'),('SK048','Operating Systems','It & Software'),('SK049','Docker','It & Software'),('SK050','DevOps','It & Software'),('SK051','Kubernetes','It & Software'),('SK052','Python','It & Software'),('SK053','Ansible','It & Software'),('SK054','AWS Certification','It & Software'),('SK055','AWS Certified Solutions Architect - Professional','It & Software'),('SK056','Microsoft Azure','It & Software'),('SK057','Algorithms','It & Software'),('SK058','QuickBooks Pro','Office Productivity'),('SK059','Construction','Office Productivity'),('SK060','AutoCAD','Office Productivity'),('SK061','ServiceNow','Office Productivity'),('SK062','Touch Typing','Office Productivity'),('SK063','QuickBooks','Office Productivity'),('SK064','Typing','Office Productivity'),('SK065','Salesforce','Office Productivity'),('SK066','Video Conferencing','Office Productivity'),('SK067','Personal Transformation','Personal Development'),('SK068','Productivity','Personal Development'),('SK069','Leadership','Personal Development'),('SK070','Personal Finance','Personal Development'),('SK071','Career Development','Personal Development'),('SK072','Parenting & Relationships','Personal Development'),('SK073','Happiness','Personal Development'),('SK074','Religion & Spirituality','Personal Development'),('SK075','Personal Brand Building','Personal Development'),('SK076','Creativity','Personal Development'),('SK077','Influence','Personal Development'),('SK078','Self Esteem','Personal Development'),('SK079','Stress Mangement','Personal Development'),('SK080','Memory & Study Skills','Personal Development'),('SK081','Motivation','Personal Development'),('SK082','Tantra','Personal Development'),('SK083','Freight Broker','Personal Development'),('SK084','American Accent','Personal Development'),('SK085','English Pronunciation','Personal Development'),('SK086','Fibonacci Trading','Personal Development'),('SK087','Handwriting Analysis','Personal Development'),('SK088','French Language','Personal Development'),('SK089','Voice-Over','Personal Development'),('SK090','Public Speaking','Personal Development'),('SK091','Web Design','Design'),('SK092','Graphic Design','Design'),('SK093','Design Tools','Design'),('SK094','User Experience','Design'),('SK095','Game Design','Design'),('SK096','Design Thinking','Design'),('SK097','3D & Animation ','Design'),('SK098','Fashion ','Design'),('SK099','Architectural Design','Design'),('SK100','Interior Design','Design'),('SK101','Character Animation','Design'),('SK102','Character Design','Design'),('SK103','Drawing','Design'),('SK104','Comic Book Creation','Design'),('SK105','Digital Painting','Design'),('SK106','Circuit Design','Design'),('SK107','Electronics','Design'),('SK108','Portraiture','Design'),('SK109','Pencil Drawing','Design'),('SK110','Digital Marketing','Marketing'),('SK111','Search Engine Optimization ','Marketing'),('SK112','Social Media Marketing','Marketing'),('SK113','Branding','Marketing'),('SK114','Marketing Fundamentals','Marketing'),('SK115','Analytics & Automation','Marketing'),('SK116','Public Relations','Marketing'),('SK117','Advertising','Marketing'),('SK118','Video & Mobile Marketing','Marketing'),('SK119','Content Marketing','Marketing'),('SK120','Growth Hacking ','Marketing'),('SK121','Affiliate Marketing ','Marketing'),('SK122','Product Marketing','Marketing'),('SK123','Copywriting','Marketing'),('SK124','Google Ads (AdWords) Certification','Marketing'),('SK125','YouTube Audience Growth','Marketing'),('SK126','Event Planning','Marketing'),('SK127','Conversion Rate Optimization','Marketing'),('SK128','Marketing Strategy','Marketing'),('SK129','Social Media Marketing','Marketing'),('SK130','Fundraising','Marketing'),('SK131','PowerPoint','Marketing'),('SK132','Arts & Crafts','Lifestyle'),('SK133','Food & Beverage','Lifestyle'),('SK134','Beauty & Makeup','Lifestyle'),('SK135','Travel','Lifestyle'),('SK136','Gaming','Lifestyle'),('SK137','Home Improvement','Lifestyle'),('SK138','Pet Care & Training','Lifestyle'),('SK139','Neuro-Linguistic Programming','Lifestyle'),('SK140','EFT','Lifestyle'),('SK141','Day Trading','Lifestyle'),('SK142','Emotional Intelligence','Lifestyle'),('SK143','Meditation','Lifestyle'),('SK144','Permaculture','Lifestyle'),('SK145','Mindfulness','Lifestyle'),('SK146','Herbalism','Lifestyle'),('SK147','REBT','Lifestyle'),('SK148','Digital Photography','Photography'),('SK149','Photography Fundamwntals','Photography'),('SK150','Portraits','Photography'),('SK151','Photography Tools','Photography'),('SK152','Commercial Photography','Photography'),('SK153','Video Design','Photography'),('SK154','Photography','Photography'),('SK155','Landscape Photography','Photography'),('SK156','Drone Photography','Photography'),('SK157','Nature Photography','Photography'),('SK158','Color Grading','Photography'),('SK159','Adobe Lightroom','Photography'),('SK160','Aerial Videography','Photography'),('SK161','Photoshop','Photography'),('SK162','Drone','Photography'),('SK163','Fitness','Health & Fitness'),('SK164','General Health','Health & Fitness'),('SK165','Sports','Health & Fitness'),('SK166','Nutrition','Health & Fitness'),('SK167','Yoga','Health & Fitness'),('SK168','Mental Health','Health & Fitness'),('SK169','Dieting','Health & Fitness'),('SK170','Self Defense','Health & Fitness'),('SK171','Safety & First Aid','Health & Fitness'),('SK172','Dance','Health & Fitness'),('SK173','Meditation','Health & Fitness'),('SK174','Qi Gong','Health & Fitness'),('SK175','Massage','Health & Fitness'),('SK176','Sports Massage','Health & Fitness'),('SK177','EFT','Health & Fitness'),('SK178','Crystal Energy','Health & Fitness'),('SK179','Facial Massage','Health & Fitness'),('SK180','Reiki','Health & Fitness'),('SK181','Aromatherapy','Health & Fitness'),('SK182','Hypnotherapy','Health & Fitness'),('SK183','Instruments','Music'),('SK184','Production','Music'),('SK185','Music Fundamentals','Music'),('SK186','Vocal','Music'),('SK187','Music Techniques','Music'),('SK188','Music Software','Music'),('SK189','DJ','Music'),('SK190','Songwriting','Music'),('SK191','Music Marketing','Music'),('SK192','Music Business','Music'),('SK193','Sound Therapy','Music'),('SK194','Lyric Writing','Music'),('SK195','Rapping','Music'),('SK196','Talent Agent','Music'),('SK197','Music Production','Music'),('SK198','Engineering','Teaching & Academics'),('SK199','Humanities','Teaching & Academics'),('SK200','Math','Teaching & Academics'),('SK201','Science','Teaching & Academics'),('SK202','Online Education','Teaching & Academics'),('SK203','Social Science','Teaching & Academics'),('SK204','Language','Teaching & Academics'),('SK205','Teacher Training','Teaching & Academics'),('SK206','Test Prep','Teaching & Academics'),('SK207','Research Methods','Teaching & Academics'),('SK208','Early Childhood Education','Teaching & Academics'),('SK209','Aquaculture','Teaching & Academics'),('SK210','Beauty','Teaching & Academics'),('SK211','Tattoo Art','Teaching & Academics'),('SK212','Montessori','Teaching & Academics'),('SK213','Academic Writing','Teaching & Academics'),('SK214','Data Analysis','Teaching & Academics'),('SK215','SPSS','Teaching & Academics');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 16:58:55