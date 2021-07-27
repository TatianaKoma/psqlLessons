SELECT
    c.contact_name,
    c.company_name,
    c.phone,
    e.first_name,
    e.last_name,
    e.title,
    o.order_date,
    o.ship_country,
    p.product_name,
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

SELECT
    c.contact_name,
    c.company_name,
    c.phone,
    e.first_name,
    e.last_name,
    e.title,
    o.order_date,
    o.ship_country,
    p.product_name,
    p.unit_price,
    od.quantity,
    od.discount
FROM orders AS o
         JOIN order_details AS od
              USING(order_id)
         JOIN products AS p
              USING(product_id)
         JOIN customers AS c
              USING(customer_id)
         JOIN employees AS e
              USING(employee_id)
WHERE ship_country = 'USA';

SELECT
    order_id,
    customer_id,
    first_name,
    last_name,
    title
FROM orders
NATURAL JOIN employees;

