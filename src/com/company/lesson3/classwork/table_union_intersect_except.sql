SELECT country
FROM customers
UNION
SELECT country
FROM employees;

SELECT country
FROM customers
INTERSECT
SELECT country
FROM suppliers;

SELECT country
FROM customers
EXCEPT
SELECT country
FROM suppliers;

