## Прости заявки
### 1. За базата от данни Movies

**Зад 1.** <br/>Напишете заявка, която извежда адреса на студио ‘Disney’.

``````sql
SELECT address
FROM studio
WHERE name = 'Disney'
``````

**Зад 2.** <br/>Напишете заявка, която извежда рождената дата на актьора Jack Nicholson.

``````sql
SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson' 
``````

**Зад 3.** <br/>Напишете заявка, която извежда имената на актьорите, които са участвали във филм от 1980 или във филм, в чието заглавие има думата ‘Knight’.

``````sql
SELECT starname
FROM starsin
WHERE movieyear = 1980 OR movietitle LIKE '%Knight%'
``````

**Зад 4.** <br/>Напишете заявка, която извежда имената на продуцентите с нетни активи над 10 000 000 долара.

``````sql
SELECT name
FROM movieexec
WHERE networth > 10000000 
``````

**Зад 5.** <br/>Напишете заявка, която извежда имената на актьорите, които са мъже или живеят на Prefect Rd.

``````sql
SELECT name
FROM moviestar
WHERE gender = 'm' OR address LIKE '%Prefect Rd%'
``````

### 2. За базата от данни PC

**Зад 1.** <br/>Напишете заявка, която извежда модел, честота и размер на диска за всички персонални компютри с цена под 1200 долара. Задайте псевдоними за атрибутите честота и размер на диска, съответно MHz и GB.

``````sql
SELECT model, speed as MHz, hd as GB
FROM pc
WHERE price < 1200; 
``````

**Зад 2.** <br/>Напишете заявка, която извежда производителите на принтери без повторения.

``````sql
SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'; 
``````

**Зад 3.** <br/>Напишете заявка, която извежда модел, размер на паметта, размер на екран за лаптопите, чиято цена е над 1000 долара.

``````sql
SELECT model, ram, screen
FROM laptop
WHERE price > 1000; 
``````

**Зад 4.** <br/>Напишете заявка, която извежда всички цветни принтери.

``````sql
SELECT DISTINCT *
FROM printer
WHERE color = 'y';
``````

**Зад 5.** <br/>Напишете заявка, която извежда модел, честота и размер на диска за тези персонални компютри със CD 12x или 16x и цена под 2000 долара.

``````sql
SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' OR cd = '16x') AND price < 2000; 
``````

### 3. За базата от данни Ships

**Зад 1.** <br/>Напишете заявка, която извежда класа и страната за всички класове с по-малко от 10 оръдия.

``````sql
SELECT class, country 
FROM classes
WHERE numguns < 10;
``````

**Зад 2.** <br/>Напишете заявка, която извежда имената на корабите, пуснати на вода преди 1918. Задайте псевдоним shipName на колоната.

``````sql
SELECT name as shipName
FROM ships
WHERE launched < 1918;
``````

**Зад 3.** <br/>Напишете заявка, която извежда имената на корабите потънали в битка и имената на съответните битки.

``````sql
SELECT ship, battle
FROM outcomes
WHERE result = 'sunk'
``````

**Зад 4.** <br/>Напишете заявка, която извежда имената на корабите с име, съвпадащо с името на техния клас.

``````sql
SELECT name
FROM ships
WHERE name = class;
``````

**Зад 5.** <br/>Напишете заявка, която извежда имената на корабите, които започват с буквата R.

``````sql
SELECT name
FROM ships
WHERE name LIKE 'R%';
``````

**Зад 6.** <br/>Напишете заявка, която извежда имената на корабите, които съдържат 2 или повече думи.

``````sql
SELECT name
FROM ships
WHERE name LIKE '% %';
``````