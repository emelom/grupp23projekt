-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 14, 2018 at 12:45 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `studyHelper`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Availability`
--

CREATE TABLE `Availability` (
  `day` varchar(7) NOT NULL,
  `coachId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `day` varchar(7) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `studentId` int(11) NOT NULL,
  `coachId` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CoachSubjects`
--

CREATE TABLE `CoachSubjects` (
  `subjectName` varchar(255) NOT NULL,
  `helperId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Days`
--

CREATE TABLE `Days` (
  `name` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNr` int(20) NOT NULL,
  `studentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`name`, `email`, `password`, `phoneNr`, `studentId`) VALUES
('Louise', 'louise@wiljander.com', 'hej', 876, 1);

-- --------------------------------------------------------

--
-- Table structure for table `StudyCoach`
--

CREATE TABLE `StudyCoach` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `coachId` int(11) NOT NULL,
  `phoneNr` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Subjects`
--

CREATE TABLE `Subjects` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Availability`
--
ALTER TABLE `Availability`
  ADD KEY `dag` (`day`),
  ADD KEY `buddyID` (`coachId`);

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `dag` (`day`),
  ADD KEY `ämne` (`subject`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `buddyId` (`coachId`);

--
-- Indexes for table `CoachSubjects`
--
ALTER TABLE `CoachSubjects`
  ADD PRIMARY KEY (`subjectName`,`helperId`),
  ADD KEY `buddyId` (`helperId`);

--
-- Indexes for table `Days`
--
ALTER TABLE `Days`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `StudyCoach`
--
ALTER TABLE `StudyCoach`
  ADD PRIMARY KEY (`coachId`);

--
-- Indexes for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Booking`
--
ALTER TABLE `Booking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `studentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `StudyCoach`
--
ALTER TABLE `StudyCoach`
  MODIFY `coachId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Availability`
--
ALTER TABLE `Availability`
  ADD CONSTRAINT `Tillgänglighet_ibfk_1` FOREIGN KEY (`day`) REFERENCES `studybuddy`.`Dag` (`name`),
  ADD CONSTRAINT `Tillgänglighet_ibfk_2` FOREIGN KEY (`coachId`) REFERENCES `studybuddy`.`StudyBuddy` (`helperId`);

--
-- Constraints for table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `Bokning_ibfk_1` FOREIGN KEY (`day`) REFERENCES `studybuddy`.`Dag` (`name`),
  ADD CONSTRAINT `Bokning_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `studybuddy`.`Ämnen` (`name`),
  ADD CONSTRAINT `Bokning_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `studybuddy`.`Student` (`studentId`),
  ADD CONSTRAINT `Bokning_ibfk_4` FOREIGN KEY (`coachId`) REFERENCES `studybuddy`.`StudyBuddy` (`helperId`);

--
-- Constraints for table `CoachSubjects`
--
ALTER TABLE `CoachSubjects`
  ADD CONSTRAINT `BuddyÄmnen_ibfk_1` FOREIGN KEY (`subjectName`) REFERENCES `studybuddy`.`Ämnen` (`name`),
  ADD CONSTRAINT `BuddyÄmnen_ibfk_2` FOREIGN KEY (`helperId`) REFERENCES `studybuddy`.`StudyBuddy` (`helperId`);
