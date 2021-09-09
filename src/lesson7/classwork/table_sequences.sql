CREATE SEQUENCE seq1;

SELECT nextval('seq1');
SELECT currval('seq1');
SELECT lastval();

SELECT setval('seq1', 16);
SELECT currval('seq1');
SELECT nextval('seq1');

SELECT setval('seq1', 16, false);
SELECT currval('seq1');
SELECT nextval('seq1');

CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');

CREATE SEQUENCE IF NOT EXISTS seq3
INCREMENT 16
MINVALUE 0
MAXVALUE 128
START WITH 0;

SELECT nextval('seq3');

ALTER SEQUENCE seq3 RENAME TO seq4;

ALTER SEQUENCE seq4 RESTART WITH 16;

SELECT nextval('seq4');

DROP SEQUENCE seq4;

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
    id BIGSERIAL,
    title TEXT NOT NULL,
    isbn VARCHAR(32) NOT NULL,
    publisher_id INT NOT NULL,

    CONSTRAINT PK_book_id PRIMARY KEY(id)
);

SELECT *
FROM book;

CREATE SEQUENCE IF NOT EXISTS book_id_seq
START WITH 1 OWNED BY book.id;

INSERT INTO book(title, isbn, publisher_id)
VALUES
('title', 'isbn', 1);

ALTER TABLE book
ALTER COLUMN id SET DEFAULT nextval('book_id_seq');

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
    id BIGSERIAL,
    title TEXT NOT NULL,
    isbn VARCHAR(32) NOT NULL,
    publisher_id INT NOT NULL,

    CONSTRAINT PK_book_id PRIMARY KEY(id)
);

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    title TEXT NOT NULL,
    isbn VARCHAR(32) NOT NULL,
    publisher_id INT NOT NULL,

    CONSTRAINT PK_book_id PRIMARY KEY(id)
);

INSERT INTO book
OVERRIDING SYSTEM VALUE
VALUES
(3, 'title', 'isbn', 1);
