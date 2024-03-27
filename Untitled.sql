create database Assignment;
use Assignment;


/*Movie tables*/
select * from movie_actor;
select * from movies_category;
select * from movies_director;
select * from movie_table;
select * from movie_writer;


/*Dim tables*/
select count(*) from dim_actor;
select count(*) from dim_category;
select count(*) from dim_director;
select count(*) from dim_writer;


/*Query for Business Questions Output*/

/*Show Category wise, title/movie name who has more than 4 writers and 3 actors. Include the counts.*/

SELECT
  (mc.categories) AS Category,
  ma.name AS MovieName,
  COUNT(DISTINCT mw.writer_id) AS NumberOfWriters,
  COUNT(DISTINCT ma.actor_id) AS NumberOfActors
FROM
  movie_category mc
JOIN
  movie_actor ma ON mc.movie_id = ma.movie_id
JOIN
  movie_writer mw ON mc.movie_id = mw.movie_id
GROUP BY
  mc.categories, ma.name
HAVING
  COUNT(DISTINCT mw.writer_id) > 4 AND COUNT(DISTINCT ma.actor_id) > 3;
  
/* Title/movie name who has more than 4 writers and 3 actors.*/

SELECT DISTINCT
  ma.name AS MovieName
FROM
  movie_category mc
JOIN
  movie_actor ma ON mc.movie_id = ma.movie_id
JOIN
  movie_writer mw ON mc.movie_id = mw.movie_id
GROUP BY
  mc.movie_id, ma.name
HAVING
  COUNT(DISTINCT mw.writer_id) > 4 AND COUNT(DISTINCT ma.actor_id) > 3;


/* Count of moview who have more than 4 writers and 3 actors.*/


SELECT
  COUNT(*) AS TotalNumberOfMovies
FROM (
  SELECT
    mc.movie_id
  FROM
    movie_category mc
  JOIN
    movie_actor ma ON mc.movie_id = ma.movie_id
  JOIN
    movie_writer mw ON mc.movie_id = mw.movie_id
  GROUP BY
    mc.movie_id
  HAVING
    COUNT(DISTINCT mw.writer_id) > 4 AND COUNT(DISTINCT ma.actor_id) > 3
) AS filtered_movies;





/*List year wise titles.*/

SELECT  year,name from movie_table order by year,name;
