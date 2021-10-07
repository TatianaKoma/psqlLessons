CREATE TABLE chess_title(
    id BIGSERIAL PRIMARY KEY,
    title TEXT
);

CREATE TABLE chess_player(
    id BIGSERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    title_id INT REFERENCES chess_title(id)
);

INSERT INTO chess_title(title)
VALUES ('Candidat Master'),
       ('FIDE Master'),
       ('International Master'),
       ('Grand Master');

SELECT *
FROM chess_title;

INSERT INTO chess_player(first_name, last_name, title_id)
VALUES ('Wesley', 'So', 4),
       ('Vlad', 'Kramnik', 4),
       ('Vasily', 'Pupkin', 1);

SELECT *
FROM chess_player
JOIN chess_title USING (id);

DROP TABLE chess_title CASCADE ;
DROP TABLE chess_player;

CREATE TYPE chess_title AS ENUM
    ('Candidat Master', 'FIDE Master', 'International Master');

SELECT enum_range(null::chess_title);

ALTER TYPE chess_title
ADD VALUE 'Grand Master' AFTER 'International Master';

CREATE TABLE chess_player(
     id BIGSERIAL PRIMARY KEY,
     first_name TEXT,
     last_name TEXT,
     title chess_title
);

INSERT INTO chess_player(first_name, last_name, title)
VALUES ('Magnus', 'Carlsen', 'Grand Master');

SELECT *
FROM chess_player;