-- Department Job Role
SELECT EmployeeNumber, Department, JobRole, 
CASE WHEN Attrition= "Yes" THEN 1 ELSE 0 END AS Attrition,
CASE WHEN Attrition= "No" THEN 1 ELSE 0 END AS Retention FROM hr;

-- Gender
SELECT EmployeeNumber, Gender, Attrition FROM hr;

-- Field
SELECT EmployeeNumber, EducationField AS Field, Attrition FROM hr;

-- Age
SELECT EmployeeNumber, Age, 
CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END AS Attrition,
CASE WHEN Attrition = "No" THEN 1 ELSE 0 END AS Retention FROM hr;

-- Highest Education
SELECT EmployeeNumber, EducationLevel AS HighestEducation, Attrition, 
CASE WHEN Attrition = "Yes" THEN CONCAT(EducationLevel, " Attrition") 
ELSE CONCAT(EducationLevel, " Retention") END AS SubHE FROM hr;

-- Attrition Date
SELECT EmployeeNumber, AttritionDate, MONTH(AttritionDate) AS Month,
CASE WHEN MONTH(AttritionDate) = 1 THEN "January"
WHEN MONTH(AttritionDate) = 2 THEN "February"
WHEN MONTH(AttritionDate) = 3 THEN "March"
WHEN MONTH(AttritionDate) = 4 THEN "April"
WHEN MONTH(AttritionDate) = 5 THEN "May"
WHEN MONTH(AttritionDate) = 6 THEN "June"
WHEN MONTH(AttritionDate) = 7 THEN "July"
WHEN MONTH(AttritionDate) = 8 THEN "August"
WHEN MONTH(AttritionDate) = 9 THEN "September"
WHEN MONTH(AttritionDate) = 10 THEN "October"
WHEN MONTH(AttritionDate) = 11 THEN "November"
WHEN MONTH(AttritionDate) = 12 THEN "December" END AS Months, YEAR(AttritionDate) AS Year FROM hr
WHERE Attrition = "Yes"
ORDER BY 5, 3;


SELECT YEAR(AttritionDate) AS Year, MONTH(AttritionDate) AS Month,
CASE WHEN MONTH(AttritionDate) = 1 THEN "January"
WHEN MONTH(AttritionDate) = 2 THEN "February"
WHEN MONTH(AttritionDate) = 3 THEN "March"
WHEN MONTH(AttritionDate) = 4 THEN "April"
WHEN MONTH(AttritionDate) = 5 THEN "May"
WHEN MONTH(AttritionDate) = 6 THEN "June"
WHEN MONTH(AttritionDate) = 7 THEN "July"
WHEN MONTH(AttritionDate) = 8 THEN "August"
WHEN MONTH(AttritionDate) = 9 THEN "September"
WHEN MONTH(AttritionDate) = 10 THEN "October"
WHEN MONTH(AttritionDate) = 11 THEN "November"
WHEN MONTH(AttritionDate) = 12 THEN "December" END AS Months, COUNT(attrition) FROM hr
WHERE Attrition = "Yes"
GROUP BY 1, 2 ORDER BY 1, 2;

SELECT * FROM hr;

