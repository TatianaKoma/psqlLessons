DROP TABLE chair;

CREATE TABLE chair
(
    id BIGSERIAL PRIMARY KEY,
    chair_name VARCHAR,
    dean VARCHAR
);

 INSERT INTO chair
 VALUES
(1,'Tom', 'dean');

SELECT *
FROM chair;

INSERT INTO chair
VALUES
(2, 'Mary', 'not dean');

DROP TABLE chair;

CREATE TABLE chair
(
    id BIGSERIAL UNIQUE NOT NULL ,
    chair_name VARCHAR,
    dean VARCHAR
);

SELECT constraint_name
FROM information_schema.key_column_usage
WHERE table_name = 'chair'
      AND table_schema = 'public'
      AND column_name = 'id';

ALTER TABLE chair
DROP CONSTRAINT chair_id_key;

ALTER TABLE chair
    ADD PRIMARY KEY(id);