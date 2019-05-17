SELECT title, name
FROM movie INNER JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE movieexec.cert# = (SELECT DISTINCT producerc# FROM movie WHERE title = 'Star Wars'); 

SELECT DISTINCT name
FROM movieexec INNER JOIN movie ON movieexec.cert# = movie.producerc#
WHERE movie.title IN (SELECT movietitle FROM starsin WHERE starname = 'Harrison Ford');

SELECT DISTINCT studioname as name, starsin.starname
FROM movie INNER JOIN starsin ON movie.title = starsin.movietitle;

SELECT starname, networth, title
FROM movie INNER JOIN starsin ON movie.title = starsin.movietitle
INNER JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE networth >= ALL (SELECT networth FROM movieexec);

SELECT name, movietitle
FROM moviestar LEFT JOIN starsin ON moviestar.name = starsin.starname
WHERE starsin.movietitle IS NULL;