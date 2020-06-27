-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2020 at 08:12 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codewithmd`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_num` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'demo', 'demo@gmail.com', '5656565656', 'This is fake msg', '2020-06-24 17:22:13'),
(2, 'Md M Aalam', 'mdaalam22@gmail.com', '9814732857', 'send my message please', '2020-06-24 17:23:04'),
(3, 'saad khan', 'me.saadkhan66@gmail.com', '9814732857', 'hello guys how are you', '2020-06-24 18:03:28'),
(4, 'khan', 'me.saadkhan66@gmail.com', '9814732857', 'This is test mesaage', '2020-06-24 18:33:05'),
(5, 'ziks', 'zikskhan143@gmail.com', '9814732857', 'send message from ziks id', '2020-06-25 16:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(4, 'What is Python? Executive Summary.Learn Python Easily', 'python-intro', 'Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. Python\'s simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.\r\n\r\nOften, programmers fall in love with Python because of the increased productivity it provides. Since there is no compilation step, the edit-test-debug cycle is incredibly fast. Debugging Python programs is easy: a bug or bad input will never cause a segmentation fault. Instead, when the interpreter discovers an error, it raises an exception. When the program doesn\'t catch the exception, the interpreter prints a stack trace. A source level debugger allows inspection of local and global variables, evaluation of arbitrary expressions, setting breakpoints, stepping through the code a line at a time, and so on. The debugger is written in Python itself, testifying to Python\'s introspective power. On the other hand, often the quickest way to debug a program is to add a few print statements to the source: the fast edit-test-debug cycle makes this simple approach very effective.', 'post-bg.jpg', '2020-06-27 13:15:52'),
(2, 'What Is Data Science? A Beginner’s Guide To Data Science.', 'second-post', 'As the world entered the era of big data, the need for its storage also grew. It was the main challenge and concern for the enterprise industries until 2010. The main focus was on building framework and solutions to store data. Now when Hadoop and other frameworks have successfully solved the problem of storage, the focus has shifted to the processing of this data. Data Science is the secret sauce here. All the ideas which you see in Hollywood sci-fi movies can actually turn into reality by Data Science. Data Science is the future of Artificial Intelligence. Therefore, it is very important to understand what is Data Science and how can it add value to your business.\r\n\r\nEdureka 2019 Tech Career Guide is out! Hottest job roles, precise learning paths, industry outlook & more in the guide. Download now.\r\nIn this blog, I will be covering the following topics.', 'post-bg.jpg', '2020-06-25 17:51:41'),
(3, 'How to Learn Machine Learning. A Guide for Beginner', 'third-post', 'Hello,Namaste and welcome!\r\n\r\nIn this guide, we\'re going to reveal how you can get a world-class machine learning education for free.\r\n\r\nYou don\'t need a fancy Ph.D in math. You don\'t need to be the world\'s best programmer. And you certainly don\'t need to pay $16,000 for an expensive \"bootcamp.\"\r\n\r\nWhether your goal is to become a data scientist, use ML algorithms as a developer, or add cutting-edge skills to your business analysis toolbox, you can pick up applied machine learning skills much faster than you might think.\r\n\r\n1. Are you a self-starter?\r\n\r\nDo you like to learn with hands-on projects? Are you driven and self-motivated? Can you commit to goals and see them through? If so, you\'ll love studying machine learning. You\'ll get to solve interesting challenges, tinker with fascinating algorithms, and build an incredibly valuable career skill.\r\n\r\n2. Are you tired of seeing expensive courses and bootcamps?\r\n\r\nWe are too... That\'s why we put together this guide of completely free resources anyone can use to learn machine learning. The truth is that most paid courses out there recycle the same content that\'s already available online for free. We\'ll pull back the curtains and reveal where to find them for yourself.\r\n\r\n3. Do you want a single page on the internet that will always be up-to-date?\r\n\r\nMachine learning is a rapidly evolving field. That makes it exciting to learn, but materials can become outdated quickly. We\'re going to update this page regularly with the best resources to learn machine learning.\r\n\r\nWe\'ve got a lot of great stuff you\'ll like, so let\'s dive right in!', 'post-bg.jpg', '2020-06-26 18:51:09'),
(5, 'What is Artificial Intelligence?How does it works?', 'artificial-intelligence', 'Artificial intelligence (AI) is wide-ranging branch of computer science concerned with building smart machines capable of performing tasks that typically require human intelligence. AI is an interdisciplinary science with multiple approaches, but advancements in machine learning and deep learning are creating a paradigm shift in virtually every sector of the tech industry. \r\nAt it\'s core, AI is the branch of computer science that aims to answer Turing\'s question in the affirmative. It is the endeavor to replicate or simulate human intelligence in machines.', 'post-bg.jpg', '2020-06-27 13:18:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
