-- Run the following line to execute the script via CLI
-- sqlite3 -header -box jobs_2023.sqlite < where_query.sql > outputs/where_query_output.txt

-- Trim L/R spaces
UPDATE job_postings_fact SET job_title_short = trim(job_title_short);
UPDATE job_postings_fact SET job_location = trim(job_location);
UPDATE job_postings_fact SET job_via = trim(job_via);
UPDATE job_postings_fact SET salary_year_avg = trim(salary_year_avg);

/*
In general, the order to write commands is as follows:
SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column1 [ASC|DESC]
LIMIT number;
*/

-- Query to see relevant data for Data Analysts
SELECT
  job_title_short,
  job_location,
  job_via,
  salary_year_avg
FROM
  job_postings_fact
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg > 150000
  AND job_via = 'via LinkedIn'
  AND job_location <> ''
ORDER BY
  salary_year_avg DESC
LIMIT 30;
