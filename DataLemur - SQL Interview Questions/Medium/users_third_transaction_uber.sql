-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

-- transactions Table:

-- Column Name	Type
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

WITH order_transaction_date AS(
  
  SELECT 
    user_id
    , spend
    , transaction_date
    , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rows_num
  FROM transactions

)

SELECT
  user_id
  , spend
  , transaction_date
FROM order_transaction_date
WHERE rows_num = 3;

