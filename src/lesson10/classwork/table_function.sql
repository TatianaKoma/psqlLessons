SELECT *
FROM customers;

SELECT *
INTO tmp_customers
FROM customers;

SELECT *
FROM tmp_customers;

UPDATE tmp_customers
SET region = 'unknown'
WHERE region IS NULL;

CREATE OR REPLACE FUNCTION fix_customer_region()
    RETURNS void AS $$
        UPDATE tmp_customers
        SET region = 'unknown'
        WHERE region IS NULL
    $$ LANGUAGE SQL;

SELECT fix_customer_region();

CREATE OR REPLACE FUNCTION get_total_numbers_of_goods()
    RETURNS BIGINT AS $$
        SELECT SUM(units_in_stock)
        FROM products
    $$ LANGUAGE SQL;

SELECT get_total_numbers_of_goods() AS total_goods;

CREATE OR REPLACE FUNCTION get_avg_price()
    RETURNS FLOAT8 AS $$
        SELECT AVG(unit_price)
        FROM products
    $$ LANGUAGE SQL;

SELECT get_avg_price() AS avg_price;
