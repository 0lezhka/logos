CREATE DATABASE MyDB;
USE MyDB;


CREATE TABLE Products
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);
CREATE TABLE Customers
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    CustomerId INT NOT NULL,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price DECIMAL NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id) ON DELETE CASCADE
    );
    
 -- Наповнити даними БД яку самі проектували   
    
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES ('iPhone X', 'Apple', 2, 76000),
('iPhone 8', 'Apple', 2, 51000),
('iPhone 7', 'Apple', 5, 42000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 46000),
('Honor 10', 'Huawei', 2, 26000),
('Nokia 8', 'HMD Global', 6, 38000);
 
INSERT INTO Customers(FirstName) VALUES ('Tom'), ('Bob'),('Sam');
 
INSERT INTO Orders (ProductId, CustomerId, CreatedAt, ProductCount, Price)
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Galaxy S8'),
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2018-05-21', 
    2, 
    (SELECT Price FROM Products WHERE ProductName='Galaxy S8')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone X'),
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2018-05-23',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone X')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone X'),
    (SELECT Id FROM Customers WHERE FirstName='Bob'),
    '2018-05-21',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone X')
);

-- Попрактикуватись в написанні JOIN до БД яку проектували

SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId;

SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId
WHERE Products.Price > 45000
ORDER BY Customers.FirstName;

SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Orders LEFT JOIN Customers 
ON Orders.CustomerId = Customers.Id;

SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
LEFT JOIN Products ON Orders.ProductId = Products.Id
WHERE Products.Price > 45000
ORDER BY Orders.CreatedAt;

