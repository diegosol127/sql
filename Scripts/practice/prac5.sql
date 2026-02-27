-- Run from CLI in parent directory
-- sqlite3 -header -box -nullvalue NULL jobs_2023.sqlite < Scripts/practice/prac5.sql > Outputs/practice/prac5_output.txt

/*
- Find the average salary and number of job postings for each skill
Hint: Use LEFT JOIN to combine skills_dim, skills_job_dim, and job_postings_fact tables
Goal: Understand the demand and pay for skills
*/

SELECT
  skills.skills AS skill_name,
  COUNT(skills_to_job.job_id) AS number_of_job_postings,
  ROUND(AVG(job_postings.salary_year_avg), 2) AS salary_avg
FROM
  skills_dim AS skills
LEFT JOIN skills_job_dim AS skills_to_job ON skills.skill_id = skills_to_job.skill_id
LEFT JOIN job_postings_fact AS job_postings ON skills_to_job.job_id = job_postings.job_id
GROUP BY
  skill_name
HAVING
  number_of_job_postings > 20
ORDER BY
  salary_avg DESC
LIMIT 30;
