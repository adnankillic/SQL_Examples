-- Microsoft Azure's capacity planning team wants to understand how much data its customers are using, and how much spare capacity is left in each of it's data centers. 
-- You’re given three tables: customers, datacenters, and forecasted_demand.

-- Write a query to find the total monthly unused server capacity for each data center. Output the data center id in ascending order and the total spare capacity.

-- customers Table:
-- Column Name	Type
-- name	string
-- customer_id	integer


--datacenters Table:
--Column Name	Type
--datacenter_id	integer
--name	string
--monthly_capacity	integer

--forecasted_demand Table:
--Column Name	Type
--customer_id	integer
--datacenter_id	integer
--monthly_demand	integer

WITH demans AS(

SELECT 
  datacenter_id
  , SUM(monthly_demand) AS total_demand
FROM forecasted_demand
GROUP BY datacenter_id

)

SELECT
  dm.datacenter_id
  , (dc.monthly_capacity - dm.total_demand) AS spare_capacity
FROM demans AS dm
INNER JOIN datacenters AS dc ON dc.datacenter_id = dm.datacenter_id
ORDER BY dc.datacenter_id;



