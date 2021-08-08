ALTER TABLE passport
ADD COLUMN registration TEXT NOT NULL;

CREATE TABLE person
(
    person_id INT PRIMARY KEY ,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL
);

ALTER TABLE person
RENAME person_id TO id;

CREATE TABLE passport
(
    id INT PRIMARY KEY,
    serial_number INT NOT NULL,
    fk_passport_person INT REFERENCES person(id)
);

INSERT INTO person VALUES (1,'John','Snow');
INSERT INTO person VALUES (2,'Ned','Stark');
INSERT INTO person VALUES (3,'Rob','Baratheon');

INSERT INTO passport VALUES (1, 134566, 1,'Winterfell');
INSERT INTO passport VALUES (2, 789012, 2,'Winterfell');
INSERT INTO passport VALUES (3, 345678, 3,'King''s Landing');