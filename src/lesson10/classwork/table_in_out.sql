CREATE OR REPLACE FUNCTION get_product_price_by_name(prod_name VARCHAR)
    RETURNS REAL AS $$
        SELECT unit_price
        FROM products
        WHERE product_name = prod_name
    $$ LANGUAGE SQL;

SELECT
    get_product_price_by_name('Chocolade') AS price;

CREATE OR REPLACE FUNCTION get_price_bounaries(OUT max_price REAL, OUT min_price REAL) AS $$
    SELECT
        MAX(unit_price),
        MIN(unit_price)
    FROM products
$$ LANGUAGE SQL;

SELECT
    get_price_bounaries();

SELECT *
FROM get_price_bounaries();

CREATE OR REPLACE FUNCTION get_price_boundary_by_dscontinuity
    (IN is_discontinued INT, OUT max_price REAL, OUT min_price REAL) AS $$
        SELECT
            MAX(unit_price),
            MIN(unit_price)
        FROM products
        WHERE discontinued = is_discontinued
    $$ LANGUAGE SQL;

SELECT
    get_price_boundary_by_dscontinuity(1);

SELECT *
FROM get_price_boundary_by_dscontinuity(1);

 CREATE OR REPLACE FUNCTION get_price_boundary_by_dscontinuity
    (IN is_discontinued INT DEFAULT 1, OUT max_price REAL, OUT min_price REAL) AS $$
        SELECT
            MAX(unit_price),
            MIN(unit_price)
        FROM products
        WHERE discontinued = is_discontinued
    $$ LANGUAGE SQL;

 SELECT
    get_price_boundary_by_dscontinuity();

SELECT *
FROM get_price_boundary_by_dscontinuity();

 SELECT *
 FROM get_price_boundary_by_dscontinuity(0);

 SELECT *
 FROM get_price_boundary_by_dscontinuity(1);

