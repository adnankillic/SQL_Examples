-- Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. 
-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) 
-- for each of the different age groups.

-- Output the age bucket and percentage of sending and opening snaps. Round the percentages to 2 decimal places.

-- Notes:

-- You should calculate these percentages:
-- time sending / (time sending + time opening)
	-- time opening / (time sending + time opening)
	-- To avoid integer division in percentages, multiply by 100.0 and not 100.

-- activities Table:
-- Column Name	Type
-- activity_id	integer
-- user_id	integer
-- activity_type	string ('send', 'open', 'chat')
-- time_spent	float
-- activity_date	datetime

-- age_breakdown Table:
-- Column Name	Type
-- user_id	integer
-- age_bucket	string ('21-25', '26-30', '31-25')


WITH snaps_timespent AS( 

  SELECT 
    age_bucket
    , SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send_timespent
    , SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open_timespent
    , SUM(time_spent) AS total_timespent
  FROM activities
  INNER JOIN age_breakdown ON age_breakdown.user_id = activities.user_id
  WHERE activity_type IN ('send', 'open')
  GROUP BY age_bucket

)

SELECT
  age_bucket
  , ROUND(100.0 * send_timespent / total_timespent, 2) AS send_perc
  , ROUND(100.0 * open_timespent / total_timespent, 2) AS open_perc
FROM snaps_timespent;

