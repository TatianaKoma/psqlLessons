CREATE OR REPLACE FUNCTION get_total_number_of_goods()
    RETURNS BIGINT AS $$
        BEGIN
            RETURN sum(units_in_stock)
            FROM products;
        END;
    $$ LANGUAGE plpgsql;

SELECT get_total_number_of_goods();

CREATE OR REPLACE FUNCTION get_max_price_from_discontinued()
    RETURNS REAL AS $$
        BEGIN
            RETURN max(unit_price)
            FROM products
            WHERE discontinued = 1;
        END;
    $$ LANGUAGE plpgsql;

SELECT get_max_price_from_discontinued();

CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price REAL, OUT min_price REAL) AS $$
    BEGIN
        max_price := MAX(unit_price)
        FROM products;
        min_price := MIN(unit_price)
        FROM products;
    END;
$$ LANGUAGE plpgsql;

SELECT get_price_boundary_by_dscontinuity();


CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price REAL, OUT min_price REAL) AS $$
    BEGIN
        SELECT
            MAX(unit_price),
            MIN(unit_price) INTO max_price, min_price
        FROM products;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_sum(x INT, y INT, OUT result INT) AS $$
    BEGIN
        result := x + y;
        RETURN;
    END;
$$ LANGUAGE plpgsql;

SELECT *
FROM get_sum(2,3);

CREATE OR REPLACE FUNCTION get_customers_by_country(customer_country VARCHAR)
    RETURNS SETOF customers AS $$
       BEGIN
           RETURN QUERY
           SELECT *
           FROM customers
           WHERE country = customer_country;
       END;
    $$ LANGUAGE plpgsql;

SELECT *
FROM get_customers_by_country('USA');

