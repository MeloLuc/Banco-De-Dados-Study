-- data aggregation (also called totalization, summarization, or grouping)

--record count
SELECT COUNT(*) AS record_count FROM STATION_DATA;

SELECT COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1;

SELECT year, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1
GROUP BY year;

SELECT year, month, COUNT(*)AS record_count FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month; 

SELECT year, month, COUNT(*) FROM STATION_DATA
WHERE tornado = 1
GROUP BY 1, 2;

SELECT year, month, COUNT(*) FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month
ORDER BY year, month;

SELECT year, month, COUNT(*) FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month
ORDER BY year DESC, month;

SELECT year, month, COUNT(*) FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month
ORDER BY year DESC, month DESC;

-- we can use a column in COUNT() function to count how many fields are not null
SELECT COUNT(snow_depth) AS record_snow_depth_count FROM STATION_DATA;

SELECT year, month, temperature, COUNT(snow_depth) AS record_snow_depth_count FROM STATION_DATA
WHERE snow_depth NOT NULL AND snow_depth > 0 
GROUP BY year, month, temperature
ORDER BY year, month;

SELECT COUNT(DISTINCT year) AS total_years FROM STATION_DATA;

SELECT COUNT(DISTINCT year) AS total_years_with_snow FROM STATION_DATA
WHERE snow_depth > 0;

SELECT year, COUNT(DISTINCT year) AS total_years_with_snow FROM STATION_DATA
WHERE snow_depth > 0
GROUP BY year
ORDER BY year DESC;

--average
SELECT month, round(AVG(temperature), 2) AS average_temperature FROM STATION_DATA
WHERE year = 2003
GROUP BY month;

SELECT year, month, round(AVG(temperature), 2) AS average_temperature FROM STATION_DATA
GROUP BY year, month
ORDER BY year DESC, month;

--sum
SELECT year, round(SUM(snow_depth), 2) AS total_snow_depth FROM STATION_DATA
WHERE snow_depth IS NOT NULL
GROUP BY year
ORDER BY year;


