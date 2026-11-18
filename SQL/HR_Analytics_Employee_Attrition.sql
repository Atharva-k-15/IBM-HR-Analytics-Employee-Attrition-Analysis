-- Q1.Display all employee records
select * from employee;

-- Q2.Display only EmployeeNumber, Age, Department, JobRole, MonthlyIncome and Attrition
select EmployeeNumber, Age, Department, JobRole, MonthlyIncome, Attrition from employee;

-- Q3.Find the total number of employee records
select count(*) as TotalEmployees from employee;

-- Q4.Count employees who left and employees who stayed
select Attrition, count(EmployeeCount) as TotalEmployees
from employee
group by Attrition;

-- Q5.List all distinct departments, job roles, education fields and marital statuses
select distinct(Department), JobRole, EducationField, MaritalStatus from employee
order by Department desc;

-- Q6.Find employees whose age is below 30
select * from employee
where Age < 30;

-- Q7.Find employees earning more than 10,000 per month
select * from employee
where MonthlyIncome > 10000;

-- Q8.List employees who work overtime
select * from employee
where OverTime = 'Yes';

-- Q9.Find employees in the Research & Development department
select * from employee
where Department = 'Research & Development';

-- Q10.Find employees who travel frequently for business
select * from employee
where BusinessTravel = 'Travel_Frequently';

-- Q11.Display employees in descending order of monthly income
select * from employee
order by MonthlyIncome DESC;

-- Q12.Find the 10 highest-paid employees
select * from employee
order by MonthlyIncome DESC
LIMIT 10;

-- Q13.Find employees with 10 or more years at the company
select * from employee
where YearsAtCompany >= 10;

-- Q14.Find employees with low job satisfaction (score 1 or 2)
select * from employee
where JobSatisfaction IN (1, 2);

-- Q15.Find employees whose job role contains the word 'Sales'
select * from employee
where JobRole LIKE '%Sales%';

-- Q16.Calculate the overall employee attrition rate as a percentage
SELECT Attrition, COUNT(*) AS employee_count, ROUND(COUNT(*) * 100.0/ (SELECT COUNT(*) FROM employee),2) AS percentage
FROM employee
GROUP BY Attrition;

-- Q17.Calculate total employees, leavers and attrition rate for each department
SELECT Department, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM employee
GROUP BY Department;

-- Q18.Calculate attrition rate for every job role
select JobRole, count(*) as Total_Employees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
from employee
group by JobRole;

-- Q19.Calculate average monthly income for employees who left versus those who stayed
select Attrition, avg(MonthlyIncome) as Avg_Monthly_Income
from employee
group by Attrition;

-- Q20.Calculate average age by attrition status
select Attrition, avg(age) as Avg_Age
from employee
group by Attrition;

-- Q21.Find the number and percentage of employees working overtime
select OverTime, count(EmployeeCount) as Total_Employees, 
ROUND(COUNT(EmployeeCount) * 100.0/ (SELECT COUNT(*) FROM employee),2) AS Percentage
from employee
group by OverTime;

-- Q22.Calculate attrition rates for overtime and non-overtime employees
SELECT OverTime, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM employee
GROUP BY OverTime;

-- Q23.Find departments with more than 100 employees
select Department, count(EmployeeCount) as Total_Employees
from employee
group by Department
having count(EmployeeCount) > 100;

-- Q24.Calculate average job satisfaction for leavers and non-leavers
select Attrition, avg(JobSatisfaction) as Avg_Job_Satisfaction
from employee
group by Attrition;

-- Q25.Find job roles with an attrition rate higher than the overall company rate
SELECT JobRole, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY JobRole
HAVING AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) > (SELECT AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END)
FROM employee);

-- Q26.Calculate attrition rate by gender and marital status
select Gender, MaritalStatus, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
from employee
group by Gender, MaritalStatus
order by Gender, MaritalStatus;

-- Q27.Calculate average monthly income by department and job role
select Department, JobRole, count(EmployeeCount) as Total_Employees,
sum(MonthlyIncome) as Total_Monthly_Income, avg(MonthlyIncome) as Avg_Monthly_Income
from employee
group by Department, JobRole
order by Department;

-- Q28.Calculate average monthly income by department and job level
select Department, JobLevel, count(EmployeeCount) as Total_Employees,
sum(MonthlyIncome) as Total_Monthly_Income, avg(MonthlyIncome) as Avg_Monthly_Income
from employee
group by Department, JobLevel
order by Department;

-- Q29.Find the job roles with the total number of leavers and attrition rate (job role wise)
select JobRole, count(EmployeeCount) as Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate 
from employee
group by JobRole;

-- Q30.Find the five job roles with the highest number of leavers
select JobRole, count(EmployeeCount) as Leavers
from employee
where Attrition = 'Yes'
group by JobRole
order by Leavers desc
limit 5;

-- Q31.Find total number of employees in each department and job role
select Department, JobRole, count(EmployeeCount) as Total_Employees
from employee
group by Department, JobRole
order by Department;

-- Q32.Calculate the average years at the company for each department
select Department, avg(YearsAtCompany) as Avg_Yrs_at_Company
from employee
group by Department;

-- Q33.Calculate total leavers and attrition rate by business travel frequency
select BusinessTravel, count(*) as Total_Employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
from employee
group by BusinessTravel;

-- Q34.Classify employees into age groups: under 25, 25–34, 35–44, 45–54 and 55+. Calculate attrition for each group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY MIN(Age);

-- Q35.Classify tenure into 0–1, 2–3, 4–5, 6–10 and 11+ years.Compare attrition
SELECT
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 1 THEN '0-1'
        WHEN YearsAtCompany BETWEEN 2 AND 3 THEN '2-3'
        WHEN YearsAtCompany BETWEEN 4 AND 5 THEN '4-5'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10'
        ELSE '11+'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 1 THEN '0-1'
        WHEN YearsAtCompany BETWEEN 2 AND 3 THEN '2-3'
        WHEN YearsAtCompany BETWEEN 4 AND 5 THEN '4-5'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10'
        ELSE '11+'
    END
ORDER BY MIN(YearsAtCompany);

-- Q36.Create monthly income bands and calculate attrition in each band
SELECT
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 5000 THEN '1000 - 5000'
        WHEN MonthlyIncome BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN '10001 - 15000'
        ELSE '15001 - 20000'
    END AS Income_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 5000 THEN '1000 - 5000'
        WHEN MonthlyIncome BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN '10001 - 15000'
        ELSE '15001 - 20000'
    END
ORDER BY MIN(MonthlyIncome);

-- Q37.Classify employees into low (1–2) and high (3–4) job satisfaction groups.Compare attrition
SELECT
    CASE
        WHEN JobSatisfaction BETWEEN 1 AND 2 THEN 'Low (1-2)'
        ELSE 'High (3-4)'
    END AS Job_Satisfaction_Groups,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY
    CASE
        WHEN JobSatisfaction BETWEEN 1 AND 2 THEN 'Low (1-2)'
        ELSE 'High (3-4)'
    END
ORDER BY MIN(JobSatisfaction);

-- Q38.Calculate attrition for the four combinations of overtime and low/high job satisfaction.
SELECT OverTime,
    CASE
        WHEN JobSatisfaction BETWEEN 1 AND 2 THEN 'Low (1-2)'
        ELSE 'High (3-4)'
    END AS Job_Satisfaction_Groups,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY OverTime,
    CASE
        WHEN JobSatisfaction BETWEEN 1 AND 2 THEN 'Low (1-2)'
        ELSE 'High (3-4)'
    END
ORDER BY OverTime, MIN(JobSatisfaction);

-- Q39.Find employees who work overtime, have job satisfaction of 1 or 2, and have left
select JobSatisfaction, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers
from employee
where OverTime = 'Yes'
group by JobSatisfaction
having JobSatisfaction <= 2;

-- Q40.Calculate attrition rates for combinations of department and overtime status
select Department, OverTime as Overtime_Status, count(*) as Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
from employee
group by Department, OverTime
order by Department, OverTime;

