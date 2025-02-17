use northwind
;
-- Write SQL query to find supplier of each product
SELECT s.SupplierName, p.ProductName
FROM products AS p
JOIN suppliers AS s
ON p.SupplierID = s.SupplierID
;

-- Write sql query to  find category of each product.
SELECT c.CategoryName, p.ProductName
FROM products AS p
JOIN categories AS c
ON p.CategoryID = c.CategoryID
;

-- Retrieve all products belonging to the meat/poultry category
SELECT c.CategoryName, p.ProductName
FROM products AS p
JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Meat/Poultry'
;

-- Retrieve the order ID, order date, customer name, and employee name for all orders
SELECT o.OrderID, o.OrderDate, c.CustomerName, e.FirstName,e.LastName
FROM customers AS c
JOIN orders AS o
ON c.CustomerID = o.CustomerID
JOIN employees AS e
ON e.EmployeeID = o.EmployeeID
;

-- Retrieve the product name, category name, and supplier name for all products.
SELECT p.ProductName, c.CategoryName, s.SupplierName 
FROM products AS p
JOIN suppliers AS s
ON p.SupplierID = s.SupplierID
JOIN categories AS c
ON c.CategoryID = p.CategoryID
;

-- Create a report for all the orders of 1996 and their Customers.
SELECT c.CustomerName, o.OrderDate
FROM customers AS c
JOIN orders AS o
ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 1996
;

-- Retrieve all categories along with the number of products in each category.
SELECT DISTINCT(c.CategoryName), COUNT(p.ProductID)
FROM products AS p
JOIN categories AS c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
;

-- Retrieve all products with their prices and the quantity ordered for each product.
SELECT DISTINCT(p.ProductName), p.Price, o.Quantity, p.Price * o.Quantity AS total
FROM products AS p
JOIN order_details AS o
ON p.ProductID =  o.ProductID
;