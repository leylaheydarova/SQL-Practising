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


--5. Retrieve a list of products along with the name of the category they belong to.
SELECT ProductName,
(
	SELECT 
		CategoryName 
	FROM 
		Categories
	WHERE 
		Categories.CategoryID = Products.CategoryID
	) AS [ProductName]
FROM 
	Products

--6. Find orders that include products from the category "Beverages".
SELECT *
FROM
	[Order Details]
WHERE 
	ProductID IN
(
	
)
	

--7. Retrieve categories that have more than 10 products.

--8. Find the names of products supplied by "Exotic Liquids".

--9. Retrieve orders with the maximum freight cost.

--10. Find customers whose average order value is less than $100.

--11. Retrieve employees who have handled less than 3 orders.

--12. List customers who have placed orders with a total amount greater than $5000.

--13. Find employees who have handled orders with a total greater than $20,000.

--14. Retrieve the list of customers who have never placed an order.

--15. List products that have a unit price higher than the average unit price of all products.

--16. Find products from categories where the total stock of all products is less than 200 units.

--17. Retrieve orders where the freight cost is greater than the average freight cost.

--18. List suppliers who supply more than 20 different products.