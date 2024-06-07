use Northwind

--1. Subquery with HAVING:    
--List the names of customers who have placed more than two orders.(customers, orders)
SELECT 
	ContactName 
FROM 
	Customers
WHERE 
	CustomerID IN 
	(
		SELECT CustomerID FROM Orders
		GROUP BY 
			CustomerID
			HAVING 
				COUNT(OrderID) > 2
	)
ORDER BY 
	ContactName

--2. Retrieve the names of employees who are responsible for orders with a total price higher than the average order total.
--(Employees, orders)
SELECT 
	CONCAT(FirstName , ' ' , LastName) [Employee]
FROM 
	Employees
WHERE
	EmployeeID IN 
	(
	SELECT
		EmployeeID 
	FROM 
		Orders [O]
	JOIN 
		[Order Details] [OD]
		ON 
			O.OrderID = OD.OrderID
	GROUP BY
		EmployeeID
		HAVING
			SUM(OD.UnitPrice) > AVG(OD.UnitPrice*OD.Quantity)
	)

--3. Find all employees whose hire date is earlier than the hire date of any employee in the 'Sales Representatives' title:
SELECT * 
FROM 
	Employees
WHERE 
	HireDate < all
	(
		SELECT HireDate FROM Employees
		WHERE Title = 'Vice President, Sales' 
	)

--4. Find all products that are cheaper than all products in the 'Confections' category:
SELECT 
	* 
FROM 
	Products
WHERE
	UnitPrice < all
	(
		SELECT UnitPrice
		FROM Products
		WHERE CategoryID =
		(
			SELECT CategoryID FROM Categories
			WHERE CategoryName = 'Confections'
		)
	)