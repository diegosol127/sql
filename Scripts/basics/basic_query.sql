UPDATE
  job_postings_fact
SET
  job_location = trim(job_location);
SELECT
  job_title_short,
  job_location
FROM
  job_postings_fact
LIMIT 5
