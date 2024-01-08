USE BikeStores;

----------------------------------------------------------------------------------------
-- CAST()
-- CAST() function to convert a value or an expression from one type to another.
-- CAST() function explicitly convert a value of one type to another.
-- The CAST() function returns the expression converted to the target data type.

-- IMPLICITE CONVERSION
-- When you use two values with different data types,
-- SQL Server will try to convert the lower data type to the higher one before it can process the calculation. 
-- This is known as an implicit conversion in SQL Server.

-- RULES FOR CONVERSION

-- From Data Type | To Data Type | Behavior
---------------------------------------------------
-- numeric			numeric			Round
-- numeric			int				Truncate
-- numeric			money			Round
-- money			int				Round
-- money			numeric			Round
-- float			int				Truncate
-- float			numeric			Round
-- float			datetime		Round
-- datetime			int				Round
---------------------------------------------------

----------------------------------------------------------------------------------------

-- IMPLICITE CONVERSION EXAMPLE
SELECT 1 + '1' AS RESULT;

-- EXPLICITE CONVERSION EXAMPLE
SELECT 1 + CAST(1 AS int) RESULT;

-- CONVERT DECIMAL TO INTEGER
SELECT CAST (5.95 AS int) RESULT;

-- CONVERT DECIMAL TO ANOTHER DECIMAL WITH DIFFERENT LENGTH
SELECT CAST(5.95 AS DEC(3, 0)) RESULT;

-- CONVERT STRING TO DATETIME VALUE
SELECT CAST('2024-01-08' AS datetime) RESULT;

-- CAST() WITH ARITHMETIC OPERATOR
SELECT
	MONTH(O.order_date)MONTHS,
	CAST(SUM(OI.quantity * OI.list_price * (1 - OI.discount))AS int)AMOUNT
FROM
	[sales].[orders] O
INNER JOIN
	[sales].[order_items] OI
ON
	OI.order_id = O.order_id
WHERE
	YEAR(O.order_date) = 2017
GROUP BY
	MONTH(O.order_date)
ORDER BY
	MONTHS;