SELECT "JobSatisfaction" AS Metric, "Attrition" AS temp, 
COUNT(IF(jobsatisfaction = 1 AND Attrition = "Yes", 1, NULL)) AS "1", 
COUNT(IF(jobsatisfaction = 2 AND Attrition = "Yes", 1, NULL)) AS "2",
COUNT(IF(jobsatisfaction = 3 AND Attrition = "Yes", 1, NULL)) AS "3", 
COUNT(IF(jobsatisfaction = 4 AND Attrition = "Yes", 1, NULL)) AS "4" FROM hr
UNION
SELECT "JobSatisfaction" AS Metric, "Retention" AS temp, 
COUNT(IF(jobsatisfaction = 1 AND Attrition = "No", 1, NULL)) AS "1", 
COUNT(IF(jobsatisfaction = 2 AND Attrition = "No", 1, NULL)) AS "2",
COUNT(IF(jobsatisfaction = 3 AND Attrition = "No", 1, NULL)) AS "3", 
COUNT(IF(jobsatisfaction = 4 AND Attrition = "No", 1, NULL)) AS "4" FROM hr
UNION
SELECT "EnvironmentSatisfaction" AS Metric, "Attrition" AS temp, 
COUNT(IF(EnvironmentSatisfaction = 1 AND Attrition = "Yes", 1, NULL)) AS "1", 
COUNT(IF(EnvironmentSatisfaction = 2 AND Attrition = "Yes", 1, NULL)) AS "2",
COUNT(IF(EnvironmentSatisfaction = 3 AND Attrition = "Yes", 1, NULL)) AS "3", 
COUNT(IF(EnvironmentSatisfaction = 4 AND Attrition = "Yes", 1, NULL)) AS "4" FROM hr
UNION
SELECT "EnvironmentSatisfaction" AS Metric, "Retention" AS temp, 
COUNT(IF(EnvironmentSatisfaction = 1 AND Attrition = "No", 1, NULL)) AS "1", 
COUNT(IF(EnvironmentSatisfaction = 2 AND Attrition = "No", 1, NULL)) AS "2",
COUNT(IF(EnvironmentSatisfaction = 3 AND Attrition = "No", 1, NULL)) AS "3", 
COUNT(IF(EnvironmentSatisfaction = 4 AND Attrition = "No", 1, NULL)) AS "4" FROM hr
UNION
SELECT "RelationshipSatisfaction" AS Metric, "Attrition" As temp, 
COUNT(IF(RelationshipSatisfaction = 1 AND Attrition = "Yes", 1, NULL)) AS "1", 
COUNT(IF(RelationshipSatisfaction = 2 AND Attrition = "Yes", 1, NULL)) AS "2",
COUNT(IF(RelationshipSatisfaction = 3 AND Attrition = "Yes", 1, NULL)) AS "3", 
COUNT(IF(RelationshipSatisfaction = 4 AND Attrition = "Yes", 1, NULL)) AS "4" FROM hr
UNION
SELECT "RelationshipSatisfaction" AS Metric, "Retention" AS temp, 
COUNT(IF(RelationshipSatisfaction = 1 AND Attrition = "No", 1, NULL)) AS "1", 
COUNT(IF(RelationshipSatisfaction = 2 AND Attrition = "No", 1, NULL)) AS "2",
COUNT(IF(RelationshipSatisfaction = 3 AND Attrition = "No", 1, NULL)) AS "3", 
COUNT(IF(RelationshipSatisfaction = 4 AND Attrition = "No", 1, NULL)) AS "4" FROM hr
UNION
SELECT "PerformanceRating" AS Metric, "Attrition" AS temp,
COUNT(IF(PerformanceRating = 1 AND Attrition = "Yes", 1, NULL)) AS "1", 
COUNT(IF(PerformanceRating = 2 AND Attrition = "Yes", 1, NULL)) AS "2",
COUNT(IF(PerformanceRating = 3 AND Attrition = "Yes", 1, NULL)) AS "3", 
COUNT(IF(PerformanceRating = 4 AND Attrition = "Yes", 1, NULL)) AS "4" FROM hr
UNION
SELECT "PerformanceRating" AS Metric, "Retention" AS temp, 
COUNT(IF(PerformanceRating = 1 AND Attrition = "No", 1, NULL)) AS "1", 
COUNT(IF(PerformanceRating = 2 AND Attrition = "No", 1, NULL)) AS "2",
COUNT(IF(PerformanceRating = 3 AND Attrition = "No", 1, NULL)) AS "3", 
COUNT(IF(PerformanceRating = 4 AND Attrition = "No", 1, NULL)) AS "4" FROM hr
UNION
SELECT "WorkLifeBalance" AS Metric, "Attrition" AS temp,
COUNT(IF(WorkLifeBalance = 1 AND Attrition = "Yes", 1, NULL)) AS "1", 
COUNT(IF(WorkLifeBalance = 2 AND Attrition = "Yes", 1, NULL)) AS "2",
COUNT(IF(WorkLifeBalance = 3 AND Attrition = "Yes", 1, NULL)) AS "3", 
COUNT(IF(WorkLifeBalance = 4 AND Attrition = "Yes", 1, NULL)) AS "4" FROM hr
UNIOn
SELECT "WorkLifeBalance" AS Metric, "Retention" AS temp, 
COUNT(IF(WorkLifeBalance = 1 AND Attrition = "No", 1, NULL)) AS "1", 
COUNT(IF(WorkLifeBalance = 2 AND Attrition = "No", 1, NULL)) AS "2",
COUNT(IF(WorkLifeBalance = 3 AND Attrition = "No", 1, NULL)) AS "3", 
COUNT(IF(WorkLifeBalance = 4 AND Attrition = "No", 1, NULL)) AS "4" FROM hr;





