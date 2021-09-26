CREATE TABLE perf_test(
    id INT,
    reason TEXT COLLATE "C",
    annotation TEXT COLLATE "C"
);

INSERT INTO perf_test(id, reason, annotation)
SELECT s.id, md5(random()::TEXT), NULL
FROM generate_series(1, 10000000) AS s(id)
ORDER BY random();

UPDATE perf_test
SET annotation = UPPER(md5(random()::TEXT));

EXPLAIN
SELECT *
FROM perf_test
WHERE id = 3700000;

CREATE INDEX idx_perf_test_id ON perf_test(id);

EXPLAIN ANALYSE
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%' AND annotation LIKE 'AB%';

CREATE INDEX idx_perf_test_reason_annotation ON perf_test(reason, annotation);

EXPLAIN
SELECT *
FROM perf_test
WHERE reason LIKE 'bc%' AND annotation LIKE 'AB%';

SELECT *
FROM perf_test
WHERE reason LIKE 'bc%';

SELECT *
FROM perf_test
WHERE annotation LIKE 'AB%';