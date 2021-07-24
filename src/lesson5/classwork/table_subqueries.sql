SELECT DISTINCT
    country
FROM customers;

SELECT
    company_name
FROM suppliers
WHERE country IN (
                    SELECT DISTINCT
                        country
                    FROM customers
                 );

SELECT DISTINCT
    s.company_name
FROM suppliers AS s
JOIN customers AS c
    USING(country);

SELECT
    c.category_name,
    SUM(p.units_in_stock)
FROM products AS p
JOIN categories AS c
    USING(category_id)
GROUP BY category_name
ORDER BY SUM(p.units_in_stock) DESC
LIMIT (
         SELECT MIN(product_id) + 4
         FROM products
      );

SELECT
       AVG(units_in_stock)
FROM products;

SELECT product_name,
       units_in_stock
FROM products
WHERE units_in_stock > (
                         SELECT
                             AVG(units_in_stock)
                         FROM products
                        )
ORDER BY units_in_stock;