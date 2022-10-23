-- Assume there are three Spotify tables containing information about the artists, songs, and music charts. 
-- Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. 
-- From now on, we'll refer to this ranking number as "song appearances".

-- Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

-- For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; this is the highest number of appearances, so he is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

-- Assumptions:

-- If two artists' songs have the same number of appearances, the artists should have the same rank.
-- The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

-- artists Table:
-- Column Name	Type
-- artist_id	integer
-- artist_name	varchar

-- songs Table:
-- Column Name	Type
-- song_id	integer
-- artist_id	integer

-- global_song_rank Table:
-- Column Name	Type
-- day	integer (1-52)
-- song_id	integer
-- rank	integer (1-1,000,000)

WITH top_artists AS(

  SELECT
    artist_id,
    DENSE_RANK() OVER(ORDER BY song_count DESC) AS artist_rank
  FROM (
  
    SELECT 
      songs.artist_id,
      COUNT(songs.song_id) AS song_count
    FROM songs
    INNER JOIN global_song_rank AS ranking ON songs.song_id = ranking.song_id
    WHERE ranking.rank <= 10
    GROUP BY songs.artist_id
  ) AS top_songs

)

SELECT
  artists.artist_name, top_artists.artist_rank
FROM top_artists
INNER JOIN artists ON top_artists.artist_id = artists.artist_id
WHERE top_artists.artist_rank <= 5
ORDER BY top_artists.artist_rank, artists.artist_name





