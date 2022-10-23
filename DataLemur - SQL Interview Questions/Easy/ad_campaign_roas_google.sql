-- Google marketing managers are analyzing the performance of various advertising accounts over the last month. 
-- They need your help to gather the relevant data.

-- Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. 
-- Round your answer to 2 decimal places, and order your output by the advertiser_id.

-- Hint: ROAS = Ad Revenue / Ad Spend

-- ad_campaigns Table:
-- Column Name	Type
-- campaign_id	integer
-- spend	integer
-- revenue	float
-- advertiser_id	integer

SELECT
  advertiser_id,
  ROUND((SUM(revenue) / SUM(spend))::DECIMAL, 2) AS ROAS
FROM ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id;
