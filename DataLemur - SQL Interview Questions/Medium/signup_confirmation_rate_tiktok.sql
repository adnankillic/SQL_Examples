/*New TikTok users sign up with their emails, so each signup requires a text confirmation to activate the new user's account.

Write a query to find the confirmation rate of users who confirmed their signups with text messages. Round the result to 2 decimal places.

Assumptions:

A user may fail to confirm several times with text. Once the signup is confirmed for a user, they will not be able to initiate the signup again.
A user may not initiate the signup confirmation process at all.

emails Table:
Column Name	Type
email_id	integer
user_id	integer
signup_date	datetime

texts Table:
Column Name	Type
text_id	integer
email_id	integer
signup_action	varchar

*/

WITH rate AS(

SELECT 
  emails.user_id,
  CASE WHEN texts.email_id IS NOT NULL THEN 1 ELSE 0 END AS signup
FROM emails
LEFT JOIN texts ON texts.email_id = emails.email_id AND texts.signup_action = 'Confirmed'

)

SELECT
  ROUND(SUM(signup)::DECIMAL / COUNT(user_id), 2) AS confirmation_rate
FROM rate
