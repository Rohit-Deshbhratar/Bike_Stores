USE BikeStores;

----------------------------------------------------------------------------------------
-- CHECKSUM_AGG() FUNCTION
-- CHECKSUM_AGG() function is an aggregate function that returns the checksum of the values in a set.
----------------------------------------------------------------------------------------
--1. BASIC EXAMPLE
-- Create a new table with the data retrieved from the production.stocks table,
-- The new table stores products and their quantities

-- STEP 1
SELECT
	product_id, sum(quantity) QUANTITY
INTO
	[sales].[inventory]
FROM
	[production].[stocks]
GROUP BY
	product_id;

--STEP 2
SELECT
	CHECKSUM_AGG(QUANTITY)QTY_CHKSUM_AGG
FROM
	[sales].[inventory];
----------DONE----------

SELECT * 
FROM 
	[sales].[inventory]
ORDER BY
	product_id;

-- CHANGE/UPDATE DATA ANS SEE THE CHANGES IN CHECKSUM_AGG() OUTPUT

-- UPDATING DATA
UPDATE
	[sales].[inventory]
SET
	QUANTITY = 10
WHERE
	product_id = 1;

-- TO SEE THE CHANGES IN CHECKSUM_AGG()
SELECT
	CHECKSUM_AGG(QUANTITY) UPDATED_RESULT
FROM
	[sales].[inventory];
----------------------------------------------------------------------------------------