-- We would like to track the month over month percentage change in revenue. Your output should be in the form of the year and month and
-- the percentage change, round to 2 demical points, and sort from the beginning of the year to the end of the year

-- transactions
-- id int
-- created_at datetime
-- value int
-- purchase_id int

-- find overall month over month percent change in revenue
-- percentage change -> ((this month's sum of value - last month's sum of value) / last month's sum of value)*100

-- month | perc_diff

-- date_trunc (to get month)
-- perc change over month (window func)
-- round by 2 decimal place
-- sort from beginning to end of year (asc)

select DATE_TRUNC('month', created_at) as month,
	ROUND((SUM(value)- LAG(SUM(value),1) OVER (ORDER BY DATE_TRUNC('month', created_at)))/ LAG(SUM(value),1) OVER
		(ORDER BY DATE_TRUNC('month', created_at)) * 100, 2) as perc_diff
from interviews.transactions
group by 1
order by 1 asc
