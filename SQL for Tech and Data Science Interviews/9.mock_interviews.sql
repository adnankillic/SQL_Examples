-- Highest cost orders
-- Find the customer with the highest total order cost between 2019-02-01 and 2019-05-01. Output their first name, 
-- total cost of their item, and the date

-- For simplicity, you can assume that every first name in the dataset is unique
-- Assumption: Customers can make multiple orders on the same date

-- customers 
-- id int
-- first_name varchar
-- last_name varchar
-- city varchar
-- address varchar
-- phone_number varchar

-- orders
-- id int
-- cust_id int
-- order_date varchar
-- order_quantity int
-- order_details varchar
-- order_cost int

-- order_date | first_name | total_cost

-- group by cust_id, id, order_date
-- calculated order_quantitiy * order_cost as total_cost

-- group by date, cust_id
-- sum(total_cost)

-- join customer table to get first_name for each cust_id

-- get total cost per day for each customer ( cust_id | date | total_cost)
-- find the maximum total cost (select max(total_cost) in where)
-- find all the customers ( join to customers)

with total_costs as(
select cust_id, order_date, sum(order_quantity * order_cost) as total_cost
from interviews.orders
where order_date between ('2019-02-01') and ('2019-05-01')
group by cust_id, order_date
)

select c.first_name, t.total_cost, t.order_date
from total_costs t
join interviews.customers c
on c.id = t.cust_id
where t.total_cost = ( select max(total_cost) from total_costs)


