USE BikeStores;

----------------------------------------------------------------------------------------
-- AVG() function
-- AVG() function is an aggregate function that returns the average value of a group.
----------------------------------------------------------------------------------------

-- 1. BASIC EXAMPLE
SELECT
	AVG(list_price) AVG_LIST_PRICE
FROM
	[production].[products];

-- 2. AVG() WITH GROUP BY
-- Find the average list price for each product category
SELECT
	C.category_name,
	CAST(ROUND(AVG(P.list_price), 2) AS decimal(10, 2)) AVG_PRODUCT_PRICE
FROM
	[production].[products] P
INNER JOIN
	[production].[categories] C
ON
	C.category_id = P.category_id
GROUP BY
	C.category_name
ORDER BY
	C.category_name;

-- 3. AVG() WITH HAVING CLAUSE
SELECT
	B.brand_name,
	CAST(ROUND(AVG(P.list_price), 2) AS decimal(10, 2)) AVG_PRODUCT_PRICE
FROM
	[production].[products] P
INNER JOIN
	[production].[brands] B
ON
	B.brand_id = P.brand_id
GROUP BY
	B.brand_name
HAVING
	AVG(P.list_price) > 500
ORDER BY
	AVG_PRODUCT_PRICE;
----------------------------------------------------------------------------------------