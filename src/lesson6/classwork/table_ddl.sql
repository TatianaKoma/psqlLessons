CREATE TABLE student
(
    student_id BIGSERIAL,
    first_name VARCHAR,
    last_name VARCHAR,
    birthday DATA,
    phone VARCHAR
);

CREATE TABLE cathedra
(
    cathedra_id BIGSERIAL,
    cathedra_name VARCHAR,
    dean VARCHAR
);

ALTER TABLE student
ADD COLUMN middle_name VARCHAR;

ALTER TABLE student
ADD COLUMN rating FLOAT;

ALTER TABLE student
ADD COLUMN enrolled DATA;

ALTER TABLE student
DROP COLUMN middle_name;

ALTER TABLE cathedra
RENAME TO chair;

ALTER TABLE chair
RENAME cathedra_id TO chair_id;

ALTER TABLE chair
RENAME cathedra_name TO chair_name;

ALTER TABLE student
ALTER COLUMN first_name SET DATA TYPE varchar(64);
ALTER TABLE student
ALTER COLUMN last_name SET DATA TYPE varchar(64);
ALTER TABLE student
ALTER COLUMN phone SET DATA TYPE varchar(30);

CREATE TABLE faculty
(
    faculty_id BIGSERIAL,
    faculty_name VARCHAR
);

INSERT INTO faculty (faculty_name)
VALUES ('faculty 1'),
       ('faculty 2'),
       ('faculty 3');
SELECT *
FROM faculty;

TRUNCATE TABLE faculty RESTART IDENTITY;

DROP TABLE faculty;
