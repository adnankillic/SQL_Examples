-- Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between 
-- each user’s first post of the year and last post of the year in the year 2021. 
-- Output the user and number of the days between each user's first and last post.

-- posts Table:
-- Column Name	Type
-- user_id	integer
-- post_id	integer
-- post_date	timestamp
-- post_content	timestamp

SELECT 
  user_id
  , MAX(post_date::DATE) - MIN(post_date::DATE) as days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021
GROUP BY user_id
HAVING COUNT(post_id) >1;