-- Q41.Rank job roles by attrition rate from highest to lowest
SELECT JobRole, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate,
    DENSE_RANK() OVER (ORDER BY AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) DESC) AS Role_Rank
FROM employee
GROUP BY JobRole
ORDER BY Role_Rank;

-- Q42.Find the top three job roles by attrition rate within each department
WITH cte AS (
SELECT Department, JobRole, AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END) AS Attrition_Rate,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END) DESC) AS rnk
FROM employee
GROUP BY Department, JobRole
)
SELECT * FROM cte
WHERE rnk <= 3;

-- Q43.Rank employees by monthly income within their department
with cte as(
select Department, MonthlyIncome, EmployeeNumber, dense_rank() over(partition by Department order by MonthlyIncome desc) as rnk
from employee
)
select EmployeeNumber, Department, MonthlyIncome, rnk
from cte;

-- Q44.Find the top three highest-paid employees in each department
with cte as(
select Department, MonthlyIncome, EmployeeNumber, dense_rank() over(partition by Department order by MonthlyIncome desc) as ranking
from employee
)
select EmployeeNumber, Department, MonthlyIncome, ranking
from cte
where ranking <= 3;

-- Q45.Calculate each department's share of all company leavers
SELECT Department, count(*) as Total_Employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Total_Leavers,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /
       (SELECT COUNT(*) FROM employee WHERE Attrition = 'Yes'), 2) AS Leavers_Share
FROM employee
GROUP BY Department;

-- Q46.Assign a row number to employees within each job role, ordered by years at the company
select JobRole, EmployeeNumber, YearsAtCompany, row_number() over(partition by JobRole order by YearsAtCompany desc) as rnk
from employee;

-- Q47.Use ROW_NUMBER to identify duplicate EmployeeNumber values, if any, and retain one record per identifier
WITH cte AS (
    SELECT EmployeeNumber, ROW_NUMBER() OVER (PARTITION BY EmployeeNumber ORDER BY EmployeeNumber) AS rn
    FROM employee
)
SELECT * FROM cte
WHERE rn = 1;

-- Q48.Calculate each employee's income rank within their job level
with cte as(
select *, dense_rank() over(partition by JobLevel order by MonthlyIncome desc) as rnk
from employee
)
select JobLevel, EmployeeNumber, MonthlyIncome, rnk
from cte;

-- Q49.Identify employees earning less than their department's average monthly income
SELECT Department, EmployeeNumber, MonthlyIncome
FROM employee e
WHERE MonthlyIncome < (
    SELECT AVG(MonthlyIncome)
    FROM employee
    WHERE Department = e.Department
)
ORDER BY Department, MonthlyIncome;

-- Q50.Compare employees who left and stayed across job satisfaction, work-life balance and environment satisfaction
SELECT 'Job Satisfaction' AS Factor, JobSatisfaction AS Score,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leavers,
       SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Stayers
FROM employee
GROUP BY JobSatisfaction

UNION ALL

SELECT 'Work Life Balance' AS Factor, WorkLifeBalance AS Score,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END),
       SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
FROM employee
GROUP BY WorkLifeBalance

UNION ALL

SELECT 'Environment Satisfaction' AS Factor, EnvironmentSatisfaction AS Score,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END),
       SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
FROM employee
GROUP BY EnvironmentSatisfaction;

-- Q51.Produce HR risk-segment table containing dept, job role, tenure band, overtime status, employee count, leaver count & attrition rate
SELECT Department, JobRole,
       CASE
           WHEN YearsAtCompany < 3 THEN '0-2 Years'
           WHEN YearsAtCompany < 6 THEN '3-5 Years'
           ELSE '6+ Years'
       END AS Tenure_Band,
       OverTime,
       COUNT(*) AS Employee_Count,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Leaver_Count,
       ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 100.0 ELSE 0 END), 2) AS Attrition_Rate
FROM employee
GROUP BY Department, JobRole, Tenure_Band, OverTime
ORDER BY Department DESC;