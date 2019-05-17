SELECT DISTINCT country
FROM classes
WHERE numguns >= ALL (SELECT numguns FROM classes); 

SELECT DISTINCT ships.class
FROM ships
WHERE ships.name IN (SELECT ship FROM outcomes WHERE result = 'sunk');

SELECT DISTINCT ships.name, ships.class
FROM ships
WHERE ships.class IN (SELECT class FROM classes WHERE bore = 16);

SELECT outcomes.battle
FROM outcomes
WHERE outcomes.ship IN (SELECT name FROM ships WHERE class = 'Kongo');

SELECT s.name, s.class
FROM ships as s, classes as c
WHERE s.class = c.class AND c.numguns >= ALL (SELECT numguns FROM classes WHERE c.bore = bore)
ORDER BY s.class;
