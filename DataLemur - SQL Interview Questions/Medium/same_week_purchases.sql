/*Assume you are given the two tables below containing information on Etsy user signups and user purchases. 
Write a query to obtain the percentage of users who signed up and made a purchase within the same week of signing up. Results should be rounded to nearest 2 decimal places.

signups Table:
Column Name	Type
user_id	integer
signup_date	datetime

user_purchases Table:
Column Name	Type
user_id	integer
product_id	integer
purchase_amount	decimal
purchase_date	datetime
*/

SELECT 
  ROUND(100.0 * COUNT(DISTINCT user_purchases.user_id) / COUNT(DISTINCT signups.user_id), 2) AS same_week_purchases_pct
FROM signups
LEFT JOIN user_purchases ON user_purchases.user_id = signups.user_id
WHERE purchase_date IS NULL
      OR (purchase_date BETWEEN signup_date AND (signup_date + '1 week'::INTERVAL))