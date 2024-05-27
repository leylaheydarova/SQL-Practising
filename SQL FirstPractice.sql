use Northwind
--Retrieve all records from the Customers table:
SELECT * FROM Customers

--Select the names of all products:
SELECT ProductName FROM Products

--Get a list of all employees' first and last names:
SELECT FirstName, LastName FROM Employees

--Get the list of all customers in Germany:
SELECT * FROM Customers
WHERE Country = 'Germany'

--Retrieve all orders with a freight cost greater than 100:
SELECT * FROM Orders
WHERE Freight > 100

--List all employees who live in London:
SELECT * FROM Employees
WHERE City = 'London'

--Retrieve all categories:
SELECT CategoryName FROM Categories

--Get the names and contact titles of all suppliers:
SELECT 
	ContactName, 
	ContactTitle 
FROM 
	Suppliers


--Find orders that were shipped after January 1, 1997:
SELECT * FROM Orders
WHERE ShippedDate > '01-01-1997'

--Select all products with units in stock less than 20:
SELECT * FROM Products
WHERE UnitsInStock < 20

--Retrieve the order details for a specific order (e.g., OrderID = 10248):
SELECT * FROM Orders
WHERE OrderID = 10249

--Find the company names of all customers in France:
SELECT CompanyName FROM Customers
WHERE Country = 'France'

--Find the names of customers whose contact title is 'Owner':
--Find customers in Mexico:
--Retrieve all suppliers from the USA:
--Find all products with discontinued status:
--Get the names and phone numbers of customers in London:
--Select the products that need to be reordered (units on order greater than units in stock):
--Find all orders with a ship city of 'Paris':
--List all products that are not discontinued:
--Get orders with a freight cost less than 50:
--Find products with a stock quantity of exactly 0:
--Find orders placed on or after July 1, 1996:
--Get suppliers from Japan:
--Find products supplied by supplier ID 1: