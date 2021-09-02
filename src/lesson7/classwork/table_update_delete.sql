SELECT * FROM author;

UPDATE author
SET full_name = 'Elias', rating = 5
WHERE id = 1;

INSERT INTO book (title, isbn, id)
VALUES ('title', 'isbn', 3)
RETURNING *;

INSERT INTO author
VALUES (1, 'full_name', 4);

UPDATE author
SET full_name = 'Walter', rating = 5
WHERE id = 1
RETURNING id;

DELETE FROM author
WHERE rating = 5
RETURNING *;