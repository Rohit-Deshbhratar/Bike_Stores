USE BikeStores;

----------------------------------------------------------------------------------------
--SELECT DISTINCT examples
-- Retrieve only distinct values in a specified list of columns.

-- If you apply the DISTINCT clause to a column that has NULL, 
-- the DISTINCT clause will keep only one NULL and eliminate the other. 
-- In other words, the DISTINCT clause treats all NULL “values” as the same value.
----------------------------------------------------------------------------------------
--1. SELECT UNIQUE CITIES.
SELECT
	DISTINCT city
FROM
	[sales].[customers]
ORDER BY
	city;

--2. DISTINCT WITH MULTIPLE COLUMNS
SELECT
	DISTINCT city, state
FROM
	[sales].[customers]
ORDER BY
	city, state;

--3. DISTINCT WITH NULL VALUES
SELECT
	DISTINCT phone
FROM
	[sales].[customers]
ORDER BY
	phone;

----------------------------------------------------------------------------------------
-- 'WHERE' CLAUSE
-- The WHERE clause only returns the rows that cause the search condition to evaluate to TRUE.
-- The search condition is a logical expression or a combination of multiple logical expressions. 
-- In SQL, a logical expression is often called a predicate.

-- Note that SQL Server uses three-valued predicate logic where a logical expression can evaluate to TRUE, FALSE, or UNKNOWN. 
-- The WHERE clause will not return any row that causes the predicate to evaluate to FALSE or UNKNOWN.
----------------------------------------------------------------------------------------

--1. Finding rows by using a simple equality
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	category_id = 1
ORDER BY
	list_price DESC;

--2. Finding rows that meet two conditions
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	category_id = 1 AND model_year = 2018
ORDER BY
	list_price DESC;

--3. Finding rows by using a comparison operator
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	list_price > 300 AND model_year = 2018
ORDER BY
	list_price DESC;

--4. Finding rows that meet any of two conditions
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	list_price > 300 OR model_year = 2018
ORDER BY
	list_price DESC;

--5. Finding rows with the value between two values
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	list_price BETWEEN 1899.0 AND 1999.99
ORDER BY
	list_price DESC;

--6. Finding rows that have a value in a list of values
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	list_price IN (299.99, 369.99, 489.99)
ORDER BY
	list_price DESC;

--7. Finding rows whose values contain a string
SELECT
	product_id, product_name, category_id, model_year, list_price
FROM
	[production].[products]
WHERE
	product_name LIKE '%Cruiser%'
ORDER BY
	list_price DESC;

----------------------------------------------------------------------------------------
-- 'NULL'
-- NULL is used to indicate the absence of any data value.
-- When NULL is involved in the logical evaluation, the result is UNKNOWN. 
-- Therefore, a logical expression may return one of three-valued logic: TRUE, FALSE, and UNKNOWN.

-- The results of the following comparisons are UNKNOWN:
-- NULL = 0
-- NULL <> 0
-- NULL > 0
-- NULL = NULL

-- The NULL does not equal anything, even itself. It means that NULL is not equal to NULL because each NULL could be different.

-- IS NULL = To test whether a value is NULL or not, you always use the IS NULL operator.
-- IS NOT NULL = To check if a value is not NULL, you can use the IS NOT NULL operator.
----------------------------------------------------------------------------------------

--1. Find the customers who do not have phone numbers recorded in the customers table.
SELECT
	customer_id, first_name, last_name,phone
FROM
	[sales].[customers]
WHERE
	phone IS NULL
ORDER BY
	first_name, last_name;

--2. Find the customers who have phone numbers recorded in the customers table.
SELECT
	customer_id, first_name, last_name,phone
FROM
	[sales].[customers]
WHERE
	phone IS NOT NULL
ORDER BY
	first_name, last_name;

----------------------------------------------------------------------------------------
-- 'AND' OPERATOR
-- The AND is a logical operator that allows you to combine two Boolean expressions. 
-- It returns TRUE only when both expressions evaluate to TRUE.

-- When you use more than one logical operator in an expression, 
-- SQL Server always evaluates the AND operators first. 
-- However, you can change the order of evaluation by using parentheses.
----------------------------------------------------------------------------------------

--1. Using AND operator
SELECT
	*
FROM
	[production].[products]
WHERE
	category_id = 1 AND list_price > 400
ORDER BY
	list_price DESC;

--2. Using multiple AND operators
SELECT
	*
FROM
	[production].[products]
WHERE
	category_id = 1 AND list_price > 400 AND brand_id = 1
ORDER BY
	list_price DESC;

--3. Using the AND operator with other logical operators
SELECT
	*
FROM
	[production].[products]
WHERE
	brand_id = 1 OR brand_id = 2 AND list_price > 1000  
ORDER BY
	brand_id DESC;

-- ABOVE QUERY WITH PARENTHESIS
SELECT
	*
FROM
	[production].[products]
WHERE
	(brand_id = 1 OR brand_id = 2) AND list_price > 1000  
ORDER BY
	brand_id;

----------------------------------------------------------------------------------------
-- 'OR' OPERATOR
-- OR is a logical operator that allows you to combine two Boolean expressions. 
-- It returns TRUE when either of the conditions evaluates to TRUE.
-- SQL Server evaluates the OR operators after the AND operator.
----------------------------------------------------------------------------------------

--1. Using OR operator
SELECT
	product_name, list_price
