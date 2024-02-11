-- Drop database
DROP DATABASE IF EXISTS bibr_dev_db;

-- prepares a MySQL server for the Binary Briefs project
CREATE DATABASE IF NOT EXISTS bibr_dev_db;
CREATE USER IF NOT EXISTS 'bibr_dev'@'localhost' IDENTIFIED BY 'Warrior@22@7';
GRANT ALL PRIVILEGES ON `bibr_dev_db`.* TO 'bibr_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bibr_dev'@'localhost';
FLUSH PRIVILEGES;

USE bibr_dev_db;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('017ec502-e84a-4a0f-92d6-d97e27bb6bdf','2024-02-10 02:17:06','2024-02-10 02:17:06','Medical technology'),('0d375b05-5ef9-4d43-aaca-436762bb25bf','2024-02-10 02:17:06','2024-02-10 02:17:06','Besiness Technology'),('12e9ccb4-03e4-4f82-ac3d-4fc7e3ebfbfe','2024-02-10 02:17:06','2024-02-10 02:17:06','Artificial Intelligence'),('1e0f976d-beef-497b-b29c-b4a25d1c071a','2024-02-10 02:17:06','2024-02-10 02:17:06','Educational Technology'),('20f281b1-2cd1-4e36-a7c7-d1062ff16bcd','2024-02-10 02:17:06','2024-02-10 02:17:06','Gaming'),('28ff856a-2cfb-44df-91b8-1285914553c8','2024-02-10 02:17:06','2024-02-10 02:17:06','Biotechnology');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `article_id` varchar(60) NOT NULL,
  `category_id` varchar(60) NOT NULL,
  PRIMARY KEY (`article_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `article_category_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `article_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--
LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES ('02d9a2b5-7dca-423f-8406-707bc76abf7e','12e9ccb4-03e4-4f82-ac3d-4fc7e3ebfbfe','1721b75c-e0b2-46ae-8dd2-f86b62fb46e6','1e0f976d-beef-497b-b29c-b4a25d1c071a','0675a2d6-f64c-4be7-9a8a-f55341f09d4b','20f281b1-2cd1-4e36-a7c7-d1062ff16bcd');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(500) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` Text NOT NULL,
  `author` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--



INSERT INTO `articles` VALUES ('02d9a2b5-7dca-423f-8406-707bc76abf7e','2024-02-10 02:17:06','2024-02-10 02:17:06','Navigating the Promise and Perils of Artificial Intelligence','00a11245-12fa-436e-9ccc-967417f8c30a','Artificial Intelligence (AI) stands at the forefront of technological innovation, offering remarkable capabilities that have the potential to reshape industries and society as a whole. With its capacity to process vast amounts of data and uncover intricate patterns, AI enables advancements in fields ranging from healthcare and finance to transportation and entertainment. However, alongside its promise comes the imperative to address ethical and societal implications, including concerns regarding data privacy, algorithmic bias, and the future of work. As AI continues to evolve, it is essential to prioritize responsible development and deployment practices, ensuring that these technologies benefit humanity while upholding principles of fairness, transparency, and accountability.','Hafsa Daoudim'),('1721b75c-e0b2-46ae-8dd2-f86b62fb46e6','2024-02-10 02:17:06','2024-02-10 02:17:06','Opus: Revolutionizing Accessibility in Multimedia Content','150e591e-486b-48ee-be42-4aecba665020','Opus, the captions website, stands as a testament to the power of technology in fostering inclusivity and accessibility for all. With its innovative platform, Opus revolutionizes the way individuals engage with multimedia content by providing accurate and timely captions. These captions not only enhance comprehension for the hearing impaired but also enrich the overall viewing experience for all users. Through its commitment to excellence and user-centric design, Opus bridges the gap between content creators and audiences, paving the way for a more inclusive digital landscape.','Khaoula Ouajaa'),('0675a2d6-f64c-4be7-9a8a-f55341f09d4b','2024-02-10 02:17:06','2024-02-10 02:17:06','Empowering Creativity and collaboration in Game Development','150e591e-486b-48ee-be42-4aecba665020','In an age defined by technological advancement, artificial intelligence (AI) emerges as a transformative force, reshaping industries and revolutionizing the way we interact with machines. From personalized recommendations on streaming platforms to autonomous vehicles navigating city streets, AI permeates our daily lives, augmenting human capabilities and driving unprecedented innovation. Behind the scenes, machine learning algorithms analyze vast datasets, extracting insights and powering applications that range from predictive analytics in healthcare to natural language processing in virtual assistants. However, as AI continues to evolve, questions surrounding ethics, privacy, and bias loom large, prompting conversations about responsible development and regulation. Despite these challenges, the potential of AI to tackle complex problems and unlock new opportunities remains undeniable, positioning it as a cornerstone of the digital age.','Karla Svanovska');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('00a11245-12fa-436e-9ccc-967417f8c30a','2024-02-10 02:17:06','2024-02-10 02:17:06','noemail6@gmail.com','pwd6'),('00e93fc3-53ff-4da4-8e72-faa5216f81bb','2024-02-10 02:17:06','2024-02-10 02:17:06','noemail28@gmail.com','pwd28'),('150e591e-486b-48ee-be42-4aecba665020','2024-02-10 02:17:06','2024-02-10 02:17:06','noemail23@gmail.com','pwd23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



