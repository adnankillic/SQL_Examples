/*In consulting, being "on the bench" means you have a gap between two client engagements. Google wants to know how many days of bench time each consultant had in 2021. 
Assume that each consultant is only staffed to one consulting engagement at a time.

Write a query to pull each employee ID and their total bench time in days during 2021.

Assumptions:

All listed employees are current employees who were hired before 2021.
The engagements in the consulting_engagements table are complete for the year 2022.

staffing Table:
Column Name	Type
employee_id	integer
is_consultant	boolean
job_id	integer

consulting_engagements Table:
Column Name	Type
job_id	integer
client_id	integer
start_date	date
end_date	date
contract_amount	integer

*/

WITH consulting_days AS(

  SELECT 
    staffs.employee_id,
    SUM(engagements.end_date - engagements.start_date) AS non_bench_days,
    COUNT(staffs.job_id) AS inclusive_days  
  FROM staffing AS staffs
  INNER JOIN consulting_engagements AS engagements ON staffs.job_id = engagements.job_id
  WHERE staffs.is_consultant = 'true'
  GROUP BY staffs.employee_id

)

SELECT
  employee_id,
  365 - SUM(non_bench_days) - SUM(inclusive_days) AS bench_days
FROM consulting_days
GROUP BY employee_id

