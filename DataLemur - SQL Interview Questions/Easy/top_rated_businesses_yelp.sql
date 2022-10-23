/*Assume you are given the table below containing information on user reviews. Write a query to obtain the number and percentage of businesses that are top rated. 
A top-rated busines is defined as one whose reviews contain only 4 or 5 stars.

Output the number of businesses and percentage of top rated businesses rounded to the nearest integer.

reviews Table:
Column Name	Type
business_id	integer
review_id	integer
review_stars	integer
review_date	datetime*/

SELECT 
  COUNT(business_id) AS business_count,
  ROUND(100.0 * COUNT(business_id) /(SELECT COUNT (business_id) FROM reviews),0) AS top_rated_pct
FROM reviews
WHERE review_stars >= 4