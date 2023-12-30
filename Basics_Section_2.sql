USE BikeStores;

-- In this tutorial, you will learn how to use the SQL Server ORDER BY clause to sort the result set of a query by one or more columns.

-- 1. ASCENDING ORDER(DEFAULT)
SELECT
	first_name, last_name
FROM
	sales.customers
ORDER BY
	first_name;

-- 2. DESCENDING ORDER
SELECT
	first_name, last_name
FROM	
	sales.customers
ORDER BY
	first_name DESC;

-- 3. Sort a result set by multiple columns. It sorts the customer list by the city first and then by the first name.
SELECT
	first_name, last_name, city
FROM	
	sales.customers
ORDER BY
	city, first_name;

-- 4. Sort a result set by multiple columns and different orders.
--The following statement sorts the customers by the city in descending order and 
--then sorts the sorted result set by the first name in ascending order.
SELECT
	first_name, last_name, city
FROM	
	sales.customers
ORDER BY
	city DESC, first_name ASC;

-- 5. Sort a result set by a column that is not in the select list
SELECT
	first_name, last_name, city
FROM	
	sales.customers
ORDER BY
	state;

-- 6. Sort a result set by an expression
SELECT
	first_name, last_name, city
FROM
	sales.customers
ORDER BY
	LEN(first_name) DESC;

-- 7. Sort by ordinal positions of columns
-- SQL Server allows you to sort the result set based on the ordinal positions of columns that appear in the select list.
SELECT
	first_name, last_name
FROM
	sales.customers
ORDER BY
	2 DESC, 1;
