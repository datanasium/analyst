-- Data Analyst Bootcamp
--- AlexTheAnalyst/SQL-Code

/* == BASIC ==*/
DROP DATABASE IF EXISTS SQLTutorial;

CREATE DATABASE SQLTutorial;


--Table 1 Query:
CREATE TABLE EmployeeDemographics 
(EmployeeID INT, 
FirstName VARCHAR(50), 
LastName VARCHAR(50), 
Age INT, 
Gender VARCHAR(50)
);


--Table 2 Query:
CREATE TABLE EmployeeSalary 
(EmployeeID INT, 
JobTitle VARCHAR(50), 
Salary INT
);


---Table 1 Insert:
INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')
;


--Table 2 Insert:
INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)
;



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (5) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
FROM [SQLTutorial].[dbo].[EmployeeDemographics]
;


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * 
FROM [SQLTutorial].[dbo].[EmployeeDemographics];


SELECT DISTINCT Gender 
FROM [SQLTutorial].[dbo].[EmployeeDemographics];


SELECT TOP 5 * 
FROM [SQLTutorial].[dbo].[EmployeeDemographics];


SELECT MAX(Salary)  
FROM [SQLTutorial].[dbo].[EmployeeSalary];


SELECT MIN(Salary)  
FROM [SQLTutorial].[dbo].[EmployeeSalary];


SELECT AVG(Salary)  
FROM [SQLTutorial].[dbo].[EmployeeSalary];


SELECT COUNT(Salary)  
FROM [SQLTutorial].[dbo].[EmployeeSalary];


SELECT * 
FROM [SQLTutorial].[dbo].[EmployeeDemographics]
WHERE Age <=32 AND Gender = 'Male'
;


SELECT * FROM [SQLTutorial].[dbo].[EmployeeDemographics]
WHERE Age <=32 OR Gender = 'Male'
;


SELECT * 
FROM [SQLTutorial].[dbo].[EmployeeDemographics]
WHERE LastName LIKE 'S%c%ott%'
;


--SYNTAX: IS NULL/NOT NULL 
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL
;


SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL
;


--SYNTAX:IN
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim','Michael')
;


--SYNTAX: GROUP BY, ORDER BY
SELECT Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age>31
GROUP BY Gender
ORDER BY CountGender DESC
;


SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender 
; 


SELECT *
FROM EmployeeDemographics
ORDER BY 1,3 DESC, 5
;


/* == INTERMEDIATE ==*/
--SYNTAX: JOINS (Full/Left/Right/Outer Joins)
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN  SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'MIchael'
;


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;  


SELECT JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
;  


SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle
;  


SELECT JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName = 'Michael' 
;  


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
;

---Table 1 Insert:
INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

---Table 3 Query:
CREATE TABLE WareHouseEmployeeDemographics 
(EmployeeID INT, 
FirstName VARCHAR(50), 
LastName VARCHAR(50), 
Age INT, 
Gender VARCHAR(50)
)
;


---Table 3 Insert:
INSERT INTO WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', 45, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')
;


--SYNTAX: UNION
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION 
SELECT * 
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics 
;


--SYNTAX: UNION ALL
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT * 
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics 
ORDER BY EmployeeID
;


--- Ensure data columns are the same
SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID
;


--SYNTAX: CASE STATEMENTS
SELECT FirstName, LastName, Age,
CASE 
  WHEN Age = 30 THEN 'Yuppy'
  WHEN Age > 30 THEN 'Old'
  WHEN Age BETWEEN 27 AND 30 THEN 'Young'
  ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age
;



SELECT FirstName, LastName, JobTitle, Salary,
CASE 
  WHEN JobTitle = 'Salaesman' THEN Salary + (Salary * 0.10) 
  WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05) 
  WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.000001) 
  ELSE Salary + (Salary * 0.03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY JobTitle
;



--SYNTAX: HAVING CLAUSE
SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1 
ORDER BY COUNT(JobTitle)
;

SELECT JobTitle, AVG(Salary) 'AVG(Salary)'
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)
;


