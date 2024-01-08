USE BikeStores;

----------------------------------------------------------------------------------------
-- GROUPING DATA

--1. GROUP BY
-- The GROUP BY clause allows you to arrange the rows of a query in groups. 
-- The groups are determined by the columns that you specify in the GROUP BY clause.
-- The GROUP BY clause is often used with aggregate functions for generating summary reports.
-- An aggregate function performs a calculation on a group and returns a unique value per group.
-- The GROUP BY clause arranges rows into groups and an aggregate function returns the summary for each group.

--2. HAVING
-- The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of conditions. 
-- Because SQL Server processes the HAVING clause after the GROUP BY clause, 
-- you cannot refer to the aggregate function specified in the select list by using the column alias.

--3. GROUPING SETS
-- A grouping set is a group of columns by which you group. 
-- Typically, a single query with an aggregate defines a single grouping set.
-- The "GROUPING SETS" defines multiple grouping sets in the same query.

-- The GROUPING function indicates whether a specified column in a GROUP BY clause is aggregated or not. 
-- It returns 1 for aggregated or 0 for not aggregated in the result set.

--4. CUBE
-- The CUBE is a subclause of the GROUP BY clause that allows you to generate multiple grouping sets.
-- If you have N dimension columns specified in the CUBE, you will have 2^N grouping sets.

--5. ROLLUP
-- ROLLUP is a subclause of the GROUP BY clause which provides a shorthand for defining multiple grouping sets.
-- When generating the grouping sets, ROLLUP assumes a hierarchy among the dimension columns and 
-- only generates grouping sets based on this hierarchy.
-- The ROLLUP is often used to generate subtotals and totals for reporting purposes.
-- The ROLLUP is commonly used to calculate the aggregates of hierarchical data such as sales by year > quarter > month.
----------------------------------------------------------------------------------------
--GROUP BY
--1. SIMPLE EXAMPLE
-- Retrieve the customer id and the ordered year of the customers with customer id one and two
SELECT
	customer_id, YEAR(order_date) ORDER_YEAR
FROM
	[sales].[orders]
WHERE
	customer_id IN (1, 2)
GROUP BY
	customer_id, YEAR(order_date)
ORDER BY
	customer_id;

-- OR
SELECT DISTINCT
	customer_id, YEAR(order_date) ORDER_YEAR
FROM
	[sales].[orders]
WHERE
	customer_id IN (1, 2)
ORDER BY
	customer_id;

--2 GROUP BY WITH AGGREGATE FUNCTIONS
-- Find the number of orders placed by the customer by year
SELECT
	customer_id, YEAR(order_date)ORDER_YEAR, COUNT(order_id) ORDER_PLACED
FROM	
	[sales].[orders]
WHERE
	customer_id IN (1, 2)
GROUP BY
	customer_id, YEAR(order_date)
ORDER BY
	YEAR(order_date) DESC

--3. Find the number of customers in every city
SELECT
	city, COUNT(customer_id) TOTAL_CUSTOMERS
FROM	
	[sales].[customers]
GROUP BY
	city
ORDER BY
	city;

--4. Find the number of customers by state and city
SELECT
	state, city, COUNT(customer_id) TOTAL_CUSTOMERS
FROM
	[sales].[customers]
GROUP BY
	state, city
ORDER BY
	state, city;

--5. Total customers by state
SELECT
	state, COUNT(customer_id) TOTAL_CUSTOMERS
FROM
	[sales].[customers]
GROUP BY
	state
ORDER BY
	state;

--6. Find the average list price by brand for all products with the model year 2018
SELECT
	B.brand_name, 
	CAST(ROUND(AVG(P.list_price), 2) AS decimal (10, 2)) AVG_PRICE
FROM
	[production].[brands] B
INNER JOIN
	[production].[products] P
ON
	B.brand_id = P.brand_id
WHERE
	P.model_year = 2018
GROUP BY
	B.brand_name
ORDER BY
	B.brand_name;

--7. Find the minimum and maximum list prices of all products with the model 2018 by brand
SELECT
	B.brand_name, MIN(P.list_price)MIN_PRICE, MAX(P.list_price)MAX_PRICE
FROM
	[production].[products] P
INNER JOIN
	[production].[brands] B
ON
	P.brand_id = B.brand_id
WHERE
	P.model_year = 2018
GROUP BY
	B.brand_name
ORDER BY
	B.brand_name;

--8. GROUP BY WITH SUM() FUNCTION
-- Find the net value of every order
SELECT
	order_id,
	SUM(quantity * list_price * (1 - discount))NET_VALUE
FROM
	[sales].[order_items]
