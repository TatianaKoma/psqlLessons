EXPLAIN
SELECT *
FROM perf_test
WHERE annotation LIKE 'AB%';

CREATE INDEX ind_perf_test_annotation ON perf_test(annotation);

EXPLAIN
SELECT *
FROM perf_test
WHERE LOWER(annotation) LIKE('ab%');

CREATE INDEX idx_perf_test_annotation_lower ON perf_test(LOWER(annotation));