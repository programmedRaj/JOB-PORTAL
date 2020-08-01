-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2020 at 02:28 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `create_time`) VALUES
('r@g.xom', 'pbkdf2:sha256:150000$UwlNvIAJ$3255af8ca3b183465264bf4989ca88c11fdb4836be6a27945451ca8c193f7477', '2020-07-05 10:45:01'),
('raj', 'pbkdf2:sha256:150000$XkkRQret$a96c62be8ac4ef4d114a1e903753c4912edd9d1c93bde3cc4fb0c5b3fcd92113', '2020-07-22 08:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `category` varchar(100) NOT NULL,
  `skills_taught` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `posted_by` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `title`, `description`, `category`, `skills_taught`, `level`, `price`, `url`, `posted_by`) VALUES
(1, 'The Web Developer Bootcamp', 'Description', 'Development', 'web development - HTML, CSS, JS, Node, and More', 'Beginner', 455, 'https://www.udemy.com/course/the-web-developer-bootcamp/', 'raj'),
(2, 'Deep Learning A-Z™: Hands-On Artificial Neural Networks', 'Description', 'Development', 'Deep learning', 'Beginner', 455, 'https://www.udemy.com/course/deeplearning/', 'raj'),
(3, 'The Complete React Native + Hooks Course [2020 Edition]', 'Description', 'Development', 'Redux Framework', 'Beginner', 455, 'https://www.udemy.com/course/the-complete-react-native-and-redux-course/', 'raj'),
(4, 'Learn Python Programming Masterclass', 'Description', 'Development', 'Programming  Languages', 'Intermediate', 455, 'https://www.udemy.com/course/python-the-complete-python-developer-course/', 'vikas'),
(5, 'Complete C# Unity Developer 2D: Learn to Code Making Games', 'Description', 'Development', 'Game Development Fundamentals', 'Intermediate', 455, 'https://www.udemy.com/course/unitycourse/', 'chinmay'),
(6, 'The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert', 'Description', 'Development', 'MySQL', 'Beginner', 455, 'https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/', 'chinmay'),
(7, 'Selenium WebDriver with Java -Basics to Advanced+Frameworks', 'Description', 'Development', 'Software Testing', 'Beginner', 455, 'https://www.udemy.com/course/selenium-real-time-examplesinterview-questions/', 'raj'),
(8, 'Scrum Certification Prep +Scrum Master+ Agile Scrum Training', 'Description', 'Development', 'Agile', 'Intermediate', 455, 'https://www.udemy.com/course/scrum-certification/', 'chinmay'),
(9, 'Docker Mastery: with Kubernetes +Swarm from a Docker Captain', 'Description', 'Development', 'Docker', 'Intermediate', 455, 'https://www.udemy.com/course/docker-mastery/', NULL),
(10, 'Shopify Power: Build An Ecommerce Website Using Shopify', 'Description', 'Development', 'Shopify', 'Beginner', 481, 'https://www.udemy.com/course/shopify-power/', NULL),
(11, 'An Entire MBA in 1 Course:Award Winning Business School Prof', 'Description', 'Business', 'Business Fundamentals', 'Intermediate', 415, 'https://www.udemy.com/course/an-entire-mba-in-1-courseaward-winning-business-school-prof/', NULL),
(12, 'The Complete Financial Analyst Course 2020', 'Description', 'Business', 'Financial Analysis', 'Beginner', 455, 'https://www.udemy.com/course/the-complete-financial-analyst-course/', NULL),
(13, 'Writing With Flair: How To Become An Exceptional Writer', 'Description', 'Business', 'Writing ', 'Advanced', 455, 'https://www.udemy.com/course/writing-with-flair-how-to-become-an-exceptional-writer/', NULL),
(14, 'Become a Product Manager | Learn the Skills & Get the Job', 'Description', 'Business', 'Product Management', 'Advanced', 455, 'https://www.udemy.com/course/become-a-product-manager-learn-the-skills-get-a-job/', NULL),
(15, 'Sales Training: Practical Sales Techniques', 'Description', 'Business', 'Sales skills', 'Advanced', 455, 'https://www.udemy.com/course/master-successful-selling/', NULL),
(16, 'The Complete Digital Marketing Guide - 18 Courses in 1', 'Description', 'Business', 'Digital Marketing', 'Advanced', 455, 'https://www.udemy.com/course/digital-marketing-guide/', NULL),
(17, 'UiPath - Level 1 Robotic Process Automation', 'Description', 'Business', 'Robotic Process Automation', 'Beginner', 488, 'https://www.udemy.com/course/uipath-robotic-process-automation/', NULL),
(18, 'PMP Exam Prep Seminar - PMBOK Guide 6', 'Description', 'Business', 'PMBOK', 'Advanced', 455, 'https://www.udemy.com/course/pmp-pmbok6-35-pdus/', NULL),
(19, 'Intro to Business Law for Entrepreneurs ', 'Description', 'Business', 'Business Law', 'Advanced', 481, 'https://www.udemy.com/course/introduction-to-business-law-for-entrepreneurs-mba-business-school/', NULL),
(20, 'The Ultimate Hands-On Hadoop - Tame your Big Data!', 'Description', 'Business', 'Big Data', 'Advanced', 455, 'https://www.udemy.com/course/the-ultimate-hands-on-hadoop-tame-your-big-data/', NULL),
(21, 'How to Start an Amazon FBA Store on a Tight Budget', 'Description', 'Business', 'Amazo FBA', 'Advanced', 455, 'https://www.udemy.com/course/sell-on-amazon-as-small-start-up/', NULL),
(22, 'Administrative Human Resources (HR) for Beginners', 'Description', 'Business', 'Human Resources', 'Beginner', 455, 'https://www.udemy.com/course/administrative-human-resources-for-beginners/', NULL),
(23, 'Professional Life Coaching Certification PCELC Life Coach', 'Description', 'Business', 'Life Coach Training', 'Advanced', 455, 'https://www.udemy.com/course/professional-life-coach-certification/', NULL),
(24, 'Scrivener |Full Course on How to Write a Book in Scrivener 2', 'Description', 'Business', 'Scrivener', 'Advanced', 455, 'https://www.udemy.com/course/scrivener-everything-you-need-to-know-from-idea-to-launch/', NULL),
(25, 'Fundamentals of Analyzing Real Estate Investments', 'Description', 'Business', 'Real Estate Investing', 'Advanced', 455, 'https://www.udemy.com/course/real-estate-investment-analysis/', NULL),
(26, 'The Complete Financial Analyst Course 2020', 'Description', 'Finance & Accounting Courses', 'Financial Analysis', 'Advanced', 455, 'https://www.udemy.com/course/the-complete-financial-analyst-course/', NULL),
(27, 'Introduction to Finance, Accounting, Modeling and Valuation', 'Description', 'Finance & Accounting Courses', 'Accounting', 'Advanced', 455, 'https://www.udemy.com/course/introduction-to-accounting-finance-modeling-valuation-by-chris-haroun/', NULL),
(28, 'PCI (Payment Card) Standards for Corporate Professionals', 'Description', 'Finance & Accounting Courses', 'PCI DSS', 'Advanced', 455, 'https://www.udemy.com/course/pci-payment-card-standards-for-corporate-professionals/', NULL),
(29, 'Blockchain and Bitcoin Fundamentals', 'Description', 'Finance & Accounting Courses', 'Bitcoin', 'Beginner', 455, 'https://www.udemy.com/course/blockchain-and-bitcoin-fundamentals/', NULL),
(30, '(17) Economics courses (35 hrs) incl. Indian & US Economies', 'Description', 'Finance & Accounting Courses', 'Economics', 'Intermediate', 455, 'https://www.udemy.com/course/egg-timer-economics/', NULL),
(31, 'The Complete Investment Banking Course 2020', 'Description', 'Finance & Accounting Courses', 'Investment Banking', 'Intermediate', 455, 'https://www.udemy.com/course/the-complete-investment-banking-course-2016/', NULL),
(32, 'AWS Certified Solutions Architect - Associate 2020', 'Description', 'IT & Software', 'AWS Certification ', 'Beginner', 455, 'https://www.udemy.com/course/aws-certified-solutions-architect-associate/', NULL),
(33, 'The Complete Ethical Hacking Course: Beginner to Advanced!', 'Description', 'IT & Software', 'Ethical Hacking', 'Intermediate', 455, 'https://www.udemy.com/course/penetration-testing/', NULL),
(34, 'PLC Programming From Scratch (PLC I)', 'Description', 'IT & Software', 'PLC', 'Beginner', 455, 'https://www.udemy.com/course/plc-programming-from-scratch/', NULL),
(35, 'Learn Linux in 5 Days and Level Up Your Career', 'Description', 'IT & Software', 'Linux', 'Intermediate', 455, 'https://www.udemy.com/course/learn-linux-in-5-days/', NULL),
(36, 'Microsoft Excel - Excel from Beginner to Advanced', 'Description', 'Office Productivity', 'Excel', 'Beginner', 455, 'https://www.udemy.com/course/microsoft-excel-2013-from-beginner-to-advanced-and-beyond/', NULL),
(37, 'The Complete iMovie Course - from Beginner to Advanced 2020', 'Description', 'Office Productivity', 'iMovie', 'Beginner', 455, 'https://www.udemy.com/course/the-complete-imovie-course/', NULL),
(38, 'Google Cloud Productivity - Drive and Google\'s Office Suite', 'Description', 'Office Productivity', 'Google Apps', 'Beginner', 455, 'https://www.udemy.com/course/google-office-productivity/', NULL),
(39, 'SAP ABAP Programming For Beginners - Online Training', 'Description', 'Office Productivity', 'SAP ABAP', 'Intermediate', 455, 'https://www.udemy.com/course/sap-abap-programming-for-beginners/', NULL),
(40, 'Oracle PL/SQL Fundamentals vol. I & II', 'Description', 'Office Productivity', 'PPI/SQL', 'Intermediate', 455, 'https://www.udemy.com/course/oracle-plsql-fundamentals-vol-i-ii/', NULL),
(41, 'Reiki Level I, II and Master/Teacher Program', 'Description', 'Personal Development', 'Reiki', 'Intermediate', 455, 'https://www.udemy.com/course/reikicourse/', NULL),
(42, 'Become a SpeedDemon: Productivity Tricks to Have More Time', 'Description', 'Personal Development', 'Personal Productivity', 'Beginner', 455, 'https://www.udemy.com/course/become-a-speeddemon-hack-automation-focus-efficiency-to-have-more-time/', NULL),
(43, 'Management Skills: New Manager Training in Essential Skills', 'Description', 'Personal Development', 'Mangement skilla', 'Intermediate', 455, 'https://www.udemy.com/course/the-new-manager-managing-people-teams-processes/', NULL),
(44, 'Investing In Stocks The Complete Course! (11 Hour)', 'Description', 'Personal Development', 'Stock Trading ', 'Intermediate', 455, 'https://www.udemy.com/course/investing-in-stocks/', NULL),
(45, '[2020] Career Hacking™: Resume, LinkedIn, Interviewing +More', 'Description', 'Personal Development', 'Interviewing skills', 'Beginner', 455, 'https://www.udemy.com/course/golden-gate-bridge/', NULL),
(46, 'Neuroscience for parents: How to raise amazing kids', 'Description', 'Personal Development', 'Neuroscience', 'Beginner', 455, 'https://www.udemy.com/course/neuroscience-and-parenting/', NULL),
(47, 'Happiness Life Coach Certification (Accredited)', 'Description', 'Personal Development', 'Life Coach Training', 'Beginner', 455, 'https://www.udemy.com/course/happiness-life-coach-certification/', NULL),
(48, 'Mindfulness Practitioner Course (Level I, II, III & Master)', 'Description', 'Personal Development', 'Mindfulness', 'Beginner', 455, 'https://www.udemy.com/course/mindfulness-training-course-online-mindfulness-practitioner/', NULL),
(49, 'Personal Branding Mastery: The System To Reinvent Yourself!', 'Description', 'Personal Development', 'Personal Branding ', 'Intermediate', 611, 'https://www.udemy.com/course/personal-branding-mastery/', NULL),
(50, 'Arts Therapy - Arts Therapy For Self Healing (Part One)', 'Description', 'Personal Development', 'Art  Therapy', 'Beginner', 507, 'https://www.udemy.com/course/art-therapy-for-everyone/', NULL),
(51, 'Body Language for Entrepreneurs', 'Description', 'Personal Development', 'Body Language', 'Beginner', 455, 'https://www.udemy.com/course/body-language-for-entrepreneurs/', NULL),
(52, 'Double Your Confidence & Self Esteem - Complete Blueprint', 'Description', 'Personal Development', 'Confidence', 'Beginner', 455, 'https://www.udemy.com/course/double-your-confidence-self-esteem/', NULL),
(53, 'Emotional Intelligence: Master Anxiety, Fear, & Emotions', 'Description', 'Personal Development', 'Emotional  Intelligence', 'Beginner', 455, 'https://www.udemy.com/course/master-your-emotions-uncertainty-stress-anxiety-and-fear/', NULL),
(54, 'Become a SuperLearner® 2: Learn Speed Reading & Boost Memory', 'Description', 'Personal Development', 'Speed Reading ', 'Intermediate', 455, 'https://www.udemy.com/course/become-a-superlearner-2-speed-reading-memory-accelerated-learning/', NULL),
(55, 'Neuroplasticity: How To Rewire Your Brain', 'Description', 'Personal Development', 'Neuroplasticity', 'Intermediate', 494, 'https://www.udemy.com/course/neuroplasticity/', NULL),
(56, 'Wordpress for Beginners - Master Wordpress Quickly', 'Description', 'Design', 'WordPress', 'Beginner', 455, 'https://www.udemy.com/course/wordpress-for-beginners-course/', NULL),
(57, 'The Ultimate Drawing Course - Beginner to Advanced', 'Description', 'Design', 'Drawing', 'Beginner', 455, 'https://www.udemy.com/course/the-ultimate-drawing-course-beginner-to-advanced/', NULL),
(58, 'Drawing and Painting on the iPad with Procreate', 'Description', 'Design', 'Digital art ', 'Intermediate', 455, 'https://www.udemy.com/course/drawing-and-painting-on-the-ipad-with-procreate/', NULL),
(59, 'UX & Web Design Master Course: Strategy, Design, Development', 'Description', 'Design', 'User Experience design', 'Intermediate', 455, 'https://www.udemy.com/course/ux-web-design-master-course-strategy-design-development/', NULL),
(60, 'Pixel art for Video games', 'Description', 'Design', 'Pixel Art', 'Intermediate', 455, 'https://www.udemy.com/course/pixel-art-for-video-games/', NULL),
(61, 'Learn to draw fashion with Adobe Illustrator CC - Beginners', 'Description', 'Design', 'Adobe Illustrator', 'Beginner', 455, 'https://www.udemy.com/course/learn-to-draw-fashion-with-adobe-illustrator-cc-beginners/', NULL),
(62, 'The Complete Digital Marketing Course - 12 Courses in 1', 'Description', 'Marketing', 'Digital Marketing', 'Beginner', 455, 'https://www.udemy.com/course/learn-digital-marketing-course/', NULL),
(63, 'SEO 2020: Complete SEO Training + SEO for WordPress Websites', 'Description', 'Marketing', 'SEO', 'Beginner', 455, 'https://www.udemy.com/course/seo-get-to-number1-in-google-search/', NULL),
(64, 'Facebook Ads & Facebook Marketing MASTERY 2020 | Coursenvy ®', 'Description', 'Marketing', 'Facebook Marketing', 'Beginner', 455, 'https://www.udemy.com/course/facebook-ads-facebook-marketing-mastery-guide/', NULL),
(65, 'YouTube Masterclass - Your Complete Guide to YouTube', 'Description', 'Marketing', 'Youtube Marketing', 'Intermediate', 455, 'https://www.udemy.com/course/youtube-masterclass/', NULL),
(66, 'Google Analytics Certification: Become Certified & Earn More', 'Description', 'Marketing', 'Google Analytics', 'Intermediate', 455, 'https://www.udemy.com/course/google-analytics-certification/', NULL),
(67, 'The Ultimate Public Relations Masterclass', 'Description', 'Marketing', 'Public Relations', 'Beginner', 455, 'https://www.udemy.com/course/the-ultimate-public-relations-masterclass/', NULL),
(68, 'The Art & Science of Drawing / BASIC SKILLS', 'Description', 'Lifestyle', 'Drawing', 'Beginner', 455, 'https://www.udemy.com/course/the-art-and-science-of-drawing/', NULL),
(69, 'Sourdough Bread Baking 101', 'Description', 'Lifestyle', 'Sourdough Bread Baking', 'Beginner', 474, 'https://www.udemy.com/course/sourdough-bread-baking-101/', NULL),
(70, 'Natural Beauty: How to Make Lotions,Creams and Body Butters', 'Description', 'Lifestyle', 'Beauty', 'Beginner', 468, 'https://www.udemy.com/course/natural-beauty-how-to-make-lotionscreams-and-body-butters/', NULL),
(71, 'Travel Writing: Explore the World & Publish Your Stories!', 'Description', 'Lifestyle', 'Writing ', 'Beginner', 455, 'https://www.udemy.com/course/travel-writing-class/', NULL),
(72, 'iPhone Photography | Take Professional Photos On Your iPhone', 'Description', 'Photography', 'iPhone Photography', 'Beginner', 481, 'https://www.udemy.com/course/iphonephotography/', NULL),
(73, 'Photography Masterclass: A Complete Guide to Photography', 'Description', 'Photography', 'Photography', 'Beginner', 455, 'https://www.udemy.com/course/photography-masterclass-complete-guide-to-photography/', NULL),
(74, 'Adobe Lightroom Classic CC & CC: Photo Editing Masterclass', 'Description', 'Photography', 'Adobe Lightroom ', 'Beginner', 455, 'https://www.udemy.com/course/adobe-lightroom/', NULL),
(75, 'Cognitive Behavioural Therapy (CBT) Practitioner Certificate', 'Description', 'Health & Fitness', 'CBT', 'Beginner', 455, 'https://www.udemy.com/course/cognitive-behavioural-therapy-online-course-cbt-practitioner-course/', NULL),
(76, 'Herbalism :: Introduction & Medicine Making [Certificate]', 'Description', 'Health & Fitness', 'Herbalism', 'Intermediate', 500, 'https://www.udemy.com/course/herbalism-medicine-making/', NULL),
(77, 'Elevate Your Tennis Game: Learn from Champion Andre Agassi', 'Description', 'Health & Fitness', 'Tennis', 'Intermediate', 462, 'https://www.udemy.com/course/andreagassi/', NULL),
(78, 'Internationally Accredited Diploma in Yoga Training', 'Description', 'Health & Fitness', 'Yoga', 'Intermediate', 481, 'https://www.udemy.com/course/internationally-accredited-diploma-in-yoga-training/', NULL),
(79, 'Shuffle Dance Master Class Vol 1. | How to Shuffle Dance', 'Description', 'Health & Fitness', 'Dance', 'Beginner', 455, 'https://www.udemy.com/course/how-to-shuffle-dance-tutorial/', NULL),
(80, 'Crash Course 2 Keto - Ketosis Made Simple', 'Description', 'Health & Fitness', 'Ketosis', 'Beginner', 455, 'https://www.udemy.com/course/crashcourse2keto/', NULL),
(81, 'The Art of Energy Healing', 'Description', 'Health & Fitness', 'Energy Healing', 'Intermediate', 455, 'https://www.udemy.com/course/the-art-of-energy-healing/', NULL),
(82, 'Pianoforall - Incredible New Way To Learn Piano & Keyboard', 'Description', 'Music', 'Piano', 'Advanced', 455, 'https://www.udemy.com/course/pianoforall-incredible-new-way-to-learn-piano-keyboard/', NULL),
(83, 'Music + Audio Production in Logic Pro X - The Complete Guide', 'Description', 'Music', 'Music Production', 'Advanced', 455, 'https://www.udemy.com/course/music-production-in-logic-pro-x-course/', NULL),
(84, 'Music Theory Comprehensive Complete! (Levels 1, 2, & 3)', 'Description', 'Music', 'Music theory', 'Beginner', 514, 'https://www.udemy.com/course/music-theory-complete/', NULL),
(85, 'How To Sing #1: Complete Vocal Warm ups & Voice Physiology', 'Description', 'Music', 'Singing', 'Beginner', 468, 'https://www.udemy.com/course/singing-lessons-online/', NULL),
(86, 'Read Music FAST!', 'Description', 'Music', 'Reading Music', 'Beginner', 455, 'https://www.udemy.com/course/sight-reading/', NULL),
(87, 'Ultimate Ableton Live 9 COMPLETE: Parts 1, 2, & 3', 'Description', 'Music', 'Aleton Live', 'Beginner', 455, 'https://www.udemy.com/course/ultimate-ableton-live-complete/', NULL),
(88, 'IELTS Band 7+ Complete Prep Course', 'Description', 'Teaching & Academics', 'IELTS', 'Beginner', 644, 'https://www.udemy.com/course/ielts-band-7-preparation-course/', NULL),
(89, 'Mastering Data Structures & Algorithms using C and C++', 'Description', 'Teaching & Academics', 'Data Structures', 'Beginner', 455, 'https://www.udemy.com/course/datastructurescncpp/', NULL),
(90, 'Critical Thinker Academy: Learn to Think Like a Philosopher', 'Description', 'Teaching & Academics', 'Critical Thinking', 'Beginner', 455, 'https://www.udemy.com/course/critical-thinker-academy/', NULL),
(91, 'Become a Calculus 1 Master', 'Description', 'Teaching & Academics', 'Calculus', 'Beginner', 455, 'https://www.udemy.com/course/calculus1/', NULL),
(92, 'The complete SOLAR ENERGY course. Beginner to advanced level', 'Description', 'Teaching & Academics', 'Solar Energy', 'Intermediate', 481, 'https://www.udemy.com/course/the-complete-solar-energy-course-beginner-to-advanced-level/', NULL),
(93, 'How to Create an Awesome Online Course', 'Description', 'Teaching & Academics', 'Online Course Creation', 'Intermediate', 455, 'https://www.udemy.com/course/how-to-create-an-awesome-online-course/', NULL),
(94, 'Counselling Practitioner Certificate (Beginner to Advanced)', 'Description', 'Teaching & Academics', 'Counselling', 'Beginner', 455, 'https://www.udemy.com/course/online-counselling-practitioner-course-counselling-skills/', NULL),
(95, 'Learn German Language: Complete German Course - Beginners', 'Description', 'Teaching & Academics', 'German Language', 'Beginner', 455, 'https://www.udemy.com/course/german-course-for-beginners-learn-german/', NULL),
(96, 'Confidence On Camera: Make Amazing Videos, Easily.', 'Description', 'Teaching & Academics', 'Presentation Skills', 'Advanced', 468, 'https://www.udemy.com/course/be-comfortable-and-confident-on-camera/', NULL),
(97, 'IELTS Band 7+ Complete Prep Course', 'Description', 'Teaching & Academics', 'IELTS', 'Beginner', 644, 'https://www.udemy.com/course/ielts-band-7-preparation-course/', NULL),
(98, 'Research Methodology', 'Description', 'Teaching & Academics', 'Research Methods', 'Beginner', 455, 'https://www.udemy.com/course/research-methods/', NULL),
(99, 'Complete Punctuation: Novice To Pro', 'Description', 'Teaching & Academics', 'Punctuation', 'Intermediate', 455, 'https://www.udemy.com/course/punctuation-novice-to-pro/', NULL),
(100, 'Rockstar Teacher Training', 'Description', 'Teaching & Academics', 'Teacher Training', 'Intermediate', 455, 'https://www.udemy.com/course/rockstar-teacher-training/', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE `enrolled_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_courses`
--

INSERT INTO `enrolled_courses` (`id`, `user_id`, `course_id`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_jobs`
--

CREATE TABLE `enrolled_jobs` (
  `id` int(11) NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applied_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question` varchar(2000) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_jobs`
--

INSERT INTO `enrolled_jobs` (`id`, `job_id`, `user_id`, `applied_on`, `question`, `status`) VALUES
(1, 'cscordwx', 1, '2020-08-01 17:28:07', 'sdsd', 'applied'),
(2, 'cscordwx', 2, '2020-08-01 01:12:10', 'sdsd', NULL),
(3, 'cscorewb', 2, '2020-08-01 01:12:10', 'sdsdsd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` varchar(10) NOT NULL,
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) NOT NULL,
  `closing_date` datetime NOT NULL,
  `pos_names` varchar(1000) NOT NULL,
  `no_postions` varchar(100) NOT NULL,
  `stipend` varchar(255) NOT NULL,
  `qualification` varchar(3000) NOT NULL,
  `extra_info` varchar(1000) NOT NULL,
  `interview_mode` varchar(7) NOT NULL,
  `interveiw_loc` varchar(100) NOT NULL,
  `date_time_interview` datetime NOT NULL,
  `is_online_test` tinyint(1) NOT NULL,
  `posted_by` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `posted_on`, `description`, `closing_date`, `pos_names`, `no_postions`, `stipend`, `qualification`, `extra_info`, `interview_mode`, `interveiw_loc`, `date_time_interview`, `is_online_test`, `posted_by`) VALUES