FROM	
	[production].[products]
WHERE
	list_price < 200 OR list_price > 6000
ORDER BY
	list_price;

--2. Using multiple OR operators
SELECT
	product_name, list_price
FROM	
	[production].[products]
WHERE
	brand_id = 1 OR brand_id = 2 OR brand_id = 4
ORDER BY
	list_price;

--3. Using OR operator with AND operator
SELECT
	product_name, brand_id, list_price
FROM
	[production].[products]
WHERE
	brand_id = 1 OR brand_id = 2 AND list_price > 500
ORDER BY
	brand_id DESC, list_price;

----------------------------------------------------------------------------------------
-- 'IN' OPERATOR
-- The IN operator is a logical operator that allows you to test whether a specified value matches any value in a list.
-- The IN operator is equivalent to multiple OR operators.
-- To negate the IN operator, you use the NOT IN operator
-- Note that if a list contains NULL, the result of IN or NOT IN will be UNKNOWN.
----------------------------------------------------------------------------------------

--1. IN OPERATOR EXAMPLE
SELECT
    product_name,
    list_price
FROM
    [production].[products]
WHERE
    list_price IN (89.99, 109.99, 159.99)
ORDER BY
    list_price;

--2. EXAMPLE WITH NOT IN
SELECT
    product_name,
    list_price
FROM
    [production].[products]
WHERE
    list_price NOT IN (89.99, 109.99, 159.99)
ORDER BY
    list_price;

----------------------------------------------------------------------------------------
-- 'BETWEEN' OPERATOR
-- The BETWEEN operator is a logical operator that allows you to specify a range to test.
-- The BETWEEN operator returns TRUE if the expression to test is greater than or equal to 
-- the value of the start_expression and less than or equal to the value of the end_expression.

-- 'NOT BETWEEN' OPERATOR
-- The NOT BETWEEN returns TRUE if the value in the column or expression is less than 
-- the value of the  start_expression and greater than the value of the end_expression.

-- Note that if any input to the BETWEEN or NOT BETWEEN is NULL, then the result is UNKNOWN.
----------------------------------------------------------------------------------------
--1. BETWEEN WITH NUMBERS
SELECT
	product_id, product_name, list_price
FROM
	[production].[products]
WHERE
	list_price BETWEEN 149.99 AND 199.99
ORDER BY
	list_price;

--2. BETWEEN WITH DATES
SELECT
	order_id, customer_id, order_date, order_status
FROM
	[sales].[orders]
WHERE
	order_date BETWEEN '2017-01-15' AND '2017-01-17'
ORDER BY
	order_date;

----------------------------------------------------------------------------------------
-- 'LIKE' OPERATOR
-- LIKE is a logical operator that determines if a character string matches a specified pattern. 
-- A pattern may include regular characters and wildcard characters. 
-- The LIKE operator is used in the WHERE clause of the SELECT, UPDATE, and DELETE statements 
-- to filter rows based on pattern matching.

-- WILDCARD CHARACTERS
-- The percent wildcard (%): any string of zero or more characters.
-- The underscore (_) wildcard: any single character.
-- The [list of characters] wildcard: any single character within the specified set.
-- The [character-character]: any single character within the specified range.
-- The [^]: any single character not within a list or a range.
----------------------------------------------------------------------------------------
-- The % (percent) wildcard
--1. USING '%' WILDCARD
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE 'Z%'
ORDER BY
	first_name;

--2. SELECT CUSTOMER WHOSE LAST NAME ENDS WITH 'er'
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE '%er'
ORDER BY
	first_name;

--3. SELECT CUSTOMER WHOSE LAST NAME STARTS WITH 'T' AND ENDS WITH 'S'.
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE 'T%s'
ORDER BY
	first_name;

-- The _ (underscore) wildcard
--4. SELECT CUSTOMER WHOSE LAST NAME SECOND CHARACTER IS 'u'.
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE '_u%'
ORDER BY
	first_name;

-- The [list of characters] wildcard
--5. SELECT CUSTOMERS WHERE FIRST CHAR IN LAST NAME IS 'Y' OR 'Z'.
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE '[YZ]%'
ORDER BY
	first_name;

-- The [character-character] wildcard
-- Find the customers where the first character in the last name is the letter in the range A to C
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE '[A-C]%'
ORDER BY
	first_name;

-- The [^Character List or Range] wildcard
-- Select customers where the first character in the last name is not the letter in the range A to X
SELECT
	customer_id, first_name, last_name
FROM
	[sales].[customers]
WHERE
	last_name LIKE '[^A-X]%'
ORDER BY
	first_name;

-- 'NOT LIKE' OPERATOR
SELECT
    customer_id, first_name, last_name
FROM
    [sales].[customers]
WHERE
    first_name NOT LIKE 'A%'
ORDER BY
    first_name;

-- LIKE with ESCAPE
SELECT
	product_name
FROM
	[production].[products]
WHERE
	product_name LIKE '%!"%' ESCAPE '!';

-- COLUMN ALIAS
-- If the column alias contains spaces, you need to enclose it in quotation marks
-- 'AS' KEYWORD IS OPTIONAL
SELECT
    first_name + ' ' + last_name AS 'Full Name'
FROM
    [sales].[customers]
ORDER BY
    first_name;

-- Table alias
-- A table can be given an alias which is known as correlation name or range variable.
-- Similar to the column alias, table alias can be assigned either with or without the AS keyword