EXPLAIN
SELECT *
FROM perf_test
WHERE reason LIKE '%bc%';

CREATE EXTENSION pg_trgm;

CREATE INDEX trgm_inx_perf_test_reason ON perf_test USING gin(reason gin_trgm_ops);