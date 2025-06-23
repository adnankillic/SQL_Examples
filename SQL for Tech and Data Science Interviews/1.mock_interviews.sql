-- post_events

-- user_id int
-- created_at datetime
-- event_name varchar ('enter','post','cancel')
-- enter: each action for all posting has an enter event
-- post: if post is successful
-- cancel: if post is unsuccessful

-- What information would you like to start off by pulling to get an overall understanding of the post feature

-- overall health
-- total number of posts (number of enters)
-- posts made by date
-- success rate
-- cancel rate

-- success rate by date
-- date | success_rate = number of post / number of enter

-- group by date
-- count of number of posts / count of number of enter


select created_at,
	count(case when event_name = 'post' then 1 else null end) * 1.00 /
	count(case when event_name = 'enter' then 1 else null end) * 100 as perc_success

from post_events
group by created_at
order by created_at


-- What are the success rates by day?
-- Which day of the week has the lowest success rate?

-- group by extracted dow
-- average perc_success

-- day | perc_success
-- min per_success
-- order by perc_success desc

with created_events as(
select created_at,
	count(case when event_name = 'post' then 1 else null end) * 1.00 /
	count(case when event_name = 'enter' then 1 else null end) * 100 as perc_success

from post_events
group by created_at
order by created_at
)

select extract(dow from created_at) as dow,
	avg(perc_success)
from created_events
group by 1
order by 2 asc

