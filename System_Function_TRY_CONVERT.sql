USE BikeStores;

----------------------------------------------------------------------------------------
-- TRY_CONVERT()
-- The TRY_CONVERT() function converts a value of one type to another. It returns NULL if the conversion fails.
-- However, if you request a conversion that is explicitly not permitted, the TRY_CONVERT() function will fail with an error.

-- TRY_CONVERT() vs. CONVERT()
-- 1. If the cast fails, the TRY_CONVERT() function returns NULL while the CONVERT() function raises an error.
-- 2. You can use the NULL handling functions or expressions such as ISNULL() and COALESCE to handle the result of the TRY_CONVERT() function in case the cast fails.
-- 3. To handle the result of the CONVERT() function if the cast fails, you use the TRY...CATCH statement.
----------------------------------------------------------------------------------------
--1. RETURNS NULL EXAMPLE
SELECT 
	CASE 
		WHEN TRY_CONVERT(int, 'TEST') IS NULL THEN 'CAST FAILED'
		ELSE 'CAST SUCCEEDED'
	END AS RESULT;

--2. RAISES ERROR
SELECT TRY_CONVERT(xml, 3.25)RESULT;

--3. CONVERT STRING TO DECIMAL
SELECT TRY_CONVERT(decimal(4, 2), '45.89')RESULT;

-- OR ROUNDING OFF THE VALUES
SELECT TRY_CONVERT(decimal(5, 2), '99.995')RESULT;

-- OR RETURNS NULL (WRONG FORMAT IN QUERY)
SELECT TRY_CONVERT(decimal(4, 2), '123.45')RESULT;

--4. STRING TO INTEGER
SELECT TRY_CONVERT(int, '456')RESULT;

-- OR RETURN NULL
SELECT TRY_CONVERT(int, '55.6')RESULT;

--5. DATETIME TO DATE OR TIME
-- TO DATE
SELECT TRY_CONVERT(date, GETDATE())DATES;
-- TO TIME
SELECT TRY_CONVERT(time, GETDATE())TIMES;
----------------------------------------------------------------------------------------