GROUP BY
	order_id;
----------------------------------------------------------------------------------------

-- HAVING
--1. HAVING WITH COUNT() FUNCTION
-- Find the customers who placed at least two orders per year
SELECT
	customer_id, YEAR(order_date) ORDERED_IN, COUNT(order_id) TOTAL_ORDER
FROM
	[sales].[orders]
GROUP BY
	customer_id, YEAR(order_date)
HAVING 
	COUNT(order_id) >= 2
ORDER BY
	customer_id;

-- HAVING WITH SUM()
-- Finds the sales orders whose net values are greater than 20,000
SELECT
	order_id,
	SUM(
		quantity * list_price * (1 - discount)
		)NET_VALUE
FROM	
	[sales].[order_items]
GROUP BY
	order_id
HAVING
	SUM(
		quantity * list_price * (1 - discount)
		) >= 20000
ORDER BY
	NET_VALUE;

-- HAVING WITH MIN(), MAX()
-- Finds the maximum and minimum list prices in each product category
SELECT
	category_id, MAX(list_price)HIGHEST_VALUE, MIN(list_price)LOWEST_VALUE
FROM
	[production].[products]
GROUP BY
	category_id
HAVING
	MAX(list_price) > 400 OR MIN(list_price) < 500;

-- HAVING WITH AVG()
-- Find product categories whose average list prices are between 500 and 1,000
SELECT
	category_id, AVG(list_price)AVG_PRICE
FROM
	[production].[products]
GROUP BY
	category_id
HAVING
	AVG(list_price) BETWEEN 500 AND 1000
ORDER BY
	category_id;
----------------------------------------------------------------------------------------

--3. GROUPING SETS

-- STEP 1
-- TO UNDERSTAND "GROUPING SETS" CREATE NEW TABLE [sales].[sales_summary]
-- FROM [sales].[order_items] BY APPLYING INNER JOINS ON  [production].[products],
-- [production].[brands] AND [production].[categories].
SELECT
    B.brand_name AS brand, C.category_name AS category, P.model_year,
    round(
        SUM (
            quantity * I.list_price * (1 - discount)
        ),
        0
    ) sales INTO [sales].[sales_summary]
FROM
    [sales].[order_items] I
INNER JOIN 
	[production].[products] P 
ON 
	P.product_id = I.product_id
INNER JOIN 
	[production].[brands] B 
ON 
	B.brand_id = P.brand_id
INNER JOIN 
	[production].[categories] C 
ON 
	C.category_id = P.category_id
GROUP BY
    B.brand_name, C.category_name, P.model_year
ORDER BY
    B.brand_name, C.category_name, P.model_year;

-- STEP 2
-- DISPLAY DATA IN [sales].[sales_summary]
SELECT * 
FROM
	[sales].[sales_summary]
ORDER BY
	brand, category, model_year;

-- STEP 3
SELECT
	 brand, category, SUM(sales)SALES
FROM
	[sales].[sales_summary]
GROUP BY
	GROUPING SETS(
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand, category;
------------- DONE -------------

-- GROUPING FUNCTION EXAMPLE
SELECT
    GROUPING(brand) GROUPING_BRAND, GROUPING(category) GROUPING_CATEGORY, brand, category,
    SUM (sales) sales
FROM
    [sales].[sales_summary]
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY
    brand, category;
----------------------------------------------------------------------------------------
-- CUBE

-- BASIC EXAMPLE
SELECT
	brand, category, SUM(sales)SALES
FROM
	[sales].[sales_summary]
GROUP BY
	CUBE(brand, category);

-- PARTIAL CUBE
SELECT
	brand, category, SUM(sales)SALES
FROM
	[sales].[sales_summary]
GROUP BY
	brand,
	CUBE(category);
----------------------------------------------------------------------------------------
-- ROLLUP
-- Use "ROLLUP" to calculate the sales amount by brand (subtotal) and both brand and category (total).
-- NOTE HIERARCHY IS BRAND --> CATEGORY
SELECT
	brand, category, SUM(sales) SALES
FROM
	[sales].[sales_summary]
GROUP BY
	ROLLUP(brand, category);

-- CHANGE ORDER OF ROLLUP i.e. CATEGORY --> BRAND
SELECT
	category, brand, SUM(sales) SALES
FROM
	[sales].[sales_summary]
GROUP BY
	ROLLUP(category, brand);

-- PARTIAL ROLLUP
SELECT
	brand, category, SUM(sales) SALES
FROM
	[sales].[sales_summary]
GROUP BY
	brand, ROLLUP(category);
----------------------------------------------------------------------------------------
