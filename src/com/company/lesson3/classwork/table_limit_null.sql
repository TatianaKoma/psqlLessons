SELECT
    product_name,
    unit_price
FROM products
LIMIT 10;

SELECT
    product_name,
    unit_price
FROM products
WHERE discontinued <> 1
ORDER BY unit_price DESC
LIMIT 10;

SELECT
    ship_city,
    ship_region,
    ship_country
FROM  orders
WHERE ship_region IS NULL;

SELECT
    ship_city,
    ship_region,
    ship_country
FROM  orders
WHERE ship_region IS NOT NULL;


