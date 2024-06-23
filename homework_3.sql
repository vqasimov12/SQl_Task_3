--/ * Database Employees * /
--/ * 1. Get empid, firstname, lastname, country, region, city of all employees from USA. * /
--/ * 2. Get the number of employees for each specialty. * /
--/ * 3. Count the number of people for each name. * /
--/ * 4. Get the most common name. * /
--/ * 5. Get the least common name. * /
--/ * 6. Get the top 5 cities where the most workers are. * /
--/ * 7. Get the top 5 cities, which have the most unique specialties. * /
--/ * 8. Issue mailing addresses for emailing to all employees who started working on 1/01/2012. * /
--/ * 9. Issue statistics in what year how many employees were employed. * /
--/ * 10. Issue statistics in which year how many workers in which countries were employed. * /
--/ * 11. Refresh the Employees table by adding data from the History table to the EndDate column. * /
--/ * 12. Issue statistics on how many employees in which year they left. * /
--/ * 13. Issue the number of employees who have worked less than a year. * /

Use Employees

--Task 1


--SELECT  BusinessEntityID AS empid,FirstName AS firstname,LastName AS lastname, CountryRegionName AS region, City AS city
--FROM Employees
--WHERE CountryRegionName  LIKE 'United States'



--Task 2

--SELECT COUNT(*),JobTitle AS  SPECIALITY
--FROM Employees
--GROUP BY [JobTitle]


--TASK 3

--SELECT COUNT(*),FirstName AS  [NAME]
--FROM Employees
--GROUP BY  FirstName



--TASK 4


--SELECT TOP(1) COUNT(*) AS [COUNT],FirstName AS  [NAME]
--FROM Employees
--GROUP BY  FirstName
--ORDER BY [COUNT] DESC



--TASK 5



--SELECT TOP(1) COUNT(*) AS [COUNT],FirstName AS  [NAME]
--FROM Employees
--GROUP BY  FirstName
--ORDER BY [COUNT] 



--TASK 6


--SELECT TOP(5) COUNT(*) AS [COUNT],City
--FROM Employees 
--GROUP BY City 
--ORDER BY [COUNT] DESC


--TASK 7


--SELECT TOP(5) COUNT(*) AS [COUNT],CITY
--FROM Employees
--GROUP BY CITY ,JobTitle
--ORDER BY [COUNT] DES


--TASK 8


--SELECT *
--FROM Employees
--WHERE DATEDIFF(DAY, '20120101', StartDate)=0



--TASK 9

--SELECT COUNT(*) ,YEAR(StartDate) AS [YEAR]
--FROM Employees 
--GROUP BY YEAR(StartDate)



--TASK 10

--SELECT COUNT(*) ,YEAR(StartDate) AS [YEAR],CountryRegionName AS COUNTRY
--FROM Employees 
--GROUP BY CountryRegionName,  YEAR(StartDate)



--TASK 11
--UPDATE Employees
--SET EndDate = (
--    SELECT TOP (1) EndDate
--    FROM History
--    WHERE Employees.BusinessEntityID = History.BusinessEntityID
--    ORDER BY EndDate DESC
--)


--  TASK 12

--SELECT COUNT(*) AS [COUNT] ,YEAR(EndDate) AS [YEAR]
--FROM Employees 
--GROUP BY  YEAR(EndDate)


--TASK 13
SELECT FirstName,PhoneNumber 
FROM Employees
WHERE DATEDIFF(YEAR,StartDate,EndDate)<1