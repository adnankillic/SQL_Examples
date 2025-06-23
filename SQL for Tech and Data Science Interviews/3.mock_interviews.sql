-- account_status

-- ac_id int
-- date datetime
-- status varchar
-- [open, closed]

-- Assume: There are patient accounts that were open and closed by the date in the accounts status table
-- Compute: The percentage of accounts that were closed on January 10 2020

-- filter by '2020-01-10'
-- get number of closed accounts / closed accounts + open accounts

-- with subquery
with closed as (
select date,
	count(case when status = 'closed' then 1 else null end) * 1.00 / 
	(count(case when status = 'closed' then 1 else null end) +
	count(case when status = 'open' then 1 else null end)) * 100 perc_closed
from interviews.account_status
group by 1
)

select perc_closed
from closed
where date = '2020-01-10'


-- there is no subquery
select count(case when status = 'closed' then 1 else null end) * 1.00 / 
	(count(case when status = 'closed' then 1 else null end) +
	count(case when status = 'open' then 1 else null end)) * 100 perc_closed
from interviews.account_status
where date = '2020-01-10'
