-- Assume you are given the below table on transactions from users. Bucketing users based on their latest transaction date, write a query to obtain the number of users who 
-- made a purchase and the total number of products bought for each transaction date.

-- Output the transaction date, number of users and number of products.

-- user_transactions Table:
-- Column Name	Type
-- product_id	integer
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

WITH latest_date AS(

SELECT 
  transaction_date
  , user_id
  , product_id
  , RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS days_rank
FROM user_transactions

)

SELECT
  transaction_date
  , COUNT(DISTINCT user_id) AS number_of_users
  , COUNT(product_id) AS number_of_products
FROM latest_date
WHERE days_rank = 1
GROUP BY transaction_date
ORDER BY transaction_date

