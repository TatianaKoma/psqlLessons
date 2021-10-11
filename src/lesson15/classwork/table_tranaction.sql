BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

WITH prod_update AS(
    UPDATE products
    SET discontinued = 1
    WHERE units_in_stock < 10
    RETURNING product_id
)

SELECT * INTO last_orders_on_discontinued
FROM order_details
WHERE product_id IN (SELECT product_id FROM prod_update);
SAVEPOINT backup;
DELETE FROM order_details
WHERE product_id IN ( SELECT product_id FROM last_orders_on_discontinued);

ROLLBACK TO backup;

UPDATE order_details
SET quantity = 0
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);
COMMIT;

SELECT *
FROM order_details
WHERE product_id IN (SELECT product_id FROM last_orders_on_discontinued);

DROP TABLE IF EXISTS last_orders_on_discontinued;

SELECT *
FROM last_orders_on_discontinued;

BEGIN;
ALTER TABLE employees
ADD COLUMN salary DECIMAL(12, 2);

UPDATE employees SET salary = random()*100;
COMMIT;

BEGIN;
UPDATE employees
SET salary = salary * 1.5
WHERE salary < 50;
 SAVEPOINT increase_salary;
UPDATE employees
SET salary = salary * 0.8
WHERE salary > 70;

ROLLBACK TO increase_salary;
UPDATE employees
SET salary = 0
WHERE employee_id = 9;
COMMIT;