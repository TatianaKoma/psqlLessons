DROP FUNCTION IF EXISTS get_price_boundaries;

CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price REAL, OUT min_price REAL)
    RETURNS SETOF record AS $$
        SELECT MAX(unit_price), MIN(unit_price)
        FROM products
    $$ LANGUAGE SQL;

SELECT *
FROM get_price_boundaries();

CREATE TYPE price_bounds AS(
    max_price REAL,
    min_price REAL
);

CREATE FUNCTION get_price_boundaries()
    RETURNS SETOF price_bounds AS $$
        SELECT MAX(unit_price), MIN(unit_price)
        FROM products
    $$ LANGUAGE SQL;

SELECT *
FROM get_price_boundaries();

CREATE TYPE complex AS(
    r FLOAT8,
    i FLOAT8
);

CREATE TABLE math_calcs(
    id SERIAL,
    val complex
);

INSERT INTO math_calcs(val)
VALUES(ROW (3.0, 4.0)),
       (ROW (2.0, 1.0));

SELECT *
FROM math_calcs;

SELECT (val).r
FROM math_calcs;

SELECT (math_calcs.val).i
FROM math_calcs;

SELECT (val).*
FROM math_calcs;

UPDATE math_calcs
SET val = ROW ( 5.0, 4.0)
WHERE id = 1;

UPDATE math_calcs
SET val.r= 3.0
WHERE id = 1;