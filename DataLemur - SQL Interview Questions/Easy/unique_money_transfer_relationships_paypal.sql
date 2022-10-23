-- You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. A two-way unique relationship is established 
-- when two people send money back and forth. Write a query to find the number of two-way unique relationships in this data.

-- Assumption:

-- A payer can send money to the same recipient multiple times.

-- payments Table:
-- Column Name	Type
-- payer_id	integer
-- recipient_id	integer
-- amount	integer

WITH relationships AS(

SELECT 
  payer_id
  , recipient_id
FROM payments
INTERSECT
SELECT 
  recipient_id
  , payer_id
FROM payments

)


SELECT 
  COUNT(payer_id) / 2 AS unique_relationships
FROM relationships;