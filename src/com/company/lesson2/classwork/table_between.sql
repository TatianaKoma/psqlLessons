SELECT COUNT (*)
FROM orders
WHERE freight BETWEEN 20 AND 40;

SELECT *
FROM orders
WHERE order_date BETWEEN '1998-03-30' AND '1998-04-03';

SELECT *
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA';

SELECT *
FROM customers
WHERE country IN ('Mexico','Germany','USA','Canada');

SELECT *
FROM products
WHERE category_id IN ( 1,2,3,4,5,7);

SELECT *
FROM customers
WHERE country NOT IN ('Mexico','Germany','USA','Canada');

SELECT DISTINCT country
FROM customers;

SELECT DISTINCT country
FROM customers
ORDER BY country;


SELECT DISTINCT country
FROM customers
ORDER BY country DESC ;

SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city ASC ;

