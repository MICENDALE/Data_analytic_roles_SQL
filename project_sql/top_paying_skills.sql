-- Data analyst top paying skills
SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 25; 
-- Data scientist top paying skills
SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' AND 
    salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
TOP PAYING SKILLS DATA ANALYST REMOTE
[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619"
  }
]
*/
/*
TOP PAYING SKILLS DATA SCIENTIST REMOTE
[
  {
    "skills": "gdpr",
    "average_salary": "217738"
  },
  {
    "skills": "golang",
    "average_salary": "208750"
  },
  {
    "skills": "atlassian",
    "average_salary": "189700"
  },
  {
    "skills": "selenium",
    "average_salary": "180000"
  },
  {
    "skills": "opencv",
    "average_salary": "172500"
  },
  {
    "skills": "neo4j",
    "average_salary": "171655"
  },
  {
    "skills": "microstrategy",
    "average_salary": "171147"
  },
  {
    "skills": "dynamodb",
    "average_salary": "169670"
  },
  {
    "skills": "php",
    "average_salary": "168125"
  },
  {
    "skills": "tidyverse",
    "average_salary": "165513"
  },
  {
    "skills": "solidity",
    "average_salary": "165000"
  },
  {
    "skills": "c",
    "average_salary": "164865"
  },
  {
    "skills": "go",
    "average_salary": "164691"
  },
  {
    "skills": "datarobot",
    "average_salary": "164500"
  },
  {
    "skills": "qlik",
    "average_salary": "164485"
  },
  {
    "skills": "redis",
    "average_salary": "162500"
  },
  {
    "skills": "watson",
    "average_salary": "161710"
  },
  {
    "skills": "rust",
    "average_salary": "161250"
  },
  {
    "skills": "elixir",
    "average_salary": "161250"
  },
  {
    "skills": "cassandra",
    "average_salary": "160850"
  },
  {
    "skills": "looker",
    "average_salary": "158715"
  },
  {
    "skills": "slack",
    "average_salary": "158333"
  },
  {
    "skills": "terminal",
    "average_salary": "157500"
  },
  {
    "skills": "airflow",
    "average_salary": "157414"
  },
  {
    "skills": "julia",
    "average_salary": "157244"
  }
]
*/