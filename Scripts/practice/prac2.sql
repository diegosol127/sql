-- Run from CLI in parent directory
-- sqlite3 -header -box jobs_2023.sqlite < Scripts/practice/prac2.sql > Outputs/practice/prac2.txt

/*
- Look for non-senior data analyst or business analyst roles
- Get the job title, location, and average yearly salary
*/

--Trim L/R spaces
UPDATE job_postings_fact SET job_title = trim(job_title);
UPDATE job_postings_fact SET job_location = trim(job_location);
UPDATE job_postings_fact SET salary_year_avg = trim(salary_year_avg);

-- Solution
SELECT
  job_title AS title,
  job_location AS location,
  salary_year_avg AS salary
FROM
  job_postings_fact
WHERE
  (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
  job_title LIKE '%Analyst%' AND
  job_title NOT LIKE '%Senior%' AND
  job_title NOT LIKE '%Sr%'
ORDER BY
  salary_year_avg DESC
LIMIT 50;
