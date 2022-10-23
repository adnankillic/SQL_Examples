-- The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. 
-- If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator.

-- Write a query to return the IDs of these LinkedIn power creators in alphabetical order.

-- Assumption:

-- A person can work at multiple companies.
-- This is the second part of the question, so make sure your start with Part 1 if you haven't completed that yet!

-- personal_profiles Table:
-- Column Name	Type
-- profile_id	integer
-- name	string
-- followers	integer


-- employee_company Table:
-- Column Name	Type
-- personal_profile_id	integer
-- company_id	integer

-- company_pages Table:
-- Column Name	Type
-- company_id	integer
-- name	string
-- followers	integer

WITH popular_companies AS(

SELECT 
  personal_profile_id
  , MAX(followers) AS highest_followers
FROM employee_company AS emp
LEFT JOIN company_pages AS pages ON emp.company_id = pages.company_id
GROUP BY personal_profile_id

)

SELECT 
  profile_id
FROM popular_companies AS companies
LEFT JOIN personal_profiles AS profiles ON companies.personal_profile_id = profiles.profile_id
WHERE followers > highest_followers
ORDER BY profile_id
