SELECT DISTINCT name
FROM ships
INNER JOIN outcomes ON ships.name = outcomes.ship
WHERE ships.name LIKE 'C%' OR ships.name LIKE 'K%';