SELECT product.maker, laptop.speed
FROM product INNER JOIN laptop ON product.model = laptop.model
WHERE laptop.hd > 9; 

(SELECT DISTINCT product.maker, pc.price
FROM product INNER JOIN pc ON product.model = pc.model
WHERE product.maker = 'B')
UNION
(SELECT DISTINCT product.maker, laptop.price
FROM product INNER JOIN laptop ON product.model = laptop.model
WHERE product.maker = 'B')
UNION
(SELECT DISTINCT product.maker, printer.price
FROM product INNER JOIN printer ON product.model = printer.model
WHERE product.maker = 'B')

(SELECT maker
FROM product
WHERE type = 'laptop')
EXCEPT
(SELECT maker
FROM product
WHERE type = 'Pc');

SELECT DISTINCT t1.hd
FROM pc as t1, pc as t2
WHERE t1.hd = t2.hd AND t1.code != t2.code;

SELECT DISTINCT t1.model, t2.model
FROM pc as t1, pc as t2
WHERE t1.speed = t2.speed AND t1.ram = t2.ram AND t1.model < t2.model;

SELECT DISTINCT product.maker
FROM product INNER JOIN (pc as t1 CROSS JOIN pc as t2) ON product.model = t1.model
WHERE t1.code < t2.code AND t1.speed > 400 AND t2.speed > 400 AND t1.model = t2.model;