CREATE OR REPLACE FUNCTION get_average_prices_by_prod_categories()
    RETURNS SETOF DOUBLE PRECISION AS $$
        SELECT
            AVG(unit_price)
        FROM products
        GROUP BY category_id
    $$ LANGUAGE SQL;

SELECT *
FROM get_average_prices_by_prod_categories() AS average_prices;

CREATE OR REPLACE FUNCTION get_avg_prices_by_prod_cats(OUT sum_price REAL, OUT avg_price FLOAT8)
    RETURNS SETOF RECORD AS $$
        SELECT
            SUM(unit_price),
            AVG(unit_price)
        FROM products
        GROUP BY category_id
    $$ LANGUAGE SQL;

SELECT
    sum_price
FROM get_avg_prices_by_prod_cats();

SELECT
    sum_price,
    avg_price
FROM get_avg_prices_by_prod_cats();

DROP FUNCTION get_avg_prices_by_prod_cats;

CREATE OR REPLACE FUNCTION get_avg_prices_by_prod_cats()
    RETURNS SETOF RECORD AS $$
        SELECT
            SUM(unit_price),
            AVG(unit_price)
        FROM products
        GROUP BY category_id
    $$ LANGUAGE SQL;

SELECT
    sum_price AS sum_of, avg_price AS in_avg
FROM get_avg_prices_by_prod_cats() AS(sum_price REAL, avg_price FLOAT8);

CREATE OR REPLACE FUNCTION get_customers_by_country(customer_country VARCHAR)
    RETURNS TABLE(char_code CHAR, company_name VARCHAR) AS $$
        SELECT
            customer_id,
            company_name
        FROM customers
        WHERE country = customer_country
    $$ LANGUAGE SQL;

SELECT *
FROM get_customers_by_country('USA');

SELECT
    char_code,
    company_name
FROM get_customers_by_country('USA');

DROP FUNCTION get_customers_by_country;

CREATE OR REPLACE FUNCTION get_customers_by_country(customer_country VARCHAR)
    RETURNS SETOF customers AS $$
--         SELECT customer_id, company_name won"t work
        SELECT *
        FROM customers
        WHERE country = customer_country
    $$ LANGUAGE SQL;

SELECT *
FROM get_customers_by_country('USA');

SELECT
    contact_name AS contact, company_name
FROM get_customers_by_country('USA');