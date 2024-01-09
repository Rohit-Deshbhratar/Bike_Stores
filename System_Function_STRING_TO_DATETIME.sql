USE BikeStores;

----------------------------------------------------------------------------------------
-- STRING TO DATETIME
-- The CONVERT() and TRY_CONVERT() functions can convert United States datetime format (month, day, year and time) 
-- by default, therefore, you don’t need to specify style 101
----------------------------------------------------------------------------------------

-- Example shows how to use the CONVERT() function to convert strings in ISO date format to datetime values
SELECT CONVERT(DATETIME, '2024-01-09')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024/01/09')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024.01.09')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024-01-09 11:40')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024-01-09 11:40:09')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024-01-09 11:40:09.555')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024/01/09 11:40:09.555')STR_TO_DATE;
SELECT CONVERT(DATETIME, '2024.01.09 11:40:09.555')STR_TO_DATE;

-- CONVERT() function can also convert an ISO date string without delimiters to a date value
SELECT CONVERT(datetime, '20240109')STR_TO_DATE;

SELECT TRY_CONVERT( DATETIME, '01-31-2024')STR_TO_DATE;
SELECT TRY_CONVERT( DATETIME, '01/31/2024')STR_TO_DATE;
SELECT TRY_CONVERT( DATETIME, '01.31.2024')STR_TO_DATE;
SELECT TRY_CONVERT( DATETIME, '01-31-2024 12:15')STR_TO_DATE;
SELECT TRY_CONVERT( DATETIME, '01/31/2024 12:15:10')STR_TO_DATE;
SELECT TRY_CONVERT( DATETIME, '01.31.2024 12:15:10.333')STR_TO_DATE;
----------------------------------------------------------------------------------------
