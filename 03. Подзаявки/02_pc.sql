SELECT maker
FROM product
WHERE model IN (SELECT model FROM pc WHERE speed > 500);

SELECT code, model, price
FROM printer
WHERE price >= ALL (SELECT price FROM printer);

SELECT *
FROM laptop
WHERE speed < ALL (SELECT DISTINCT speed FROM pc);

SELECT t1.model, t1.price
FROM ((SELECT model, price
FROM pc)
UNION 
(SELECT model, price
FROM laptop)
UNION
(SELECT model, price
FROM printer)) as t1
WHERE t1.price >= ALL((SELECT price FROM pc) UNION (SELECT price FROM laptop) UNION (SELECT price
FROM printer));

SELECT maker
FROM product 
WHERE product.model IN (SELECT model FROM printer WHERE color = 'y' AND price >= ALL(SELECT price FROM printer WHERE color = 'y'))

SELECT maker
FROM product 
WHERE product.model IN (SELECT model FROM pc as t1 WHERE t1.ram <= ALL (SELECT ram FROM pc) AND t1.speed >= ALL (SELECT speed FROM pc WHERE ram = t1.ram));