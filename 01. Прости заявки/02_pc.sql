SELECT model, speed as MHz, hd as GB
FROM pc
WHERE price < 1200; 

SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'; 

SELECT model, ram, screen
FROM laptop
WHERE price > 1000; 

SELECT DISTINCT *
FROM printer
WHERE color = 'y';

SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' OR cd = '16x') AND price < 2000; 