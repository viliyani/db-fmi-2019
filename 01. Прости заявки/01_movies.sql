SELECT address
FROM studio
WHERE name = 'Disney'

SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson' 

SELECT starname
FROM starsin
WHERE movieyear = 1980 OR movietitle LIKE '%Knight%'

SELECT name
FROM movieexec
WHERE networth > 10000000 

SELECT name
FROM moviestar
WHERE gender = 'm' OR address LIKE '%Prefect Rd%'