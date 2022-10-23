-- Your team at Accenture is helping a Fortune 500 client revamp their compensation and benefits program. 
-- The first step in this analysis is to manually review employees who are potentially overpaid or underpaid.

-- An employee is considered to be potentially overpaid if they earn more than 2 times the average salary for people with the same title. 
-- Similarly, an employee might be underpaid if they earn less than half of the average for their title. 
-- We'll refer to employees who are both underpaid and overpaid as compensation outliers for the purposes of this problem.

-- Write a query that shows the following data for each compensation outlier: employee ID, salary, and whether they are potentially overpaid or potentially underpaid.

-- employee_pay Table:
-- Column Name	Type
-- employee_id	integer
-- salary	integer
-- title	varchar

WITH avg_salaries AS(

SELECT 
  employee_id
  , salary
  , ROUND((AVG(salary) OVER( PARTITION BY title) * 2), 2) AS double_avg_salary
  , ROUND((AVG(salary) OVER( PARTITION BY title) / 2), 2) AS half_avg_salary
FROM employee_pay

)

SELECT
    employee_id
  , salary
  , CASE 
      WHEN salary > double_avg_salary THEN 'Overpaid'
      WHEN salary < half_avg_salary THEN 'Underpaid'
    END AS outlier_status
FROM avg_salaries
WHERE salary > double_avg_salary OR salary < half_avg_salary


