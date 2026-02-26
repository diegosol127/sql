-- Run from CLI in parent directory
-- sqlite3 -header -box jobs_2023.sqlite < Scripts/practice/prac1.sql > Outputs/practice/prac1.txt

/*
- Get the job details for BOTH 'Data Analyst' or 'Business Analyst' positions
  - For 'Data Analyst', only find jobs > $100k
  - For 'Business Analyst', only find jobs > $70k
- Only include jobs located in EITHER:
  - 'Boston, MA'
  - 'Anywhere' (i.e. remote jobs)
*/

--Trim L/R spaces
UPDATE job_postings_fact SET job_title_short = trim(job_title_short);
UPDATE job_postings_fact SET job_location = trim(job_location);
UPDATE job_postings_fact SET salary_year_avg = trim(salary_year_avg);
UPDATE job_postings_fact SET job_via = trim(job_via);

-- Solution
SELECT
  job_title_short,
  job_location,
  job_via,
  salary_year_avg
FROM
  job_postings_fact
WHERE
  job_location IN ('Boston, MA', 'Anywhere') AND
  (
    (job_title_short = 'Data Analyst' AND salary_year_avg >= 100000) OR
    (job_title_short = 'Business Analyst' AND salary_year_avg >= 70000)
  )
ORDER BY
  salary_year_avg DESC
LIMIT 50;
