USE BikeStores;

----------------------------------------------------------------------------------------
--1. The OFFSET and FETCH clauses are the options of the ORDER BY clause. 
-- They allow you to limit the number of rows to be returned by a query.

--2. The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. 
-- The offset_row_count can be a constant, variable, or parameter that is greater or equal to zero.

--3. The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed. 
-- The offset_row_count can a constant, variable or scalar that is greater or equal to one.

--4. The OFFSET clause is mandatory while the FETCH clause is optional. 
-- Also, the FIRST and NEXT are synonyms respectively so you can use them interchangeably. 
-- Similarly, you can use the FIRST and NEXT interchangeably.

--5. Note that you must use the OFFSET and FETCH clauses with the ORDER BY clause. Otherwise, you will get an error.

--6. The OFFSET and FETCH clauses are preferable for implementing the query paging solution than the TOP clause.
----------------------------------------------------------------------------------------

--1. TO SKIP FIRST 10 ROWS AND FETCH REMAINING ROWS.
SELECT
	product_name, list_price
FROM
	[production].[products]
ORDER BY
	product_name
OFFSET 10 ROWS;

--2. TO SKIP FIRST 10 ROWS AND FETCH NEXT 10 ROWS ONLY.
SELECT
	product_name, list_price
FROM 
	[production].[products]
ORDER BY
	product_name
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

-- 3. SELECT 10 MOST EXPENSIVE PRODUCTS.
SELECT
	product_name, list_price
FROM
	[production].[products]
ORDER BY
	list_price DESC
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;

----------------------------------------------------------------------------------------
--SQL Server SELECT TOP
--1. The SELECT TOP clause allows you to limit the number of rows or percentage of rows returned in a query result set.
--Because the order of rows stored in a table is unspecified, the SELECT TOP statement is always used in conjunction with the ORDER BY clause. 
--Therefore, the result set is limited to the first N number of ordered rows.

-- TOP = TOP keyword is an expression that specifies the number of rows to be returned.

-- PERCENT = PERCENT keyword indicates that the query returns the first N percentage of rows, 
-- where N is the result of the expression.

-- WITH TIES = WITH TIES allows you to return more rows with values that match the last row in the limited result set.
----------------------------------------------------------------------------------------
-- 1. SELECT 10 MOST EXPENSIVE PRODUCTS.
SELECT TOP 10
	product_name, list_price
FROM
	[production].[products]
ORDER BY
	list_price DESC;

--2. Using TOP to return a percentage of rows
SELECT 
	TOP 1 PERCENT
	product_name, list_price
FROM
	[production].[products]
ORDER BY
	list_price DESC;

--3. Using TOP WITH TIES to include rows that match the values in the last row
SELECT 
	TOP 3 WITH TIES
	product_name, list_price
FROM
	[production].[products]
ORDER BY
	list_price DESC;