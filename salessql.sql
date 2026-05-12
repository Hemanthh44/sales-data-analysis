-- 1) How many total records are present in the sales_data table?
SELECT COUNT(*) 
FROM "sales_data";

-- 2) How many unique customers are in the data?
SELECT COUNT(DISTINCT "Customer_Name") 
FROM "sales_data";

-- 3) What is the total sales value?
SELECT SUM("Total_Sales") 
FROM "sales_data";

-- 4) Show total sales for each product category.
SELECT "Category", SUM("Total_Sales") AS "Category_Sales"
FROM "sales_data"
GROUP BY "Category"
ORDER BY "Category_Sales" DESC;

-- 5) Which are the top 10 products by sales?
SELECT "Product", SUM("Total_Sales") AS "Product_Sales"
FROM "sales_data"
GROUP BY "Product"
ORDER BY "Product_Sales" DESC
LIMIT 10;

-- 6) What is the average order sales value?
SELECT AVG("Total_Sales") AS "Average_Order_Value"
FROM "sales_data";

-- 7) Show monthly sales totals based on Order_Data.
SELECT DATE_TRUNC('month', "Order_Data") AS "Month",
       SUM("Total_Sales") AS "Monthly_Sales"
FROM "sales_data"
GROUP BY DATE_TRUNC('month', "Order_Data")
ORDER BY "Month";

-- 8) How many orders came from each state?
SELECT "State_Code", COUNT(*) AS "Orders_Count"
FROM "sales_data"
GROUP BY "State_Code"
ORDER BY "Orders_Count" DESC;

-- 9) Which brand generated the highest total sales?
SELECT "Brand", SUM("Total_Sales") AS "Brand_Sales"
FROM "sales_data"
GROUP BY "Brand"
ORDER BY "Brand_Sales" DESC
LIMIT 1;

-- 10) Show supervisors with total sales more than 1,00,000.
SELECT "Assigned Supervisor", SUM("Total_Sales") AS "Supervisor_Sales"
FROM "sales_data"
GROUP BY "Assigned Supervisor"
HAVING SUM("Total_Sales") > 100000
ORDER BY "Supervisor_Sales" DESC;