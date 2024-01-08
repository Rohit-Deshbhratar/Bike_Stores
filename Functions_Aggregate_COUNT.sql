USE BikeStores;

----------------------------------------------------------------------------------------
-- COUNT() FUNCTION
-- COUNT() is an aggregate function that returns the number of items found in a set.

-- COUNT(*)
-- COUNT(*) returns the number of rows in a specified table. 
-- COUNT(*) does not support DISTINCT and takes no parameters. 
-- It counts each row separately and includes rows that contain NULL values. 
----------------------------------------------------------------------------------------

--1. Returns the number of products in the products table.
SELECT
	COUNT(*) ROW_COUNT
FROM
	[production].[products];

--2. Find the number of products whose model year is 2016 and the list price is higher than 999.99
SELECT
	COUNT(*) ROW_COUNT
FROM
	[production].[products]
WHERE
	model_year = 2016 AND list_price > 999.99;

-- COUNT(*) WITH GROUP BY CLAUSE
--3. Find the number of products in each product category

SELECT
	C.category_name, COUNT(*) PRODUCT_COUNT
FROM
	[production].[products] P
INNER JOIN
	[production].[categories] C
ON
	C.category_id = P.category_id
GROUP BY
	C.category_name
ORDER BY
	PRODUCT_COUNT DESC;

-- COUNT(*) WITH HAVING CLAUSE
-- Find the brand and the number of products for each. Returns only the brands that have the number of products greater than 20
SELECT
	B.brand_name, COUNT(*) PRODUCT_COUNT
FROM
	[production].[products] P
INNER JOIN
	[production].[brands] B
ON
	B.brand_id = P.brand_id
GROUP BY
	B.brand_name
HAVING 
	COUNT(*) > 20
ORDER BY
	PRODUCT_COUNT DESC;
----------------------------------------------------------------------------------------