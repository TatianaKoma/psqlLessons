CREATE TABLE publisher
(
    id INT PRIMARY KEY,
    org_name VARCHAR(128) NOT NULL ,
    address TEXT NOT NULL
);

CREATE TABLE book
(
    id INT PRIMARY KEY,
    title TEXT NOT NULL,
    isbn VARCHAR(32) NOT NULL
);