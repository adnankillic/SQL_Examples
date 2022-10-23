-- Assume you are given the table below on user transactions. Write a query to obtain the list of customers whose first transaction was valued at $50 or more. 
-- Output the number of users.

-- Clarification:

-- Use the transaction_date field to determine which transaction should be labeled as the first for each user.
-- Use a specific function (we can't give too much away!) to account for scenarios where a user had multiple transactions on the same day, and one of those was the first.

-- user_transactions Table:
-- Column Name	Type
-- transaction_id	integer
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

WITH purchase_num AS(

SELECT 
  user_id
  , spend
  , RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank_num
FROM user_transactions

)

SELECT
  COUNT(DISTINCT user_id ) AS users
FROM purchase_num
WHERE rank_num = 1 AND spend >= 50;
