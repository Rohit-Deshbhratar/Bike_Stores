USE BikeStores;

----------------------------------------------------------------------------------------
-- JOINS
-- In a relational database, data is distributed in multiple logical tables. 
-- To get a complete meaningful set of data, you need to query data from these tables using joins. 
-- SQL Server supports many kinds of joins, including inner join, left join, right join, full outer join, and cross join.

-- INNER JOIN
-- The INNER JOIN clause compares each row of table T1 with rows of table T2 to find all pairs of rows 
-- that satisfy the join predicate. If the join predicate evaluates to TRUE, the column values of the 
-- matching rows of T1 and T2 are combined into a new row and included in the result set.
-- INNER KEYWORD IS OPTIONAL.

-- LEFT JOIN
-- For each row from the T1 table, the query compares it with all the rows from the T2 table. 
-- If a pair of rows causes the join predicate to evaluate to TRUE, 
-- the column values from these rows will be combined to form a new row which is then included in the result set.
-- If a row from the left table (T1) does not have any matching row from the T2 table, 
-- the query combines column values of the row from the left table with NULL for each column value from the right table.

-- RIGHT JOIN
-- The RIGHT JOIN clause starts selecting data from the right table and matching it with the rows from the left table. 
-- The RIGHT JOIN returns a result set that includes all rows in the right table, 
-- whether or not they have matching rows from the left table.
-- If a row in the right table does not have any matching rows from the left table, 
-- the column of the left table in the result set will have nulls.

-- FULL OUTER JOIN
-- The FULL OUTER JOIN is a clause of the SELECT statement. 
-- The FULL OUTER JOIN clause returns a result set that includes rows from both left and right tables.
-- When no matching rows exist for the row in the left table, the columns of the right table will contain NULL.
-- Likewise, when no matching rows exist for the row in the right table, the column of the left table will contain NULL.

--'OUTER' keyword is optional.

-- CROSS JOIN
-- The CROSS JOIN joined every row from the first table (T1) with every row from the second table (T2). 
-- In other words, the cross join returns a Cartesian product of rows from both tables.
-- Unlike the INNER JOIN or LEFT JOIN, the cross join does not establish a relationship between the joined tables.

-- SELF JOIN
-- A self join allows you to join a table to itself. 
-- It helps query hierarchical data or compare rows within the same table.
-- A self join uses the inner join or left join clause. 
-- Because the query that uses the self join references the same table, 
-- the table alias is used to assign different names to the same table within the query.
----------------------------------------------------------------------------------------

-- INNER JOIN WITH 2 TABLES
SELECT
	P.product_name, C.category_name, P.list_price
FROM
	[production].[products] P
INNER JOIN
	[production].[categories] C
ON
	C.category_id = P.category_id
ORDER BY
	product_name DESC;

-- INNER JOIN WITH 3 TABLES
SELECT
	P.product_name, C.category_name, P.list_price, B.brand_name
FROM
	[production].[products] P
INNER JOIN
	[production].[categories] C
ON
	C.category_id = P.category_id
INNER JOIN
	production.brands B
ON
	B.brand_id = P.brand_id
ORDER BY
	product_name DESC;
----------------------------------------------------------------------------------------

-- LEFT JOIN WITH 2 TABLES
SELECT
	P.product_id, OI.order_id
FROM
	[production].[products] P
LEFT JOIN
	[sales].[order_items] OI
ON
	OI.product_id = P.product_id
ORDER BY
	order_id;

-- LEFT JOIN WITH 3 TABLES
-- production.products <-- sales.order_items <-- sales.orders
SELECT
	P.product_name, O.order_id, OI.item_id, O.order_date
FROM
	[production].[products] P
LEFT JOIN
	[sales].[order_items] OI
ON
	OI.product_id = P.product_id
LEFT JOIN
	[sales].[orders] O
ON
	O.order_id = OI.order_id
ORDER BY
	order_id;

-- Conditions in ON vs. WHERE clause
--1. Find the products that belong to order id 100
SELECT
    P.product_id, P.product_name, O.order_id
FROM
    [production].[products] P
LEFT JOIN [sales].[order_items] O 
   ON O.product_id = P.product_id
WHERE order_id = 100
ORDER BY
    order_id;

--2. 
SELECT
    P.product_id, P.product_name, O.order_id
FROM
    [production].[products] P
LEFT JOIN [sales].[order_items] O 
   ON O.product_id = P.product_id AND order_id = 100
ORDER BY
    order_id DESC;
----------------------------------------------------------------------------------------

-- RIGHT JOIN WITH 2 TABLES
SELECT
	P.product_name, OI.order_id
FROM
	[sales].[order_items] OI
RIGHT JOIN
	[production].[products] P
ON
	P.product_id = OI.product_id
ORDER BY
	OI.order_id;

-- Filter products that do not have any sale.
SELECT
	P.product_name, OI.order_id
FROM
	[sales].[order_items] OI
RIGHT JOIN
	[production].[products] P
ON
	P.product_id = OI.product_id
WHERE
	OI.order_id IS NULL
ORDER BY
	P.product_name;
----------------------------------------------------------------------------------------

-- FULL OUTER JOIN
SELECT
	P.product_name, OI.order_id
FROM
	[sales].[order_items] OI
FULL OUTER JOIN
	[production].[products] P
ON
	P.product_id = OI.product_id
ORDER BY
	OI.order_id;
----------------------------------------------------------------------------------------
-- CROSS JOIN
-- COMBINATIONS OF ALL PRODUCTS AND STORES
SELECT
	P.product_id, P.product_name, S.store_id, 0 AS Quantity
FROM
	[production].[products] P
CROSS JOIN
	[sales].[stores] S
ORDER BY
	P.product_name, S.store_id;

-- FIND PRODUCTS THAT HAVE NO SALES ACROSS THE STORES
SELECT
    s.store_id,
    p.product_id,
    ISNULL(sales, 0) sales
FROM
    sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
    SELECT
        s.store_id,
        p.product_id,
        SUM (quantity * i.list_price) sales
    FROM
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.stores s ON s.store_id = o.store_id
    INNER JOIN production.products p ON p.product_id = i.product_id
    GROUP BY
        s.store_id,
        p.product_id
) c ON c.store_id = s.store_id
AND c.product_id = p.product_id
WHERE
    sales IS NULL
ORDER BY
    product_id,
    store_id;
----------------------------------------------------------------------------------------

-- SELF JOIN
--1. TO QUERY HIERARCHICAL DATA
SELECT
	E.first_name + ' ' + E.last_name EMP,
	M.first_name + ' ' + M.last_name MGR
FROM
	[sales].[staffs] E
INNER JOIN
	[sales].[staffs] M
ON
	M.staff_id = E.manager_id
ORDER BY
	MGR;

--2. TO COMPARE ROWS WITHIN TABLES
SELECT
	C1.city,
	C1.first_name + ' ' + C1.last_name CUSTOMER_1,
	C2.first_name + ' ' + C2.last_name CUSTOMER_2
FROM
	[sales].[customers] C1
INNER JOIN
	[sales].[customers] C2
ON
	C1.customer_id > C2.customer_id AND C1.city = C2.city
ORDER BY
	C1.city, CUSTOMER_1, CUSTOMER_2;
----------------------------------------------------------------------------------------