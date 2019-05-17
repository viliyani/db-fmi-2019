SELECT *
FROM classes LEFT JOIN ships ON classes.class = ships.class
WHERE ships.name IS NOT NULL; 

SELECT *
FROM classes LEFT JOIN ships ON classes.class = ships.class;

SELECT classes.country, ships.name
FROM classes INNER JOIN ships ON classes.class = ships.class
WHERE ships.name NOT IN (SELECT ship FROM outcomes); 

SELECT ships.name as ShipName
FROM classes INNER JOIN ships ON classes.class = ships.class
WHERE ships.launched = 1916 AND classes.numguns > 7;

SELECT outcomes.ship, outcomes.battle, battles.date
FROM ships INNER JOIN outcomes ON ships.name = outcomes.ship
INNER JOIN battles ON battles.name = outcomes.battle
WHERE outcomes.result = 'sunk'
ORDER BY outcomes.ship;

SELECT *
FROM ships INNER JOIN classes ON classes.class = ships.class
WHERE ships.name = classes.class; 

SELECT classes.*	
FROM classes LEFT JOIN ships ON classes.class = ships.class
WHERE ships.class IS NULL; 

SELECT ships.name, classes.displacement, classes.numguns,outcomes.result
FROM outcomes INNER JOIN ships ON outcomes.ship = ships.name
INNER JOIN classes ON classes.class = ships.class
WHERE outcomes.battle = 'North Atlantic';
