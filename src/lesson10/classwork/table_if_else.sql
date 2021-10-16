CREATE OR REPLACE FUNCTION convert_temp_to(temperature REAL, to_celsius BOOL DEFAULT true)
    RETURNS REAL AS $$
        DECLARE
            result_temp REAL;
        BEGIN
            IF to_celsius THEN
                result_temp = (5.0 / 9.0) *  (temperature - 32);
            ELSE
                result_temp = (9 * temperature + (32 * 5)) / 5.0;
            END IF;
            RETURN result_temp;
        END;
    $$ LANGUAGE plpgsql;

SELECT
    convert_temp_to(80);
SELECT
    convert_temp_to(26.7, false);

CREATE OR REPLACE FUNCTION get_season(month_number INT)
    RETURNS TEXT AS $$
        DECLARE
            season TEXT;
        BEGIN
            IF month_number BETWEEN 3 AND 5 THEN
                season = 'spring';
            ELSEIF month_number BETWEEN 6 AND 8 THEN
                season = 'summer';
            ELSEIF month_number BETWEEN 9 and 11 THEN
                season = 'autumn';
            ELSE
                season = 'winter';
            END IF;
            RETURN season;
        END;
    $$ LANGUAGE plpgsql;

SELECT get_season(12);