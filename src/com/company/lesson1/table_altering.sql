ALTER TABLE book
ADD COLUMN fk_publisher_id INT;

ALTER TABLE book
ADD CONSTRAINT fk_book_publisher
FOREIGN KEY(fk_publisher_id) REFERENCES publisher(publisher_id);

DROP TABLE book;
CREATE TABLE book
(
    id BIGSERIAL PRIMARY KEY ,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    fk_publisher_id integer REFERENCES publisher(publisher_id) NOT NULL
);

INSERT INTO book
VALUES
(1, 'The Diary of a Young Girl','0199535566',1),
(2,'Pride and Prejudice', '9780307594006',1),
(3,'To Kill a Mockingbird','0446310786',2),
(4,'The Book of Gutsy Women: Favorite Stories of Courage and Resilience','1501178415',2),
(5,'War and Peace','1788886526',2);