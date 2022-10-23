/*Assume you are given the table below containing information on user purchases. Write a query to obtain the number of users who purchased the same product 
on two or more different days. Output the number of unique users.

purchases Table:
Column Name	Type
user_id	integer
product_id	integer
quantity	integer
purchase_date	datetime
*/

SELECT 
  COUNT(DISTINCT p1.user_id)
FROM purchases AS p1
JOIN purchases AS p2 ON p1.product_id = p2.product_id
    AND p1.purchase_date::DATE <> p2.purchase_date::DATE;