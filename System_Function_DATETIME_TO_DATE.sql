USE BikeStores;

----------------------------------------------------------------------------------------
-- DATETIME TO DATE
-- To convert a datetime to a date, you can use the CONVERT(), TRY_CONVERT(), or CAST() function.
-- Note that the GETDATE() function returns the current database server’s datetime.
----------------------------------------------------------------------------------------
-- USE CAST() TO CONVERT DATETIME TO DATE
SELECT CAST(GETDATE() AS date) TODAYS_DATE;

-- USE CONVERT() TO CONVERT DATETIME TO DATE
SELECT CONVERT(date, GETDATE()) TODAYS_DATE;

-- USE TRY_CONVERT() TO CONVERT DATETIME TO DATE
SELECT TRY_CONVERT(date, GETDATE()) TODAYS_DATE;
----------------------------------------------------------------------------------------