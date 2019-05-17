/*SELECT *
FROM moviestar 
WHERE gender = 'F' AND name IN (SELECT name FROM movieexec WHERE networth > 10000000);

SELECT moviestar.name
FROM moviestar 
WHERE name NOT IN (SELECT name FROM movieexec);

SELECT title
FROM movie
WHERE length > ALL (SELECT length FROM movie WHERE title = 'Star Wars');

SELECT movie.title, movieexec.name
FROM movie INNER JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE movieexec.networth > ALL (SELECT networth FROM movieexec WHERE name = 'Merv Griffin')*/