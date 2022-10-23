/*Assume you are given the table below for the purchasing activity by order date and product type. 
Write a query to calculate the cumulative purchases for each product type over time in chronological order.

Output the order date, product, and the cumulative number of quantities purchased.

total_trans Table:
Column Name	Type
order_id	integer
product_type	string
quantity	integer
order_date	datetime
*/

SELECT 
  order_date,
  product_type,
  SUM(quantity) OVER (PARTITION BY product_type ORDER BY order_date) AS cum_purchased
FROM total_trans
ORDER BY order_date