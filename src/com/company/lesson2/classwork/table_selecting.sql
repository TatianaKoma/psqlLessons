-- вытащить все поля из таблицы products
SELECT *
FROM products;

-- вытащить отдельные колонки
SELECT
    product_id,
    product_name,
    unit_price
FROM products;
-- математические операции
SELECT
    product_id,
    product_name,
    unit_price*units_in_stock
FROM products;

SELECT DISTINCT
    city,
    country
FROM employees;

