-- The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. 
-- If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator.

-- Write a query to return the IDs of these LinkedIn power creators ordered by the IDs.

-- Assumption:

-- Each person with a LinkedIn profile in this database works at one company only.

-- personal_profiles Table:
-- Column Name	Type
-- profile_id	integer
-- name	string
-- followers	integer
-- employer_id	integer

-- company_pages Table:
-- Column Name	Type
-- company_id	integer
-- name	string
-- followers	integer

SELECT 
  profile_id
FROM personal_profiles AS pp
INNER JOIN company_pages AS cp ON pp.employer_id = cp.company_id
WHERE pp.followers > cp.followers
ORDER BY profile_id
