-- 1. Создать таблицу exam с полями:
-- - идентификатора экзамена - автоинкрементируемый, уникальный,
-- запрещает NULL;
-- - наименования экзамена
-- - даты экзамена
CREATE TABLE exam
(
    id BIGSERIAL UNIQUE NOT NULL,
    exam_name VARCHAR,
    exam_date DATE
);

-- 2. Удалить ограничение уникальности с поля идентификатора
ALTER TABLE exam
DROP CONSTRAINT exam_id_key;

-- 3. Добавить ограничение первичного ключа на поле идентификатора
ALTER TABLE exam
ADD PRIMARY KEY(id);

-- 4. Создать таблицу person с полями
-- - идентификатора личности (простой int, первичный ключ)
-- - имя
-- - фамилия
CREATE TABLE person
(
    id INT NOT NULL ,
    fist_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,

    CONSTRAINT PK_person_id PRIMARY KEY (id)
);

-- 5. Создать таблицу паспорта с полями:
-- - идентификатора паспорта (простой int, первичный ключ)
-- - серийный номер (простой int, запрещает NULL)
-- - регистрация
-- - ссылка на идентификатор личности (внешний ключ)
CREATE TABLE passport
(
    id INT,
    serial_number INT NOT NULL,
    registration TEXT NOT NULL,
    person_id INT NOT NULL,

    CONSTRAINT PK_passport_id PRIMARY KEY(id),
    CONSTRAINT FK_passport_person FOREIGN KEY(person_id) REFERENCES person(id)
);

-- 6. Добавить колонку веса в таблицу book (создавали ранее) с ограничением,
-- проверяющим вес (больше 0 но меньше 100)
ALTER TABLE book
ADD COLUMN weight DECIMAL CONSTRAINT CHK_book_weight CHECK (weight > 0 AND weight < 100);

-- 7. Убедиться в том, что ограничение на вес работает
-- (попробуйте вставить невалидное значение)
INSERT INTO book
VALUES(128,'Wind of the Gone', '1257910369', 100.5);

-- 8. Создать таблицу student с полями:
-- - идентификатора (автоинкремент)
-- - полное имя
-- - курс (по умолчанию 1)
DROP TABLE student;
CREATE TABLE student
(
    id BIGSERIAL PRIMARY KEY ,
    full_name VARCHAR,
    level INT DEFAULT '1',

    CONSTRAINT CHK_student_level CHECK ( level = '1' OR level = '2' OR level = '3')
);

-- 9. Вставить запись в таблицу студентов и убедиться,
-- что ограничение на вставку значения по умолчанию работает
INSERT INTO student (full_name)
VALUES
('Ivanov Ivan');

SELECT *
FROM student;

-- 10. Удалить ограничение "по умолчанию" из таблицы студентов
ALTER TABLE student
ALTER COLUMN level DROP DEFAULT;

-- 11. Подключиться к БД northwind и добавить ограничение на
-- поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products
ADD CONSTRAINT CHK_products_unit_price CHECK(unit_price > 0);

-- 12. "Навесить" автоинкрементируемый счётчик на поле product_id
-- таблицы products (БД northwind). Счётчик должен начинаться с числа
-- следующего за максимальным значением по этому столбцу.

-- 13. Произвести вставку в products (не вставляя идентификатор явно)
-- и убедиться, что автоинкремент работает.
-- Вставку сделать так, чтобы в результате команды вернулось значение,
-- сгенерированное в качестве идентификатора.