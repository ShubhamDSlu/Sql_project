Use inventorydb;
show tables;
select * from sales;
select * from product;
select * from categories;

SELECT
    P.Product_Name,
    C.CategoryName,
    P.Unit_price,
    P.Units_instock
FROM
    Product AS P
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id;
    
SELECT
    C.CategoryName,
    P.Product_Name
FROM
    Categories AS C
LEFT JOIN
    Product AS P ON C.Category_id = P.Category_id
ORDER BY
    C.CategoryName, P.Product_Name;
    
SELECT
    P.Product_Name,
    S.SaleDate,
    S.QuantitySold
FROM
    Product AS P
LEFT JOIN
    Sales AS S ON P.Product_id = S.Product_id
ORDER BY
    P.Product_Name, S.SaleDate;
    
SELECT
    S.SaleID,
    P.Product_Name,
    S.SaleDate,
    S.QuantitySold
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
ORDER BY
    S.SaleDate, S.SaleID;
    
SELECT
    P.Product_Name,
    P.Units_instock
FROM
    Product AS P
LEFT JOIN
    Sales AS S ON P.Product_id = S.Product_id
WHERE
    S.SaleID IS NULL;
SELECT
    S.SaleID,
    P.Product_Name,
    C.CategoryName,
    S.SaleDate,
    S.QuantitySold,
    (P.Unit_price * S.QuantitySold) AS TotalSaleAmount
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
ORDER BY
    S.SaleDate, S.SaleID;
    
SELECT
    P.Product_Name,
    C.CategoryName,
    P.Units_instock
FROM
    Product AS P
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
WHERE
    P.Units_instock < 50
ORDER BY
    P.Units_instock ASC;
    
SELECT
    P.Product_Name,
    SUM(S.QuantitySold) AS TotalQuantitySold,
    SUM(S.QuantitySold * P.Unit_price) AS TotalRevenue
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
GROUP BY
    P.Product_Name
ORDER BY
    TotalRevenue DESC;
    
SELECT
    C.CategoryName,
    SUM(S.QuantitySold) AS TotalQuantitySold,
    SUM(S.QuantitySold * P.Unit_price) AS TotalRevenue
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
GROUP BY
    C.CategoryName
ORDER BY
    TotalRevenue DESC;
    
SELECT
    P.Product_Name,
    SUM(S.QuantitySold) AS TotalQuantitySold
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
GROUP BY
    P.Product_Name
ORDER BY
    TotalQuantitySold DESC
LIMIT 5;
    
    
SELECT
    P1.Product_Name,
    P1.Unit_price,
    C.CategoryName
FROM
    Product AS P1
INNER JOIN
    Categories AS C ON P1.Category_id = C.Category_id
WHERE
    P1.Unit_price > (
        SELECT AVG(P2.Unit_price)
        FROM Product AS P2
        WHERE P2.Category_id = P1.Category_id
    )
ORDER BY
    C.CategoryName, P1.Unit_price DESC;
    
SELECT
    P.Product_Name,
    C.CategoryName,
    P.Units_instock,
    P.Unit_price
FROM
    Product AS P
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
ORDER BY
    C.CategoryName, P.Product_Name;
    
SELECT
    P.Product_Name,
    SUM(S.QuantitySold) AS TotalQuantitySold,
    SUM(S.QuantitySold * P.Unit_price) AS TotalRevenueGenerated
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
GROUP BY
    P.Product_Name
ORDER BY
    TotalRevenueGenerated DESC;
    
 SELECT
    C.CategoryName,
    SUM(S.QuantitySold) AS TotalQuantitySold,
    SUM(S.QuantitySold * P.Unit_price) AS TotalRevenueGenerated
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
GROUP BY
    C.CategoryName
ORDER BY
    TotalRevenueGenerated DESC;   
    
SELECT
    DATE_FORMAT(SaleDate, '%Y-%m') AS SalesMonth,
    SUM(S.QuantitySold) AS TotalQuantitySold,
    SUM(S.QuantitySold * P.Unit_price) AS MonthlyRevenue
FROM
    Sales AS S
INNER JOIN
    Product AS P ON S.Product_id = P.Product_id
GROUP BY
    SalesMonth
ORDER BY
    SalesMonth;


SELECT
    P.Product_Name,
    C.CategoryName
FROM
    Product AS P
INNER JOIN
    Categories AS C ON P.Category_id = C.Category_id
WHERE
    P.Units_instock = 0;
    
SELECT Product_Name, Unit_price
FROM Product
ORDER BY Unit_price DESC
LIMIT 5; -- Top 5 most expensive products


SELECT Category_id, COUNT(Product_id) AS NumberOfProducts
FROM Product
GROUP BY Category_id;


SELECT P.Product_Name, C.CategoryName
FROM Product AS P
INNER JOIN Categories AS C
ON P.Category_id = C.Category_id;


UPDATE Product
SET Units_instock = 60
WHERE Product_id = 1; -- Update Laptop stock


UPDATE Product
SET Unit_price = 1150.00, Units_instock = 45
WHERE Product_Name = 'Laptop';