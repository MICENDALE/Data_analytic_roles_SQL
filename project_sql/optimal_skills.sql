-- Data analyst optimal skills
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
         salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id
) , average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND (AVG(salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    demand_count DESC,
    average_salary DESC
LIMIT 25; 
-- Data Scientist optimal skills
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist' AND
         salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id
) , average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND (AVG(salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist' AND 
        salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    demand_count DESC,
    average_salary DESC
LIMIT 25;

/*
DATA ANALYST OPTIMAL SKILL JSON RESULT
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "97237"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "256",
    "avg_salary": "87288"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "110",
    "avg_salary": "97431"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "58",
    "avg_salary": "88701"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "48",
    "avg_salary": "82576"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "32",
    "avg_salary": "86088"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "28",
    "avg_salary": "97200"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "24",
    "avg_salary": "92170"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avg_salary": "88783"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": "18",
    "avg_salary": "81634"
  }
]
*/

/*
DATA SCIENTIST OPTIMAL SKILL JSON RESULT
[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143828"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "591",
    "avg_salary": "142833"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "394",
    "avg_salary": "137885"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149630"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "122",
    "avg_salary": "142306"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144816"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129920"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129920"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "82",
    "avg_salary": "143322"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148964"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "77",
    "avg_salary": "129224"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "72",
    "avg_salary": "131390"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152687"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "63",
    "avg_salary": "139631"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "59",
    "avg_salary": "155811"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "58",
    "avg_salary": "132599"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "57",
    "avg_salary": "158715"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "57",
    "avg_salary": "164691"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "56",
    "avg_salary": "156702"
  }
]
*/