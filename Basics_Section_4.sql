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