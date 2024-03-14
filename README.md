# Introduction

This project is part of my capstone task for the YouTube course delivered by [Luke Barousse](/https://youtu.be/7mz73uXD9DA?si=M8bUhMUUg1qXRi7n)

The dataset used for this analysis can be found [here](/https://www.lukebarousse.com/sql)

# Background

The SQL queries and analysis for this project will answer the following four question focusing on remote roles that can be done from anywhere. 

1. What are the high paying roles for data analysts and data scientists?

2. What are the highly demanded skills from data analysts and data scientists?

3. What are the high paying skills for data analysts and data scientists?

4. What is the optimal skill to learn based on demand and average salary?

You can find my complete SQL queries here: [project_sql folder](/project_sql/)

# Tools
**SQL**

**PostgreSQL**

**Visual Studio Code**

**Git**

**Github**

# Analysis
As mentioned in the background, we will be answering each question and discussing our findings as we go along. 

*Keep in mind the analysis only focuses on remote jobs (findings might be different for on-site roles)*

## 1 High paying roles for data analysts and data scientists

### 1.1 Data analyst roles

``` sql
SELECT 
    job_id, 
    job_title, 
    job_location, 
    job_schedule_type, 
    salary_year_avg, 
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'  AND 
    job_location= 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
Based on the results from the above query here are some key findings:

The highest paying role for a Data Analyst is "Data Analyst" at Mantys with an average yearly salary of $650,000.00.

Following that, the second highest paying role is "Director of Analytics" at Meta with an average yearly salary of $336,500.00.

The third highest paying role is "Associate Director- Data Insights" at AT&T with an average yearly salary of $255,829.50.

Other notable high paying roles include "Data Analyst, Marketing" at Pinterest Job Advertisements with an average yearly salary of $232,423.00 and "Data Analyst (Hybrid/Remote)" at Uclahealthcareers with an average yearly salary of $217,000.00.

Roles like "Principal Data Analyst (Remote)" at SmartAsset and "Director, Data Analyst - HYBRID" at Inclusively also offer competitive salaries, with average yearly salaries of $205,000.00 and $189,309.00 respectively.

The lowest among the listed high paying roles is "ERM Data Analyst" at Get It Recruit - Information Technology with an average yearly salary of $184,000.00.

These findings provide insights into the range of salaries offered for data analyst roles, with some roles significantly outpaying others.

### 1.2 Data Scientist Roles


```sql
SELECT 
    job_id, 
    job_title, 
    job_location, 
    job_schedule_type, 
    salary_year_avg, 
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist'  AND 
    job_location= 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
This result contains data on various high-level data science positions. Here are the key points:

The highest paying role is "Staff Data Scientist/Quant Researcher" at Selby Jennings with an average yearly salary of $550,000.00.

Other high-paying roles include "Staff Data Scientist - Business Analytics" at Selby Jennings with an average yearly salary of $525,000.00 and "Data Scientist" at Algo Capital Group with an average yearly salary of $375,000.00.

"Head of Data Science" positions at Demandbase offer competitive salaries, ranging from $351,500.00 to $324,000.00.

Roles such as "Director Level - Product Management - Data Science" at Teramind and "Director of Data Science & Analytics" at Reddit offer average yearly salaries of $320,000.00 and $313,000.00 respectively.

"Director of Data Science" positions at Storm4 and "Head of Battery Data Science" at Lawrence Harvey both offer an average yearly salary of $300,000.00.

"Principal Data Scientist" roles at Storm5 also offer an average yearly salary of $300,000.00.

Overall, the result showcases high-paying data science positions across various companies, with salaries ranging from $300,000.00 to $550,000.00.

**The top skills among these high paying roles were SQL, Python, Tableau, R and Excel respectively**

## 2 Highly demanded skills from data analysts and data scientists

### 2.1 Demanded skills from data analysts

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 10
```

| Skills     | Demand Count |
|------------|--------------|
| sql        | 7291         |
| excel      | 4611         |
| python     | 4330         |
| tableau    | 3745         |
| power bi   | 2609         |
| r          | 2142         |
| sas        | 1866         |
| looker     | 868          |
| azure      | 821          |
| powerpoint | 819          |

### 2.2 Demanded skills from data scientists

| Skills      | Demand Count |
|-------------|--------------|
| python      | 10390        |
| sql         | 7488         |
| r           | 4674         |
| aws         | 2593         |
| tableau     | 2458         |
| sas         | 2214         |
| spark       | 2008         |
| azure       | 1919         |
| pandas      | 1836         |
| tensorflow  | 1836         |

## 3. High paying skills for data analysts and data scientists

### 3.1 Payment for skill - Data analysts 

```sql
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
```

| Skills         | Average Salary |
|----------------|----------------|
| pyspark        | 208,172        |
| bitbucket      | 189,155        |
| couchbase      | 160,515        |
| watson         | 160,515        |
| datarobot      | 155,486        |
| gitlab         | 154,500        |
| swift          | 153,750        |
| jupyter        | 152,777        |
| pandas         | 151,821        |
| elasticsearch | 145,000        |
| golang         | 145,000        |
| numpy          | 143,513        |
| databricks     | 141,907        |
| linux          | 136,508        |
| kubernetes     | 132,500        |
| atlassian      | 131,162        |
| twilio         | 127,000        |
| airflow        | 126,103        |
| scikit-learn   | 125,781        |
| jenkins        | 125,436        |
| notion         | 125,000        |
| scala          | 124,903        |
| postgresql     | 123,879        |
| gcp            | 122,500        |
| microstrategy  | 121,619        |

### 3.2 Payment for skill - Data scientists 

| Skills       | Average Salary |
|--------------|----------------|
| gdpr         | 217,738        |
| golang       | 208,750        |
| atlassian    | 189,700        |
| selenium     | 180,000        |
| opencv       | 172,500        |
| neo4j        | 171,655        |
| microstrategy| 171,147        |
| dynamodb     | 169,670        |
| php          | 168,125        |
| tidyverse    | 165,513        |
| solidity     | 165,000        |
| c            | 164,865        |
| go           | 164,691        |
| datarobot    | 164,500        |
| qlik         | 164,485        |
| redis        | 162,500        |
| watson       | 161,710        |
| rust         | 161,250        |
| elixir       | 161,250        |
| cassandra    | 160,850        |
| looker       | 158,715        |
| slack        | 158,333        |
| terminal     | 157,500        |
| airflow      | 157,414        |
| julia        | 157,244        |

## 4. Optimal skill to learn based on demand and salary 

### 4.1 Optimal skills to learn for data analysts 

```sql
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
```
| Skill       | Demand Count | Average Salary |
|-------------|--------------|----------------|
| SQL         | 398          | 97,237         |
| Excel       | 256          | 87,288         |
| Python      | 236          | 101,397        |
| Tableau     | 230          | 99,288         |
| R           | 148          | 100,499        |
| Power BI    | 110          | 97,431         |
| SAS         | 63           | 98,902         |
| PowerPoint  | 58           | 88,701         |
| Looker      | 49           | 103,795        |
| Word        | 48           | 82,576         |
| Snowflake   | 37           | 112,948        |
| Oracle      | 37           | 104,534        |
| SQL Server  | 35           | 97,786         |
| Azure       | 34           | 111,225        |
| Sheets      | 32           | 86,088         |
| AWS         | 32           | 108,317        |
| Flow        | 28           | 97,200         |
| Go          | 27           | 115,320        |
| SPSS        | 24           | 92,170         |
| VBA         | 24           | 88,783         |
| Hadoop      | 22           | 113,193        |
| Jira        | 20           | 104,918        |
| JavaScript  | 20           | 97,587         |
| SharePoint  | 18           | 81,634         |

### 4.2 Optimal skills to learn for data scientists

| Skill         | Demand Count | Average Salary |
|---------------|--------------|----------------|
| Python        | 763          | 143,828        |
| SQL           | 591          | 142,833        |
| R             | 394          | 137,885        |
| Tableau       | 219          | 146,970        |
| AWS           | 217          | 149,630        |
| Spark         | 149          | 150,188        |
| TensorFlow    | 126          | 151,536        |
| Azure         | 122          | 142,306        |
| PyTorch       | 115          | 152,603        |
| Pandas        | 113          | 144,816        |
| SAS           | 110          | 129,920        |
| Hadoop        | 82           | 143,322        |
| Scikit-Learn  | 81           | 148,964        |
| Excel         | 77           | 129,224        |
| NumPy         | 73           | 149,089        |
| Power BI      | 72           | 131,390        |
| Snowflake     | 72           | 152,687        |
| Java          | 64           | 145,706        |
| Databricks    | 63           | 139,631        |
| GCP           | 59           | 155,811        |
| Git           | 58           | 132,599        |
| Looker        | 57           | 158,715        |
| Go            | 57           | 164,691        |
| Scala         | 56           | 156,702        |

# Lessons learnt

Python, SQL, and R are consistently in demand across different datasets, reflecting their importance in the data science and analytics field.

Cloud computing skills such as AWS, Azure, and GCP are highly sought after, indicating the increasing reliance on cloud technology in various industries.

Data visualization tools like Tableau and Power BI are popular, highlighting the importance of data presentation and analysis.

Programming languages like Java, Go, and Scala also hold significance, showcasing the diverse skill set required in the tech industry.

Specialized skills such as PyTorch, TensorFlow, and Databricks command higher average salaries, reflecting their niche expertise and demand.


# Conclusion

Based on the results, it can be concluded that there is a strong demand for a wide range of technical skills in the job market, particularly in fields related to data science, analytics, cloud computing, and programming. Overall, staying updated with emerging technologies and acquiring in-demand skills can enhance career prospects in the tech industry.

Shout out [Luke Barousse](/https://www.lukebarousse.com/) and [Kelly Adams](/https://www.kellyjadams.com/) for preparing a great course material. 