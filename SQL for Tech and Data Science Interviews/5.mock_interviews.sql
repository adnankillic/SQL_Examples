-- uber_rides

-- request_id int
-- request_date datetime
-- request_status varchar ('cancelled_by_driver','cancelled_by_client','success')
-- distance_to_travel float
-- monetary_cost float
-- driver_to_client_distance float

-- For each date, find the difference between the distance per dollar for that date and the average distance per dollar for that year/month
-- distance per dollar = distance travelled / cost of ride
-- Find the difference as an absolute value and round it to the second decimal place. Order results by request date


-- all dates are unique
-- you can count unsuccesful rides

-- request_date | difference

-- each day distance_per_dollar
-- each month_year distance_per_dollar
-- join these tables together
-- difference
-- absolute value, round to 2 decimals
-- order by request_date asc

with each_date as(
select request_date, avg(distance_to_travel/monetary_cost) as distance_per_dollar
from interviews.uber_rides
group by 1
),
per_month_year as(
select date_trunc('month', request_date) as month_year,
	avg(distance_to_travel/monetary_cost) as distance_per_dollar
from interviews.uber_rides
group by 1
)

select a.request_date,
	round(abs(cast(a.distance_per_dollar - b.distance_per_dollar as decimal)), 2) as difference
from each_date a
join per_month_year b
	on date_trunc('month', a.request_date) = b.month_year
order by a.request_date asc 











