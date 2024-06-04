use Northwind

--Lesson tries
SELECT TOP 5 PERCENT ProductName FROM Products
ORDER BY ProductName DESC


select * from Customers
where ContactName like '%o[w-z]%'

--Practices
--Easy: Retrieve the first 5 products from the Products table.
SELECT TOP(5) * FROM Products

--Easy: Retrieve all customers whose contact name contains the substring "Maria".
SELECT * FROM Customers
WHERE ContactName LIKE 'Maria%'

--Medium: Retrieve all employees who are in the 'Sales' or 'Marketing' departments.
SELECT * FROM Employees
WHERE Title LIKE 'Sales%' OR Title LIKE 'Marketing%'

--Medium: Retrieve all orders with a Freight charge between $50 and $200.
SELECT * FROM Orders
WHERE Freight BETWEEN 50 AND 200
ORDER BY Freight

--Hard: Retrieve the top 10 most expensive products.
SELECT TOP(10)* FROM Orders
ORDER BY Freight DESC

--Hard: Retrieve all employees who were hired between January 1, 1992, and December 31, 1995.
SELECT * FROM Employees
WHERE HireDate BETWEEN '1992-01-01' AND '1995-12-31'

--Easy: Retrieve all products ordered by ProductName in ascending order.
SELECT * FROM Products
ORDER BY ProductName

--Easy: Retrieve all customers located in 'Berlin' who have postal codes starting with '1'.
SELECT * FROM Customers
WHERE City = 'Berlin' AND PostalCode LIKE '1%'

--Medium: Retrieve all employees who are either in the 'Sales Representative' position or have been hired after January 1, 1995.
SELECT * FROM Employees
WHERE Title = 'Sales Representative' OR HireDate > '1995-01-01'

--Medium: Retrieve all orders ordered by OrderDate in descending order.
SELECT * FROM Orders
ORDER BY OrderDate DESC

--Hard: Retrieve all products that have a UnitPrice between $20 and $50 and a UnitsInStock greater than 100.
SELECT * FROM Products
WHERE UnitPrice BETWEEN 20 and 500 AND UnitsInStock > 100

--Hard: Retrieve all suppliers who are either located in 'Tokyo' or whose company name starts with 'Exotic'.
SELECT * FROM Suppliers
WHERE City = 'Tokyo' OR CompanyName LIKE  'Exotic%'

--Hard: Retrieve the top 10 customers who are either from 'London' or 'Paris' and order them by CompanyName in ascending order.
SELECT TOP(10) * FROM Customers
WHERE City = 'London' OR City = 'Paris'
ORDER BY CompanyName

--Easy: Retrieve the top 10% of products with the highest UnitPrice.
SELECT TOP 10 PERCENT * FROM Products
ORDER BY UnitPrice DESC

--Medium: Retrieve the bottom 20% of products with the lowest UnitsInStock.
SELECT TOP 20 PERCENT * FROM Products
ORDER BY UnitsInStock

--Medium: Retrieve 30% of orders placed in the year 1996.
SELECT * FROM Orders
WHERE OrderDate LIKE '%1996%'

--Easy: Retrieve all products with NULL values in the ReorderLevel column.
SELECT * FROM Products
WHERE ReorderLevel = 0

--Easy: Retrieve all products with non-NULL values in the UnitsInStock column.
SELECT * FROM Products
WHERE UnitsInStock != 0

--Medium: Retrieve all products whose names start with 'C'.
SELECT * FROM Products
WHERE ProductName LIKE 'C%'

--Hard: Retrieve all products with a UnitsInStock less than or equal to 10.
SELECT * FROM Products
WHERE UnitsInStock <= 10

--Hard: Retrieve all customers from 'Berlin' who have postal codes starting with '1' or '2'.
SELECT * FROM Customers
WHERE City = 'Berlin' AND PostalCode LIKE '[1-2]%'

--Medium: Retrieve all products with a UnitPrice not equal to $10.
SELECT * FROM Products
WHERE UnitPrice != 10

--Medium: Retrieve all orders with a RequiredDate greater than or equal to '1997-07-01'.
SELECT * FROM Orders
WHERE RequiredDate >= '1997-07-01'

--Hard: Retrieve all products with a UnitsOnOrder less than 10.
SELECT * FROM Products
WHERE UnitsOnOrder < 10

--Hard: Retrieve all employees hired on or before '1994-01-01' who are not Sales Representatives.
SELECT * FROM Employees
WHERE HireDate >= '1994-01-01' AND Title != 'Sales Representative'

--Hard: Retrieve all orders placed between '1996-01-01' and '1996-03-31' that were shipped after '1996-04-15'.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-01-01' AND '1996-03-31' AND ShippedDate > '1996-04-15'
