# IBM HR Analytics – Employee Attrition Analysis

## 1. Project Overview

This project focuses on analysing employee attrition patterns using the IBM HR Analytics Employee Attrition dataset. The objective is to identify workforce trends, understand factors associated with employee turnover, and generate actionable insights that can support better employee retention strategies.

The project follows an end-to-end data analytics workflow using Python, SQL, Excel and Power BI.

## 2. Business Problem Statement

Employee attrition can affect organisational stability, workforce productivity and recruitment costs. Understanding why employees leave is important for developing effective retention strategies.

This project analyses employee information to identify attrition patterns across departments, job roles, income levels, overtime requirements, job satisfaction and other workforce-related factors.

## 3. Project Objectives

- Analyse overall employee attrition and retention rates.
- Identify departments and job roles with comparatively higher attrition.
- Examine the relationship between overtime and employee attrition.
- Analyse salary, job satisfaction and work-life balance patterns.
- Explore differences between employees who left and those who stayed.
- Develop data-driven recommendations to support employee retention.

## 4. Dataset Information

| Attribute | Details |
|---|---|
| Dataset | IBM HR Analytics Employee Attrition |
| Domain | Human Resources |
| Records | 1,470 |
| Columns | 35 |
| Target Variable | Attrition |
| File Format | CSV |

**Data quality checks:** No missing values, duplicate rows or duplicate Employee Number values were identified during the analysis.

## 5. Tools & Technologies

- **Python:** Data cleaning, manipulation and exploratory data analysis.
- **Pandas & NumPy:** Data processing and numerical analysis.
- **Matplotlib & Seaborn:** Data visualisation.
- **Jupyter Notebook:** Python analysis environment.
- **MySQL Workbench 8.0 CE:** SQL-based data analysis.
- **SQLAlchemy:** Python-to-database integration.
- **Microsoft Excel:** Dataset exploration and analysis.
- **Power BI:** Interactive dashboard development.

## 6. Project Workflow

### Phase 1: Python – Exploratory Data Analysis

- Loaded and inspected the employee dataset.
- Examined data types, dimensions and data quality.
- Performed exploratory data analysis.
- Analysed employee attrition across different workforce attributes.
- Created visualisations to identify significant patterns.

### Phase 2: SQL – Database Analysis

- Imported employee data into MySQL.
- Created the `HREmployeeAttrition` database and `employee` table.
- Performed SQL-based analysis using 51 numbered queries.
- Analysed employee demographics, departments, job roles, income and attrition patterns.

### Phase 3: Power BI – Dashboard Development

Developed a two-page interactive dashboard:

**Dashboard 1: IBM HR Employees Attrition Overview**
- Overall employee statistics.
- Employee attrition overview.
- Department-wise attrition.
- Job-role-wise employee attrition.

**Dashboard 2: Employees Retention & Risk Analysis**
- Income and salary-related analysis.
- Job satisfaction analysis.
- Work-life balance analysis.
- Employee tenure analysis.
- Comparison of employees who left and stayed.

## 7. Key Analytical Findings

| Metric | Finding |
|---|---:|
| Total Employees | 1,470 |
| Employees Who Left | 237 |
| Employees Who Stayed | 1,233 |
| Overall Attrition Rate | 16.12% |

### Department-wise Attrition

| Department | Attrition Rate |
|---|---:|
| Sales | 20.63% |
| Human Resources | 19.05% |
| Research & Development | 13.84% |

### Additional Insights

- Sales Representatives recorded the highest job-role attrition rate at 39.76%.
- Employees working overtime had an attrition rate of 30.53%, compared with 10.44% among employees not working overtime.
- Employees who left had an average tenure of 5.13 years, compared with 7.37 years among employees who stayed.
- Average monthly income was lower among employees who left than among employees who stayed.

These findings indicate patterns and associations in the dataset; they do not independently establish the causes of employee attrition.

## 8. Key Skills Demonstrated

- Data Cleaning and Preprocessing
- Exploratory Data Analysis (EDA)
- Statistical Analysis
- Data Visualisation
- Python and Pandas
- SQL Queries and Database Management
- MySQL and SQLAlchemy Integration
- Microsoft Excel
- Power BI Dashboard Development
- Business Insights and Data-Driven Recommendations

## 9. Project Limitations

- The analysis is based on the available IBM HR Analytics dataset.
- The dataset represents a defined set of employee records and may not reflect every organisation's workforce.
- Observed relationships should not be interpreted as proof of causation.
- Recommendations are analytical suggestions and would require organisational validation before implementation.

## 10. Conclusion

This project demonstrates an end-to-end approach to HR analytics by combining Python, SQL, Excel and Power BI.

Through exploratory analysis, database queries and interactive dashboards, the project identifies important employee attrition patterns and translates them into practical business insights.

It showcases the application of data analytics techniques to real-world Human Resources challenges.

**Project Domain:** Human Resources Analytics  
**Project Type:** End-to-End Data Analytics  
**Tools:** Python | SQL | Excel | Power BI