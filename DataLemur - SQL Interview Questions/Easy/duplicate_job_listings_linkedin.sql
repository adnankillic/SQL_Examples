-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
-- Write a query to get the number of companies that have posted duplicate job listings (two jobs at the same company with the same title and description).

-- job_listings Table:
-- Column Name	Type
-- job_id	integer
-- company_id	integer
-- title	string
-- description	string

WITH jobs_grouped AS(

SELECT 
  company_id
  , title
  , description
  , COUNT(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title, description

)

SELECT
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM jobs_grouped
WHERE job_count > 1;



