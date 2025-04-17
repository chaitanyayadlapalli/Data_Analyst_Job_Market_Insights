/*
Question: What are the top_paying data analyst jobs?
- Identify  the top 10 highest paying data analyst roles  that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- why? Highlight the top-paying opportunities for data Analysts, offering insights into emp
*/


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS companyName
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Data Analyst%'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
order by
    salary_year_avg DESC
LIMIT 10;