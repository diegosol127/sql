-- Run from CLI in parent directory
-- sqlite3 -header -box -nullvalue NULL jobs_2023.sqlite < Scripts/basics/null.sql > Outputs/basics/null_output.txt

SELECT
  job_title_short,
  job_location,
  job_via,
  salary_year_avg
FROM
  job_postings_fact
WHERE
  salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg
LIMIT
  30;