('ascorewx', '2020-07-29 04:58:29', 'The construction sector includes the construction of commercial, industrial, and residential buildings and engineering projects like roads, bridges, and utility systems. Construction includes both new construction and remodeling, additions, maintenance, and repairs.', '2020-08-10 00:00:00', 'Civil Site Engineer . Electrical Eng. Machinical Eng. Maintenance Dep Roorkee', '4', '229999', 'Bachelor of Arts (B.A),Bachelor of Business Administration (B.B.A),Bachelor Of Computer Application (B.C.A),Bachelor Of Technology (B.Tech/B.E),Bachelor of Science (B.Sc),Company SecretaryDiplomaMasters in Arts (M.A),Masters in Technology (M.Tech/M.E/M.Sc)', 'extras', 'Offline', 'Mumbai', '2020-08-12 00:00:00', 1, 'Vikas'),
('bkceswex', '2020-07-29 04:58:29', 'Ã¢â‚¬Â¢ Responsible for selling Rainwear Products to FMCG, Pharma, Agro Industries.\r\nÃ¢â‚¬Â¢ Coordinate with partners to create and execute business plans to meet sales goals.\r\nÃ¢â‚¬Â¢ Analyze market trends and accordingly develop sales plans.\r\nÃ¢â‚¬Â¢ Evaluate partner sales performance and recommend improvements.\r\nÃ¢â‚¬Â¢ Educate partners about product portfolio.\r\nÃ¢â‚¬Â¢ Address partner related issues, sales conflicts and pricing issues in a timely manner.\r\nÃ¢â‚¬Â¢ Develop positive working relationship with partners to build business.\r\nÃ¢â‚¬Â¢ Stay current with latest developments in marketplace and competitor activities.\r\nÃ¢â‚¬Â¢ Communicate up-to-date information about new products and enhancements to partners.\r\nÃ¢â‚¬Â¢ Assist in partner marketing activities such as tradeshows, campaigns and other promotional activities.\r\nÃ¢â‚¬Â¢ Identify, recruit and on-board new channel partners within assigned territory.\r\nAchieves assigned sales quota in designated partner accounts.', '2020-09-12 00:00:00', 'BDM - Corporate sale', '5', '1000000', 'Master OF Business Administration (M.B.A)', 'extras', 'offline', 'Mumbai ', '2020-09-11 00:00:00', 0, 'Vikas'),
('bkcorewx', '2020-07-29 04:58:29', 'Male candidates with horticulture qualification ( B Sc or M Sc) with 2-4 years of exp in landscaping, vegetables, fruits and ,multicrops\r\nShould be conversant with organic farming right from seeding till harvesting .\r\nShould be a team worker with the ability to give helping hand to Farm manager\r\nShould be conversant /knowledgeable in pesticides/fertilizers .\r\nShould be able to communicate to down the line workers\r\nShould be able to handle the inputs and outputs with utmost to achieve organization objectives.', '2020-07-30 00:00:00', 'Horticulturist', '6', '900000', 'Horticulture qualification ( B Sc or M Sc) ', 'extras', 'Online', 'Delhi', '2020-07-31 00:00:00', 1, 'Vikas'),
('bscorewx', '2020-07-29 04:58:29', 'Ã‚Â Job opening for the internal medicine at reputedÃ‚Â  Multi-Specialist hospital in Roorkee.', '2020-08-11 00:00:00', 'Internal Medicine Physician Assistant', '5', '3000000', 'MBBS ,Doctor of Medicine (M.D/M.S)', 'extras', 'Offline', 'Roorkee', '2020-08-13 00:00:00', 1, 'Vikas'),
('cscoaewx', '2020-07-29 04:58:29', 'Min 1+ years of experience in sales of products like Steel, Cement, PVC ,Construction,Real Estate, Paints, with a reputed company will be entertained and is must and should Freshers will not entertained\n\nMale Candidates will be Proffered\nHaving own conveyance like motorbike or scooter\n\nSearching for new clients who could benefit from our products in a designated region. \n\nEstablishing new, and maintaining existing, relationships with customers. \n\nCold calling & Lead generation. \n\nManaging and interpreting customer requirements. \n\nProvide alternative solutions as required to meet unique customer needs. \n\nOffering after-sales support services. \n\nMeeting regular sales targets. \n\nWilling to Travel extensively.\n\nPerks and Benefits \n\nEPF, ESIC, Annual Bonus ,Incentive.', '2020-07-31 00:00:00', 'Sales Executive /Manager', '7', '450000 ', 'Any Qualification(PUC OR DEGREE) with experience from Steel/Cement/Construction /Real Estate Metal Fabrication Industry will be preferable', 'extras', 'Online', 'Bengaluru ', '2020-08-02 00:00:00', 1, 'Raj'),
('cscoloop', '2020-07-29 04:58:29', 'We are looking for candidate in our Industrial Department for Business Development Manager.\r\nfollowing are the criteria:\r\nPerson should have Minimum 6 Months Experience\r\nExposure of industrial product developments( sales & technical) with repute paints company like knp ,Asian paints ,BASF ,PPG ,SABOO,ESSDEE, ETC\r\nDealing with oem\'s product line like pu , plastic coating ,TSA ,Stoving range .to develop new segments /oems\r\nPerson should have technical qualification from HBTI or from any repute paint technology msc . ', '2020-08-11 00:00:00', 'Business Development Manager-(Sales & Technical)', '9', '400000', 'Bachelor Of Technology ,(B.Tech/B.E)Diploma', 'extras', 'offline', 'Ahmedabad ', '2020-07-07 00:00:00', 0, 'Vikas'),
('cscopewx', '2020-07-29 04:58:29', 'Good Communication Skill\nHindi & English', '2020-08-09 00:00:00', 'Ground staff & Air ticketing', '4', '819999', '10+2 & Graduate FresherÃ¢â‚¬â„¢s', 'extras', 'Offline', 'Haldwani', '2020-08-11 00:00:00', 1, 'Vikas'),
('cscorbwx', '2020-07-29 04:58:29', 'The construction sector includes the construction of commercial, industrial, and residential buildings and engineering projects like roads, bridges, and utility systems. Construction includes both new construction and remodeling, additions, maintenance, and repairs.', '2020-08-01 00:00:00', 'civil Site Engineer. Electrical Eng. Machinical Eng. Maintenance Haridwar', '12', '229999', 'Bachelor of Arts (B.A),Bachelor of Business Administration (B.B.A),Bachelor Of Computer Application (B.C.A),Bachelor of Commerce (B.Com),Bachelor Of Technology (B.Tech/B.E),Bachelor of Science (B.Sc),12th Class (XII),DiplomaMasters in Technology (M.Tech/M.E/M.Sc)', 'extras', 'Online', 'Dehradun', '2020-08-03 00:00:00', 1, 'Raj'),
('cscorcwx', '2020-07-29 04:58:29', 'We are looking back office executive & cashier for leading Bank.\nThe candidate has to assist and support administrative staff in their day to day operations.\nTiming: 9:30am to 4:30pm\nExperience/fresher will get hike in salary\nNo targets\nFixed day shift\nCentralize pick and drop\nRoles, Responsibilities and skills:\n1. Assist and coordinate with sales and marketing teams.\n2. Support sales staff in handling and documenting customer accounts.\n3. Prepare and reconcile customer balances.\n4. Gather the information, check the authenticity, designs a format for representation.\n5. Excel knowledge is mandatory.', '2020-08-02 00:00:00', 'Cashier & computer operator', '12', '819999', '. 10th, 12th, and any Graduates.', 'extras', 'Online', 'Dehradun', '2020-08-04 00:00:00', 1, 'Raj'),
('cscordwx', '2020-07-29 04:58:29', 'Greetings from Multi way Employment\nResponsibilities and Duties\nHiring Company: Indigo , Spice jet ,Qatar airlines etc\nÃ¢â‚¬Â¢ Reservation & Ticketing (Manual & Computerize both).\nÃ¢â‚¬Â¢ Handel Passenger Queries and address passengers grievance\nÃ¢â‚¬Â¢ Handel day to day operational task\nÃ¢â‚¬Â¢ Preparation of daily/monthly service report\nÃ¢â‚¬Â¢ Baggage Handling', '2020-08-03 00:00:00', 'Air Ticketing Executive Ground Staff Cabin Crew', '15', '740000', 'Bachelor of Arts (B.A),Bachelor of Business Administration (B.B.A),Bachelor Of Computer Application (B.C.A),Bachelor of Commerce (B.Com),Bachelor Of Technology (B.Tech/B.E),Bachelor of Education (B.Ed)Bachelor in Hotel Management (B.H.M)Bachelor Of Pharmacy (B.Pharm)', 'extras', 'Online', 'Dehradun', '2020-08-05 00:00:00', 1, 'Raj'),
('cscoremx', '2020-07-29 04:58:29', 'We are looking back office executive & cashier for leading Bank.\nThe candidate has to assist and support administrative staff in their day to day operations.\nTiming: 9:30am to 4:30pm\nExperience/fresher will get hike in salary\nNo targets\nFixed day shift\nCentralize pick and drop\nRoles, Responsibilities and skills:\n1. Assist and coordinate with sales and marketing teams.\n2. Support sales staff in handling and documenting customer accounts.\n3. Prepare and reconcile customer balances.\n4. Gather the information, check the authenticity, designs a format for representation.\n5. Excel knowledge is mandatory.', '2020-08-05 00:00:00', 'Cashier & computer operator', '2', '819999', '10th, 12th, and any Graduates.', 'extras', 'Offline', 'Dehradun', '2020-08-07 00:00:00', 0, 'Raj'),
('cscorenx', '2020-07-29 04:58:29', 'Building a team of PFAs:\no Identifying prospective PFAs as per the guidelines of the organisation\no Coordinating the appointment process of the PFAs\no Activisation of successfully appointed new PFAs through handholding, participation in OJT and ensuring their motivation to sell\no Achieving the number of active PFAs in his / her team as per the organisations targets\nÃ¢â‚¬Â¢ Deliver sales targets and ensure adherence to the Mandated Sales Process:\no Prepare monthly and annual action plans to achieve his/her goals\no Ensuring adherence by PFAs to the Sales process as mandated by the company\no Motivating and ensuring Revenue targets (as may be set from time to time) for the PFA are achieved\no Measurement and tracking of relevant metrics for PFAs\no Ensure that R&R schemes are communicated to understood by the PFAs in the team and used effectively to motivate and help team perform\no Work towards achieving the target sales and product mix from the team of PFAs\no Track customer proposals through to conversion\n', '2020-08-06 00:00:00', 'Development ManagerÃ‚Â ', '5', '300000', 'Bachelor of Arts (B.A),Bachelor of Commerce (B.Com),Master OF Business Administration (M.B.A)', 'extras', 'Offline', 'Dehradun', '2020-08-08 12:00:00', 0, 'Raj'),
('cscoreox', '2020-07-29 04:58:29', 'Front Office Duties and Responsibilities\nGreet clients and set a positive office atmosphere. Answer the phone, take messages, and redirect calls to appropriate offices. Organize and maintain files and records; update when necessary. Create and maintain updated documents and spreadsheets', '2020-08-07 00:00:00', 'Hiring For Back office Executive/Front office', '6', '1000000', 'B.com', 'extras', 'Offline', 'Lucknow', '2020-08-09 00:00:00', 0, 'Raj'),
('cscorewb', '2020-07-29 04:58:29', 'About the Company:\nWith the development of Technology, Civil Aviation Demands more professionalism in handling the Aeroplanes. Today it is being realized that the responsibility of achieving zero accident rate in airlines depends not only with a pilot but also on all professionals including those on ground who are contributory to Flight Safety. Hence proper coordination and resource management among men and machine, in the overall system becomes more important. The need of the hour is to make these professionals pass through a common platform so that they understand each other\'s needs in a better way and understand their responsibility to provide healthy and professional Civil Aviation environment.', '2020-07-29 00:00:00', 'Air Ticketing', '7', '409999', 'Aviation, Bachelor of Business Administration (B.B.A), Bachelor Of Computer Application (B.C.A)', 'extras', 'Online', 'Hyderabad', '2020-07-31 00:00:00', 1, 'Raj'),
('cscorewc', '2020-07-30 07:16:57', 'Some airport structures include on-site hotels built within or attached to a terminal building. Airport hotels have grown popular due to their convenience for transient passengers and easy accessibility to the airport terminal. Many airport hotels also have agreements with airlines to provide overnight lodging for displaced passengers.\r\nMajor airports in such countries as Russia and Japan offer miniature sleeping units within the airport that are available for rent by the hour. The smallest type is the capsule hotel popular in Japan. A slightly larger variety is known as a sleep box. An even larger type is provided by the company.An airport manager\'s job is to keep people moving in the right direction. ... Airport managers handle everything from signing leases with airlines and concessionaires to meeting safety regulations. They prepare for emergencies and deal with foul weather. They also plan for the future growth of their airports.', '2020-07-30 00:00:00', 'Airport security, and Management department', '12', '1200000', 'Aviation, Bachelor of Arts (B.A), Bachelor of Commerce (B.Com), Bachelor Of Technology (B.Tech/B.E), 12th Class (XII), DiplomaMasters in Arts (M.A)', '', 'Online', 'Kolkata', '2020-08-01 00:00:00', 1, 'Raj'),
('cscorewx', '2020-07-29 05:00:49', 'Roles & responsibilities\r\nLiaise with developers and designers to identify and scope new features\r\nGather and address technical and architectural design requirements\r\nBuild reusable code and libraries for future use\r\nManage code deployments, fixes, updates and related processes\r\nActively troubleshoot any issues that arise during testing and on production environment\r\nWork with CI and CD tools\r\nOffer technical support where needed, developing software for our back-end systems\r\nFollow emerging technologies\r\n', '2020-07-16 00:00:00', '\r\nSoftware Engineer/Programmer', '5', '1500000', 'B.E/B.Tech', 'extras', 'offline', 'Pune', '2020-07-03 00:00:00', 1, 'Raj'),
('cscorlwx', '2020-07-29 05:02:09', 'Front Office Duties and Responsibilities\nGreet clients and set a positive office atmosphere. Answer the phone, take messages, and redirect calls to appropriate offices. Organize and maintain files and records; update when necessary. Create and maintain updated documents and spreadsheets', '2020-08-04 00:00:00', 'Back office Executive/Front office', '23', '1000000', 'Any  degree', 'extras', 'Online', 'Durgapur', '2020-08-06 00:00:00', 1, 'Raj'),
('cscortwx', '2020-07-27 23:53:09', 'As part of the marketing team , you will create quality content for complex enterprise software sold to a global audience.\r\nYou are a pragmatic self - starter with an impeccable command of the English language and the ability to learn , teach , and impress upon both technical and business audiences the value of Alepo s software and solutions.\r\nThis is a fantastic opportunity to work with top writers and participate in some of the hottest trends in the industry such as 5G , blockchain , digital transformation , DevOps , machine learning , and much more.\r\nIn Alepo you will be heard , and you can make a difference.\r\nMinimum BA/ BS in science , engineering , media , or communications\r\nResponsibilities Build quality marketing collateral with input from both technical and sales teams Understand the industry , identify key trends , and relate Alepo s software to those trends Write web content , press releases , case studies , white papers , brochures , newsletters , email campaigns , blogs , and articles for a global audience Author engaging and insightful technical content for C suite executives that can be published on peer - reviewed third - party websites Create visually appealing collateral in Microsoft Word , PowerPoint , or Adobe InDesign Skills Quick learner and self - starter Creative and independent thinker Confident , positive , flexible , and team - minded attitude Command of Word and PowerPoint Experience using social media to engage technical readers Previous experience with WordPress , Adobe InDesign , Confluence , MailChimp , JIRA', '2020-07-30 00:00:00', '\r\nSoftware Engineer/Programmer', '3', '1000000', 'B.E/B.Tech', 'extras', 'Online', 'Pune', '2020-07-14 00:00:00', 1, 'Raj'),
('cscotewx', '2020-07-30 07:16:57', 'Delivery Partner is required to pick up food items from restaurants and deliver to customers over a 2-wheeler bike or cycle.\nHe will receive orders through a mobile application from the nearest restaurants which have to be delivered to the address specified in the app itself.\nTheir payouts are processed on a weekly basis.\nPayout Structure\nThe payout of Delivery Partners has several components like\nBasic Pay (Fixed),\nDistance Pay (Variable basis delivery distance),\nMilestone Incentives(Daily Order milestone Bonuses) ,etc.\nOther Benefits:\nMedical insurance cover upto 1 lakh; Accidental Insurance cover upto 10 lakh.\nJoining Bonus (Varies across cities)\nFlexible working hours (Partners can choose to log-in at their preferred time of convenience', '2020-08-08 00:00:00', 'Hiring Delivery Boys for a Food Delivery App', '15', '90000', '10th ,12th pass', 'extras', 'Offline', 'Chittaurgarh', '2020-08-10 00:00:00', 0, 'Vikas'),
('csporewx', '2020-07-29 05:00:49', 'job opening for the post of intenior designer- sonepat\nlocation-sonepat\nexp-3+\nknowledge of wood  designing\nits wooden furniture & interiors manufaturing company located in Sonipat', '2020-08-14 00:00:00', 'intenior designer- sonepat', '6', '240000', 'Diploma', 'extras', 'Offline', 'Sonipat ', '2020-08-16 00:00:00', 1, 'Vikas'),
('infilowx', '2020-07-29 05:02:09', 'We are looking for candidate in our Industrial Department for Business Development Manager.\nfollowing are the criteria:\nPerson should have Minimum 6 Months Experience\nExposure of industrial product developments( sales & technical) with repute paints company like knp ,Asian paints ,BASF ,PPG ,SABOO,ESSDEE, ETC\nDealing with oem\'s product line like pu , plastic coating ,TSA ,Stoving range .to develop new segments /oems\nPerson should have technical qualification from HBTI or from any repute paint technology msc . ', '2020-07-28 00:00:00', 'Business Development Manager-(Sales & Technical)', '17', '1000000', 'Bachelor Of Technology (B.Tech/B.E),Diploma', 'extras', 'Online', 'Ahmedabad', '2020-07-30 00:00:00', 1, 'Raj'),
('jscorewx', '2020-07-29 05:00:49', 'Salary & Benefits: As per industry standards', '2020-08-12 00:00:00', 'Gynecologist in a Corporate Hospital', '3', '300000', 'MBBS ,Doctor of Medicine (M.D/M.S)', 'extras', 'Offline', 'Roorkee', '2020-08-14 00:00:00', 1, 'Vikas'),
('kkkkrewx', '2020-07-27 23:53:09', 'You will be responsible for producing graphically- rich content such as presentations , documents , brochures , social media banners , videos , and event materials.\r\nAny Bachelors Degree. Preference to Bachelors of Fine Arts.\r\nMinimum of 5 years\r\nPortfolio of designs Modern clean minimalist aesthetic 8+ years of experience with at least two of those years working in a global software house Ability to visually express concepts; business attributes PowerPoint guru; InDesign maestro Deep understanding of the principles of typography Ability to create and maintain brand guidelines Maintains brand consistency across all deliverables Broad experience with industry- standard tools such as: Photoshop , Illustrator , Adobe XD Demonstrated experience creating product demonstration videos , illustrations , and infographics Degree in design or related discipline\r\nA Behance profile\r\nWorked for international software house for at least 2 years Video creation and video animation HTML/ CSS/ Bootstrap UI/ UX experience Own and define brand guidelines for an international software company', '2020-08-11 00:00:00', 'Graphic Designer', '8', '80000', 'Bachelors/Degree', 'extras', 'offline', 'Mumbai', '2020-07-31 00:00:00', 0, 'Raj'),
('lklkrewx', '2020-07-27 23:53:09', 'Should be able to communicate to down the line workers\r\nShould be able to handle the inputs and outputs with utmost to achieve organization objectives.', '2020-07-25 00:00:00', 'Horticulturist', '7', '1000000', 'Graduate in Mass Communication', 'extras', 'Online', 'Delhi', '2020-07-23 00:00:00', 1, 'Raj'),
('lscorewx', '2020-07-29 05:00:49', 'Handle the bank branch which is provided by the manager and generate leads\nMaintaining and building fine relationships so as to get business month on month.\nCoordinating and synchronizing with BM\'s and Regional Heads so as to increase the business.\nManaging and supporting Relationship Managers for sales calls, Promotion support & training-development.\nPlanning, strategizing, supervising big events so as to create more clients for respective channels and also generating business thereby.\nEffective presentation to masses and classes being a part of the job carried out well.\nLooking out for prospective corporate agents and appointing them so as to increase and achieve targets comfortably.', '2020-08-13 00:00:00', 'Client of HR Remedy India - Banca Vertical', '2', '350000', 'B.com', 'extras', 'Offline', 'Chennai', '2020-08-15 00:00:00', 1, 'Vikas'),
('mklkrewx', '2020-07-29 05:00:49', 'Candidate should have Degree in Law/ Masters in social science, paralegal training or knowledge of laws, At least 3 yrs of experience.\r\n', '2020-09-23 00:00:00', 'Consultant Ã¢â‚¬â€œ Paralegal', '8', '220000', 'Bachelors of Law (B.L/L.L.B),Masters in Technology (M.Tech/M.E/M.Sc)', 'extras', 'offline', 'Chandigarh', '2020-09-17 00:00:00', 1, 'Vikas');

