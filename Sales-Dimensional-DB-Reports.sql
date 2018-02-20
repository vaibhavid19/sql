use salesordersexample;
show tables;
set sql_mode=PIPES_AS_CONCAT;
select * from customers
order by CustAreaCode DESC;

# Second highest area code
SELECT * 
FROM CUSTOMERS AS MAIN
WHERE 2 = (SELECT count(*) FROM CUSTOMERS AS AUX
WHERE AUX.CustAreaCode >= MAIN.CustAreaCode);


# Customers ordered bikes and helmet separately.
SELECT CustBikes.CustFirstName,
CustBikes.CustLastName
FROM
(SELECT DISTINCT Customers.CustomerID,
Customers.CustFirstName,
Customers.CustLastName
FROM ((Customers
INNER JOIN Orders
ON Customers.CustomerID
= Orders.CustomerID)
INNER JOIN Order_Details
ON Orders.OrderNumber =
Order_Details.OrderNumber)
INNER JOIN Products
ON Products.ProductNumber =
Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%Bike')
AS CustBikes
INNER JOIN
(SELECT DISTINCT Customers.CustomerID
FROM ((Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID)
INNER JOIN Order_Details
ON Orders.OrderNumber =
Order_Details.OrderNumber)
INNER JOIN Products
ON Products.ProductNumber =
Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%Helmet')
AS CustHelmets
ON CustBikes.CustomerID =
CustHelmets.CustomerID;

#	“Find all the customers who ever ordered a bicycle helmet.”
SELECT * FROM PRODUCTS;
SELECT CUSTFIRSTNAME, CUSTLASTNAME, PRODUCTNAME
FROM ((CUSTOMERS
NATURAL JOIN ORDERS)
NATURAL JOIN ORDER_DETAILS)
NATURAL JOIN PRODUCTS.ProductNumber
WHERE PRODUCTS.PRODUCTNAME LIKE '%Helmet%';

SELECT DISTINCT Customers.CustFirstName,
Customers.CustLastName
FROM ((Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID)
INNER JOIN Order_Details
ON Orders.OrderNumber =
Order_Details.OrderNumber)
INNER JOIN Products
ON Products.ProductNumber =
Order_Details.ProductNumber
WHERE Products.ProductName LIKE '%Helmet%';

#	“Show me customers and employees who have the same name.”
SELECT CustFirstName, CustLastName, EMPLOYEES.EMPFIRSTNAME
FROM CUSTOMERS
INNER JOIN EMPLOYEES
ON EMPLOYEES.EMPFIRSTNAME = CUSTOMERS.CustFirstName
AND EMPLOYEES.EMPLASTNAME = CUSTOMERS.CustLastName;

#	“Show me the vendors and the products they supply to us.”
SELECT Vendors.VendName, Products.ProductName
FROM (Vendors
INNER JOIN product_vendors
ON Vendors.VendorID = product_vendors.VendorID)
INNER JOIN Products
ON Products.ProductNumber = product_vendors.ProductNumber;


#	“Show me the orders that contain both a bike and a helmet.”
SELECT * 
FROM Products
WHERE ProductName LIKE '%Bike%'
OR ProductName LIKE '%Helmet%';

SELECT DISTINCT OrderNumber
FROM Order_Details
WHERE ProductNumber IN (1, 2, 6, 11)
union
SELECT DISTINCT OrderNumber
FROM Order_Details
WHERE ProductNumber IN (10, 25, 26);

#	“Show me customers and employees who live in the same city.”(JOIN on the city name.)
#	“List customers and the entertainers they booked.”(JOIN on the engagement number.)
#	“Find the agents and entertainers who live in the same ZIP Code.”(JOIN on the ZIP Code.)
#	“Show me the students and their teachers who have the same first name.” (JOIN on the first name.)
#	“Find the bowlers who are on the same team.”(JOIN on the team ID.)
#	“Display all the ingredients for recipes that contain carrots.”(JOIN on the ingredient ID.)

# “Show me a list of all the orders we’ve taken, except for those posted in October.
SELECT OrderNumber, OrderDate
FROM Orders
WHERE OrderDate NOT BETWEEN '2012-10-01' 
AND '2012-10-31';

#	“Give me a list of customers who didn’t specify what county they live in.”
SELECT CustFirstName || ' ' || CustLastName 
AS Our_Customer
FROM Customers
WHERE CustCity is NULL;

SELECT * FROM Customers;

#	“Show me a list of products that have product codes beginning with ‘G_00’ and ending in a single number or letter.”
SELECT ProductName, ProductNumber
FROM Products
WHERE ProductName LIKE 'G_ %';

#	“Show me a list of products with a retail price of fifty dollars or less.”
SELECT ProductName
FROM Products
WHERE RetailPrice <= 50;

#	“Show me a list of all our vendors and their identification numbers.”
SELECT 'The ID Number for ' || VendName ||
' is ' || CAST(VendorID AS CHARACTER)
FROM Vendors;

SELECT * FROM Orders;

#	“How many days elapsed between the order date and the ship date for each order?”
SELECT OrderNumber, CAST(CAST(ShipDate AS DATE) - CAST(OrderDate AS date) AS SIGNED) AS DaysElapsed
FROM Orders;