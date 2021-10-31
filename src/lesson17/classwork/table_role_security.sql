CREATE ROLE sales_stuff;
CREATE ROLE northwind_admins;

CREATE USER john_smith WITH PASSWORD 'qwerty';
CREATE USER north_admin1 WITH PASSWORD 'qwerty';

REVOKE CREATE ON SCHEMA public FROM public;
REVOKE ALL ON DATABASE postgres FROM public;

GRANT CONNECT ON DATABASE postgres TO sales_stuff;
GRANT CONNECT ON DATABASE  postgres TO northwind_admins;

GRANT USAGE ON SCHEMA public TO sales_stuff;

GRANT USAGE ON SCHEMA public TO northwind_admins;
GRANT CREATE ON SCHEMA public TO northwind_admins;
GRANT CREATE ON DATABASE  postgres TO northwind_admins;

GRANT sales_stuff TO john_smith;
GRANT northwind_admins TO north_admin1;

SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'admin_demo2';

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE
    public.orders,
    public.order_details,
    public.products
    TO sales_stuff;
GRANT SELECT ON TABLE public.employees TO sales_stuff;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES
    IN SCHEMA public
TO northwind_admins;

SELECT *
FROM orders;

GRANT SELECT (employee_id, last_name, title, title_of_courtesy, birth_date, hire_date, city,
    region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path)
ON employees
TO sales_stuff;

REVOKE SELECT ON employees
FROM sales_stuff;

SELECT *
FROM products;

SELECT
    COUNT(*)
FROM products;

ALTER TABLE products
ENABLE ROW LEVEL SECURITY;

CREATE POLICY active_products_for_sales_stuff ON products
FOR SELECT
TO sales_stuff
USING (discontinued <> 1);

SELECT *
FROM products
WHERE reorder_level > 10;

CREATE POLICY reordered_products_for_sales_stuff ON products
FOR SELECT
TO sales_stuff
USING (reorder_level > 10);

DROP POLICY reordered_products_for_sales_stuff ON products;

REVOKE ALL PRIVILEGES ON employees, orders, order_details, products
FROM sales_stuff;

REVOKE ALL ON DATABASE postgres FROM sales_stuff;
REVOKE ALL ON SCHEMA public FROM sales_stuff;

DROP POLICY reordered_products_for_sales_stuff ON products;
DROP POLICY active_products_for_sales_stuff ON products;
DROP ROLE sales_stuff;
DROP USER john_smith;

SELECT *
FROM pg_roles;
