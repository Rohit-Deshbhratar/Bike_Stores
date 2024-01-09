USE BikeStores;

----------------------------------------------------------------------------------------
-- ISNUMERIC()
-- ISNUMERIC() accepts an expression and returns 1 if the expression is a valid numeric type; otherwise, it returns 0.
-- Note that a valid numeric type is one of the following:
-- The ISNUMERIC() actually checks if a value can be converted to a numeric data type and returns the right answer. 
-- However, it doesn’t tell you which datatype and properly handle the overflow.
-- This was why the TRY_CAST(), TRY_PARSE(), and TRY_CONVERT() function was introduced since SQL Server 2012.

-- Exact numbers: BIGINT, INT, SMALLINT, TINYINT, and BIT
-- Fixed precision: DECIMAL, NUMERIC
-- Approximate: FLOAT, REAL
-- Monetary values: MONEY, SMALLMONEY
----------------------------------------------------------------------------------------
--1. check if the string '$10' can be converted to a number or not
SELECT ISNUMERIC('$10')AS NUMERICC;

--2. IS THIS STRING '2.9854E-1074' IS NUMERIC
SELECT ISNUMERIC('2.9854E-1074')NUMERICC;

--3. IS THIS STRING '+ABC' IS NUMBER
SELECT ISNUMERIC('+ABC')NUMERICC;
----------------------------------------------------------------------------------------