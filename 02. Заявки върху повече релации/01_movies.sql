SELECT moviestar.name
FROM moviestar CROSS JOIN starsin
WHERE moviestar.gender = 'm' AND starsin.movietitle  = 'The Usual Suspects' AND moviestar.name = starsin.starname; 

SELECT starsin.starname
FROM movie INNER JOIN starsin ON movie.title = starsin.movietitle AND movie.year = starsin.movieyear
WHERE movie.year = 1995 AND movie.studioname = 'MGM';

SELECT DISTINCT movieexec.name
FROM movie INNER JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE movie.studioname = 'MGM';

SELECT m2.title
FROM movie as m1, movie as m2
WHERE m1.title = 'Star Wars' AND m1.length < m2.length;

SELECT t2.name
FROM movieexec as t1, movieexec as t2
WHERE t1.name = 'Stephen Spielberg' AND t1.networth < t2.networth; 

SELECT movie.title
FROM movieexec as t1, movieexec as t2 INNER JOIN movie ON t2.cert# = movie.producerc#
WHERE t1.name = 'Stephen Spielberg' AND t1.networth < t2.networth;