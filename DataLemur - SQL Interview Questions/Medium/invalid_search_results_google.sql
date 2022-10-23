/*Output the country (in ascending order), total number of searches and percentage of invalid search rounded to 2 decimal places.

Note that to find the percentages, multiply by 100.0 and not 100 to avoid integer division.

Definition and assumptions:

num_search is the number of searches attempted and invalid_result_pct is the percentage of invalid searches.
In cases where countries has search attempts but does not have an invalid result percentage, it should be excluded, and vice versa.

search_category Table:

Column Name	Type
country	string
search_cat	string
num_search	integer
invalid_result_pct	decimal*/

WITH invalid_results AS(

SELECT 
  country,
  num_search,
  invalid_result_pct,
  CASE WHEN invalid_result_pct IS NOT NULL THEN num_search ELSE NULL END AS num_search_2,
  ROUND((num_search * invalid_result_pct)/100.0) AS invalid_search
FROM search_category
WHERE num_search IS NOT NULL AND invalid_result_pct IS NOT NULL

)

SELECT
  country,
  SUM(num_search_2) AS total_search,
  ROUND(SUM(invalid_search)/ SUM(num_search_2)*100.0, 2) AS invalid_result_pct
FROM invalid_results
GROUP BY country
ORDER BY country

