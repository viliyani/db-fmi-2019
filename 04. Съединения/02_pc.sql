SELECT maker,product.model,product.type
FROM product LEFT JOIN pc ON product.model = pc.model
LEFT JOIN laptop ON product.model = laptop.model
LEFT JOIN printer ON product.model = printer.model
WHERE pc.code IS NULL AND laptop.code IS NULL AND printer.code IS NULL;

-- Version 1 for 2nd 
SELECT DISTINCT p.maker
FROM product as p, laptop as l, printer as pr
WHERE p.model = l.model AND maker IN (SELECT maker FROM product as p2 LEFT JOIN printer ON p2.model = printer.model WHERE printer.code IS NOT NULL);

-- Vesrion 2 for 2nd
SELECT DISTINCT p1.maker
FROM product as p1, product as p2
WHERE p1.maker = p2.maker AND p1.type = 'laptop' AND p2.type = 'printer'; 

SELECT DISTINCT l.hd
FROM laptop as l
WHERE hd IN (SELECT hd FROM laptop as l2 WHERE l.model != l2.model);

SELECT *
FROM pc LEFT JOIN product ON pc.model = product.model
WHERE product.maker IS NULL;