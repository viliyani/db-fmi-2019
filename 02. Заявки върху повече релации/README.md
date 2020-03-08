## Заявки в SQL върху две и повече релации
### 1. За базата от данни Movies

**Зад 1.** <br/>Напишете заявка, която извежда имената на актьорите мъже, участвали във филма The Usual Suspects.

``````sql
SELECT moviestar.name
FROM moviestar CROSS JOIN starsin
WHERE moviestar.gender = 'm' AND starsin.movietitle  = 'The Usual Suspects' AND moviestar.name = starsin.starname; 
``````

**Зад 2.** <br/>Напишете заявка, която извежда имената на актьорите, участвали във филми от 1995, продуцирани от студио MGM.

``````sql
SELECT starsin.starname
FROM movie INNER JOIN starsin ON movie.title = starsin.movietitle AND movie.year = starsin.movieyear
WHERE movie.year = 1995 AND movie.studioname = 'MGM';
``````

**Зад 3.** <br/>Напишете заявка, която извежда имената на продуцентите, които са продуцирали филми на студио MGM.

``````sql
SELECT DISTINCT movieexec.name
FROM movie INNER JOIN movieexec ON movie.producerc# = movieexec.cert#
WHERE movie.studioname = 'MGM';
``````

**Зад 4.** <br/>Напишете заявка, която извежда имената на всички филми с дължина, поголяма от дължината на филма Star Wars.

``````sql
SELECT m2.title
FROM movie as m1, movie as m2
WHERE m1.title = 'Star Wars' AND m1.length < m2.length;
``````

**Зад 5.** <br/>Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.

``````sql
SELECT t2.name
FROM movieexec as t1, movieexec as t2
WHERE t1.name = 'Stephen Spielberg' AND t1.networth < t2.networth; 
``````

**Зад 6.** <br/>Напишете заявка, която извежда имената на всички филми, които са продуцирани от продуценти с нетни активи по-големи от тези на Stephen Spielberg.

``````sql
SELECT movie.title
FROM movieexec as t1, movieexec as t2 INNER JOIN movie ON t2.cert# = movie.producerc#
WHERE t1.name = 'Stephen Spielberg' AND t1.networth < t2.networth;
``````

### 2. За базата от данни PC

**Зад 1.** <br/>Напишете заявка, която извежда производителя и честотата на лаптопите с размер на диска поне 9 GB.

``````sql
SELECT product.maker, laptop.speed
FROM product INNER JOIN laptop ON product.model = laptop.model
WHERE laptop.hd > 9; 

``````

**Зад 2.** <br/>Напишете заявка, която извежда модел и цена на продуктите, произведени от производител с име B.

``````sql
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
``````

**Зад 3.** <br/>Напишете заявка, която извежда производителите, които произвеждат лаптопи, но не произвеждат персонални компютри.

``````sql
(SELECT maker
FROM product
WHERE type = 'laptop')
EXCEPT
(SELECT maker
FROM product
WHERE type = 'Pc');
``````

**Зад 4.** <br/>Напишете заявка, която извежда размерите на тези дискове, които се предлагат в поне два различни персонални компютъра (два компютъра с различен код).

``````sql
SELECT DISTINCT t1.hd
FROM pc as t1, pc as t2
WHERE t1.hd = t2.hd AND t1.code != t2.code;
``````

**Зад 5.** <br/>Напишете заявка, която извежда двойките модели на персонални компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i).

``````sql
SELECT DISTINCT t1.model, t2.model
FROM pc as t1, pc as t2
WHERE t1.speed = t2.speed AND t1.ram = t2.ram AND t1.model < t2.model;
``````

**Зад 6.** <br/>Напишете заявка, която извежда производителите на поне два различни персонални компютъра с честота поне 400.

``````sql
SELECT DISTINCT product.maker
FROM product INNER JOIN (pc as t1 CROSS JOIN pc as t2) ON product.model = t1.model
WHERE t1.code < t2.code AND t1.speed > 400 AND t2.speed > 400 AND t1.model = t2.model;
``````

### 3. За базата от данни Ships

**Зад 1.** <br/> Напишете заявка, която извежда името на корабите с водоизместимост над 50000.

``````sql
SELECT ships.name
FROM ships INNER JOIN classes ON ships.class = classes.class
WHERE classes.displacement > 50000;
``````

**Зад 2.** <br/>Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
всички кораби, участвали в битката при Guadalcanal.

``````sql
SELECT ships.name, classes.numguns, classes.displacement
FROM ships INNER JOIN classes ON ships.class = classes.class INNER JOIN outcomes ON ships.name = outcomes.ship 
WHERE outcomes.battle = 'Guadalcanal'
``````

**Зад 3.** <br/>Напишете заявка, която извежда имената на тези държави, които имат както бойни кораби, така и бойни крайцери.

``````sql
SELECT DISTINCT t1.country
FROM classes as t1, classes as t2
WHERE t1.country = t2.country AND t1.type != t2.type;
``````

**Зад 4.** <br/>Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по-късно са участвали в друга битка.

``````sql
SELECT DISTINCT t1.ship
FROM outcomes as t1, outcomes as t2
WHERE t1.ship = t2.ship AND t1.result = 'damaged' AND t2.result = 'ok';
``````