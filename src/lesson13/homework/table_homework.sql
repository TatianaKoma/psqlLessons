-- 1. Переписать функцию, которую мы разработали ранее в одном из ДЗ таким образом,
-- чтобы функция возвращала экземпляр композитного типа. Вот та самая функция:
-- create or replace function get_salary_boundaries_by_city(
-- 	emp_city varchar, out min_salary numeric, out max_salary numeric)
-- AS
-- $$
-- 	SELECT MIN(salary) AS min_salary,
-- 	   	   MAX(salary) AS max_salary
--   	FROM employees
-- 	WHERE city = emp_city
-- $$ language sql;

CREATE OR REPLACE FUNCTION get_salary_boundaries_by_city(emp_city VARCHAR, OUT min_salary NUMERIC,
    OUT max_salary NUMERIC) AS $$
        SELECT MIN(salary) AS min_salary,
               MAX(salary) AS max_salary
        FROM employees
        WHERE city = emp_city
    $$ LANGUAGE SQL;

CREATE TYPE salary_boundaries AS(
    max_salary NUMERIC,
    min_salary NUMERIC
);

CREATE OR REPLACE FUNCTION get_salary_boundaries_by_city(emp_city VARCHAR)
    RETURNS SETOF salary_boundaries AS $$
        SELECT MAX(salary) AS max_salary,
               MIN(salary) AS min_salary
        FROM employees
        WHERE city = emp_city;
    $$ LANGUAGE SQL;

SELECT *
FROM get_salary_boundaries_by_city('London');

-- 2. Задание состоит из пунктов:
-- Создать перечисление армейских званий США,
-- включающее следующие значения: Private, Corporal, Sergeant
-- Вывести все значения из перечисления.
-- Добавить значение Major после Sergeant в перечисление
-- Создать таблицу личного состава с колонками:
-- person_id, first_name, last_name, person_rank (типа перечисления)
-- Добавить несколько записей, вывести все записи из таблицы

CREATE TYPE army_title AS ENUM
    ( 'Private', 'Corporal', 'Sergeant');

SELECT enum_range(null::army_title);

ALTER TYPE army_title
ADD VALUE 'Major' AFTER 'Sergeant';

CREATE TABLE personnel(
    id BIGSERIAL PRIMARY KEY ,
    first_name TEXT,
    last_name TEXT,
    title army_title
);

INSERT INTO personnel(first_name, last_name, title)
VALUES ('Vasia', 'Ivanov', 'Major'),
        ('Ira', 'Petrova', 'Sergeant');

SELECT *
FROM personnel;