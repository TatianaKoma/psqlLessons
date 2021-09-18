CREATE OR REPLACE FUNCTION fib(n INT)
    RETURNS INT AS $$
        DECLARE
            counter INT = 0;
            i INT = 0;
            j INT = 1;
        BEGIN
            IF n < 1 THEN
                RETURN 0;
            END IF;

            WHILE counter < n
            LOOP
                counter = counter +1;
                SELECT j, i + j INTO i, j;
            END LOOP;

            RETURN i;
        END;
    $$ LANGUAGE plpgsql;

SELECT fib(3);

CREATE OR REPLACE FUNCTION fib(n INT)
    RETURNS INT AS $$
DECLARE
    counter INT = 0;
    i INT = 0;
    j INT = 1;
BEGIN
    IF n < 1 THEN
        RETURN 0;
    END IF;

    LOOP
       EXIT WHEN counter > n;
       counter = counter + 1;
        SELECT j, i + j INTO i, j;
    END LOOP;

    RETURN i;
END;
$$ LANGUAGE plpgsql;

DO $$
BEGIN
    FOR counter IN 1..10 BY 2
        LOOP
            RAISE NOTICE 'Counter : %', counter;
        END LOOP;
END$$;


