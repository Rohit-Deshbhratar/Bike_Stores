USE BikeStores;

----------------------------------------------------------------------------------------
-- IIF()
-- The IIF() function accepts three arguments. It evaluates the first argument and returns the second argument
-- if the first argument is true; otherwise, it returns the third argument.
----------------------------------------------------------------------------------------
--1. BASIC EXAMPLE
SELECT IIF(10 > 20, 'TRUE', 'FALSE')RESULT;

--2. IIF() WITH TABLE COLUMN
-- Returns the corresponding order status based on the status number.
SELECT
	IIF(order_status = 1, 'PENDING',
		IIF(order_status = 2, 'PROCESSING',
			IIF(order_status = 3, 'REJECTED',
				IIF(order_status = 4, 'COMPLETED', 'NA')
				)			
			)
		)ORDER_STATUS, COUNT(order_id)ORDER_COUNT
FROM
	[sales].[orders]
WHERE
	YEAR(order_date) = 2018
GROUP BY
	order_status;

--3. IIF() WITH AGGREGATE FUNCTION
SELECT
	SUM(IIF(order_status = 1, 1, 0))AS 'PENDING',
	SUM(IIF(order_status = 2, 1, 0))AS 'PROCESSING',
	SUM(IIF(order_status = 3, 1, 0))AS 'REJECTED',
	SUM(IIF(order_status = 4, 1, 0))AS 'COMPLETED',
	COUNT(*) TOTAL
FROM
	[sales].[orders]
WHERE
	YEAR(order_date) = 2018;
----------------------------------------------------------------------------------------