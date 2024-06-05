use Northwind

--lesson time
select * from Categories

select * from Categories [p]
join Products [c]
on p.CategoryID = c.CategoryID

select 
	worker.EmployeeID [workerID],
	worker.FirstName [workerName],
	boss.EmployeeID [bossID],
	boss.FirstName [bossName]
from 
	Employees [boss]
join Employees [worker]
	on boss.EmployeeID = worker.ReportsTo

--PRACTICES
--1. Retrieve all customers
SELECT * FROM Customers

--2. List all orders with their corresponding customer name
SELECT 
	O.OrderID,
	O.CustomerID,
	C.ContactName
FROM Orders [O]
JOIN Customers [C]
	ON C.CustomerID = O.CustomerID

--3. Find the total number of orders placed by each customer
SELECT 
	C.CustomerID, 
	C.ContactName 
FROM 
	Orders [O]
JOIN 
	Customers [C]
	ON 
		O.CustomerID = C.CustomerID
GROUP BY 
	C.CustomerID, C.ContactName

--4. List products with their supplier's name
SELECT
	P.ProductID,
	P.ProductName,
	S.SupplierID,
	S.ContactName
FROM 
	Products [P]
JOIN 
	Suppliers [S]
	ON
		P.SupplierID = S.SupplierID


--5. Find the top 5 most expensive products
SELECT TOP(5) 
	ProductID,
	ProductName,
	UnitPrice
FROM Products
ORDER BY UnitPrice DESC

--6. List all employees who have not reported to anyone (NULL in ReportsTo)
SELECT 
	EmployeeID,
	CONCAT(FirstName, ' ', LastName) AS [EmployeeName]
FROM 
	Employees
--JOIN Employees [Boss]
--	ON Worker.ReportsTo = Boss.EmployeeID
WHERE 
	ReportsTo IS NULL

--7. Calculate the total sales for each product
SELECT 
	P.ProductID,
	P.ProductName,
	SUM(OD.Quantity * P.UnitPrice) [TotalSale]
FROM 
	Products [P]
JOIN 
	[Order Details] [OD]
	ON 
		OD.ProductID = P.ProductID
GROUP BY
	P.ProductID, P.ProductName

--8. Find the total number of products in each category
SELECT
	C.CategoryID,
	C.CategoryName,
	COUNT(P.ProductID) [TotalProductCount]
FROM 
	Products [P]
JOIN 
	Categories [C]
	ON
		P.CategoryID = C.CategoryID
GROUP BY
	C.CategoryID, C.CategoryName
	
--9. List all employees along with their manager's name
SELECT 
	worker.EmployeeID [workerID],
	worker.FirstName [workerName],
	manager.FirstName [managerName]
FROM 
	Employees [manager]
JOIN Employees [worker]
	ON manager.EmployeeID = worker.ReportsTo

--10. Retrieve all orders made in the year 1997
SELECT 
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount)), 2) [TOTAL SALES]
FROM 
	Orders [O]
JOIN 
	[Order Details] [OD]
	ON
	OD.OrderID = O.OrderID
WHERE OrderDate LIKE '%1997%'

--11. List all products that have not been ordered
SELECT
	ProductName
FROM Products
WHERE UnitsOnOrder = 0

--12.Find customers who have placed more than 10 orders
SELECT 
	C.CustomerID,
	C.ContactName,
	COUNT(O.OrderID) [OrdersCount]
FROM 
	Customers [C]
JOIN
	Orders [O]
	ON C.CustomerID = O.CustomerID
GROUP BY
	C.CustomerID, C.ContactName
HAVING
	COUNT(O.OrderID) > 10
--13. Find the average unit price of products in each category
SELECT
	C.CategoryID,
	C.CategoryName,
	AVG(P.UnitPrice) [AveragePrice]
FROM 
	Products [P]
JOIN 
	Categories [C]
	ON
		P.CategoryID = C.CategoryID
GROUP BY
	C.CategoryID, C.CategoryName

--14. List all orders along with the total amount for each order
SELECT 
	OrderID,
	ROUND(SUM(UnitPrice*Quantity*(1-Discount)), 2) [TotalSales]
FROM 
	[Order Details]
GROUP BY 
	OrderID

--15. List the names of customers who have ordered products from the 'Beverages' category
select distinct
	cus.ContactName
from Products [p]
join [Order Details] [od]
	on p.ProductID = od.ProductID
join Categories [c]
	on p.CategoryID = c.CategoryID
join Orders [o]
	on o.OrderID = od.OrderID
join Customers [cus]
	on o.CustomerID = cus.CustomerID
where c.CategoryName = 'Beverages'

--16. List the names of employees and the number of orders they have handled
SELECT 
	CONCAT(E.FirstName, ' ', E.LastName),
	COUNT(O.OrderID) [HandledOrderCount]
FROM Orders [O]
JOIN Employees [E]
	ON O.EmployeeID = E.EmployeeID
GROUP BY
	CONCAT(E.FirstName, ' ', E.LastName)

--17. Find the average discount given on orders
SELECT 
	OrderID,
	ROUND(AVG(Discount), 3) [AverageDiscount]
FROM [Order Details]
GROUP BY
	OrderID
HAVING
	AVG(Discount) > 0

--18. List all suppliers located in a specific country (e.g., 'USA')
SELECT 
	Country,
	ContactName 
FROM 
	Suppliers
GROUP BY 
	Country,
	ContactName

--19. Retrieve the top 5 customers who have placed the highest number of orders
SELECT TOP(5)
	CustomerID,
	COUNT(OrderID) [OrdersCount]
FROM Orders
GROUP BY 
	CustomerID
ORDER BY 
	OrdersCount DESC

--20.Task: Retrieve Sales Information for Each Product
--Objective: Write a query to retrieve a list of products along with the total quantity sold and the total sales amount for each product. 
--Sort the results by the total sales amount in descending order.
SELECT 
	P.ProductName,
	SUM(OD.Quantity) [TotalQuantity],
	ROUND(SUM(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)),2) [TotalSales]
FROM Products [P]
JOIN [Order Details] [OD]
	ON
		P.ProductID = OD.ProductID
GROUP BY
	P.ProductName
ORDER BY
	TotalSales

--21. Task: Retrieve Basic Customer Order Information
--Objective: Write a query to retrieve a list of all customers and their most recent order details, including the customer name, order ID, order date, 
--and total order amount. Sort the results by customer name.


--22.Task: Retrieve Supplier and Product Order Information
--Objective: Write a query to retrieve a list of suppliers and their products, along with the total number of orders and total sales amount for each product. 
--Sort the results by supplier name and then by total sales amount in descending order.