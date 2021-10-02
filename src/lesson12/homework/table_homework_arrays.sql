-- Создать функцию, которая вычисляет средний фрахт по заданным странам (функция принимает список стран).

CREATE OR REPLACE FUNCTION get_avg_freight_by_countries(VARIADIC countries TEXT[])
    RETURNS FLOAT8 AS $$
        SELECT AVG(freight)
        FROM orders
        WHERE ship_country = ANY(countries);
    $$ LANGUAGE SQL;

SELECT *
FROM get_avg_freight_by_countries('USA', 'France');

SELECT *
FROM get_avg_freight_by_countries(VARIADIC ARRAY ['USA', 'UK']);