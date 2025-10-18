-- 17/10/2025 part 1
SELECT * FROM STATION_DATA
WHERE year = 2003;

-- we can use != OR <> for exclusion
SELECT * FROM STATION_DATA
WHERE year != 2003;

SELECT * FROM STATION_DATA
WHERE year <> 2003;

-- incluse ranges
SELECT * FROM STATION_DATA
WHERE year BETWEEN 2003 and 2005;

-- using and or in (>= <=)
SELECT * FROM STATION_DATA
WHERE year >= 2003 AND year <= 2005;

SELECT * FROM STATION_DATA
WHERE year > 2003 AND year < 2005; -- exclusive

SELECT * FROM STATION_DATA
WHERE month = 3
OR month = 4
OR month = 5;

SELECT * FROM STATION_DATA
WHERE month IN (3, 4, 5); --IN - we have to provide a valid list

SELECT * FROM STATION_DATA
WHERE year = 2003 AND month = 8; -- when i born

SELECT * FROM STATION_DATA
WHERE month NOT IN (3, 4, 5);

SELECT * FROM STATION_DATA
WHERE month % 3 = 0; -- end of each quater

-- we can also use with text - ' '
SELECT * FROM STATION_DATA
WHERE report_code = '4B4146';

SELECT * FROM STATION_DATA
WHERE report_code IN ('513A63', '1F8A7B', 'EF616A');

SELECT * FROM STATION_DATA
WHERE length(report_code) != 6;

-- wild cards LIKE (% any number of characters) (_ a single character)
SELECT* FROM STATION_DATA
WHERE report_code LIKE 'A%'; --starts with A and has any number of characters after

SELECT * FROM STATION_DATA
WHERE report_code LIKE 'A_C%';

SELECT * FROM STATION_DATA
WHERE report_code LIKE 'AC%';

-- booleans
SELECT * FROM STATION_DATA
WHERE tornado = 1 AND hail = 1;

SELECT * FROM STATION_DATA
WHERE tornado AND hail;

SELECT * FROM STATION_DATA
WHERE tornado = 0 AND hail = 1;

SELECT * FROM STATION_DATA
WHERE NOT tornado AND hail;

--IS NULL, IS NOT NULL
SELECT * FROM STATION_DATA
WHERE snow_depth IS NULL;  -- null is often unwanted

SELECT * FROM STATION_DATA
WHERE precipitation <= 0.5; -- did you consider the null values?

SELECT * FROM STATION_DATA
WHERE precipitation IS NULL OR precipitation <= 0.5;

-- using coalesce() - null -> specified default value
SELECT * FROM STATION_DATA
WHERE coalesce(precipitation, 0) <= 0.5;

SELECT report_code, coalesce(precipitation, 1000) as rainfall
FROM STATION_DATA;

SELECT * FROM STATION_DATA
WHERE (rain = 1 AND temperature <= 32)
OR snow_depth > 0;