USE BikeStores;

----------------------------------------------------------------------------------------
-- CONVERT()
-- The CONVERT() function returns the value of "expression" translated to the "target_type" with a specified "style".
----------------------------------------------------------------------------------------
-- CONVET DECIMAL TO INTEGER
SELECT CONVERT(int, 2.99) RESULT;

-- CONVERT DECIMAL TO ANOTHER DECIMAL
SELECT CONVERT(decimal, 3.59) RESULT;

SELECT CAST(3.59 AS DEC(2, 0)) RESULT;

-- CONVERT STRING TO DATETIME
SELECT CONVERT(datetime, '2024-01-08') RESULT;

-- CONVERT DATETIME TO STRING
SELECT CONVERT(datetime, GETDATE(),15) RESULT;
----------------------------------------------------------------------------------------