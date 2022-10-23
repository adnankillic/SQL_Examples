/*In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. 
A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.

transactions Table:
Column Name	Type
user_id	integer
amount	float
transaction_date	timestamp
*/

WITH unique_dates AS(
  SELECT
    DISTINCT user_id,
    DATE(transaction_date) AS transaction_date
  FROM transactions
      )
,shoppers AS(
  SELECT 
    user_id,
    transaction_date AS first_day,
    LEAD(transaction_date, 1) OVER(PARTITION BY user_id ORDER BY transaction_date) AS second_day,
    LEAD(transaction_date, 2) OVER(PARTITION BY user_id ORDER BY transaction_date) AS third_day
  FROM unique_dates
)

SELECT
  DISTINCT user_id
FROM shoppers
WHERE second_day = first_day + INTERVAL '1 DAY'  AND third_day = second_day + INTERVAL '1 DAY' ;