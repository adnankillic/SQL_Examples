/*For every customer that bought Photoshop, return a list of the customers, and the total spent on all the products except for Photoshop products.

Sort your answer by customer ids in ascending order.

adobe_transactions Table:
Column Name	Type
customer_id	integer
product	string
revenue	integer
*/

SELECT 
 customer_id,
 SUM(revenue) AS revenue
FROM adobe_transactions
WHERE customer_id IN (SELECT customer_id FROM adobe_transactions WHERE product = 'Photoshop')
    AND product <> 'Photoshop'
GROUP BY customer_id
ORDER BY customer_id

