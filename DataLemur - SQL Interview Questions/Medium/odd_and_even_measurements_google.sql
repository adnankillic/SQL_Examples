-- Assume you are given the table below containing measurement values obtained from a sensor over several days. 
-- Measurements are taken several times within a given day.

-- Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns.

-- Note that the 1st, 3rd, 5th measurements within a day are considered odd-numbered measurements and the 2nd, 4th, 6th measurements are even-numbered measurements.

-- measurements Table:
-- Column Name	Type
-- measurement_id	integer
-- measurement_value	decimal
-- measurement_time	datetime

WITH ranked_measurements AS( 

  SELECT 
    measurement_time::DATE AS measurement_day
    , measurement_value
    , ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time AS DATE) ORDER BY measurement_time) AS measurement_num 
  FROM measurements

)

SELECT
  measurement_day
  , SUM(CASE WHEN measurement_num % 2 != 0 THEN measurement_value ELSE 0 END ) AS odd_sum
  , SUM(CASE WHEN measurement_num % 2 = 0 THEN measurement_value ELSE 0 END ) AS even_sum
FROM ranked_measurements
GROUP BY measurement_day;


