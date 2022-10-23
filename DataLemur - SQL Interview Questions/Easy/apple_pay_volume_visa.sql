-- Visa is trying to analyze its Apply Pay partnership. Calculate the total transaction volume for each merchant where the transaction was performed via Apple Pay.

-- Output the merchant ID and the total transactions by merchant. For merchants with no Apple Pay transactions, output their total transaction volume as 0.

-- Display the result in descending order of transaction volume.

-- transactions Table:
-- Column Name	Type
-- merchant_id	integer
-- transaction_amount	integer
-- payment_method	varchar

SELECT 
  merchant_id
  , SUM(CASE WHEN LOWER(payment_method) = 'apple pay' THEN transaction_amount ELSE 0 END) AS volume
FROM transactions
GROUP BY merchant_id
ORDER BY volume DESC;