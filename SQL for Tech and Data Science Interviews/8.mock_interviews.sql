-- Our goal is to develop a navie forecast for a new metric called monthly "distance per dollar" defined as the
-- (distance_to_travel/monetary_cost) in our dataset and measure its accuracy. Use RSME to evaluate accuracy.

-- request_logs

-- request_id int
-- request_date datetime
-- request_status varchar ('success', 'fail')
-- distance_to_travel float
-- monetary_cost float
-- driver_to_client_distance float

-- actual distance per dollar per month (distance_to_travel/monetary_cost)
-- model distance per dollar
	-- window function with lag from previous month
-- RMSE between actual and model


with actual as(
select date_trunc('month', request_date) as month_year,
	sum(distance_to_travel)/sum(monetary_cost) as distance_per_dollar
from interviews.request_logs
group by 1
)
, model as(
select month_year, distance_per_dollar as distance_per_dollar_actual,
	LAG(distance_per_dollar, 1) OVER (ORDER BY month_year) as distance_per_dollar_model
from actual
group by 1,2
)


select sqrt(avg(power(distance_per_dollar_actual - distance_per_dollar_model, 2))) as RMSE
from model