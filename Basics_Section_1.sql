USE BikeStores;

--This tutorial introduces you to the basics of the SQL Server SELECT statement, 
--focusing on how to query against a single table.
----------------------------------------------------------------------------------------
--QUERY EXECUTION ORDER IS AS FOLLOWS
-- FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
----------------------------------------------------------------------------------------

-- 1. SELECTING 2 COLUMNS FROM TABLE
SELECT
	first_name, last_name
FROM
	[sales].[customers];

-- 2.. SELECTING 3 COLUMNS FROM TABLE
SELECT
	first_name, last_name, email
FROM
	[sales].[customers];

-- 1. SELECTING ALL COLUMNS FROM TABLE
SELECT * FROM [sales].[customers];