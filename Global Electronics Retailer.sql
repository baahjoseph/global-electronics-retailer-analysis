SELECT COUNT(*) FROM Customers;

SELECT COUNT(*) FROM Stores;

SELECT COUNT(*) FROM exchange_rates;


SELECT *
FROM Sales
LIMIT 10;


SELECT *
FROM Sales
LIMIT 10;


SELECT COUNT(DISTINCT `Order Number`) AS Total_Orders
FROM Sales;

SELECT SUM(Quantity) AS Total_Units_Sold
FROM Sales;


SELECT
    p.`Product Name`,
    SUM(s.Quantity) AS Total_Units_Sold
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY Total_Units_Sold DESC
LIMIT 10;


SELECT
    p.`Product Name`,
    SUM(s.Quantity * p.`Unit Price USD`) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY Total_Sales_USD DESC
LIMIT 10;


SELECT
    p.Category,
    SUM(s.Quantity * p.`Unit Price USD`) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY Total_Sales_USD DESC;



SELECT
    p.Category,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY Total_Sales_USD DESC;


SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Sales_Year,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY Sales_Year
ORDER BY Sales_Year;


SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Sales_Year,
    COUNT(DISTINCT `Order Number`) AS Total_Orders
FROM Sales
GROUP BY Sales_Year
ORDER BY Sales_Year;


SELECT
    MIN(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS First_Order_Date,
    MAX(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Last_Order_Date
FROM Sales;



SELECT
    st.StoreKey,
    st.Country,
    st.State,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
JOIN Stores st
    ON s.StoreKey = st.StoreKey
GROUP BY
    st.StoreKey,
    st.Country,
    st.State
ORDER BY Total_Sales_USD DESC
LIMIT 10;


SELECT
    c.Country,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
JOIN Customers c
    ON s.CustomerKey = c.CustomerKey
GROUP BY c.Country
ORDER BY Total_Sales_USD DESC;


SELECT
    ROUND(
        SUM(s.Quantity * p.`Unit Price USD`)
        / COUNT(DISTINCT s.`Order Number`),
        2
    ) AS Average_Order_Value_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey;
    
    
    SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Sales_Year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Sales_Month,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY
    Sales_Year,
    Sales_Month
ORDER BY
    Sales_Year,
    Sales_Month;
    
    
    SELECT
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Sales_Month,
    ROUND(SUM(s.Quantity * p.`Unit Price USD`), 2) AS Total_Sales_USD
FROM Sales s
JOIN Products p
    ON s.ProductKey = p.ProductKey
GROUP BY Sales_Month
ORDER BY Total_Sales_USD DESC;