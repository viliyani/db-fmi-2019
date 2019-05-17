/*SELECT AVG(speed) as avgSpeed
FROM pc; 

SELECT product.maker, AVG(screen) as avgScreen
FROM laptop INNER JOIN product ON laptop.model = product.model
GROUP BY product.maker;

SELECT AVG(speed) as avgSpeed
FROM laptop 
WHERE price > 1000; 

SELECT product.maker, AVG(pc.price) as avgPrice
FROM pc INNER JOIN product ON pc.model = product.model
WHERE product.maker = 'A'
GROUP BY product.maker;

SELECT t.maker, AVG(t.price) as avgPrice
FROM ((SELECT maker, price
FROM pc
INNER JOIN product ON pc.model = product.model
WHERE maker = 'B')
UNION ALL
(SELECT maker, price
FROM laptop
INNER JOIN product ON laptop.model = product.model
WHERE maker = 'B')) as t
GROUP BY t.maker;

SELECT speed, AVG(price) as avgPrice
FROM pc
GROUP BY speed;

SELECT maker, COUNT(DISTINCT code) as num_pc
FROM pc
INNER JOIN product ON pc.model = product.model
GROUP BY maker
HAVING COUNT(DISTINCT code) >= 3; 

SELECT product.maker, MAX(price) as avgPrice
FROM pc
INNER JOIN product ON pc.model = product.model
GROUP BY product.maker
HAVING MAX(price) >= ALL (SELECT MAX(price)
FROM pc
INNER JOIN product ON pc.model = product.model
GROUP BY product.maker);

SELECT maker, AVG(hd) as avgHDD
FROM pc
INNER JOIN product ON pc.model = product.model
WHERE product.maker IN (SELECT maker FROM product WHERE type = 'printer')
GROUP BY maker;*/
