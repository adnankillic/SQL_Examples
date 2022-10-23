-- Assume you are given the table below containing information on Amazon customers and their spend on products belonging to various categories. 
-- Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

-- product_spend Table:
-- Column Name	Type
-- category	string
-- product	string
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

WITH product_category_spend AS(

SELECT 
  category
  , product
  , SUM(spend) AS total_spend
FROM product_spend
WHERE transaction_date >= '2022-01-01' AND transaction_date <=  '2022-12-31'
GROUP BY category, product

)
, top_spend AS(

SELECT
  *
  , RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS ranking
FROM product_category_spend

)

SELECT
  category
  , product
  , total_spend
FROM top_spend
WHERE ranking <= 2
ORDER BY category, ranking;



