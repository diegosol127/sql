-- job title
UPDATE
  job_postings_fact
SET
  job_title_short = trim(job_title_short);

SELECT DISTINCT
  job_title_short
FROM
  job_postings_fact;

-- average salary
UPDATE
  job_postings_fact
SET
  salary_year_avg = trim(salary_year_avg);

SELECT DISTINCT
  salary_year_avg
FROM
  job_postings_fact
LIMIT 20;
