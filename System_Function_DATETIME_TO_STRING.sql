USE BikeStores;

----------------------------------------------------------------------------------------
-- DATETIME TO STRING

--The following table illustrates the valid style and the corresponding format of the datetime after converting to a string.
----------------------------------------------------------------------------------------------------------------------------------------
-- Without century (yy)	|	With century (yyyy)	|	Standard								|	Format
----------------------------------------------------------------------------------------------------------------------------------------
--	–						0 or 100				Default for datetime and smalldatetime		mon dd yyyy hh:miAM (or PM)
----------------------------------------------------------------------------------------------------------------------------------------
--	1						101						U.S.										1 = mm/dd/yy, 101 = mm/dd/yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	2						102						ANSI										2 = yy.mm.dd, 102 = yyyy.mm.dd
----------------------------------------------------------------------------------------------------------------------------------------
--	3						103						British/French								3 = dd/mm/yy, 103 = dd/mm/yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	4						104						German										4 = dd.mm.yy, 104 = dd.mm.yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	5						105						Italian										5 = dd-mm-yy, 105 = dd-mm-yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	6						106						–											6 = dd mon yy, 106 = dd mon yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	7						107						–											7 = Mon dd, yy, 107 = Mon dd, yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	8						108						–											hh:mi:ss
----------------------------------------------------------------------------------------------------------------------------------------
--	–						9 or 109				Default + milliseconds						mon dd yyyy hh:mi:ss:mmmAM (or PM)
----------------------------------------------------------------------------------------------------------------------------------------
--	10						110						USA											10 = mm-dd-yy, 110 = mm-dd-yyyy
----------------------------------------------------------------------------------------------------------------------------------------
--	11						111						JAPAN										11 = yy/mm/dd, 111 = yyyy/mm/dd
----------------------------------------------------------------------------------------------------------------------------------------
--	12						112						ISO											12 = yymmdd, 112 = yyyymmdd
----------------------------------------------------------------------------------------------------------------------------------------
--	–						13 or 113				Europe default + milliseconds				dd mon yyyy hh:mi:ss:mmm(24h)
----------------------------------------------------------------------------------------------------------------------------------------
--	14						114						–											hh:mi:ss:mmm(24h)
----------------------------------------------------------------------------------------------------------------------------------------
--	–						20 or 120				ODBC canonical								yyyy-mm-dd hh:mi:ss(24h)
----------------------------------------------------------------------------------------------------------------------------------------
--	–						21 or 121				ODBC canonical (with milliseconds) 
--													default for time, date, datetime2, and		yyyy-mm-dd hh:mi:ss.mmm(24h) 
--													datetimeoffset	
----------------------------------------------------------------------------------------------------------------------------------------
--	–						126						ISO8601										yyyy-mm-ddThh:mi:ss.mmm (no spaces)
----------------------------------------------------------------------------------------------------------------------------------------
--	–						127						ISO8601 with time zone Z.					yyyy-mm-ddThh:mi:ss.mmmZ (no spaces)
----------------------------------------------------------------------------------------------------------------------------------------
--	–						130						Hijri										dd mon yyyy hh:mi:ss:mmmAM
----------------------------------------------------------------------------------------------------------------------------------------
--	–						131						Hijri										dd/mm/yyyy hh:mi:ss:mmmAM
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- EXAMPLES OF CONVERTING DATETIME TO STRING
--1. CONVERT DATETIME TO STRING IN "mon dd yyyy hh:miAM/PM".

SELECT CONVERT(varchar(20), GETDATE(), 0) S1, CONVERT(varchar(20), GETDATE(), 100)S2;

--2. CONVERT DATETIME TO STRING IN "mm/dd/yy and mm/dd/yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 1) S1, CONVERT(varchar(20), GETDATE(), 101)S2;

--3. CONVERT DATETIME TO STRING IN "mon dd yyyy hh:miAM/PM".

SELECT CONVERT(varchar(20), GETDATE(), 3) S1, CONVERT(varchar(20), GETDATE(), 103)S2;

--4. CONVERT DATETIME TO STRING IN "dd.mm.yy and dd.mm.yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 4) S1, CONVERT(varchar(20), GETDATE(), 104)S2;

--5. CONVERT DATETIME TO STRING IN "dd-mm-yy and dd-mm-yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 5) S1, CONVERT(varchar(20), GETDATE(), 105)S2;

--6. CONVERT DATETIME TO STRING IN "dd mon yy and dd mon yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 6) S1, CONVERT(varchar(20), GETDATE(), 106)S2;

--7. CONVERT DATETIME TO STRING IN "Mon dd, yy and Mon dd yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 7) S1, CONVERT(varchar(20), GETDATE(), 107)S2;

--8. CONVERT DATETIME TO STRING IN "hh:mi:ss".

SELECT CONVERT(varchar(20), GETDATE(), 108) S1;

--9. CONVERT DATETIME TO STRING IN "mon dd yyyy hh:mi:ss:mmmAM/PM".

SELECT CONVERT(varchar(20), GETDATE(), 109)S2;

--10. CONVERT DATETIME TO STRING IN "mm-dd-yy and mm-dd-yyyy".

SELECT CONVERT(varchar(20), GETDATE(), 10) S1, CONVERT(varchar(20), GETDATE(), 110)S2;

--11. CONVERT DATETIME TO STRING IN "yy/mm/dd and yyyy/mm/dd".

SELECT CONVERT(varchar(20), GETDATE(), 11) S1, CONVERT(varchar(20), GETDATE(), 111)S2;

--12. CONVERT DATETIME TO STRING IN "yymmdd and yyyymmdd".

SELECT CONVERT(varchar(20), GETDATE(), 12) S1, CONVERT(varchar(20), GETDATE(), 112)S2;

--13. CONVERT DATETIME TO STRING IN "dd mon yyyy hh:mi:ss:mmm".

SELECT CONVERT(varchar(20), GETDATE(), 113) S1;

--14. CONVERT DATETIME TO STRING IN "hh:mi:ss:mmm" 24HR format.

SELECT CONVERT(varchar(20), GETDATE(), 114)S2;

--15. CONVERT DATETIME TO STRING IN "yyyy-mm-dd hh:mi:ss(24H)".

SELECT CONVERT(varchar(20), GETDATE(), 120)S2;

--16. CONVERT DATETIME TO STRING IN "yyyy-mm-dd hh:mi:ss.mmm (24h)".

SELECT CONVERT(varchar(20), GETDATE(), 121)S2;

--17. CONVERT DATETIME TO STRING IN "yyyy-mm-ddThh:mi:ss.mmm".

SELECT CONVERT(varchar(20), GETDATE(), 126)S2;

--18. CONVERT DATETIME TO STRING IN "yyyy-mm-ddThh:mi:ss.mmmZ".

SELECT CONVERT(varchar(20), GETDATE(), 127)S2;
----------------------------------------------------------------------------------------