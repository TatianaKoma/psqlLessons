CREATE OR REPLACE FUNCTION type_testing(money_val FLOAT8)
    RETURNS void AS $$
        BEGIN
            RAISE NOTICE 'ran %', money_val;
        END ;
    $$ LANGUAGE plpgsql;

SELECT type_testing(0.5);
SELECT type_testing(0.5::FLOAT4);
SELECT type_testing(1);

CREATE OR REPLACE FUNCTION type_testing2(money_val INT)
    RETURNS void AS $$
        BEGIN
            RAISE NOTICE 'ran %', money_val;
        END;
    $$ LANGUAGE plpgsql;

SELECT type_testing2(5);
SELECT type_testing2(0.5);
SELECT type_testing2(0.5::INT);
SELECT type_testing2(0.4::INT);
SELECT type_testing2(CAST(0.5 AS INT));

SELECT type_testing2('1.5');
SELECT type_testing2('1.5'::NUMERIC::INT);
SELECT type_testing2('1'::INT);

SELECT 50! AS big_factorial;
SELECT CAST(50 AS BIGINT)! AS big_factorial;

SELECT 'abc' || 1;
SELECT '10' = 10;