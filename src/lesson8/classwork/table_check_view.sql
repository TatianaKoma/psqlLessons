CREATE OR REPLACE VIEW heavy_orders AS
SELECT *
FROM orders
WHERE freight > 100
WITH LOCAL CHECK OPTION;
-- WITH CASCADE CHECK OPTION;

INSERT INTO heavy_orders
VALUES (11901,'FOLIG', 1, '2000-01-01', '2000-01-05', '2000-01-04', 1, 80,
 'Folies gourmandes','184, chaussée de Tournai', 'Lille', NULL, 59000, 'France'
);

SELECT *
FROM heavy_orders
WHERE order_id = 11900;

SELECT *
FROM orders
WHERE order_id = 11900;