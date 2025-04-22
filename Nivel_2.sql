-- Script para Identifica los cinco días que se generó la mayor cantidad de ingresos en la empresa por ventas
SELECT DATE(timestamp) as Fecha, SUM(amount) as Total_ventas
FROM transaction 
WHERE declined = '0'
GROUP BY DATE(timestamp)
ORDER BY Total_ventas DESC
LIMIT 5;

-- Script para obtener la media de ventas por país
SELECT country, AVG(amount) as Promedio_vtas
FROM transaction
JOIN company ON transaction.company_id = company.id
GROUP BY country
ORDER BY Promedio_vtas DESC;

-- Script para obtener la lista de todas las transacciones realizadas por empresas que están ubicadas en el mismo país que 'Non Institute'
SELECT * 
FROM transaction 
JOIN company ON transaction.company_id = company.id
	WHERE country = (SELECT country
	FROM transactions.company
	WHERE company_name = 'Non Institute');

SELECT *
FROM transaction 
WHERE company_id IN (
	SELECT id
	FROM company
	WHERE country = (
		SELECT country 
        	FROM company 
        	WHERE company_name = 'Non Institute')
        );
