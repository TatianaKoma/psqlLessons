SELECT
    s.company_name,
    p.product_name
FROM suppliers AS s
LEFT JOIN products AS p
    ON s.supplier_id = p.supplier_id;

SELECT
    c.company_name,
    o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

SELECT
    e.last_name,
    o.order_id
FROM employees AS e
LEFT JOIN orders AS o
    ON o.employee_id = e. employee_id
WHERE o.order_id IS NULL;

SELECT
    COUNT(*)
FROM employees AS e
LEFT JOIN orders AS  o
    ON e.employee_id = o.employee_id
WHERE order_id IS NULL;

SELECT
    c.company_name,
    o.order_id
FROM orders AS o
RIGHT JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE order_id IS NULL;
