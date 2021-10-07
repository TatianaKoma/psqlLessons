CREATE OR REPLACE FUNCTION filter_even(VARIADIC numbers INT[])
    RETURNS SETOF INT AS $$
        BEGIN
            FOR counter IN 1..array_upper(numbers, 1)
            LOOP
                CONTINUE WHEN counter % 2 != 0;
                RETURN NEXT counter;
            END LOOP;
        END ;
    $$ LANGUAGE plpgsql;

SELECT *
FROM filter_even(1, 2, 3, 4, 5, 6, 7, 8);

CREATE OR REPLACE FUNCTION filter_even(VARIADIC numbers INT[])
    RETURNS SETOF INT AS $$
        DECLARE
            counter INT;
        BEGIN
            FOREACH counter IN ARRAY numbers
            LOOP
                CONTINUE WHEN counter % 2 != 0;
                RETURN NEXT counter;
                END LOOP;
        END;
    $$ LANGUAGE plpgsql;