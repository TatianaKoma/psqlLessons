SELECT
    c.company_name,
    c.contact_name
FROM customers AS c
WHERE EXISTS (
              SELECT
                customer_id
              FROM orders AS o
              WHERE o.customer_id = c.customer_id
                AND freight BETWEEN 50 AND 100
              );

SELECT
    c.company_name,
    c.contact_name
FROM customers AS c
WHERE NOT EXISTS (
                    SELECT
                        customer_id
                    FROM orders AS o
                    WHERE o.customer_id = c.customer_id
                        AND o.order_date BETWEEN '1995-02-01' AND '1995-02-15'
                 );

SELECT
    p.product_name
FROM products AS p
WHERE NOT EXISTS(
                 SELECT
                    o.order_id
                 FROM orders AS o
                 JOIN order_details AS od
                    USING(order_id)
                 WHERE od.product_id = p.product_id
                    AND o.order_date BETWEEN '1995-02-01' AND '1995-02-15'
                 );

SELECT DISTINCT
    c.company_name
FROM customers AS c
JOIN orders AS o
    USING(customer_id)
JOIN order_details AS od
    USING(order_id)
WHERE quantity > 40;

SELECT
    o.customer_id
FROM orders AS o
JOIN order_details AS od
    USING(order_id)
WHERE quantity > 40;

SELECT DISTINCT
    c.company_name
FROM customers AS c
WHERE customer_id = ANY(
                        SELECT
                            o.customer_id
                        FROM orders AS o
                        JOIN order_details AS od
                            USING(order_id)
                        WHERE quantity > 40);

SELECT
       AVG(quantity)
FROM order_details;

SELECT DISTINCT
    p.product_name,
    od.quantity
FROM products AS p
JOIN order_details as od
    USING(product_id)
WHERE quantity > (
                  SELECT AVG(quantity)
                  FROM order_details
                 )
ORDER BY quantity;

SELECT
    AVG(quantity)
FROM order_details
GROUP BY product_id;

SELECT DISTINCT
    p.product_name,
    od.quantity
FROM products AS p
JOIN order_details AS od
    USING(product_id)
WHERE quantity > ALL(
                      SELECT
                        AVG(quantity)
                      FROM order_details
                      GROUP BY product_id
                     )
ORDER BY quantity;