-- Assume you are given the table below containing tweet data. Write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.

-- tweets Table:
-- Column Name	Type
-- tweet_id	integer
-- user_id	integer
-- msg	string
-- tweet_date	timestamp

WITH total_tweets AS(

SELECT 
  user_id
  , COUNT(tweet_id) AS tweets_num
FROM tweets
WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY user_id

)

SELECT
  tweets_num AS tweet_bucket
  , COUNT(user_id) AS users_num
FROM total_tweets
GROUP BY tweets_num;

