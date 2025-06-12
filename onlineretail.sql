SHOW GLOBAL VARIABLES LIKE 'local_infile';
CREATE DATABASE IF NOT EXISTS salesDB;
USE salesDB;
SHOW TABLES;
DROP TABLE IF EXISTS onlineretail;
CREATE TABLE onlineretail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);
-- Total sales per country
SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM onlineretail
GROUP BY Country
ORDER BY TotalRevenue DESC;


USE salesDB;

LOAD DATA LOCAL INFILE 'C:\\Users\\iswarya\\Downloads\\onlineretail.csv'
INTO TABLE onlineretail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);
