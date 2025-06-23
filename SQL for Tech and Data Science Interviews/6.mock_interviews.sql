-- You are the data scientist in a company that runs a social media platform
-- The company wants to take a look at the level of participation across their platform
-- Your task is to write a query to calculate the distribution of comments by the count of users that joined the platform between 2018 and 2020,
-- for the month of January 2020. The output should contain a count of comments and the corresponding number of users that made that number of comments in January 2020
-- For example, you will be counting how many users made 1 comment, 2 comments, 3 comments, 4 comments, etc in January 2020

-- Sort the output from the least number of comments to highest. There also might be a bug where an user post is dated before
-- the user join date. You will want to remove these posts from the result.



-- users
-- id int
-- name varchar
-- joined_at datetime
-- city_id int
-- device int


--comments
-- user_id int
-- body varchar
-- created_at datetime

-- num_comments | num_users

-- join users and comments
-- filter created_at January 2020
-- filter joined 2018 to 2020
-- join date < created_at
-- user, count(comments)
-- group by count(comments)
-- count(users)
-- order by num_comments asc


with counts as(
select user_id, count(body) as num_comments
from interviews.users a
join interviews.comments b
	on a.id = b.user_id
where created_at between cast('2020-01-01' as date) and cast('2020-01-31' as date)
and joined_at between cast('2018-01-01' as date) and cast('2020-01-31' as date)
and joined_at < created_at
group by 1
)

select num_comments, count(user_id) as num_users
from counts
group by 1
order by 1













