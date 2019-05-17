SELECT ships.name
FROM ships INNER JOIN classes ON ships.class = classes.class
WHERE classes.displacement > 50000;

SELECT ships.name, classes.numguns, classes.displacement
FROM ships INNER JOIN classes ON ships.class = classes.class INNER JOIN outcomes ON ships.name = outcomes.ship 
WHERE outcomes.battle = 'Guadalcanal' 

SELECT DISTINCT t1.country
FROM classes as t1, classes as t2
WHERE t1.country = t2.country AND t1.type != t2.type;

SELECT DISTINCT t1.ship
FROM outcomes as t1, outcomes as t2
WHERE t1.ship = t2.ship AND t1.result = 'damaged' AND t2.result = 'ok';