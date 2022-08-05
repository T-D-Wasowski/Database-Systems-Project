-- By Tomasz Dawid Wasowski - w1684891 - Part B Queries SQL code

-- ##### Task 8 Query ################################################

-- Write a SQL query to retrieve a list of company codes 
-- and company names and for each company the number of staff that they employ, 
-- making sure that the header shows the number of employees in each company as "Number of Staff".

SELECT 
	c.w1684891_compCode AS 'Company Code', 
	c.w1684891_compName AS 'Company Name', 
	COUNT(s.w1684891_staffID) AS 'Number of Staff'
FROM w1684891_Company c JOIN w1684891_Staff s
ON (c.w1684891_compCode = s.w1684891_compCode)
GROUP BY c.w1684891_compCode;

-- ##### Task 9 Query ################################################



SELECT
	c.w1684891_compName AS 'Company Name', 
	s.w1684891_staffFullName AS 'Staff Name',
	s.w1684891_staffPosition AS 'Staff Position',
	o.w1684891_offerName AS 'Offer Name',
	o.w1684891_offerDescrip AS 'Offer Description'
FROM w1684891_Company c 
JOIN w1684891_Staff s
ON (c.w1684891_compCode = s.w1684891_compCode)
JOIN w1684891_Offer o
ON (c.w1684891_compCode = o.w1684891_compCode);

-- ALTERNATIVE

SELECT 
	c.w1684891_compName AS 'Company Name', 
	s.w1684891_staffFullName AS 'Staff Name',
	s.w1684891_staffPosition AS 'Staff Position',
	null AS 'Offer Name',
	null AS 'Offer Description'
FROM w1684891_Company c 
JOIN w1684891_Staff s
ON (c.w1684891_compCode = s.w1684891_compCode)
UNION
SELECT
	c.w1684891_compName AS 'Company Name',
	null AS 'Staff Name',
	null AS 'Staff Position',
	o.w1684891_offerName AS 'Offer Name',
	o.w1684891_offerDescrip AS 'Offer Description'
FROM w1684891_Company c
JOIN w1684891_Offer o
ON (c.w1684891_compCode = o.w1684891_compCode)
ORDER BY `Company Name`, `Staff Name` DESC;

	