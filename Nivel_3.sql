-- Script para Identifica las empresas que realizaron transacciones con un valor comprendido entre 100 y 200 euros y en alguna de estas fechas 
SELECT company_name, phone, country, DATE(timestamp), amount
FROM company 
JOIN transaction ON company.id = transaction.company_id 
WHERE 
	amount BETWEEN 100 AND 200
	AND DATE(timestamp) IN ('2021-04-29', '2021-07-20', '2022-03-13')
ORDER BY amount DESC;

SELECT COUNT(transaction.company_id) as Numero_transacciones, company_name
FROM company 
JOIN transaction ON company.id = transaction.company_id 
GROUP BY company_name
HAVING Numero_transacciones > 4;

-- Script para Identifica las empresas que tienen más de 4 transacciones o menos
SELECT company_name, COUNT(transaction.company_id) as Numero_transacciones, 
CASE
	WHEN  COUNT(transaction.company_id) >= 4 THEN 'Más de 4 transacciones'
    ELSE 'menos de 4 transacciones'
END AS Cantidad_Transacciones
FROM company 
LEFT JOIN transaction ON company.id = transaction.company_id
GROUP BY company_name
ORDER BY Numero_transacciones DESC;
