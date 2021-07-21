SELECT COUNT(DISTINCT country)
FROM employees;

SELECT
    order_id,
    shipped_date,
    order_date
FROM orders;

SELECT DISTINCT
    city,
    country
FROM customers;

SELECT COUNT(DISTINCT country)
FROM customers;