SELECT
    p.product_name,
    s.company_name,
    p.units_in_stock
FROM products AS p
JOIN suppliers AS s
    ON p.supplier_id = s.supplier_id
ORDER BY p.units_in_stock DESC ;

SELECT
    c.category_name,
    SUM(p.units_in_stock)
FROM products AS p
JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY SUM(p.units_in_stock) DESC
LIMIT 5;

SELECT
    c.category_name,
    SUM(p.unit_price * p.units_in_stock)
FROM products AS p
JOIN categories AS c
    ON p.category_id = c.category_id
WHERE discontinued <> 1
GROUP BY c.category_name
HAVING SUM(p.unit_price * p.units_in_stock) > 5000
ORDER BY SUM(p.unit_price * p.units_in_stock) DESC;

SELECT
    o.order_id,
    o.customer_id,
    e.first_name,
    e.last_name,
    e.title
FROM orders AS o
JOIN employees AS e
    ON o.employee_id = e.employee_id;

SELECT
    o.order_date,
    p.product_name,
    o.ship_country,
    p.unit_price,
    od.quantity,
    od.discount
FROM orders AS o
JOIN order_details AS od
    ON o.order_id = od.order_id
JOIN products AS p
    ON od.product_id = p.product_id;

SELECT
    c.contact_name,
    c.company_name,
    e.phone,
    e.first_name,
    e.last_name,
    e.title,
    o.order_date,
    p.product_name,
    o.ship_country,
    p.unit_price,
    od.quantity,
    od.discount
FROM orders AS o
JOIN order_details AS od
    ON o.order_id = od.order_id
JOIN products AS p
    ON od.product_id = p.product_id
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN employees AS e
    ON o.employee_id = e.employee_id
WHERE ship_country = 'USA';
