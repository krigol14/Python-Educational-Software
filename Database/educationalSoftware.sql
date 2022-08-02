CREATE DATABASE  IF NOT EXISTS `educationalsoftware` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `educationalsoftware`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: educationalsoftware
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `chapter_stats`
--

DROP TABLE IF EXISTS `chapter_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter_stats` (
  `email` varchar(45) NOT NULL,
  `chapter_name` varchar(45) NOT NULL,
  `times_visited` int NOT NULL,
  `times_succeeded` int NOT NULL,
  `times_failed` int NOT NULL,
  PRIMARY KEY (`email`,`chapter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_stats`
--

LOCK TABLES `chapter_stats` WRITE;
/*!40000 ALTER TABLE `chapter_stats` DISABLE KEYS */;
INSERT INTO `chapter_stats` VALUES ('student@gmail.com','chapter1_gapFill',23,3,1),('student@gmail.com','chapter1_multipleChoice',143,15,13),('student@gmail.com','chapter1_tests',60,0,0),('student@gmail.com','chapter1_theory',77,0,0),('student@gmail.com','chapter1_trueOrFalse',34,3,4),('student@gmail.com','chapter2_gapFill',4,1,0),('student@gmail.com','chapter2_multipleChoice',3,1,0),('student@gmail.com','chapter2_tests',2,0,0),('student@gmail.com','chapter2_theory',24,0,0),('student@gmail.com','chapter2_trueOrFalse',8,3,3),('student@gmail.com','chapter3_theory',11,0,0),('student@gmail.com','chapter4_theory',11,0,0),('student@gmail.com','chapter5_tests',1,0,0),('student@gmail.com','chapter5_theory',9,0,0),('student@gmail.com','chapter6_theory',12,0,0),('student@gmail.com','chapter7_theory',12,0,0),('student@gmail.com','revisionTest',8,2,2),('student2@gmail.com','chapter1_gapFill',1,0,0),('student2@gmail.com','chapter1_multipleChoice',1,0,0),('student2@gmail.com','chapter1_theory',1,0,0),('student2@gmail.com','chapter1_trueOrFalse',1,0,0),('student2@gmail.com','chapter2_tests',1,0,0),('student2@gmail.com','chapter2_theory',1,0,0),('student2@gmail.com','chapter2_trueOrFalse',1,0,0),('student2@gmail.com','chapter4_theory',1,0,0),('student2@gmail.com','chapter5_theory',1,0,0),('student2@gmail.com','chapter6_theory',1,0,0),('student2@gmail.com','chapter7_theory',1,0,0);
/*!40000 ALTER TABLE `chapter_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter_tests`
--

DROP TABLE IF EXISTS `chapter_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter_tests` (
  `chapter_name` varchar(45) NOT NULL,
  `question` varchar(500) NOT NULL,
  `option1` varchar(45) DEFAULT NULL,
  `option2` varchar(45) DEFAULT NULL,
  `option3` varchar(500) DEFAULT NULL,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`chapter_name`,`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_tests`
--

LOCK TABLES `chapter_tests` WRITE;
/*!40000 ALTER TABLE `chapter_tests` DISABLE KEYS */;
INSERT INTO `chapter_tests` VALUES ('chapter1_gapFill','10mod3 in python, is calculated using the following command ......',' ',' ',' ','%'),('chapter1_gapFill','9mod2 in python is calculated using the following command ......',' ',' ',' ','%'),('chapter1_gapFill','Floor division in python, is accomplished by using the operator ......',' ',' ',' ','//'),('chapter1_gapFill','In order to ..... values 3 and 20, we use the operator +.',' ',' ',' ','add'),('chapter1_gapFill','In order to calculate the ..... between two numbers, the operator % is used.',' ',' ',' ','modulo'),('chapter1_gapFill','In order to to divide values 10 and 2, the operator ..... is used.',' ',' ',' ','/'),('chapter1_gapFill','The command print(50-5) will print ......',' ',' ',' ','45'),('chapter1_gapFill','The operator ..... is used to calculate the floor division of 10 and 3.',' ',' ',' ','//'),('chapter1_gapFill','The operator ..... is used to find the exponent of 10 into 2.',' ',' ',' ','**'),('chapter1_gapFill','The result of the following command: print(10.....5), is 2.',' ',' ',' ','/'),('chapter1_multipleChoice','Choose the correct command to print the result of the subtraction of 5 from 50: ','print(50-5)','print(50/5)','print(5--50)','print(50-5)'),('chapter1_multipleChoice','How to calculate 10mod3 in python?','10%3','3%10','10/3','10%3'),('chapter1_multipleChoice','How to calculate 9mod2 in python?','9%2','9mod2','9//2','9%2'),('chapter1_multipleChoice','Using which operator is floor division accomplished in python?','%%','//','^','//'),('chapter1_multipleChoice','Which is the result of the following command? print(10/5)','2','15','50','2'),('chapter1_multipleChoice','Which of the following commands will print the result 50?','print(10*5)','print(500//5)','print(10**5)','print(10*5)'),('chapter1_multipleChoice','Which operator should we use to add values 3 and 20?','+','/','%','+'),('chapter1_multipleChoice','Which operator should we use to divide values 10 and 2?','%','/','-','/'),('chapter1_multipleChoice','Which operator should we use to find the exponent of 10 into 2?','++','**','^','**'),('chapter1_multipleChoice','Which operator should we use to multiply values 5 and 10?','+','*','%','*'),('chapter1_trueOrFalse','10mod3 in python, is calculated using the following command: 9//2','True','False','The operator % is used in python in order to calculate the modulo','False'),('chapter1_trueOrFalse','9mod2 in python is calculated using the following command: 9%2.','True','False',' ','True'),('chapter1_trueOrFalse','Floor division in python, is accomplished by using the operator %%.','True','False','The operator // is used in python in order to calculate floor division between two values','False'),('chapter1_trueOrFalse','In order to add values 3 and 20, we use the operator *.','True','False','The operator + is used in python in order to add values','False'),('chapter1_trueOrFalse','In order to find the result of 10mod2, the operator % is used.','True','False',' ','True'),('chapter1_trueOrFalse','In order to to divide values 10 and 2, the operator / is used.','True','False',' ','True'),('chapter1_trueOrFalse','The command print(50-5) will print 10.','True','False','The command - in python is used to subtract values, so 50-5 equals 45','False'),('chapter1_trueOrFalse','The operator ** is used to find the exponent of 10 into 2.','True','False',' ','True'),('chapter1_trueOrFalse','The operator // is used to calculate the floor division of 10 and 3.','True','False',' ','True'),('chapter1_trueOrFalse','The result of the following command: print(10/5), is 2.','True','False',' ','True'),('chapter2_gapFill','..... has the same output as x=x|5.',' ',' ',' ','x=x|5'),('chapter2_gapFill','..... has the same output as y=y*10.',' ',' ',' ','y*=10'),('chapter2_gapFill','..... has the same result as x//=100.',' ',' ',' ','x=x//100'),('chapter2_gapFill','The command ..... will decrement x\'s value by 10.',' ',' ',' ','x=x-10'),('chapter2_gapFill','The command ..... will decrement y\'s value by 5.',' ',' ',' ','y-=5'),('chapter2_gapFill','The command ..... will have the same output as x=x-3.',' ',' ',' ','x-=3'),('chapter2_gapFill','The command ..... will have the same output as x=x+5.',' ',' ',' ','x+=5'),('chapter2_gapFill','The command ..... will multiply x by 20.',' ',' ',' ','x*=20'),('chapter2_gapFill','Writing ..... is the same as writing z-=3.',' ',' ',' ','z=z-3'),('chapter2_gapFill','Writing ..... is the same as writing z+=10.',' ',' ',' ','z=z+10'),('chapter2_multipleChoice','Choose the correct command to multiply x by 20.','x=x+20','x*=20','x=x&20','x*=20'),('chapter2_multipleChoice','Choose the correct option to to decrement y\'s value by 5.','y-=5','y*=5','y=y/5','y-=5'),('chapter2_multipleChoice','Choose the correct option to to increment x\'s value by 10.','x+=10','x*=10','x=x*10','x+=10'),('chapter2_multipleChoice','Which command will have the same output as x=x-3??','x-=3','x*=3',' x=x/3','x-=3'),('chapter2_multipleChoice','Which command will have the same output as x=x+5?','x+=5','x*=5',' x=5x','x+=5'),('chapter2_multipleChoice','Which command will have the same output as x=x|5?','x+=5','x|=5',' x=5x','x|=5'),('chapter2_multipleChoice','Which command will have the same output as y=y*10??','y+=10','y*=10','y*=100','y*=10'),('chapter2_multipleChoice','Which of the following commands will print the same result as x//=100?','x=x//100','x=x**100','x=x+100','x=x//100'),('chapter2_multipleChoice','Writing z=z-3 is the same as writing which of the following commands?','z-=3','z+=3','z/=3','z-=3'),('chapter2_multipleChoice','Writing z=z+10 is the same as writing which of the following commands?','z+=10','z-=10','x*=100','z+=10'),('chapter2_trueOrFalse','The command x-=3 will have the same output as x=x-3?','True','False',' ','True'),('chapter2_trueOrFalse','The command x&=20 will multiply x by 20.','True','False','*= is used in order to multiply a variable in python.','False'),('chapter2_trueOrFalse','The command x+=5 will have the same output as x=x+5?','True','False',' ','True'),('chapter2_trueOrFalse','The command x=x+10 willl decrement x\'s value by 10.','True','False','The operator += increments the variables value.','False'),('chapter2_trueOrFalse','The command y-=5 will decrement y\'s value by 5.','True','False','The operator -= decrements the variables value.','False'),('chapter2_trueOrFalse','Writing z=z-3 is the same as writing z-=3.','True','False',' ','True'),('chapter2_trueOrFalse','Writing z=z+10 is the same as writing z+=10.','True','False',' ','True'),('chapter2_trueOrFalse','x=x/5 has the same output as x=x|5.','True','False','x|=5 would have the same output.','False'),('chapter2_trueOrFalse','x=x%%100 has the same result as x//=100.','True','False','x=x/100 is the correct answer.','False'),('chapter2_trueOrFalse','y*=10 has the same output as y=y*10?','True','False',' ','True');
/*!40000 ALTER TABLE `chapter_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('student@gmail.com','11738E899EBBA08FB7FAA3E83779E175','Giannis','Gewrgiou'),('student2@gmail.com','358FDC30CA69253939307E67CAF26F25','Mixalis','Andreadis'),('student3@gmail.com','9CB5F12D51328E4FFDA333909FC2E954','Afroditi','Mirtakou');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-02 16:38:39
