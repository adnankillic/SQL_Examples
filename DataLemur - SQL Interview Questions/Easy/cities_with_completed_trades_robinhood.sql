-- You are given the tables below containing information on Robinhood trades and users. 
-- Write a query to list the top three cities that have the most completed trade orders in descending order.

-- Output the city and number of orders.

-- trades Table:
-- Column Name	Type
-- order_id	integer
-- user_id	integer
-- price	decimal
-- quantity	integer
-- status	string('Completed' ,'Cancelled')
-- timestamp	datetime

-- users Table:
-- Column Name	Type
-- user_id	integer
-- city	string
-- email	string
-- signup_date	datetime


SELECT 
  users.city
  , COUNT(trades.order_id) AS total_orders
FROM trades
INNER JOIN users ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY total_orders DESC
LIMIT 3;

