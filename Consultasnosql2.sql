-- Operador in 
SELECT p.firstname,
p.lastname,
sp.salesquota
FROM person.person AS p 
JOIN sales.salesperson AS sp
ON p.businessentityid = sp.businessentityid
WHERE p.businessentityid IN (SELECT sp.businessentityid
	WHERE salesquota > 250000);

-- Operador NOT IN
SELECT p.firstname,
p.lastname,
sp.salesquota
FROM person.person AS p 
JOIN sales.salesperson AS sp
ON p.businessentityid = sp.businessentityid
WHERE p.businessentityid  NOT IN (SELECT sp.businessentityid
	WHERE salesquota > 250000);

-- LIKE LOCALIZA VALORES QUE CONTENHAM "OR" EM QUALQUER LUGAR
SELECT * FROM customers
WHERE contactname LIKE '%or%';

--LIKE enconta quaisquer valores que tenham "r" na segunda posição
SELECT * FROM customers
WHERE contactname LIKE '_r%'

--LIKE localiza valores que começam com "a" e possuem pelo menos 3 caracteres de comprimento
SELECT * FROM customers 
WHERE contactname LIKE 'a_%_%';
 
 -- LIKE coringa []
 USE AdventureWorks2014
 SELECT businessentityid,
 firstname,
 lastname
 FROM person.person
 WHERE firstname LIKE '[CS]he%'

 --OPERADOR HAVING
 SELECT COUNT(customerid),
 country
 FROM customers
 GROUP BY country HAVING Count(customerid) > 5