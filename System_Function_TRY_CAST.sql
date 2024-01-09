USE BikeStores;

----------------------------------------------------------------------------------------
-- TRY_CAST()
-- The TRY_CAST() function casts a value of one type to another. It returns NULL if the conversion fails.
-- But, if you request a conversion that is explicitly not allowed, the TRY_CAST() function will fail with an error.

-- TRY_CAST() vs. CAST()
-- 1. If the cast fails, the TRY_CAST() function returns NULL while the CAST() function raises an error.
-- 2. You use the "NULL" handling functions or expressions such as ISNULL(), COALESCE, or CASE to handle the result of the TRY_CAST() function 
-- in case the cast fails. On the other hand, you use the TRY...CATCH statement to handle the result of the CAST() function if the cast fails.
----------------------------------------------------------------------------------------
-- 1. EXAMPLE OF RETURNING NULL
SELECT
	CASE
		WHEN TRY_CAST('TEST' AS int)IS NULL THEN 'CAST FAILED'
		ELSE 'CAST SUCCESSFUL'
	END AS RESULT;

-- 2. TRY_CAST RAISES AN ERROR
SELECT TRY_CAST(19.89 AS xml);

-- 3. USE TRY_CAST TO CAST STRING TO DECIMAL
SELECT TRY_CAST('20.04' AS decimal(4, 2))RESULT;
-- OR
SELECT TRY_CAST('19.876' AS decimal(4, 2))RESULT;
-- OR RETURNS NULL
SELECT TRY_CAST('212.4' AS decimal(4, 2))RESULT;

-- 4. CONVERT STRING TO INTEGER
SELECT TRY_CAST('1989' AS int)RESULT;
-- OR RETURNS NULL
SELECT TRY_CAST('19.89' AS int)RESULT;

-- CONVERT DATETIME TO DATE OR TIME
-- TO DATE
SELECT TRY_CAST(GETDATE() AS date)DATES;
-- TO TIME
SELECT TRY_CAST(GETDATE() AS time)TIMES
----------------------------------------------------------------------------------------