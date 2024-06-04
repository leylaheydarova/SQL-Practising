use Northwind

--Task 1: Count Orders by Customer
--Write a query to count the number of orders placed by each customer, showing only those customers who have placed more than 5 orders.
SELECT 
	CustomerID
FROM 
	Orders
GROUP BY 
	CustomerID
HAVING 
	COUNT(OrderID) > 5


--Task 2: Total Quantity Sold by Product
--Write a query to find the total quantity of each product sold, showing only those products that have sold more than 100 units.
SELECT
	ProductID, SUM(Quantity) AS [TotalQuantity]
FROM
	[Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) > 100
ORDER BY TotalQuantity


--Task 3: Number of Products in Each Category
--Write a query to count the number of products in each category, showing only those categories with more than 10 products.
SELECT 
	CategoryID, COUNT(ProductID) AS [TotalProductsOfCategory]  
FROM 
	Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 10


--Task 4: Average Unit Price of Products
--Write a query to find the average unit price of products, showing only those categories with an average unit price greater than $20.
SELECT 
	CategoryID, AVG(UnitPrice) AS [AverageOfPriceofEachCategory] 
FROM 
	Products
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 20


--Task 5: Total Freight by Shipper
--Write a query to find the total freight charges handled by each shipper, showing only those shippers with total freight charges exceeding $500.
SELECT ShipVia, SUM(Freight) AS [TotalCost]
FROM Orders
GROUP BY ShipVia
HAVING SUM(Freight) < 500

--Task 6: Total Sales by Customer
--Write a query to find the total sales amount for each customer, showing only those customers with total sales greater than $1000.
SELECT CustomerID, SUM(UnitPrice*Quantity) AS [Price]
FROM Orders o
JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY CustomerID
HAVING SUM(UnitPrice*Quantity) > 1000

--Task 7: Average Order Quantity by Product
--Write a query to find the average order quantity for each product, showing only those products with an average order quantity greater than 10.
SELECT 
	ProductID, AVG(Quantity) AS [AverageQuantity]
FROM 
	[Order Details]
GROUP BY ProductID
HAVING AVG(Quantity) > 10


--Task 8: Total Sales by Employee
--Write a query to find the total sales amount for each employee, showing only those employees with total sales greater than $5000.
SELECT 
	EmployeeID, SUM(Freight) AS [TotalSales]
FROM 
	Orders
GROUP BY EmployeeID
HAVING SUM(Freight) > 5000

--Task 9: Average Discount by Product
--Write a query to find the average discount given on each product, showing only those products with an average discount greater than 5%.
SELECT 
	ProductID, AVG(Discount) AS [AverageDiscount]
FROM [Order Details]
GROUP BY ProductID
HAVING AVG(Discount) > AVG(Discount)*0.05

--Task 10: Count Orders by Employee
--Write a query to count the number of orders handled by each employee, showing only those employees who have handled more than 50 orders.
SELECT 
	EmployeeID, COUNT(OrderID) AS [TotalCountOfOrders]
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) > 10

--Task 11: Monthly Sales by Year
--Write a query to find the total sales amount for each month of each year, showing only those months with total sales greater than $10000.
SELECT 
MONTH(OrderDate) AS [Month], 
YEAR(OrderDate) AS [Year], 
SUM(Freight*Quantity) AS [Price]
FROM 
Orders o
jOIN
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY MONTH(OrderDate), YEAR(OrderDate)
HAVING SUM(Freight*Quantity) > 10000
ORDER BY Price

SELECT * FROM Orders
SELECT * FROM [Order Details]
--Task 12: Average Order Value by Year
--Write a query to find the average order value for each year, showing only those years with an average order value greater than $500.


--Task 13: Total Quantity Sold by Year
--Write a query to find the total quantity of products sold each year, showing only those years with total quantity sold greater than 1000 units.


--Task 14: Total Freight by Country
--Write a query to find the total freight charges for each country, showing only those countries with total freight charges greater than $1000.
	SELECT 
	ShipCountry,
	SUM(Freight) AS [Total Freight]
	FROM Orders
	GROUP BY ShipCountry
	HAVING 	SUM(Freight) > 1000

--Task 15: Average Freight by Country
--Write a query to find the average freight charges for each country, showing only those countries with an average freight charge greater than $50.
SELECT 
	ShipCountry,
	AVG(Freight) AS [Total Freight]
	FROM Orders
	GROUP BY ShipCountry
	HAVING 	AVG(Freight) > 50

--Task 16: Total Orders by Country and Year
--Write a query to count the number of orders placed in each country for each year, showing only those countries with more than 100 orders in any year.
SELECT 
	ShipCountry, 
	YEAR(OrderDate) AS [Year],
	COUNT(OrderID) AS [Orders]
FROM Orders
GROUP BY ShipCountry, YEAR(OrderDate)
HAVING 	COUNT(OrderID) > 10

--Task 17: Total Sales by Category and Year
--Write a query to find the total sales amount for each product category for each year, showing only those categories with total sales greater than $10000 in any SELECT 
SELECT CategoryID, 
	YEAR(OrderDate) AS [YEAR]
FROM Products P
JOIN [Order Details] OD
ON P.ProductID = OD.ProductID
JOIN Orders O
ON O.OrderID = OD.OrderID
GROUP BY CategoryID, YEAR(OrderDate)
HAVING SUM(OD.Quantity*P.UnitPrice) > 100000

--Task 18: Total Quantity Sold by Supplier
--Write a query to find the total quantity of products sold by each supplier, showing only those suppliers with total quantity sold greater than 00 units.
SELECT 
	SupplierID, 
	SUM(Quantity)
FROM [Order Details] od
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY SupplierID
HAVING SUM(Quantity) > 1000

--Task 19: Average Discount by Year and Month
--Write a query to find the average discount given each month of each year, showing only those months with an average discount greater than 5%.


--Task 20: Total Sales by Employee and Year
--Write a query to find the total sales amount handled by each employee for each year, showing only those employees with total sales greater than $10000 in any year.