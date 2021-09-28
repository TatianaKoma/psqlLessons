DROP FUNCTION IF EXISTS get_season;
CREATE OR REPLACE FUNCTION get_season(month_number INT)
    RETURNS TEXT AS $$
        DECLARE
            season TEXT;
        BEGIN
            IF month_number BETWEEN 3 AND 5 THEN
                season = 'spring';
            ELSIF month_number BETWEEN 6 AND 8 THEN
                season = 'summer';
            ELSIF month_number BETWEEN 9 AND 11 THEN
                season = 'autumn';
            ELSE
                season = 'winter';
            END IF;
            RETURN season;
        END;
    $$ LANGUAGE plpgsql;

SELECT get_season(12);

SELECT get_season(15);

CREATE OR REPLACE FUNCTION get_season(month_number INT)
    RETURNS TEXT AS $$
        DECLARE
            season TEXT;
        BEGIN
            IF month_number NOT BETWEEN 1 AND 12 THEN
            RAISE EXCEPTION 'Invalid month. You passed: (%)', month_number
            USING HINT = 'Allowed from 1 to 12', ERRCODE = 12882;
            END IF;

            IF month_number BETWEEN 3 AND 5 THEN
                season = 'spring';
            ELSIF month_number BETWEEN 6 AND 8 THEN
                season = 'summer';
            ELSIF month_number BETWEEN 9 AND 11 THEN
                season = 'autumn';
            ELSE
                season = 'winter';
            END IF;
            RETURN season;
        END;
    $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_season_caller(month_number INT)
    RETURNS TEXT AS $$
        DECLARE
            err_ctx TEXT;
            err_msg TEXT;
            err_details TEXT;
            err_code TEXT;
        BEGIN
           RETURN get_season(month_number);
        EXCEPTION WHEN SQLSTATE '12882' THEN
            GET STACKED DIAGNOSTICS
                err_ctx = PG_EXCEPTION_CONTEXT,
                err_msg = MESSAGE_TEXT,
                err_details = PG_EXCEPTION_DETAIL,
                err_code = RETURNED_SQLSTATE ;
            RAISE INFO 'My custom handler:' ;
            RAISE INFO 'Error msg:%', err_msg;
            RAISE INFO 'Error details:%', err_details;
            RAISE INFO 'Error code:%', err_code;
            RAISE INFO 'Error context:%', err_ctx;
            RETURN NULL;
        END;
    $$ LANGUAGE plpgsql;

SELECT get_season_caller2(15);

CREATE OR REPLACE FUNCTION get_season_caller2(month_number INT)
    RETURNS TEXT AS $$
        BEGIN
            RETURN get_season(month_number);
        EXCEPTION WHEN SQLSTATE '12882' THEN
            RAISE INFO 'My custom handler:' ;
            RAISE INFO 'Error Name:%', SQLERRM;
            RAISE INFO 'Error details:%', SQLSTATE;
            RETURN NULL;
        END;
    $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_season_caller2(month_number INT)
    RETURNS TEXT AS $$
        BEGIN
            RETURN get_season(month_number);
            EXCEPTION
                WHEN SQLSTATE '12885' THEN
                    RAISE INFO 'My custom handler:' ;
                    RAISE INFO 'Error Name:%', SQLERRM;
                    RAISE INFO 'Error details:%', SQLSTATE;
                    RETURN NULL;
                WHEN OTHERS THEN
                    RAISE INFO 'My custom handler:' ;
                    RAISE INFO 'Error Name:%', SQLERRM;
                    RAISE INFO 'Error details:%', SQLSTATE;
                    RETURN NULL;
        END;
    $$ LANGUAGE plpgsql;



