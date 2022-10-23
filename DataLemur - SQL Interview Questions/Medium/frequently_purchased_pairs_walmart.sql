-- Assume you are given the following tables on Walmart transactions and products. 
-- Find the top 3 products that are most frequently bought together (purchased in the same transaction).

-- Output the name of product #1, name of product #2 and number of combinations in descending order.

-- transactions Table:
-- Column Name	Type
-- transaction_id	integer
-- product_id	integer
-- user_id	integer
-- transaction_date	datetime

WITH purchase_info AS(

  SELECT 
    user_id
    , transactions.product_id
    , transactions.transaction_id
    , product_name
  FROM transactions
  INNER JOIN products ON transactions.product_id = products.product_id

)

SELECT
  p1.product_name AS product1
  , p2.product_name AS product2
  , COUNT(*) AS combo_num
FROM purchase_info AS p1
INNER JOIN purchase_info AS p2 ON p1.transaction_id = p2.transaction_id
          AND p1.product_id > p2.product_id
GROUP BY p1.product_name, p2.product_name 
ORDER BY combo_num DESC 
LIMIT 3;


