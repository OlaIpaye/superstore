CREATE DATABASE superstoreDB;

-- creating customer table
CREATE TABLE Customer (
    CustomerID VARCHAR(50) PRIMARY KEY NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Region VARCHAR(50),
    Country VARCHAR(50),
    Segment VARCHAR(50)
);

DROP TABLE Customer;

-- creating products table
CREATE TABLE Products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

DROP TABLE Products;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100) NOT NULL,
    Region VARCHAR(50)
);

DROP TABLE Order_Details;

DROP TABLE Orders;

-- creating returns table
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY IDENTITY(1,1),
    OrderID VARCHAR(50) NOT NULL,
    Returned BIT NULL
);

-- creating order table
CREATE TABLE Orders (
    OrderID VARCHAR(50) PRIMARY KEY, -- Removed IDENTITY(1,1)
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(50) NOT NULL,
    EmployeeID INT,
    ReturnID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ReturnID) REFERENCES Returns(ReturnID)
);

-- creating order_details table
CREATE TABLE Order_Details (
    OrderID VARCHAR(50) NOT NULL,
    ProductID VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5, 2) NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



-- INSERTING RECORDS INTO TABLES

-- inserting records into the employee table
INSERT INTO Employee 
VALUES
('Anna Andreadi', 'West'),
('Chuck Magee', 'East'),
('Kelly Williams', 'Central'),
('Cassandra Brandow', 'South');

-- view  all employees
SELECT *
FROM employee;

-- Inserting records into the Returns table
INSERT INTO Returns (OrderID, Returned)
VALUES
('CA-2016-152156', 1), -- Returned
('CA-2016-138688', 1), -- Returned
('US-2015-108966', 1), -- Returned
('CA-2014-115812', 0), -- Not Returned
('CA-2017-114412', 0), -- Not Returned
('CA-2016-161389', 1), -- Returned
('US-2015-118983', 1), -- Returned
('CA-2014-105893', 0), -- Not Returned
('CA-2014-167164', 0), -- Not Returned
('CA-2014-143336', 1); -- Returned

DROP TABLE [Returns];

SELECT *
FROM Returns;

-- inserting records into the customer table
INSERT INTO Customer (CustomerID, CustomerName, City, State, PostalCode, Region, Country, Segment)
VALUES
('CG-12520', 'Claire Gute', 'Henderson', 'Kentucky', '42420', 'South', 'United States', 'Consumer'),
('DV-13045', 'Darrin Van Huff', 'Los Angeles', 'California', '90036', 'West', 'United States', 'Corporate'),
('SO-20335', 'Sean O''Donnell', 'Fort Lauderdale', 'Florida', '33311', 'South', 'United States', 'Consumer'),
('BH-11710', 'Brosina Hoffman', 'Los Angeles', 'California', '90032', 'West', 'United States', 'Consumer'),
('AA-10480', 'Andrew Allen', 'Concord', 'North Carolina', '28027', 'South', 'United States', 'Consumer'),
('IM-15070', 'Irene Maddox', 'Seattle', 'Washington', '98103', 'West', 'United States', 'Consumer'),
('HP-14815', 'Harold Pawlan', 'Fort Worth', 'Texas', '76106', 'Central', 'United States', 'Home Office'),
('PK-19075', 'Pete Kriz', 'Madison', 'Wisconsin', '53711', 'Central', 'United States', 'Consumer'),
('AG-10270', 'Alejandro Grove', 'West Jordan', 'Utah', '84084', 'West', 'United States', 'Consumer'),
('ZD-21925', 'Zuschuss Donatelli', 'San Francisco', 'California', '94109', 'West', 'United States', 'Consumer');

SELECT *
FROM Customer;

-- inserting records into the orders table
INSERT INTO Orders (OrderID, OrderDate, ShipDate, ShipMode, CustomerID, EmployeeID, ReturnID)
VALUES
('CA-2016-152156', '2016-11-08', '2016-11-11', 'Second Class', 'CG-12520', 1, 1),
('CA-2016-138688', '2016-06-12', '2016-06-16', 'Second Class', 'DV-13045', 1, 2),
('US-2015-108966', '2015-10-11', '2015-10-18', 'Standard Class', 'SO-20335', 4, 3),
('CA-2014-115812', '2014-06-09', '2014-06-14', 'Standard Class', 'BH-11710', 3, 4),
('CA-2017-114412', '2017-04-15', '2017-04-20', 'Standard Class', 'AA-10480', 4, 5),
('CA-2016-161389', '2016-12-05', '2016-12-10', 'Standard Class', 'IM-15070', 2, 6),
('US-2015-118983', '2015-11-22', '2015-11-26', 'Standard Class', 'HP-14815', 3, 7),
('CA-2014-105893', '2014-11-18', '2014-11-20', 'Second Class', 'PK-19075', 1, 8),
('CA-2014-167164', '2014-05-05', '2014-05-07', 'Standard Class', 'AG-10270', 4, 9),
('CA-2014-143336', '2014-08-27', '2014-09-01', 'Second Class', 'ZD-21925', 2, 10);

SELECT *
FROM Orders;

