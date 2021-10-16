SELECT *
FROM products;

SELECT
    product_name,
    units_in_stock,
       RANK() OVER(ORDER BY product_id)
FROM products;

SELECT
    product_name,
    units_in_stock,
       RANK() OVER(ORDER BY units_in_stock)
FROM products;

SELECT
    product_name,
    units_in_stock,
       DENSE_RANK() OVER(ORDER BY units_in_stock)
FROM products;

SELECT
    product_name,
    unit_price,
       DENSE_RANK() OVER(
           ORDER BY
            CASE
                WHEN unit_price > 80 THEN 1
                WHEN unit_price >30 AND unit_price < 80 THEN 2
                ELSE 3
           END
           ) AS ranking
FROM products
ORDER BY unit_price DESC;

SELECT
    product_name,
    unit_price,
       LAG(unit_price) OVER(ORDER BY unit_price DESC) - unit_price AS price_lag
FROM products
ORDER BY unit_price DESC;

SELECT
    product_name,
    unit_price,
       LEAD(unit_price) OVER(ORDER BY unit_price) - unit_price AS price_lag
FROM products
ORDER BY unit_price;


SELECT
    product_name,
    unit_price,
       LEAD(unit_price,2) OVER(ORDER BY unit_price) - unit_price AS price_lag
FROM products
ORDER BY unit_price;