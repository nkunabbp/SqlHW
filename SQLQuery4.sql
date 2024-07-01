/* Database Employees */
USE Employees
/* 1. Получить empid, firstname, lastname, country, region, city всех работников из USA.			  
SELECT [BusinessEntityID], [FirstName], [LastName] , [CountryRegionName] , [StateProvinceName] , [City]
FROM Employees
WHERE [CountryRegionName] LIKE N'United States'*/

/* 2. Получить количество работников по каждой специальности.										  
SELECT [JobTitle] , COUNT([JobTitle]) As EmployeesCount
FROM Employees
GROUP BY JobTitle*/

/* 3. Посчитать сколько людей на каждое имя.														  
SELECT FirstName , COUNT(FirstName) As NamesCount
FROM Employees
GROUP BY FirstName*/

/* 4. Получить самое распространенное имя.															 
SELECT TOP(1) FirstName , COUNT(FirstName) As NamesCount
FROM Employees
GROUP BY FirstName 
ORDER BY NamesCount Desc*/	

/* 5. Получить наименее распространенное имя.												 	  
SELECT TOP(188) FirstName , COUNT(FirstName) As NamesCount
FROM Employees
GROUP BY FirstName 
ORDER BY NamesCount*/

/* 6. Получить топ 5 городов, где больше всего работников.											  
SELECT TOP(5) City , COUNT(City) As EmpliyeesCount
FROM Employees
GROUP BY City 
ORDER BY EmpliyeesCount Desc*/

/* 7. Получить топ 5 городов, в которых больше всего уникальных специальностей.					  
SELECT TOP(5) City , COUNT(DISTINCT [JobTitle]) As JobCount 
FROM Employees
GROUP BY City 
ORDER BY JobCount DESC*/	

/* 8. Выдать почтовые адреса для email-рассылки всем работникам, которые начали работать с 1/01/2012. 
SELECT FirstName, [AddressLine2], [EmailAddress], [StartDate] 
FROM Employees
WHERE [StartDate] > '01.01.2012'

UPDATE Employees
SET [AddressLine2] = 1*/

/* 9. Выдать статистику в каком году сколько работников было нанято.								  
SELECT YEAR([StartDate]) AS HireDate , COUNT([BusinessEntityID]) AS HiredEmployeesCount
FROM Employees
GROUP BY YEAR([StartDate])
ORDER BY HireDate*/

/* 10. Выдать статистику в каком году сколько работников по каким странам было нанято.				  
SELECT YEAR([StartDate]) AS HireDate , COUNT([BusinessEntityID]) AS HiredEmployeesCount , [CountryRegionName]
FROM Employees
GROUP BY YEAR([StartDate]) , [CountryRegionName]
ORDER BY HireDate , HiredEmployeesCount DESC*/
/* 11. Обновить таблицу Employees добавив данные из таблицы History в колонку EndDate.				  
UPDATE Employees
SET EndDate = H.EndDate , StartDate = H.StartDate
FROM Employees E , History H
WHERE E.[BusinessEntityID] = H.[BusinessEntityID]*/
/* 12. Выдать статистику сколько работников в какой год уволилось.									  
SELECT YEAR([EndDate]) AS FireYear, COUNT(*) AS ResignedEmployeesCount , EndDate
FROM Employees
WHERE EndDate IS NOT NULL
GROUP BY EndDate 
ORDER BY FireYear  , ResignedEmployeesCount DESC*/

/* 13. Выдать количество работников, которые проработали меньше года.								  
SELECT COUNT(*) AS EmployeesCount , FirstName , LastName
FROM Employees
WHERE DATEDIFF(MONTH , StartDate , EndDate) < 12 
GROUP BY FirstName , LastName*/
