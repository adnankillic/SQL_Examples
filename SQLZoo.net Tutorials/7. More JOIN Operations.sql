/*
1. List the films where the yr is 1962 and the budget is over 2000000 [Show id, title]
*/

SELECT 
  id
  ,title
FROM movie
WHERE yr=1962
-----------------------------------------------------------------------------------------------------------------------------------------
/*
2. Give year of 'Citizen Kane'.
*/

SELECT
  yr
FROM movie
WHERE title = 'Citizen Kane'
-----------------------------------------------------------------------------------------------------------------------------------------
/*
3. List all of the Star Trek movies, include the id, title and yr (all of these movies start with the words Star Trek in the title). Order results by year.
*/

SELECT
  id
  ,title
  ,yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr
-----------------------------------------------------------------------------------------------------------------------------------------
/*
4. What id number does the actor 'Glenn Close' have?
*/

SELECT
  id
FROM actor
WHERE name = 'Glenn Close'
-----------------------------------------------------------------------------------------------------------------------------------------
/*
5. What is the id of the film 'Casablanca'
*/

SELECT
  id
FROM movie
WHERE title = 'Casablanca'
-----------------------------------------------------------------------------------------------------------------------------------------
/*
6. Obtain the cast list for 'Casablanca'.
*/

SELECT 
  name 
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE title = 'Casablanca'
-----------------------------------------------------------------------------------------------------------------------------------------
/*
7. Obtain the cast list for the film 'Alien'
*/

SELECT 
  name 
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE title = 'Alien'
-----------------------------------------------------------------------------------------------------------------------------------------
/*
8. List the films in which 'Harrison Ford' has appeared
*/

SELECT 
  title
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' 
-----------------------------------------------------------------------------------------------------------------------------------------
/*
9. List the films where 'Harrison Ford' has appeared - but not in the starring role. 
[Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
*/

SELECT
 title
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE name = 'Harrison Ford' AND ord <> 1
-----------------------------------------------------------------------------------------------------------------------------------------
/*
10. List the films together with the leading star for all 1962 films.
*/

SELECT
 title
 ,name
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE yr = 1962 AND ord = 1
-----------------------------------------------------------------------------------------------------------------------------------------
/*
11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
*/

SELECT 
  movie.yr
  ,COUNT(*)
FROM movie
INNER JOIN casting ON casting.movieid = movie.id
INNER JOIN actor ON actor.id = casting.actorid
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-----------------------------------------------------------------------------------------------------------------------------------------
/*
12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

Did you get "Little Miss Marker twice"?
Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).

Title is not a unique field, create a table of IDs in your subquery
*/

SELECT
 DISTINCT m.title
 ,a.name
FROM (

	SELECT
	 movie.id
	 ,title
	 ,name
	FROM movie
	INNER JOIN casting ON casting.movieid = movie.id
	INNER JOIN actor ON casting.actorid = actor.id
	WHERE name = 'Julie Andrews'

) AS m
INNER JOIN (SELECT 
              actor.*
              ,casting.movieid AS movieid
            FROM actor
            INNER JOIN casting ON casting.actorid = actor.id
            WHERE casting.ord = 1
            ) AS a
ON m.id = a.movieid
-----------------------------------------------------------------------------------------------------------------------------------------
/*
13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/

SELECT
  name
FROM(

	SELECT 
	 name
	 ,COUNT(movieid) AS counts
	FROM movie
	INNER JOIN casting ON casting.movieid = movie.id
	INNER JOIN actor ON casting.actorid = actor.id
	WHERE ord = 1
	GROUP BY name
	HAVING COUNT(movieid) >= 15

) AS m
ORDER BY name 
-----------------------------------------------------------------------------------------------------------------------------------------
/*
14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
*/

SELECT
 title
 ,COUNT(actorid) AS counts
FROM movie
INNER JOIN casting ON casting.movieid = movie.id
INNER JOIN actor ON casting.actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY counts DESC, title
-----------------------------------------------------------------------------------------------------------------------------------------
/*
15. List all the people who have worked with 'Art Garfunkel'.
*/

SELECT 
  DISTINCT a2.name
FROM actor a1
JOIN casting c1 ON a1.id = c1.actorid
JOIN casting c2 ON c1.movieid = c2.movieid
JOIN actor a2 ON c2.actorid = a2.id
WHERE a1.name = 'Art Garfunkel'
  AND a2.name <> 'Art Garfunkel';












