-- -- inserting records into the products table
INSERT INTO Products (ProductID, ProductName, Category, SubCategory, UnitPrice)
VALUES
('FUR-BO-10001798', 'Bush Somerset Collection Bookcase', 'Furniture', 'Bookcases', 261.96),
('FUR-CH-10000454', 'Hon Deluxe Fabric Upholstered Stacking Chairs', 'Furniture', 'Chairs', 731.94),
('OFF-LA-10000240', 'Self-Adhesive Address Labels by Universal', 'Office Supplies', 'Labels', 14.62),
('FUR-TA-10000577', 'Bretford CR4500 Series Slim Rectangular Table', 'Furniture', 'Tables', 957.58),
('FUR-FU-10001487', 'Eldon Fold ''N Roll Cart System', 'Furniture', 'Storage', 22.37), -- Escaped the single quote
('OFF-AR-10002833', 'Newell 322', 'Office Supplies', 'Art', 7.28),
('TEC-PH-10002275', 'Mitel 5320 IP Phone VoIP phone', 'Technology', 'Phones', 907.15),
('OFF-BI-10003910', 'DXL Angle-View Binders with Locking Rings', 'Office Supplies', 'Binders', 18.50),
('OFF-AP-10002892', 'Belkin F5C206VTEL 6 Outlet Surge', 'Office Supplies', 'Appliances', 114.90),
('FUR-TA-10001539', 'Chromcraft Rectangular Conference Tables', 'Furniture', 'Tables', 1706.18);

SELECT *
FROM Products;
--
INSERT INTO Order_Details (OrderID, ProductID, Quantity, Discount)
VALUES
('CA-2016-152156', 'FUR-BO-10001798', 2, 0), -- First row
('CA-2016-138688', 'FUR-CH-10000454', 3, 0), -- Second row
('US-2015-108966', 'OFF-LA-10000240', 2, 0), -- Third row
('CA-2014-115812', 'FUR-TA-10000577', 5, 0.45), -- Fourth row
('CA-2017-114412', 'FUR-FU-10001487', 2, 0.2), -- Fifth row
('CA-2016-161389', 'OFF-AR-10002833', 7, 0), -- Sixth row
('US-2015-118983', 'TEC-PH-10002275', 4, 0), -- Seventh row
('CA-2014-105893', 'OFF-BI-10003910', 6, 0.2), -- Eighth row
('CA-2014-167164', 'OFF-AP-10002892', 3, 0.2), -- Ninth row
('CA-2014-143336', 'FUR-TA-10001539', 5, 0); -- Tenth row

SELECT *
FROM Order_Details;





SELECT *
FROM Customer;

-- Extract all customers from a specific city
SELECT *
FROM Customer
WHERE City = 'Los Angeles';

-- Search for products of a specific category or sub-category
SELECT * 
FROM Products
WHERE Category = 'Furniture' OR SubCategory = 'Tables';

-- Count how many customers are from a specific city
SELECT City, COUNT(*) AS CustomerCount
FROM Customer
GROUP BY City;

-- Calculate the average unit price of all products
SELECT AVG(UnitPrice) AS Average_Unit_Price
FROM Products;

-- All current orders
SELECT *
FROM Orders;

-- Extract all orders for products that have the keyword “electric” or "table" in their description
SELECT o.OrderID, o.OrderDate, p.ProductName
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName LIKE '%table%';


-- fixing and updating the order tabl;e with payment mode column
ALTER TABLE Orders
ADD PaymentMode VARCHAR(50);

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'CA-2016-152156';

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'CA-2016-138688';

UPDATE Orders
SET PaymentMode = 'Debit'
WHERE OrderID = 'US-2015-108966';

UPDATE Orders
SET PaymentMode = 'Debit'
WHERE OrderID = 'CA-2014-115812';

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'CA-2017-114412';

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'CA-2016-161389';

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'US-2015-118983';

UPDATE Orders
SET PaymentMode = 'Debit'
WHERE OrderID = 'CA-2014-105893';

UPDATE Orders
SET PaymentMode = 'Debit'
WHERE OrderID = 'CA-2014-167164';

UPDATE Orders
SET PaymentMode = 'Credit'
WHERE OrderID = 'CA-2014-143336';

SELECT *
FROM Orders;
--


-- Extract all payments with credit cards for music records or furniture
SELECT o.OrderID, o.OrderDate, o.PaymentMode, p.ProductName
FROM Orders o
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.PaymentMode = 'Credit' AND p.Category = 'Furniture';

-- Count how many records are recorded against the employee with the highest record
SELECT TOP 1 o.EmployeeID, COUNT(o.OrderID) AS OrderCount
FROM Orders o
GROUP BY o.EmployeeID
ORDER BY OrderCount DESC;

-- Count how many records are recorded against the employee with the highest record
WITH OrderCounts AS (
    SELECT 
        o.EmployeeID, 
        COUNT(o.OrderID) AS OrderCount
    FROM Orders o
    GROUP BY o.EmployeeID
)
SELECT TOP 1 EmployeeID, OrderCount
FROM OrderCounts
ORDER BY OrderCount DESC;


-- Count how many orders are in the system per employee in each region
SELECT e.Region, e.EmployeeName, COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Employee e ON o.EmployeeID = e.EmployeeID
GROUP BY e.Region, e.EmployeeName;





SELECT *
FROM Customer;

SELECT *
FROM Returns;

SELECT *
FROM Employee;

SELECT *
FROM Products;

SELECT *
FROM Order_Details;