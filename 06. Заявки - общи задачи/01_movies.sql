SELECT title, year, length
FROM movie
WHERE (length > 120 OR length IS NULL) AND year < 2000;

SELECT name, gender
FROM moviestar
WHERE name LIKE 'J%'
ORDER BY name desc; 

SELECT movie.studioname, COUNT(DISTINCT starsin.starname) as actors
FROM movie
INNER JOIN starsin ON movie.title = starsin.movietitle
GROUP BY movie.studioname; 

SELECT starsin.starname, COUNT(DISTINCT movie.title) as movies
FROM starsin
INNER JOIN movie ON starsin.movietitle = movie.title
GROUP BY starsin.starname;

SELECT studioname, title, year
FROM movie
WHERE studioname IN (SELECT studioname FROM movie GROUP BY studioname)
AND year IN (SELECT MAX(year) FROM movie GROUP BY studioname)
ORDER BY studioname DESC;

SELECT name
FROM moviestar
WHERE gender = 'm' AND birthdate >= ALL (SELECT birthdate FROM moviestar WHERE gender = 'm'); 

SELECT studioname, starname, COUNT(DISTINCT movie.title) as num_movies
FROM movie
INNER JOIN starsin ON movie.title = starsin.movietitle
GROUP BY studioname, starsin.starname
HAVING COUNT(DISTINCT movie.title) >= 2; 

SELECT movietitle, movieyear, COUNT(DISTINCT starsin.starname) as num_actors
FROM movie
INNER JOIN starsin ON movie.title = starsin.movietitle
GROUP BY movietitle, movieyear
HAVING COUNT(DISTINCT starsin.starname) > 2;