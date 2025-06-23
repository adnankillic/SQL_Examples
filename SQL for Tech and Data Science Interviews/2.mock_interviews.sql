-- Find the data with highest total energy consumption from our data centers
-- Output the date along with the total energy consumption across all data centers


-- eu_energy
-- date datetime
-- consumption int

-- asia_energy
-- date datetime
-- consumption int

-- na_energy
-- date datetime
-- consumption int

-- What would you do if in the first table there are two of the same dates with different consumptions?

-- date | highest_consumption

-- union all / join the tables together (to put everything into the same table so I can group them together and get the sum of the consumption)
-- group by date, total_consumption (take each date and get the total consumption of that date)
-- find maximum consumption
-- filter max = maximum_consumption (the case that there might be multiple maximums, find the actual maximum total consumption. filter that table with the date and total consumption. total consumption = maximum consumption)


with joined as (
(select * from interviews.eu_energy)
union all
(select * from interviews.asia_energy)
union all
(select * from interviews.na_energy)
) , total_consumption as (
select date, sum(consumption) as total_consumption
from joined
group by 1
)

select date, total_consumption
from total_consumption
where total_consumption = (select max(total_consumption) from total_consumption)









