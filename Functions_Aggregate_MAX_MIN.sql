USE BikeStores;

----------------------------------------------------------------------------------------
-- MAX() FUNCTION
-- MAX() function is an aggregate function that returns the maximum value in a set.

-- MIN() FUNCTION
-- MIN() function is an aggregate function that allows you to find the minimum value in a set. 
----------------------------------------------------------------------------------------

--1. BASIC EXAMPLE
SELECT
	MAX(list_price) MAX_PRICE
FROM
	[production].[products];

--2. Find producr with highest price.
SELECT
	product_id, product_name, list_price
FROM
	[production].[products]
WHERE
	list_price = (SELECT MAX(list_price) FROM production.products);

--3. MAX() WITH GROUP BY
-- Find brand name and the highest list price of products in each brand
SELECT
	B.brand_name, MAX(P.list_price) MAX_PRICE
FROM
	[production].[products] P
INNER JOIN
	[production].[brands] B
ON
	P.brand_id = B.brand_id
GROUP BY
	B.brand_name
ORDER BY
	B.brand_name;

--4. MAX() WITH HAVING CLAUSE
-- Find the brand names and the highest list price for each
SELECT
	B.brand_name, MAX(P.list_price)HIGHEST_PRICE
FROM
	[production].[products] P
INNER JOIN
	[production].[brands] B
ON
	B.brand_id = P.brand_id
GROUP BY
	B.brand_name
HAVING
	MAX(P.list_price) > 1000
ORDER BY
	HIGHEST_PRICE DESC;
----------------------------------------------------------------------------------------
--1. BASIC EXAMPLE
SELECT
	MIN(list_price)MINIMUM_PRICE
FROM
	production.products;

--2. Find product with lowest price with details
SELECT
	product_id, product_name, list_price
FROM
	[production].[products]
WHERE
	list_price = (SELECT MIN(list_price) FROM production.products);

--3. MIN() WITH GROUP BY
-- Find the lowest list price for each product category
SELECT
	C.category_name, MIN(P.list_price)LOWEST_PRICE
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

--4. Get the product category with the minimum list price greater than 500
SELECT
	C.category_name, MIN(P.list_price)LOWEST_PRICE
FROM	
	[production].[products] P
INNER JOIN
	[production].[categories] C
ON
	C.category_id = P.category_id
GROUP BY
	C.category_name
HAVING
	MIN(P.list_price) > 500
ORDER BY
	C.category_name;