-- CASE: this command allows you to replace the value of a column for another value, according to one or more conditions
SELECT report_code, year, month, day, wind_speed,
CASE
WHEN wind_speed >= 40 THEN 'HIGH'
WHEN wind_speed >= 30 AND wind_speed < 40 THEN 'MODERATE'
ELSE 'LOW' --CASE BASE
END AS wind_severity
FROM STATION_DATA;

SELECT year,
CASE 
WHEN wind_speed >= 40 THEN 'HIGH'
WHEN wind_speed >= 30 THEN 'MODERATE'
ELSE 'LOW'
END AS wind_severity,
COUNT(*) AS record_count
FROM STATION_DATA
GROUP BY 1, 2;

SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS no_tornado_precipitation
FROM STATION_DATA
GROUP BY year, month;

SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS no_tornado_precipitation
FROM STATION_DATA
WHERE precipitation IS NOT NULL AND precipitation > 0
GROUP BY year, month;

SELECT year,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) AS max_tornado_precipitation,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) AS max_no_tornado_precipitation
FROM STATION_DATA
GROUP BY year
ORDER BY year DESC;

SELECT year,
MIN(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) AS max_tornado_precipitation,
MIN(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) AS max_no_tornado_precipitation
FROM STATION_DATA
GROUP BY year
ORDER BY year DESC;

SELECT year,
round(AVG(CASE WHEN rain OR hail THEN temperature ELSE NULL END), 2) AS avg_precipitation_temp,
round(AVG(CASE WHEN NOT rain AND NOT hail THEN temperature ELSE NULL END), 2) AS avg_no_precipitation_temp
FROM STATION_DATA
WHERE year >= 2003
GROUP BY year;

SELECT month,
round(AVG(CASE WHEN rain OR hail THEN temperature ELSE NULL END), 2) AS avg_precipitation_temp,
round(AVG(CASE WHEN NOT (rain OR hail) THEN temperature ELSE NULL END), 2) AS avg_no_precipitation_temp
FROM STATION_DATA
WHERE year >= 2003
GROUP BY month; 

--When we use the CASE statement, we create more opportunities to slice data in interesting ways and embed more information into the same queries.