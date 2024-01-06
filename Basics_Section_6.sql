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

--3. GROUPING SETS

--4. CUBE

--5. ROLLUP
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