-- By Tomasz Dawid Wasowski - w1684891 - Part B Table Creation and Data Insertion SQL code

-- ##### DROP TABLES ################################################

-- Drop tables if the already exist (drops child tables first)
DROP TABLE IF EXISTS w1684891_Staff;
DROP TABLE IF EXISTS w1684891_Offer;
DROP TABLE IF EXISTS w1684891_Company;

-- ##### CREATE TABLES ##############################################

-- Create the w1684891_Company table

CREATE TABLE w1684891_Company (

	w1684891_compCode INT(6),
	w1684891_compName VARCHAR(50) UNIQUE NOT NULL,
	w1684891_compDescrip VARCHAR(250) NOT NULL,
	
	CONSTRAINT w1684891_c_compCode_pk PRIMARY KEY (w1684891_compCode)

);

-- Create the w1684891_Staff table

CREATE TABLE w1684891_Staff (

	w1684891_staffId INT(6),
	w1684891_staffFullName VARCHAR(50) NOT NULL,
	w1684891_staffPosition VARCHAR(50) NOT NULL,
	w1684891_staffEmail VARCHAR(50) UNIQUE NOT NULL,
	w1684891_compCode INT(6) NOT NULL,
	
	CONSTRAINT w1684891_s_staffId_pk PRIMARY KEY (w1684891_staffId),
	CONSTRAINT w1684891_s_compCode_fk FOREIGN KEY (w1684891_compCode) 
	REFERENCES w1684891_Company(w1684891_compCode)

);

-- Create the w1684891_Offer table

CREATE TABLE w1684891_Offer (

	w1684891_offerCode INT(8),
	w1684891_offerName VARCHAR(50) NOT NULL,
	w1684891_offerDescrip VARCHAR(250) NOT NULL,
	w1684891_offerDeadline DATE NOT NULL,
	w1684891_offerStartDate DATE NOT NULL,
	w1684891_compCode INT(6) NOT NULL,
	
	CONSTRAINT w1684891_o_offerCode_pk PRIMARY KEY (w1684891_offerCode),
	CONSTRAINT w1684891_o_compCode_fk FOREIGN KEY (w1684891_compCode) 
	REFERENCES w1684891_Company(w1684891_compCode)

);

-- ##### INSERT DATA ################################################

-- Insert data into w1684891_Company table

INSERT INTO 
w1684891_Company (
	w1684891_compCode, 
	w1684891_compName, 
	w1684891_compDescrip
) VALUES 
(000123, 'InstaFlex', 'Global producer of plastics that flex instantly'),
(000124, 'GigaBrainz', 'International consulting company; hires only the brainiest'),
(000125, 'BasicallyPrawns', 'World-wide leading prawn mongers');

-- Insert data into w1684891_Staff table

INSERT INTO
w1684891_Staff (
	w1684891_staffId, 
	w1684891_staffFullName, 
	w1684891_staffPosition, 
	w1684891_staffEmail, 
	w1684891_compCode
) VALUES 
(002245, 'Jerry Jackson', 'Tensile Flexibility Tester', 'jerryJaaaay@flex.com', 000123),
(002246, 'Stacy Stevens', 'Tensile Flexibility Manager', 'stacysMum@flex.com', 000123),
(012345, 'Goobie Wobble', 'International Brain Harvester', 'gWobbz@braaains.co.uk', 000124),
(054321, 'Bubba Gump', 'Chief Prawnster', 'bubGWizzle@prawns.de', 000125);

-- Insert data into w1684891_Offer table

INSERT INTO
w1684891_Offer (
	w1684891_offerCode,
	w1684891_offerName,
	w1684891_offerDescrip,
	w1684891_offerDeadline,
	w1684891_offerStartDate,
	w1684891_compCode
) VALUES 
(88882212, 'Corporate Prawn Consumer', 'We need someone to proffesionally consume prawns',
'2020-12-20', '2021-01-12', 000125),
(88882213, 'Ultimate Hive Mind', 'Looking for the biggest brain',
'2020-12-19', '2021-02-08', 000124),
(88882214, 'Chief Flexinator', 'Need someone to flex in a chiefly manner',
'2021-01-01', '2021-03-22', 000123),
(88882215, 'Adquate Brain Processor', 'Looking for candidate to adequately process brains',
'2020-11-29', '2020-12-12', 000124),
(88882216, 'Head Prawn Muncher', 'Searching for someone that has a head and can munch prawns',
'2021-03-21', '2021-04-01', 000125);