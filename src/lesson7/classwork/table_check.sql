DROP TABLE IF EXISTS book;

CREATE TABLE book
(
   id BIGSERIAL,
   title TEXT NOT NULL,
   isbn VARCHAR(32) NOT NULL,
   publisher_id INT,

   CONSTRAINT PK_book_id PRIMARY KEY(id)
);

ALTER TABLE book
ADD COLUMN price DECIMAL CONSTRAINT CHK_book_price CHECK ( price >= 0 );

INSERT INTO book
VALUES
(1, 'title', 'isbn', 1, 1.5);

SELECT *
FROM book;