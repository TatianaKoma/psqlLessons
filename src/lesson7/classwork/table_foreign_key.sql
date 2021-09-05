DROP TABLE publisher;
DROP TABLE book;
DROP TABLE book_author;

CREATE TABLE publisher
(
   id BIGSERIAL,
   publisher_name VARCHAR(128) NOT NULL,
   address TEXT,
   CONSTRAINT PK_id PRIMARY KEY(id)
);

CREATE TABLE book
(
    id BIGSERIAL,
    title TEXT NOT NULL,
    isbn VARCHAR(32) NOT NULL,
    publisher_id INT,
    CONSTRAINT PK_book_id PRIMARY KEY(id),
    CONSTRAINT FK_book_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(id)
);

ALTER TABLE book
DROP CONSTRAINT FK_book_publisher;

INSERT INTO publisher
VALUES
(1,'Everyman''s Library', 'NY'),
(2,'Oxford University Press', 'NY'),
(3,'Grand Central Publishing', 'Washington'),
(4,'Simon & Schuster', 'Chicago');

INSERT INTO book
VALUES
(1, 'The Diary of a Young Girl', '0199535566', 10);

SELECT *
FROM book;

TRUNCATE TABLE book;

ALTER TABLE book
ADD CONSTRAINT FK_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(id);

DROP TABLE book;