# SQL ETL Pipeline Simulation for E-Learning Platform

This project simulates a complete ETL (Extract, Transform, Load) pipeline using MySQL Workbench on an E-learning dataset. It demonstrates the application of SQL in data cleaning, transformation, audit tracking, and insight generation. Designed as part of a data analytics internship, this project showcases practical SQL engineering skills suitable for a production-level environment.


## Project Objectives
- Simulate real-world ETL process using SQL only.
- Import and clean unstructured data.
- Build normalized, production-grade tables.
- Implement trigger-based audit logging.
- Extract business insights using SQL analytical queries.
- Prepare data for portfolio demonstration and recruiter visibility.


## Dataset Overview
- Source: Synthetic yet realistic dataset (online_courses.csv) simulating popular e-learning platforms.
- Fields Include: Title, Category, Sub_Category, Skills, Instructor, Rating, PriceUSD, Duration, Enrollments, Platform, Certification, Level, ReleaseYear
- Total Records: 1000 rows
- Data Download Method: The cleaned data and logs were exported directly using MySQL Workbench's "Export Resultset to Csv File" option after running SELECT * FROM courses; and SELECT * FROM audit_log; respectively.


## ETL Process Breakdown

1. Extract
Imported online_courses.csv into staging_courses table using MySQL Import Wizard.

2. Transform
Cleaned and parsed values:
  - Extracted numeric values from Rating (e.g., "4.5 stars" -> 4.5).
  - Removed currency symbols from PriceUSD.
  - Parsed Duration from strings like "12 hours" to integers.
  - Converted Certification to boolean.
  - Trimmed text fields and removed duplicates based on Title + Instructor.

3. Load
Inserted cleaned records into courses table.
Applied constraints and timestamp fields for tracking.

4. Audit Logging
Created centralized audit_log table to track:
  - Every INSERT into courses
  - Every UPDATE to courses
Enabled using 'after_insert' and 'after_update' triggers.


## ETL Process Flow Diagram

--------------
online_courses   ____  Import via
(Raw CSV Data)        Import Wizard
--------------
        |
----------------
staging_courses   ____  Data Cleaning
(Extracted Data)        & Type Casting
----------------
        |
-------------------
  cleaned_courses   ____  Constraints &
(Cleaned and Final)       Normalization
-------------------
        |
  --------------
    audit_log     ____  Logs INSERT & 
  (Trigger Logs)        UPDATE Actions
  ---------------


## Insightful SQL Queries 
(All queries executed on the cleaned courses table.)
- Top 5 Most Enrolled Courses identified the highest-demand courses across platforms.
- Average Rating by Category ranked categories based on learner feedback.
- Paid vs Free Course Distribution analyzed business model dominance across platforms.
- Top Instructors by Average Rating identified high-quality content creators.
- Most Popular Platforms Offering High-Rated Courses merged ratings + enrollments for quality & scale insights.


## Triggers Implemented
after_insert : Logs course additions to audit_log
after_update : Logs rating changes with action details
Each trigger ensures traceability and simulates enterprise-grade data pipelines.


## Contents of Repository

|                 File Name                 |                      Description                        |
|-------------------------------------------|---------------------------------------------------------|
|            `online_courses.csv`           | Raw dataset                                             |
|            `cleaned_courses.csv`          | Cleaned and transformed data                            |
|              `audit_log.csv`              | Log of inserts and updates                              |
|        `ETL Pipeline Simulation.sql`      | All SQL operations                                      |
|       `Analytical Query Outputs.docx`     | Output of business insights                             |
| `SQL ETL Pipeline Simulation Report.docx` | Full report with objectives, tools, steps, and insights |


## Key Skills Demonstrated
- SQL ETL Design & Simulation
- Data Cleaning & Transformation in SQL
- Trigger-Based Audit Logging
- Staging vs Production Design
- Insightful SQL Querying
- Data Export & Documentation


## Key Learnings
- Practical experience in building an end-to-end SQL ETL system using just MySQL Workbench.
- Deeper understanding of staging tables, production pipelines, and transformation logic.
- Realization of the importance of audit trails and automation through triggers.
- Importance of thoughtful data modeling, normalization, and controlled dataset generation.
- Gained strong confidence in debugging, exporting results, and analyzing SQL query outputs.


## Summary
This project demonstrates not just technical knowledge but also project planning, documentation, and stakeholder awareness. It bridges the gap between raw data and decision-making through a repeatable, clean SQL ETL process. Every component, from triggers to exports, reflects real-life use cases often expected in data engineering and analytics roles. This project reflects evidence of initiative, attention to detail, and hands-on proficiency with relational databases.

### Contact Me
If you'd like to connect, collaborate, or discuss this project further:
- [LinkedIn](https://www.linkedin.com/in/diya-menghani-ab409031a/)
- Email: diyamenghani00@gmail.com

I'm always open to opportunities, feedback, and meaningful conversations around data analytics, SQL, and database design!


#### Tags
`SQL` `ETL` `Data Analytics` `MySQL` `Triggers` `Data Cleaning` `Relational Databases` `Portfolio Project` `Internship Work` `Data Engineering`