-- --------------------------------------------------------

--
-- Table structure for table `online_test`
--

CREATE TABLE `online_test` (
  `job_id` varchar(10) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `option_1` varchar(1000) NOT NULL,
  `option_2` varchar(1000) NOT NULL,
  `option_3` varchar(1000) NOT NULL,
  `option_4` varchar(1000) NOT NULL,
  `reqd_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `resume_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `additional_details` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`resume_id`, `user_id`, `email`, `location`, `phone_no`, `additional_details`) VALUES
('reewew', 1, 'sds@g.c', 'sdxdsd', '9898222', 'sdd');

-- --------------------------------------------------------

--
-- Table structure for table `resume_edu_details`
--

CREATE TABLE `resume_edu_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `college` varchar(255) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `start_year` varchar(12) NOT NULL,
  `end_date` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_edu_details`
--

INSERT INTO `resume_edu_details` (`id`, `user_id`, `status`, `college`, `degree`, `stream`, `start_year`, `end_date`) VALUES
(1, 1, 'pursuing', 'UCOE', 'Computer Engineering', 'TECHHNOLOGY', '122122', '312231'),
(2, 1, 'pursuing', 'Cgdfhf', 'dsfssvfdvfvf', 'dadssaad', '1111-11-11', '2222-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `resume_job_details`
--

CREATE TABLE `resume_job_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `organiztion` varchar(255) NOT NULL,
  `job_location` varchar(255) NOT NULL,
  `start_date` varchar(12) NOT NULL,
  `end_date` varchar(12) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_job_details`
--

INSERT INTO `resume_job_details` (`id`, `user_id`, `job_title`, `organiztion`, `job_location`, `start_date`, `end_date`, `description`, `type`) VALUES
(1, 1, 'SDE', 'MSI', 'dubaii', '32232323', '32233223', 'ddsafdgfsadgfadgsfdgvfvfdfdvb', 'sfddfsf');

-- --------------------------------------------------------

--
-- Table structure for table `resume_por`
--

CREATE TABLE `resume_por` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `resume_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_projects`
--

CREATE TABLE `resume_projects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_month` varchar(12) NOT NULL,
  `end_month` varchar(12) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `project_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_projects`
--

INSERT INTO `resume_projects` (`id`, `user_id`, `title`, `start_month`, `end_month`, `description`, `project_link`) VALUES
(1, 1, 'SDE', '2317532', '312231', 'Shaaanti Purvak', 'www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `resume_skills`
--

CREATE TABLE `resume_skills` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skill_id` varchar(10) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_skills`
--

INSERT INTO `resume_skills` (`id`, `user_id`, `skill_id`, `level`) VALUES
(2, 1, 'SK001', 'Intermediate'),
(3, 1, 'SK031', 'Advanced'),
(4, 1, 'SK131', 'Intermediate'),
(5, 1, 'SK214', 'Intermediate'),
(6, 1, 'SK006', 'Intermediate');

-- --------------------------------------------------------

--
-- Table structure for table `resume_trainings`
--

CREATE TABLE `resume_trainings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `start_date` varchar(12) NOT NULL,
  `end_date` varchar(12) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_work_examples`
--

CREATE TABLE `resume_work_examples` (
  `user_id` int(11) NOT NULL,
  `blog_url` varchar(100) NOT NULL,
  `github_profile` varchar(100) NOT NULL,
  `portfolio_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_work_examples`
--

INSERT INTO `resume_work_examples` (`user_id`, `blog_url`, `github_profile`, `portfolio_link`) VALUES
(1, 'asasa', 'dsdsd', 'sdd');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `title`, `category`) VALUES
('SK001', 'Web Development', 'Development'),
('SK002', 'Data Science', 'Development'),
('SK003', 'Mobile Apps', 'Development'),
('SK004', 'Programming Languages', 'Development'),
('SK005', 'Game Development', 'Development'),
('SK006', 'Databases', 'Development'),
('SK007', 'Software Engineering ', 'Development'),
('SK008', 'Software Testing', 'Development'),
('SK009', 'Development Tools', 'Development'),
('SK010', 'E-commerce', 'Development'),
('SK011', 'Finance', 'Business'),
('SK012', 'Entrepreneurship', 'Business'),
('SK013', 'Communications', 'Business'),
('SK014', 'Manageement', 'Business'),
('SK015', 'Sales', 'Business'),
('SK016', 'Strategy', 'Business'),
('SK017', 'Operations', 'Business'),
('SK018', 'Project Management', 'Business'),
('SK019', 'Business Law', 'Business'),
('SK020', 'Data & Analytics', 'Business'),
('SK021', 'Home Business', 'Business'),
('SK022', 'Human Resources', 'Business'),
('SK023', 'Industry', 'Business'),
('SK024', 'Media', 'Business'),
('SK025', 'Real Estate', 'Business'),
('SK026', 'QuickBooks Online', 'Business'),
('SK027', 'PowerPoint', 'Business'),
('SK028', 'Grant Writing', 'Business'),
('SK029', 'Freelance Writing', 'Business'),
('SK030', 'Procurement', 'Business'),
('SK031', 'Supply Chain', 'Business'),
('SK032', 'Stock Trading', 'Business'),
('SK033', 'Investing', 'Business'),
('SK034', 'Options Trading', 'Business'),
('SK035', 'Accounting & Bookkeeping', 'Finance & Accounting'),
('SK036', 'Compliance', 'Finance & Accounting'),
('SK037', 'Cryptocurrency & Blockchain', 'Finance & Accounting'),
('SK038', 'Economics', 'Finance & Accounting'),
('SK039', 'Finance', 'Finance & Accounting'),
('SK040', 'Finance Cert & Exam Prep', 'Finance & Accounting'),
('SK041', 'Financial Modeling & Analysis', 'Finance & Accounting'),
('SK042', 'Investing & Trading ', 'Finance & Accounting'),
('SK043', 'Money Management Tools', 'Finance & Accounting'),
('SK044', 'Taxes', 'Finance & Accounting'),
('SK045', 'IT Certification ', 'It & Software'),
('SK046', 'Network & Security', 'It & Software'),
('SK047', 'Hardware', 'It & Software'),
('SK048', 'Operating Systems', 'It & Software'),
('SK049', 'Docker', 'It & Software'),
('SK050', 'DevOps', 'It & Software'),
('SK051', 'Kubernetes', 'It & Software'),
('SK052', 'Python', 'It & Software'),
('SK053', 'Ansible', 'It & Software'),
('SK054', 'AWS Certification', 'It & Software'),
('SK055', 'AWS Certified Solutions Architect - Professional', 'It & Software'),
('SK056', 'Microsoft Azure', 'It & Software'),
('SK057', 'Algorithms', 'It & Software'),
('SK058', 'QuickBooks Pro', 'Office Productivity'),
('SK059', 'Construction', 'Office Productivity'),
('SK060', 'AutoCAD', 'Office Productivity'),
('SK061', 'ServiceNow', 'Office Productivity'),
('SK062', 'Touch Typing', 'Office Productivity'),
('SK063', 'QuickBooks', 'Office Productivity'),
('SK064', 'Typing', 'Office Productivity'),
('SK065', 'Salesforce', 'Office Productivity'),
('SK066', 'Video Conferencing', 'Office Productivity'),
('SK067', 'Personal Transformation', 'Personal Development'),
('SK068', 'Productivity', 'Personal Development'),
('SK069', 'Leadership', 'Personal Development'),
('SK070', 'Personal Finance', 'Personal Development'),
('SK071', 'Career Development', 'Personal Development'),
('SK072', 'Parenting & Relationships', 'Personal Development'),
('SK073', 'Happiness', 'Personal Development'),
('SK074', 'Religion & Spirituality', 'Personal Development'),
('SK075', 'Personal Brand Building', 'Personal Development'),
('SK076', 'Creativity', 'Personal Development'),
('SK077', 'Influence', 'Personal Development'),
('SK078', 'Self Esteem', 'Personal Development'),
('SK079', 'Stress Mangement', 'Personal Development'),
('SK080', 'Memory & Study Skills', 'Personal Development'),
('SK081', 'Motivation', 'Personal Development'),
('SK082', 'Tantra', 'Personal Development'),
('SK083', 'Freight Broker', 'Personal Development'),
('SK084', 'American Accent', 'Personal Development'),
('SK085', 'English Pronunciation', 'Personal Development'),
('SK086', 'Fibonacci Trading', 'Personal Development'),
('SK087', 'Handwriting Analysis', 'Personal Development'),
('SK088', 'French Language', 'Personal Development'),
('SK089', 'Voice-Over', 'Personal Development'),
('SK090', 'Public Speaking', 'Personal Development'),
('SK091', 'Web Design', 'Design'),
('SK092', 'Graphic Design', 'Design'),
('SK093', 'Design Tools', 'Design'),
('SK094', 'User Experience', 'Design'),
('SK095', 'Game Design', 'Design'),
('SK096', 'Design Thinking', 'Design'),
('SK097', '3D & Animation ', 'Design'),
('SK098', 'Fashion ', 'Design'),
('SK099', 'Architectural Design', 'Design'),
('SK100', 'Interior Design', 'Design'),
('SK101', 'Character Animation', 'Design'),
('SK102', 'Character Design', 'Design'),
('SK103', 'Drawing', 'Design'),
('SK104', 'Comic Book Creation', 'Design'),
('SK105', 'Digital Painting', 'Design'),
('SK106', 'Circuit Design', 'Design'),
('SK107', 'Electronics', 'Design'),
('SK108', 'Portraiture', 'Design'),
('SK109', 'Pencil Drawing', 'Design'),
('SK110', 'Digital Marketing', 'Marketing'),
('SK111', 'Search Engine Optimization ', 'Marketing'),
('SK112', 'Social Media Marketing', 'Marketing'),
('SK113', 'Branding', 'Marketing'),
('SK114', 'Marketing Fundamentals', 'Marketing'),
('SK115', 'Analytics & Automation', 'Marketing'),
('SK116', 'Public Relations', 'Marketing'),
('SK117', 'Advertising', 'Marketing'),
('SK118', 'Video & Mobile Marketing', 'Marketing'),
('SK119', 'Content Marketing', 'Marketing'),
('SK120', 'Growth Hacking ', 'Marketing'),
('SK121', 'Affiliate Marketing ', 'Marketing'),
('SK122', 'Product Marketing', 'Marketing'),
('SK123', 'Copywriting', 'Marketing'),
('SK124', 'Google Ads (AdWords) Certification', 'Marketing'),
('SK125', 'YouTube Audience Growth', 'Marketing'),
('SK126', 'Event Planning', 'Marketing'),
('SK127', 'Conversion Rate Optimization', 'Marketing'),
('SK128', 'Marketing Strategy', 'Marketing'),
('SK129', 'Social Media Marketing', 'Marketing'),
('SK130', 'Fundraising', 'Marketing'),
('SK131', 'PowerPoint', 'Marketing'),
('SK132', 'Arts & Crafts', 'Lifestyle'),
('SK133', 'Food & Beverage', 'Lifestyle'),
('SK134', 'Beauty & Makeup', 'Lifestyle'),
('SK135', 'Travel', 'Lifestyle'),
('SK136', 'Gaming', 'Lifestyle'),
('SK137', 'Home Improvement', 'Lifestyle'),
('SK138', 'Pet Care & Training', 'Lifestyle'),
('SK139', 'Neuro-Linguistic Programming', 'Lifestyle'),
('SK140', 'EFT', 'Lifestyle'),
('SK141', 'Day Trading', 'Lifestyle'),
('SK142', 'Emotional Intelligence', 'Lifestyle'),
('SK143', 'Meditation', 'Lifestyle'),
('SK144', 'Permaculture', 'Lifestyle'),
('SK145', 'Mindfulness', 'Lifestyle'),
('SK146', 'Herbalism', 'Lifestyle'),
('SK147', 'REBT', 'Lifestyle'),
('SK148', 'Digital Photography', 'Photography'),
('SK149', 'Photography Fundamwntals', 'Photography'),
('SK150', 'Portraits', 'Photography'),
('SK151', 'Photography Tools', 'Photography'),
('SK152', 'Commercial Photography', 'Photography'),
('SK153', 'Video Design', 'Photography'),
('SK154', 'Photography', 'Photography'),
('SK155', 'Landscape Photography', 'Photography'),
('SK156', 'Drone Photography', 'Photography'),
('SK157', 'Nature Photography', 'Photography'),
('SK158', 'Color Grading', 'Photography'),
('SK159', 'Adobe Lightroom', 'Photography'),
('SK160', 'Aerial Videography', 'Photography'),
('SK161', 'Photoshop', 'Photography'),
('SK162', 'Drone', 'Photography'),
('SK163', 'Fitness', 'Health & Fitness'),
('SK164', 'General Health', 'Health & Fitness'),
('SK165', 'Sports', 'Health & Fitness'),
('SK166', 'Nutrition', 'Health & Fitness'),
('SK167', 'Yoga', 'Health & Fitness'),
('SK168', 'Mental Health', 'Health & Fitness'),
('SK169', 'Dieting', 'Health & Fitness'),
('SK170', 'Self Defense', 'Health & Fitness'),
('SK171', 'Safety & First Aid', 'Health & Fitness'),
('SK172', 'Dance', 'Health & Fitness'),
('SK173', 'Meditation', 'Health & Fitness'),
('SK174', 'Qi Gong', 'Health & Fitness'),
('SK175', 'Massage', 'Health & Fitness'),
('SK176', 'Sports Massage', 'Health & Fitness'),
('SK177', 'EFT', 'Health & Fitness'),
('SK178', 'Crystal Energy', 'Health & Fitness'),
('SK179', 'Facial Massage', 'Health & Fitness'),
('SK180', 'Reiki', 'Health & Fitness'),
('SK181', 'Aromatherapy', 'Health & Fitness'),
('SK182', 'Hypnotherapy', 'Health & Fitness'),
('SK183', 'Instruments', 'Music'),
('SK184', 'Production', 'Music'),
('SK185', 'Music Fundamentals', 'Music'),
('SK186', 'Vocal', 'Music'),
('SK187', 'Music Techniques', 'Music'),
('SK188', 'Music Software', 'Music'),
('SK189', 'DJ', 'Music'),
('SK190', 'Songwriting', 'Music'),
('SK191', 'Music Marketing', 'Music'),
('SK192', 'Music Business', 'Music'),
('SK193', 'Sound Therapy', 'Music'),
('SK194', 'Lyric Writing', 'Music'),
('SK195', 'Rapping', 'Music'),
('SK196', 'Talent Agent', 'Music'),
('SK197', 'Music Production', 'Music'),
('SK198', 'Engineering', 'Teaching & Academics'),
('SK199', 'Humanities', 'Teaching & Academics'),
('SK200', 'Math', 'Teaching & Academics'),
('SK201', 'Science', 'Teaching & Academics'),
('SK202', 'Online Education', 'Teaching & Academics'),
('SK203', 'Social Science', 'Teaching & Academics'),
('SK204', 'Language', 'Teaching & Academics'),
('SK205', 'Teacher Training', 'Teaching & Academics'),
('SK206', 'Test Prep', 'Teaching & Academics'),
('SK207', 'Research Methods', 'Teaching & Academics'),
('SK208', 'Early Childhood Education', 'Teaching & Academics'),
('SK209', 'Aquaculture', 'Teaching & Academics'),
('SK210', 'Beauty', 'Teaching & Academics'),
('SK211', 'Tattoo Art', 'Teaching & Academics'),
('SK212', 'Montessori', 'Teaching & Academics'),
('SK213', 'Academic Writing', 'Teaching & Academics'),
('SK214', 'Data Analysis', 'Teaching & Academics'),
('SK215', 'SPSS', 'Teaching & Academics');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `forget_otp` int(11) DEFAULT NULL,
  `phone_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `lname`, `fname`, `passw`, `is_verified`, `forget_otp`, `phone_no`) VALUES
(1, 'r@g.com', 'shah', 'raj', 'pbkdf2:sha256:150000$OHKT7NQw$b9bb440d1b44c4ef601265f5e4a48122d20b8fdf6bbb457887eabe0530cf4c9c', 1, NULL, '9892889172'),
(2, 'r@g.com', 'shah', 'raj', 'pbkdf2:sha256:150000$W0SWA66k$6767d6aa7ce61ad4a0e3a3248a29c64e7e41bdd331589663b5d73b14f6ddc750', 1, NULL, '989288917');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolled_jobs`
--
ALTER TABLE `enrolled_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `online_test`
--
ALTER TABLE `online_test`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`resume_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `resume_edu_details`
--
ALTER TABLE `resume_edu_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resume_job_details`
--
ALTER TABLE `resume_job_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `resume_por`
--
ALTER TABLE `resume_por`
  ADD PRIMARY KEY (`id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `resume_id` (`resume_id`);

--
-- Indexes for table `resume_projects`
--
ALTER TABLE `resume_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `resume_skills`
--
ALTER TABLE `resume_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `resume_trainings`
--
ALTER TABLE `resume_trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `resume_work_examples`
--
ALTER TABLE `resume_work_examples`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrolled_jobs`
--
ALTER TABLE `enrolled_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resume_edu_details`
--
ALTER TABLE `resume_edu_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resume_job_details`
--
ALTER TABLE `resume_job_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resume_por`
--
ALTER TABLE `resume_por`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resume_projects`
--
ALTER TABLE `resume_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resume_skills`
--
ALTER TABLE `resume_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resume_trainings`
--
ALTER TABLE `resume_trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resume_work_examples`
--
ALTER TABLE `resume_work_examples`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
