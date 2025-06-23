-- Find the top three unique salaries of each department
-- Revert the result alphabetically by department and by highest to lowest salary
-- Each employee will be under one department

-- twitter_employee
-- id int
-- first_name varchar
-- last_name varchar
-- age int
-- sex varchar
-- employee_title varchar
-- department varchar
-- salary int
-- target int
-- bonus int
-- email varchar
-- city varchar
-- address varchar
-- manager_id int

-- top 3 unique salaries for each departments
-- order results alphabetically by department and by salary desc

-- department | salary | rank_id

-- dense_rank partition by department order by salary desc
-- rank_id <= 3 
-- unique
-- order by department, salary desc

with ranked as(
select department, salary,
	dense_rank() over (partition by department order by salary desc) as rank_id
from interviews.twitter_employee
)

select distinct department, salary, rank_id
from ranked
where rank_id <= 3
order by department, salary desc