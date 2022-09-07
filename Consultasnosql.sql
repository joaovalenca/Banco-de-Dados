/* usando o operador de adi��o. Vamos calcular o total de horas de aus�ncia do trabalho para cada funcion�rio. */
SELECT p.firstname, p.lastname, e.vacationhours, e.sickleavehours, e.vacationhours + e.sickleavehours as 'Horas ausente'
FROM humanresources.employee as e
JOIN person.person as p
ON e.businessentityid = p.businessentityid
ORDER BY 'Horas ausente' ASC ;

/* usando subtra��o no select. Calculando a diferen�a de taxas de imposto entre o estado e o munic�pio com a taxa de imposto mais alta e o estado ou munic�pio com ataxa de imposto mais baixa */
SELECT MAX(taxrate) as Maior_valor, MIN(taxrate) as Menor_valor, MAX(taxrate) - MIN(taxrate) as 'Tax rate difference'
FROM sales.SalesTaxRate
WHERE StateProvinceID IS NOT NULL;

/* atualizando o pre�o dos produtos utilizando multiplica��o */
SELECT productid, NAME, listprice, listprice * 1.15 AS Novo_preco
FROM production.product
WHERE NAME LIKE 'Mountain-%'
ORDER By productid ASC;

/* utilizando o operador aritm�tico de divis�o para calcular a meta de vendas mensal da equipe de vendas em CICLOS de 12 meses */
SELECT s.businessentityid AS SalesPersonID,
firstname,
lastname,
salesquota,
salesquota /12 AS 'Sales Target Per Month'
FROM sales.salesperson AS s
JOIN HumanResources.Employee AS e 
ON s.BusinessEntityID = e.businessentityid
Join person.Person as p
on e.businessentityid = p.BusinessEntityID
