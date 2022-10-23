/*Assume you are given the table below containing information on user session activity. Write a query that ranks users according to their total session durations (in minutes) by descending order 
for each session type between the start date (2022-01-01) and end date (2022-02-01). Output the user id, session type, and the ranking of the total session duration.

sessions Table:

Column Name	Type
session_id	integer
user_id	integer
session_type	string ("like", "reply", "retweet")
duration	integer (in minutes)
start_date	timestamp*/

WITH session_duration AS(

  SELECT 
    user_id,
    session_type,
    SUM(duration) AS total_session_durations
  FROM sessions
  WHERE start_date >= '2022-01-01' and start_date <= '2022-02-01'
  GROUP BY 1,2

)

SELECT
  user_id,
  session_type,
  RANK() OVER(PARTITION BY session_type ORDER BY total_session_durations DESC) AS ranking
FROM session_duration
ORDER BY session_type, ranking
