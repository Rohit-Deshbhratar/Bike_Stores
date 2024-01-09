USE BikeStores;

----------------------------------------------------------------------------------------
-- ISNULL
-- ISNULL() function replaces NULL with a specified value.
-- The ISNULL() function returns the replacement if the expression evaluates to NULL.
-- Before returning a value, it implicitly converts the type of "replacement" 
-- to the type of the "expression" if the types of the two arguments are different.
-- In case the "expression" is not NULL, the ISNULL() function returns the value of the "expression".
----------------------------------------------------------------------------------------
--1. ISNULL WITH NUMERIC DATA TYPE
SELECT ISNULL(NULL, 20)RESULT; -- NULL IS REPLACEMENT, 20 IS EXPRESSION
SELECT ISNULL(20, NULL)RESULT; -- 20 IS REPLACEMENT, NULL IS EXPRESSION

--2. ISNULL WITH STRING
SELECT ISNULL('HELLO', 'HI')RESULT;
-- ReturnS the string 'Hello' because it is the first argument and not NULL

--3. WORKING WITH DATA
SELECT
	ISNULL(phone, 'NOT AVAILABLE')CANTACT_DETAILS
FROM
	[sales].[customers];
----------------------------------------------------------------------------------------