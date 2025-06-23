-- You are the data scientist that works on our social media platforms web app
-- We would like to better understand our users' behaviour on the platform
-- Get users' average session time in ascending order
-- Assume: A user has only one session per day, per user
-- session: a page load - a page exit
-- session duration: latest page load - earliest page exit

-- web_log

-- user_id int
-- time_stamp datetime
-- action varchar ('page load','page exit','scrool up','scrool down')

-- before coding write down logical steps
-- user | date | duration
-- filter page load
-- filter page exit
-- join filters
-- t2 > t1 (page exit has to be greater than page load)
-- t2 - t1
-- find minimum duration
-- average

with session as(
select a.user_id, a.timestamp as date, min(b.timestamp - a.timestamp) as duration
from interviews.web_log a
join interviews.web_log b on a.user_id = b.user_id
where a.action = 'page_load' and b.action = 'page_exit' and b.timestamp > a.timestamp
group by 1,2
)

select user_id, avg(duration) as avg_session
from session
group by 1
order by avg_session asc

-- If we are thinking about serving ads, which is our business every scroll down someone does.
-- How to calculate the amount of money we can make for a scroll down?
-- Assume: each AD is $ 0.01, we serve an ad for every scroll down

select count('scrool_down') * 0.01
from web_log
where action = 'scrool_down'


















