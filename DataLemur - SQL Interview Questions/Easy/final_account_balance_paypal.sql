-- Given a table of bank deposits and withdrawals, return the final balance for each account.

-- Assumption:

-- All the transactions performed for each account are present in the table; no transactions are missing.

-- transactions Table:
-- Column Name	Type
-- transaction_id	integer
-- account_id	integer
-- transaction_type	varchar
-- amount	decimal

SELECT
  account_id,
  SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS final_balance
FROM transactions
GROUP BY account_id;