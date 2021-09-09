CREATE TABLE customer
(
    id BIGSERIAL,
    full_name TEXT,
    status CHAR DEFAULT 'r',

    CONSTRAINT PK_customer_id PRIMARY KEY(id),
    CONSTRAINT CHK_customer_status CHECK(status = 'r' OR status = 'p')
);

INSERT INTO customer(full_name)
VALUES
('name');

SELECT *
FROM customer;

ALTER TABLE customer
ALTER COLUMN status DROP DEFAULT;

ALTER TABLE customer
ALTER COLUMN status SET DEFAULT 'r';