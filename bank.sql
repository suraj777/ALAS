-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2018 at 04:43 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `adminname` varchar(10) NOT NULL,
  `adminpass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`adminname`, `adminpass`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `assets_id` int(4) NOT NULL,
  `userid` int(4) NOT NULL,
  `house_cost` float(9,2) DEFAULT NULL,
  `vehicle_cost` float(9,2) DEFAULT NULL,
  `vehicle_puchase_date` date DEFAULT NULL,
  `fd_cost` float(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`assets_id`, `userid`, `house_cost`, `vehicle_cost`, `vehicle_puchase_date`, `fd_cost`) VALUES
(1, 1005, 1234.00, 1234.00, '2017-12-24', 4564.00),
(2, 1005, 5000000.00, 50000.00, '2013-12-24', 50000.00),
(3, 1007, 5000000.00, 60000.00, '2016-12-23', 100000.00),
(4, 1005, 3000000.00, 45000.00, '2013-12-24', 90000.00),
(5, 1008, 6000000.00, 1111.00, '2014-11-23', 156000.00),
(7, 1012, 56500.00, 60100.00, '2014-12-25', 100000.00),
(12, 1013, 60000.00, 70000.00, '2013-11-22', 80000.00),
(13, 1013, 65413.00, 56423.00, '1998-12-25', 956232.00),
(16, 1012, 56000.00, 956899.00, '2014-12-25', 124568.00),
(17, 1007, 4500000.00, 48200.00, '2012-11-25', 100021.00),
(18, 1006, 4650000.00, 35000.00, '2012-11-25', 65000.00),
(20, 1014, 4650200.00, 23000.00, '2015-11-26', 68533.00),
(24, 1005, 0.00, 0.00, NULL, 0.00),
(25, 1015, 0.00, 0.00, NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `expenditure_details`
--

CREATE TABLE `expenditure_details` (
  `expenditure_id` int(4) NOT NULL,
  `userid` int(4) NOT NULL,
  `previous_loan` varchar(3) DEFAULT NULL,
  `previous_loan_amount` double(9,2) DEFAULT NULL,
  `loan_duration` int(2) DEFAULT NULL,
  `remaining_time_period` int(2) DEFAULT NULL,
  `emi` double(9,2) DEFAULT NULL,
  `pending_amount` double(9,2) DEFAULT NULL,
  `yearly_expenditure` double(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenditure_details`
--