--SYNTAX: HAVINGS vs GROUP BY STATEMENT
SELECT JobTitle, AVG(Salary) 'AVG(Salary)'
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
  ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(Salary)
;


--SYNTAX: UPDATING/DELETING DATA
UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012, Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'
;


UPDATE SQLTutorial.dbo.EmployeeDemographics
SET  Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012
;


DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005
;


-- To prevent error in deletion use SELECT to show what will be deleted.
-- Deletion is not reversible
SELECT * 
FROM  SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1002
;


-- Now delete the record
DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1002
;


--SYNTAX: ALIASES
SELECT FirstName + ' ' + LastName AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics
;


SELECT AVG(Age) AS 'Avg(Age)'
FROM SQLTutorial.dbo.EmployeeDemographics
;

SELECT Demo.EmployeeID
FROM SQLTutorial.dbo.EmployeeDemographics Demo 
JOIN EmployeeSalary Sal 
  ON Demo.EmployeeID = Sal.EmployeeID
;


SELECT Demo.EmployeeID, Demo.FirstName, Sal.JobTitle, Ware.Age
FROM SQLTutorial.dbo.EmployeeDemographics Demo 
LEFT JOIN SQLTutorial.dbo.EmployeeSalary Sal 
  ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics Ware  
  ON Demo.EmployeeID = Ware.EmployeeID
;



--SYNTAX: PARTITION BY
SELECT FirstName, LastName, Gender, Salary
  ,COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics dem
LEFT JOIN SQLTutorial.dbo.EmployeeSalary sal
  ON dem.EmployeeID = sal.EmployeeID
;


SELECT FirstName, LastName, Gender, Salary, 
ROW_NUMBER() OVER (ORDER BY FirstName) AS row_num
FROM SQLTutorial.dbo.EmployeeDemographics dem
LEFT JOIN SQLTutorial.dbo.EmployeeSalary sal
  ON dem.EmployeeID = sal.EmployeeID
;




--SYNTAX: DATA TYPES

--SYNTAX: CREATIGN VIEWS



--SYNTAX: GETDATE()

--SYNTAX: PRIMARY KEY

--SYNTAX: FOREIGN KEY



/* == ADVANCED == */

--SYNTAX: CTEs
-- Use to manipulate complex subqueries data
-- Acts like subqueries
-- Temporary

WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM SQLTutorial..EmployeeDemographics emp 
JOIN SQLTutorial.. EmployeeSalary sal 
  ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
SELECT * FROM CTE_Employee
;

--SYNTAX: TEMP TABLES
CREATE TABLE #temp_Employee (
  EmployeeID int,
  JobTitle varchar(100),
  Salary int
)
;

SELECT * 
FROM #temp_Employee
;

INSERT INTO #temp_Employee VALUES(
  '1001', 'HR', '45000'
)
;

INSERT INTO #temp_Employee
SELECT *
FROM SQLTutorial..EmployeeSalary
;


DROP TABLE IF EXISTS #temp_Employee_2 -- This help to prevent Store Procedure error
CREATE TABLE #temp_Employee_2 (
  JobTitle varchar(50),
  EmployeesPerJob int,
  AvgAge int,
  AvgSalary int
)

INSERT INTO #temp_Employee_2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
  ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle 

SELECT * 
FROM #temp_Employee_2
;




--SYNTAX: STRING FUNCTIONS (TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER)

--Drop Table EmployeeErrors;
DROP TABLE IF EXISTS EmployeeErrors;

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 

	

-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- Using Substring

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors

--SYNTAX: SYS TABLES

--SYNTAX: SUBQUERIES




--SYNTAX: REGEX (REGULAR EXPRESSION)

--SYNTAX: STORED PROCEDURE

--SYNTAX: IMPORTING DATA FROM DIFFERENT FILE TYPES/SOURCES

--SYNTAX: EXPORTING DATA TO DIFFERENT FILE TYPES


