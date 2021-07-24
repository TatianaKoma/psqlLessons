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
    category_name,
    SUM()