INSERT INTO `expenditure_details` (`expenditure_id`, `userid`, `previous_loan`, `previous_loan_amount`, `loan_duration`, `remaining_time_period`, `emi`, `pending_amount`, `yearly_expenditure`) VALUES
(4, 1005, 'yes', 954564.00, 60, 25, 15000.00, 750000.00, 200000.00),
(6, 1007, 'yes', 1500000.00, 15, 60, 25000.00, 1000000.00, 200000.00),
(8, 1008, 'yes', 154235.00, 99, 6, 17000.00, 75000.00, 200000.00),
(10, 1012, 'Yes', 5466.00, 1, 1, 5700.00, 5700.00, 125423.00),
(15, 1013, 'yes', 124546.00, 36, 12, 5979.00, 10000.00, 200000.00),
(16, 1013, 'yes', 987654.00, 23, 14, 5432.00, 564231.00, 875623.00),
(21, 1006, 'Yes', 350000.00, 36, 12, 17000.00, 125000.00, 300000.00),
(23, 1014, 'Yes', 95600.00, 12, 7, 12000.00, 43000.00, 200000.00),
(27, 1005, NULL, 0.00, 0, 0, 0.00, 0.00, 0.00),
(28, 1015, NULL, 0.00, 0, 0, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `financial_details`
--

CREATE TABLE `financial_details` (
  `financial_id` int(4) NOT NULL,
  `userid` int(4) DEFAULT NULL,
  `nature_of_occupation` varchar(15) DEFAULT NULL,
  `employer_name` varchar(40) DEFAULT NULL,
  `total_experience` int(2) DEFAULT NULL,
  `designation` varchar(12) DEFAULT NULL,
  `yearly_income` double(10,2) DEFAULT NULL,
  `pan_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_details`
--

INSERT INTO `financial_details` (`financial_id`, `userid`, `nature_of_occupation`, `employer_name`, `total_experience`, `designation`, `yearly_income`, `pan_no`) VALUES
(24, 1005, 'employee', 'Cisco', 2, 'Engineer', 1156235.00, 'CCVPK235aA'),
(25, 1005, 'business', 'Travels', 2, 'Manager', 150000.00, 'DSFSD233A'),
(26, 1007, 'employee', 'CDAC', 1, 'Engineer', 500000.00, 'ASBNCKAS'),
(27, 1005, 'business', 'Dukaan', 5, 'Manager', 400000.00, 'ASADSFASA'),
(28, 1008, 'employee', 'Diploma', 2, 'Engineer', 1156235.00, 'ASDASDA'),
(30, 1012, 'Employee', 'CDAC', 2, 'Engineer', 1156235.00, 'ASDASD'),
(35, 1013, 'business', 'Kapdekadukaan', 2, 'MANAGER', 500000.00, 'ANCKSK123A'),
(36, 1013, 'employee', 'GovernmentOfIndia', 2, 'PROFESSOR', 845612.00, 'ASDFG1234G'),
(42, 1012, 'employee', 'Amazon', 5, 'MANAGER', 560000.00, 'ABCDE1234A'),
(43, 1007, 'Business', 'GarmentShop', 4, 'MANAGER', 540000.00, 'ABCDE1212A'),
(44, 1006, 'Employee', 'CGGaA', 4, 'ENGINEER', 650000.00, 'ASDASD1245'),
(46, 1014, 'Employee', 'MGM College', 4, 'MANAGER', 465000.00, 'POUIA1234A'),
(50, 1005, NULL, NULL, 0, NULL, 0.00, NULL),
(51, 1015, NULL, NULL, 0, NULL, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_details`
--

CREATE TABLE `loan_details` (
  `userid` int(11) NOT NULL,
  `loanType` varchar(15) DEFAULT 'Personal Loan',
  `loanAmount` float(9,2) DEFAULT NULL,
  `loanDuration` int(2) DEFAULT NULL,
  `loanRate` float(4,2) DEFAULT '12.50',
  `loanStatus` varchar(10) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_details`
--

INSERT INTO `loan_details` (`userid`, `loanType`, `loanAmount`, `loanDuration`, `loanRate`, `loanStatus`) VALUES
(1008, 'Home', 420000.00, 4, 15.00, 'Pending'),
(1012, 'Business', 56565.00, 12, 12.50, 'Pending'),
(1012, 'Business', 154512.00, 12, 12.50, 'Pending'),
(1012, 'Business', 50000.00, 10, 12.50, 'Pending'),
(1013, 'Business', 1649794.00, 8, 12.50, 'Pending'),
(1013, 'Business', 564863.00, 25, 12.50, 'Pending'),
(1012, 'Business', 123.00, 1, 12.50, 'Pending'),
(1012, 'Business', 65656.00, 1, 12.50, 'Pending'),
(1012, 'Business', 23151.00, 1, 12.50, 'Pending'),
(1012, 'Business', 13541.00, 1, 12.50, 'Pending'),
(1012, 'Business', 98565.00, 1, 12.50, 'Pending'),
(1007, 'Business', 250000.00, 6, 12.50, 'Approved'),
(1006, 'Personal', 125403.00, 3, 12.50, 'Pending'),
(1014, 'Business', 356000.00, 98, 12.50, 'Approved'),
(1005, 'Personal Loan', 0.00, 0, 12.50, 'Pending'),
(1015, 'Personal Loan', 0.00, 0, 12.50, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `personal_details`
--

CREATE TABLE `personal_details` (
  `reg_id` int(4) NOT NULL,
  `userid` int(4) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `mobileno` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_details`
--

INSERT INTO `personal_details` (`reg_id`, `userid`, `fname`, `mname`, `lname`, `gender`, `dob`, `address`, `city`, `pincode`, `state`, `emailid`, `mobileno`) VALUES
(11, 1005, 'vishal', 'Sunil', 'Kanade', 'male', '2017-12-23', 'saas', 'amravti', 400706, 'maharashtra', 'asa@asa.com', '980565978'),
(12, 1006, 'suraj', 'h', 'b', 'male', '2007-03-19', 'saas', 'nagpur', 400706, 'maharashtra', 'asa@asa.com', '123456'),
(14, 1005, 'Gaurav', 'G', 'Panghal', 'male', '1998-02-17', 'Noida', 'navimumbai', 400706, 'maharashtra', 'asa@asa.com', '980565978'),
(16, 1007, 'Hema', 'A', 'K', 'female', '2003-12-23', 'Pandharpur', 'amravti', 400650, 'maharashtra', 'hema@k.c', '9865486598'),
(17, 1005, 'Arshiya', 'A', 'Ansari', 'female', '2017-01-02', 'Mumbai', 'navimumbai', 400706, 'maharashtra', 'asa@asa.com', '9886655665'),
(18, 1008, 'Mayur', 'Vilas', 'Patil', 'male', '1992-07-07', 'Dombivili', 'navimumbai', 400071, 'maharashtra', 'asa@asa.com', '123456'),
(20, 1012, 'Tushar', 'Laxman', 'Mohate', 'Male', '1993-02-12', NULL, '-1', 400709, '-1', 'tushar555mohtate@gmail.com', '9029104648'),
(25, 1013, 'Nayan', 'Khatri', 'Khatri', 'male', '1994-11-25', NULL, 'navi mumbai', 400706, 'maharashtra', 'nayan@gmail.com', '1234567890'),
(26, 1013, 'Devendra', 'kahitari', 'Fadanvis', 'male', '1983-12-26', 'Mumbai ', 'navi mumbai', 415645, 'maharashtra', 'devendra.fadanvis@gmail.com', '9876543210'),
(27, 1013, 'Devendra', 'kahitari', 'Fadanvis', 'male', '1983-12-26', 'Mumbai ', 'navi mumbai', 415645, 'maharashtra', 'devendra.fadanvis@gmail.com', '9876543210'),
(28, 1013, 'Devendra', 'kahitari', 'Fadanvis', 'male', '1983-12-26', 'Mumbai ', 'navi mumbai', 415645, 'maharashtra', 'devendra.fadanvis@gmail.com', '9876543210'),
(29, 1013, 'Devendra', 'kahitari', 'Fadanvis', 'male', '1983-12-26', 'Mumbai ', 'navi mumbai', 415645, 'maharashtra', 'devendra.fadanvis@gmail.com', '9876543210'),
(32, 1012, 'Rohit', 'Bdasda', 'Khokle', 'male', '2018-01-01', 'Kuthla tari', 'nashik', 400555, 'maharashtra', 'devendra.fadanvis@gmail.com', '9805659780'),
(33, 1007, 'Atul', 'M', 'Malokar', 'Male', '2015-11-24', 'Yeola', 'Nashik', 400071, 'Maharashtra', 'atul@gmail.com', '1546215462'),
(34, 1006, 'Arshiya', 'A', 'Ansari', 'Female', '2000-11-25', 'Nerul', 'Navi mumbai', 411111, 'Maharashtra', 'arshiya@gmail.com', '123456'),
(36, 1014, 'Nikhil', 'Laxman', 'Jadhav', 'Male', '2012-11-26', 'Domb', 'Navi mumbai', 411123, 'Maharashtra', 'nj9@gmail.com', '1234568790'),
(40, 1005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(41, 1015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `userid` int(4) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `userpass` varchar(16) NOT NULL,
  `emailid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`userid`, `firstname`, `lastname`, `username`, `userpass`, `emailid`) VALUES
(1001, 'vishal', 'kanade', 'vishalk700', '123456890', 'vishalkanade700@gmail.com'),
(1005, 'vi', 'ka', 'vish', '1234', 'vishalkanade700@gmail.com'),
(1006, 'suraj', 'bhosale', 'suraj', '1234', 'suraj@b.c'),
(1007, 'Hema', 'K', 'hema', '1234', 'hema@k.c'),
(1008, 'Mayur', 'Patil', 'mayur', '1234', 'mayurpatil@gmail.com'),
(1012, 'Tushar', 'Mohate', 'tushar', '1234', 'tushar555mohate@gmail.com'),
(1013, 'Nayan', 'Khatri', 'nayan', '1234', 'nayan@gmail.com'),
(1014, 'Nikhil', 'Jadhav', 'nj9', '1234', 'nikhil@gmail.com'),
(1015, 'Amita', 'Vighe', 'amita', '1234', 'amitavighe@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`assets_id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `expenditure_details`
--
ALTER TABLE `expenditure_details`
  ADD PRIMARY KEY (`expenditure_id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `financial_details`
--
ALTER TABLE `financial_details`
  ADD PRIMARY KEY (`financial_id`),
  ADD UNIQUE KEY `pan_no` (`pan_no`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `assets_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `expenditure_details`
--
ALTER TABLE `expenditure_details`
  MODIFY `expenditure_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `financial_details`
--
ALTER TABLE `financial_details`
  MODIFY `financial_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `personal_details`
--
ALTER TABLE `personal_details`
  MODIFY `reg_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `userid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`);

--
-- Constraints for table `expenditure_details`
--
ALTER TABLE `expenditure_details`
  ADD CONSTRAINT `expenditure_details_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`);

--
-- Constraints for table `financial_details`
--
ALTER TABLE `financial_details`
  ADD CONSTRAINT `financial_details_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`);

--
-- Constraints for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD CONSTRAINT `personal_details_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
