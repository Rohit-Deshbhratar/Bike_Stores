USE BikeStores;

----------------------------------------------------------------------------------------
-- SUM() FUNCTION
-- SUM() function is an aggregate function that calculates the sum of all or distinct values in an expression.
-- The SUM() function ignores NULL values.
-- When we use the DISTINCT modifier, the SUM() function returns the sum of only unique values.
----------------------------------------------------------------------------------------
--1. BASIC EXAMPLE
SELECT
	SUM(quantity) TOTAL_STOCK
FROM
	[production].[stocks];

--2. SUM() WITH GROUP BY
SELECT
	store_id, SUM(quantity) STORE_STOCK
FROM
	[production].[stocks]
GROUP BY
	store_id;

-- OR
SELECT
	store_name, SUM(quantity) STORE_STOCK
FROM
	[production].[stocks] S
INNER JOIN
	[sales].[stores] ST
ON
	ST.store_id = S.store_id
GROUP BY
	store_name;

-- SUM() WITH HAVING CLAUSE
-- Find stocks for each product and returns only products whose stocks are greater than 100
SELECT
	P.product_name, SUM(S.quantity)TOTAL_STOCK
FROM
	[production].[stocks] S
INNER JOIN
	[production].[products] P
ON
	P.product_id = S.product_id
GROUP BY
	P.product_name
HAVING
	SUM(P.list_price) > 100
ORDER BY
	TOTAL_STOCK DESC;

-- SUM() WITH EXPRESSIOPN
-- Calculate the net value for each sales order
SELECT
	order_id,
	SUM(
			quantity * list_price * (1 - discount)
		)NET_VALUE
FROM
	[sales].[order_items]
GROUP BY
	order_id
ORDER BY
	NET_VALUE DESC;
----------------------------------------------------------------------------------------