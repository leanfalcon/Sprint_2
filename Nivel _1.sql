-- Script para obtener los paises realizando compras
SELECT DISTINCT country
FROM transaction 
JOIN company ON transaction.company_id = company.id;

-- Script para obtener desde cuántos países se realizan las compras
SELECT COUNT(DISTINCT country)
FROM transaction
JOIN company ON transaction.company_id = company.id;

-- Script para obtener a la compañía con la mayor media de ventas
SELECT AVG(amount) as Promedio_ventas, company_name
FROM transaction
JOIN company ON transaction.company_id = company.id
GROUP BY company_name
ORDER BY Promedio_ventas DESC
LIMIT 1;

-- Script para obtener todas las transacciones realizadas por empresas de Alemania
SELECT * 
FROM transaction 
WHERE company_id IN (
SELECT id 
FROM company 
WHERE country = "Germany");

-- Script para obtener las empresas que han realizado transacciones por un amount superior a la media de todas las transacciones
SELECT DISTINCT * 
FROM company 
WHERE id IN (
SELECT company_id
FROM transaction
WHERE amount > (SELECT AVG(amount) FROM transaction));

-- Script para obtener las empresas que carecen de transacciones registradas
SELECT company_name, id
FROM company
WHERE id NOT IN (
SELECT DISTINCT company_id
FROM transaction 
WHERE company_id IS NOT NULL);