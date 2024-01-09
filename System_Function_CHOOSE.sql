USE BikeStores;

----------------------------------------------------------------------------------------
-- CHOOSE()
-- The CHOOSE() function returns the item from a list of items at a specified index.
-- Index starts with 1.
-- If index is not an integer, it will be converted to an integer. 
-- In case the index is out of the boundary of the list, the CHOOSE() function will return NULL.
----------------------------------------------------------------------------------------
--1. BASIC EXAMPLE
SELECT CHOOSE(2, 'FIRST', 'SECOND', 'THIRD')RESULT;

--2. APPLYING ON TABLE COLUMN
-- Return the order status based on the value in the "order_status" column of the "sales.orders" table.
SELECT
	order_id, order_date, order_status, 
	CHOOSE(order_status, 'Pending', 'Processing', 'Rejected', 'Completed')as ORDER_STATUS
FROM
	[sales].[orders]
ORDER BY
	order_date DESC;

--3. CHOOSE() WITH MONTH FINCTION
--  Return the seasons in which the customers buy products.
SELECT
	order_id, order_date, customer_id,
	CHOOSE(MONTH(order_date), 'WINTER', 'WINTER', 'SPRING', 'SPRING', 'SPRING', 'SUMMER', 'SUMMER', 'SUMMER', 'AUTUMN', 'AUTUMN', 'AUTUMN', 'WINTER')
FROM
	[sales].[orders]
ORDER BY
	customer_id;
----------------------------------------------------------------------------------------