/*
Question:
    What are the top 10 most demanded skills for data analyst?
    -join job postings to inner join table similar to q2
    -identify the top 5 in demand skills for a data analyst.
    -focus on all job postings.
    -why? retrieves the top 5 skills with the highest demand in the job market providing in sights unto the most valuable skills for job seekers.
*/
SELECT
    Skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND job_work_from_home = True
GROUP BY Skills
ORDER BY demand_count DESC
Limit 5

/*
Insights
1. SQL is by far the most in-demand skill, appearing in over 7,000 job listings—highlighting its critical role in data querying and analysis.

2.Excel remains a strong foundational tool in business analytics and reporting.

3.Python is a must-have for automation, advanced analytics, and machine learning.

4. Tableau and Power BI show the growing need for data visualization expertise in making data-driven decision

These skills are highly valuable for job seekers aiming for roles in data analysis, business intelligence, or even broader tech careers.

    [
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/