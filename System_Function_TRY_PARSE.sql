USE BikeStores;

----------------------------------------------------------------------------------------
-- TRY_PARSE()
-- The TRY_PARSE() function is used to translate the result of an expression to the requested data type. It returns NULL if the cast fails.
----------------------------------------------------------------------------------------
--1. CONVERT STRING TO DATE
SELECT TRY_PARSE('20 APRIL 1989' AS date)STR_TO_DATE;
-- OR
SELECT TRY_PARSE('1989 20 APRIL' AS date)STR_TO_DATE;

--2. STRING TO NUMBER
SELECT TRY_PARSE('-125' AS int)STR_TO_INT;
-- OR
SELECT TRY_PARSE('125' AS int)STR_TO_INT;

--3. TRY_PARSR() WITH CASE
SELECT
	CASE
		WHEN TRY_PARSE('LAST YEAR' AS date) IS NULL THEN 'CAST FAILED'
		ELSE 'CAST SUCCEEDED'
	END RESULT;
----------------------------------------------------------------------------------------