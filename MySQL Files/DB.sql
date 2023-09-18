SELECT 
CASE WHEN employeenumber BETWEEN 1 and 101 THEN "1-100"
WHEN employeenumber BETWEEN 101 and 201 THEN "101-200"
WHEN employeenumber BETWEEN 201 and 301 THEN "201-300"
WHEN employeenumber BETWEEN 301 and 401 THEN "301-400"
WHEN employeenumber BETWEEN 401 and 501 THEN "401-500"
WHEN employeenumber BETWEEN 501 and 601 THEN "501-600"
WHEN employeenumber BETWEEN 601 and 701 THEN "601-700"
WHEN employeenumber BETWEEN 701 and 801 THEN "701-800"
WHEN employeenumber BETWEEN 801 and 901 THEN "801-900"
WHEN employeenumber BETWEEN 901 and 1001 THEN "901-1000"
WHEN employeenumber BETWEEN 1001 and 1101 THEN "1001-1100"
WHEN employeenumber BETWEEN 1101 and 1201 THEN "1101-1200"
WHEN employeenumber BETWEEN 1201 and 1301 THEN "1201-1300"
WHEN employeenumber BETWEEN 1301 and 1401 THEN "1301-1400"
WHEN employeenumber BETWEEN 1401 and 1501 THEN "1401-1500"
WHEN employeenumber BETWEEN 1501 and 1601 THEN "1501-1600"
WHEN employeenumber BETWEEN 1601 and 1701 THEN "1601-1700"
WHEN employeenumber BETWEEN 1701 and 1801 THEN "1701-1800"
WHEN employeenumber BETWEEN 1801 and 1901 THEN "1801-1900"
WHEN employeenumber BETWEEN 1901 and 2001 THEN "1901-2000"
WHEN employeenumber BETWEEN 2001 and 2101 THEN "2001-2100" END AS temp, COUNT(Attrition) FROM hr_data
WHERE attrition = "Yes"
GROUP BY 1 ORDER BY 2;

ALTER TABLE hr_data 
ADD COLUMN AttritionDate DATE;


UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(1 + RAND() * 31) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1001 AND 1101;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(31 + RAND() * 61) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 901 AND 1001;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(61 + RAND() * 91) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1401 AND 1501;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(91 + RAND() * 121) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1701 AND 1801;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(121 + RAND() * 151) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1101 AND 1201;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(151 + RAND() * 181) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1 AND 101;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(181 + RAND() * 211) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 501 AND 601;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(211 + RAND() * 241) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 101 AND 201;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(241 + RAND() * 271) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1801 AND 1901;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(271 + RAND() * 301) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1301 AND 1401;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(301 + RAND() * 331) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 301 AND 401;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(331 + RAND() * 361) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 801 AND 901;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(361 + RAND() * 391) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 601 AND 701;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(391 + RAND() * 421) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 401 AND 501;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(421 + RAND() * 451) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 201 AND 301;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(451 + RAND() * 481) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1901 AND 2001;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(481 + RAND() * 511) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1601 AND 1701;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(511 + RAND() * 541) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1201 AND 1301;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(541 + RAND() * 571) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 701 AND 801;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(571 + RAND() * 601) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 1501 AND 1601;
UPDATE hr_data SET AttritionDate = CURRENT_DATE - INTERVAL FLOOR(601 + RAND() * 631) DAY WHERE Attrition = "Yes" AND employeenumber BETWEEN 2001 AND 2101;


CREATE TABLE temp(
degree_id			INT,
degree				VARCHAR(50)
);

INSERT INTO temp VALUES
(1, "High School"),
(2, "Associates Degree"),
(3, "Bachelors Degree"),
(4, "Masters Degree"),
(5, "Doctoral Degree");

ALTER TABLE hr_data 
ADD COLUMN degree_id INT;



UPDATE hr_data
SET degree_id = FLOOR(1 + RAND()*(1))
WHERE age <= 20;

UPDATE hr_data
SET degree_id = FLOOR(1 + RAND()*(3))
WHERE age BETWEEN 21 AND 24;

UPDATE hr_data
SET degree_id = FLOOR(2 + RAND()*(3))
WHERE age BETWEEN 24 AND 26;

UPDATE hr_data
SET degree_id = FLOOR(2 + RAND()*(4))
WHERE age > 25;



SELECT degree_id, COUNT(*) FROM hr_data
GROUP BY 1;

SELECT DISTINCT
CASE WHEN age <= 20 THEN "<= 20"
WHEN age BETWEEN 21 AND 24 THEN "21-23"
WHEN age BETWEEN 23 AND 26 THEN "23-25"
ELSE "> 25" END AS t, degree_id FROM hr_data
ORDER BY age, degree_id;

ALTER TABLE hr_data 
ADD COLUMN EducationLevel VARCHAR(30);

UPDATE hr_data h JOIN temp t 
SET h.EducationLevel = t.degree
WHERE h.degree_id = t.degree_id;



SELECT EmployeeNumber, Gender, Age, Attrition, AttritionDate, EducationLevel, EducationField, BusinessTravel, Department, JobLevel, JobRole,
StandardHours, OverTime, MaritalStatus, PercentSalaryHike, TotalWorkingYears, YearsAtCompany, YearsSinceLastPromotion, NumCompaniesWorked, 
DistanceFromHome, MonthlyIncome, EnvironmentSatisfaction, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, WorkLifeBalance FROM hr_data;



CREATE TABLE hr AS
SELECT EmployeeNumber, Gender, Age, Attrition, AttritionDate, EducationLevel, EducationField, BusinessTravel, Department, JobLevel, JobRole,
StandardHours, OverTime, MaritalStatus, PercentSalaryHike, TotalWorkingYears, YearsAtCompany, YearsSinceLastPromotion, NumCompaniesWorked, 
DistanceFromHome, MonthlyIncome, EnvironmentSatisfaction, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, WorkLifeBalance FROM hr_data;


-- KEEPING COLUMNS
-- EmployeeNumber, Gender, Age, Attrition, AttritionDate, EducationLevel, EducationField, BusinessTravel, Department, JobLevel, JobRole,
-- StandardHours, OverTime, MaritalStatus, PercentSalaryHike, TotalWorkingYears, YearsAtCompany, YearsSinceLastPromotion, NumCompaniesWorked, 
-- DistanceFromHome, MonthlyIncome, EnvironmentSatisfaction, JobSatisfaction, PerformanceRating, RelationshipSatisfaction, WorkLifeBalance

-- DROPING COLUMNS
-- Dailyrate, Education, EmployeeCount, HourlyRate, MonthlyRate, Over18, degree_id, JobInvolvement, TrainingTimesLastYear, StockOptionLevel, 
-- YearsWithCurrManager, YearsInCurrentRole