SELECT "Job Satisfaction" AS Metric, COUNT(IF(jobsatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(jobsatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(jobsatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(jobsatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "Yes"
UNION ALL
SELECT "Environment Satisfaction" AS Metric, COUNT(IF(EnvironmentSatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(EnvironmentSatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(EnvironmentSatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(EnvironmentSatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "Yes"
UNION ALL
SELECT "Relationship Satisfaction" AS Metric, COUNT(IF(RelationshipSatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(RelationshipSatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(RelationshipSatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(RelationshipSatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "Yes"
UNION ALL
SELECT "Performance Rating" AS Metric, COUNT(IF(PerformanceRating = 1, 1, NULL)) AS "1", COUNT(IF(PerformanceRating = 2, 1, NULL)) AS "2", 
COUNT(IF(PerformanceRating = 3, 1, NULL)) AS "3", COUNT(IF(PerformanceRating = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "Yes"
UNION ALL
SELECT "Work Life Balance" AS Metric, COUNT(IF(WorkLifeBalance = 1, 1, NULL)) AS "1", COUNT(IF(WorkLifeBalance = 2, 1, NULL)) AS "2", 
COUNT(IF(WorkLifeBalance = 3, 1, NULL)) AS "3", COUNT(IF(WorkLifeBalance = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "Yes";


SELECT "Job Satisfaction" AS Metric, COUNT(IF(jobsatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(jobsatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(jobsatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(jobsatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "No"
UNION ALL
SELECT "Environment Satisfaction" AS Metric, COUNT(IF(EnvironmentSatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(EnvironmentSatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(EnvironmentSatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(EnvironmentSatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "No"
UNION ALL
SELECT "Relationship Satisfaction" AS Metric, COUNT(IF(RelationshipSatisfaction = 1, 1, NULL)) AS "1", COUNT(IF(RelationshipSatisfaction = 2, 1, NULL)) AS "2", 
COUNT(IF(RelationshipSatisfaction = 3, 1, NULL)) AS "3", COUNT(IF(RelationshipSatisfaction = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "No"
UNION ALL
SELECT "Performance Rating" AS Metric, COUNT(IF(PerformanceRating = 1, 1, NULL)) AS "1", COUNT(IF(PerformanceRating = 2, 1, NULL)) AS "2", 
COUNT(IF(PerformanceRating = 3, 1, NULL)) AS "3", COUNT(IF(PerformanceRating = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "No"
UNION ALL
SELECT "Work Life Balance" AS Metric, COUNT(IF(WorkLifeBalance = 1, 1, NULL)) AS "1", COUNT(IF(WorkLifeBalance = 2, 1, NULL)) AS "2", 
COUNT(IF(WorkLifeBalance = 3, 1, NULL)) AS "3", COUNT(IF(WorkLifeBalance = 4, 1, NULL)) AS "4" FROM hr WHERE Attrition = "No";




SELECT 
EmployeeNumber AS EmployeeID, AttritionDate, BusinessTravel, Department, JobRole,
TotalWorkingYears AS Experience, YearsAtCompany, YearsSinceLastPromotion, MonthlyIncome AS Salary, PercentSalaryHike
FROM hr WHERE attrition = "Yes";

SELECT * FROM hr
WHERE month(attritiondate) = 7 AND year(attritiondate) = 2021;

SELECT EmployeeNumber AS EmployeeID, Gender, Age, AttritionDate, EducationLevel AS HighestQualification, EducationField, Department, JobRole,
PercentSalaryHike, TotalWorkingYears AS Experience, YearsAtCompany, YearsSinceLastPromotion, MonthlyIncome AS Salary, PerformanceRating FROM hr
WHERE attrition = "Yes";