INSERT INTO author
VALUES
(10,'John Silver', 4.5);

SELECT *
FROM author;

INSERT INTO author(id, full_name)
VALUES
(12, 'Bob Gray'),
(13, 'Tom Smit'),
(14, 'Rid Nadson');

SELECT *
INTO best_authors
FROM author
WHERE rating >= 4.5;

SELECT *
FROM best_authors;

INSERT INTO best_authors
SELECT *
FROM author
WHERE rating < 4.5;

