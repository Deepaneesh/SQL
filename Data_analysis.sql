-- Removing Dupicates 

SELECT
  *,
  COUNT(1) AS COUNT
FROM
  iris_tbl
GROUP BY
    iris_tbl."Sepal.Length",
    iris_tbl."Sepal.Width",
    iris_tbl."Petal.Length",
    iris_tbl."Petal.Width",
    iris_tbl.Species
HAVING
    COUNT(1) <> 1;

-- CAST is used for changing the column type in SQL
SELECT DISTINCT
    CAST("month" AS INTEGER) AS month
FROM flights_tbl
ORDER BY month;

-- NOTE:- when ever using the aggregated function use  HAVING

-- Working with Date function in SQL

SELECT 
DATETIME(
    SUBSTR(time_hour, 1, 10) || ' ' || SUBSTR(time_hour, 11) 
) AS date_with_time
FROM flights_tbl
LIMIT 5;

-- eXTRACTING THE YEAR from datetime stramp
SELECT
    CAST(STRFTIME('%Y', DATETIME(time_hour)) AS INTEGER) AS year
FROM weather_tbl
WHERE DATETIME(time_hour) > '2013-01-02';