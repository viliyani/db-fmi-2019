SELECT COUNT(*) as No_ships
FROM classes
WHERE type = 'bb';

SELECT class, AVG(numguns) as avgNumguns
FROM classes
WHERE type = 'bb'
GROUP BY class;

SELECT AVG(numguns) as avgNumguns
FROM classes
WHERE type = 'bb';

SELECT class, MIN(launched) as minYear, MAX(launched) as maxYear
FROM ships
GROUP BY class; 

SELECT class, COUNT(*) as no_sunk
FROM ships
INNER JOIN outcomes ON ships.name = outcomes.ship
WHERE result = 'sunk'
GROUP BY class; 

SELECT class, COUNT(*) as no_sunk
FROM ships
INNER JOIN outcomes ON ships.name = outcomes.ship
WHERE result = 'sunk'
GROUP BY class
HAVING COUNT(ships.name) >= 2;

SELECT country, AVG(bore) as avgBore
FROM classes
GROUP BY country;
