 use challenge;
  #1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
  CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,    -- Experience in years
    salary DECIMAL(10, 2)   -- Salary as a decimal value
);
INSERT INTO teachers (name, subject, experience, salary)
VALUES
('John Doe', 'Mathematics', 10, 50000.00),
('Jane Smith', 'Physics', 8, 48000.00),
('Robert Brown', 'Chemistry', 12, 52000.00),
('Emily Davis', 'Biology', 6, 45000.00),
('Michael Wilson', 'History', 9, 47000.00),
('Linda Garcia', 'English', 11, 51000.00),
('James Martinez', 'Geography', 7, 46000.00),
('Barbara Hernandez', 'Computer Science', 5, 44000.00);

/*Question 1: Find Teachers with Above-Average Salaries
Write a query to find the names and subjects of teachers who earn more than the average salary of all teachers.*/
WITH AVG_SALARY as (
SELECT AVG(SALARY) AS AVERAGE_SALARY FROM TEACHERS
)
SELECT 
NAME,SUBJECT 
FROM TEACHERS WHERE SALARY> (SELECT AVERAGE_SALARY FROM AVG_SALARY);


/*Question 2: Identify Teachers Based on Experience Levels
Write a query to categorize teachers into three experience levels:
Junior: Less than 6 years of experience
Mid-Level: Between 6 and 10 years of experience
Senior: More than 10 years of experience
Return the name, subject, experience, and category for each teacher.*/
WITH ExperienceCategoryCTE AS (
    SELECT 
        name,
        subject,
        experience,
        CASE
            WHEN experience < 6 THEN 'Junior'
            WHEN experience BETWEEN 6 AND 10 THEN 'Mid-Level'
            ELSE 'Senior'
        END AS ExperienceLevel
    FROM teachers
)
SELECT *
FROM ExperienceCategoryCTE;

/*Question 3: Rank Teachers by Salary
Write a query to rank teachers based on their salary (highest to lowest). Include the teacher's name, subject, salary, and rank in the result.*/

WITH SALARYRANK_CTE AS(
 SELECT NAME ,SUBJECT, SALARY,
 RANK() OVER(ORDER BY SALARY DESC) AS SALARY_RANK
 FROM TEACHERS
 )
 SELECT * FROM SALARYRANK_CTE;
 
 