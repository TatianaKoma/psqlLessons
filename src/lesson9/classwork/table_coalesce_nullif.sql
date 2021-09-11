
SELECT
    order_id,
    order_date,
       COALESCE(ship_region, 'unknown') AS ship_region
FROM orders
LIMIT 10;

SELECT
    last_name,
    first_name,
    COALESCE(region, 'N/A') AS region
FROM employees;

SELECT contact_name,
       COALESCE(NULLIF(city, ''), 'Unknown') AS city
FROM customers;

CREATE TABLE budgets
(
    department BIGSERIAL,
    current_year DECIMAL,
    previous_year DECIMAL
);

INSERT INTO budgets(current_year, previous_year)
VALUES (100000, 150000);
INSERT INTO budgets(current_year, previous_year)
VALUES (NULL, 150000);
INSERT INTO budgets(current_year, previous_year)
VALUES (0, 100000);
INSERT INTO budgets(current_year, previous_year)
VALUES (300000, 250000);
INSERT INTO budgets(current_year, previous_year)
VALUES (170000, 170000);
INSERT INTO budgets(current_year, previous_year)
VALUES (150000, NULL);

SELECT
    department,
    COALESCE(TO_CHAR(NULLIF(current_year, previous_year), 'FM99999999'), 'Same as last year ') as budget
FROM budgets
WHERE current_year IS NOT NULL ;
