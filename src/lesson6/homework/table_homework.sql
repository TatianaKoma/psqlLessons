-- 1. Создать таблицу teacher с полями teacher_id serial,
-- first_name varchar, last_name varchar, birthday date,
-- phone varchar, title varchar
CREATE TABLE teacher
(
    id BIGSERIAL,
    first_name VARCHAR,
    last_name VARCHAR,
    birthday DATE,
    phone VARCHAR,
    title VARCHAR
);

-- 2. Добавить в таблицу после создания колонку middle_name varchar
ALTER TABLE teacher
ADD COLUMN middle_name VARCHAR;

-- 3. Удалить колонку middle_name
ALTER TABLE teacher
DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE teacher
RENAME birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE teacher
ALTER COLUMN phone SET DATA TYPE VARCHAR(32);

-- 6. Создать таблицу exam с полями exam_id serial,
-- exam_name varchar(256), exam_date date
CREATE TABLE exam
(
    id BIGSERIAL,
    exam_name VARCHAR(256),
    exam_date DATE
);

-- 7. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO exam( exam_name, exam_date)
VALUES
( 'History', '1998-02-12'),
( 'Math', '1998-02-16'),
( 'Literature', '1998-02-21');

-- 8. Посредством полной выборки убедиться,
-- что данные были вставлены нормально и идентификаторы были сгенерированы с инкрементом
SELECT *
FROM exam;
-- 9. Удалить все данные из таблицы со сбросом идентификатор в исходное
-- состояние
TRUNCATE TABLE exam RESTART IDENTITY ;