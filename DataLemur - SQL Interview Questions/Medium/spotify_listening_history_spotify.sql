/*You are given a songs_history table that keeps track of users' listening history on Spotify. The songs_weekly table tracks how many times users listened to each song 
for all days between August 1 and August 7, 2022.

Write a query to show the user ID, song ID, and the number of times the user has played each song as of August 4, 2022. 
We'll refer to the number of song plays as song_plays. The rows with the most song plays should be at the top of the output.

Assumption:

The songs_history table holds data that ends on July 31, 2022. Output should include the historical data in this table.
There may be a new user in the weekly table who is not present in the history table.
A user may listen to a song for the first time, in which case no existing (user_id, song_id) user-song pair exists in the history table.
A user may listen to a specific song multiple times in the same day.

songs_history Table:
Column Name	Type
history_id	integer
user_id	integer
song_id	integer
song_plays	integer

songs_weekly Table:
Column Name	Type
user_id	integer
song_id	integer
listen_time	datetime
*/

WITH report AS(

SELECT
 user_id,
 song_id,
 song_plays
FROM songs_history
UNION ALL
SELECT
  user_id,
  song_id,
  COUNT(song_id) AS song_plays
FROM songs_weekly
WHERE listen_time <= '08/04/2022 23:59:59'
GROUP BY user_id, song_id

)

SELECT
  user_id,
  song_id,
  SUM(song_plays) AS song_plays
FROM report
GROUP BY user_id, song_id
ORDER BY song_plays DESC;


