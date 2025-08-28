SHOW DATABASES;
USE ORG123;

CREATE TABLE mla (
	EMP_ID INT NOT NULL,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO mla
	(EMP_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(101, 'Arjun', 'Mehta', 120000, '2021-03-15 10:15:00', 'Finance'),
		(102, 'Priya', 'Sharma', 95000, '2019-05-16 09:30:00', 'IT'),
		(103, 'Rahul', 'Kapoor', 150000, '2018-07-17 11:00:00', 'HR'),
		(104, 'Sneha', 'Patel', 180000, '2020-02-18 08:45:00', 'Marketing'),
		(105, 'Karan', 'Gupta', 220000, '2022-09-19 12:00:00', 'Finance'),
		(106, 'Ananya', 'Rao', 130000, '2021-11-20 10:30:00', 'IT'),
		(107, 'Rohit', 'Iyer', 75000, '2020-04-21 09:15:00', 'Support'),
		(108, 'Neha', 'Singh', 105000, '2023-06-22 14:00:00', 'Marketing');
        
select* from mla;

#Q1: Increase every mla’s salary by 10% and show new salary.
SELECT FIRST_NAME, SALARY, SALARY * 1.10 AS New_Salary
FROM mla;

#Q2: Show yearly salary (monthly salary × 12).
SELECT FIRST_NAME, SALARY, SALARY * 12 AS Yearly_Salary
FROM mla;

#Q3: Find employees with salary greater than 1,50,000.
SELECT * FROM mla WHERE SALARY > 150000;

#Q4: Find employees not in HR.
SELECT * FROM mla WHERE DEPARTMENT <> 'HR';

#Q5: Find employees in IT department with salary greater than 1,00,000.
SELECT * FROM mla WHERE DEPARTMENT = 'IT' AND SALARY > 100000;

#Q6: Find employees in HR or Finance department
SELECT * FROM mla WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Finance';

#Q7: Find employees who are not in Marketing.
SELECT * FROM mla WHERE NOT DEPARTMENT = 'Marketing';

# In operator
#Q9: Find mlas working in Finance, IT, or Marketing.
SELECT * FROM mla WHERE DEPARTMENT IN ('Finance', 'IT', 'Marketing');
#Q1 : Find workers not in HR or Admin with salary between 70000 and 300000.
SELECT * FROM mla
WHERE DEPARTMENT NOT IN ('HR', 'Admin')
  AND SALARY BETWEEN 70000 AND 300000;
#Q2 : Find workers with first name starting with "V" and salary greater than or equal to 200000.
SELECT * FROM mla
WHERE FIRST_NAME LIKE 'V%'
  AND SALARY >= 200000;
#Q3 : Find workers not in admin with salary < 100000
SELECT * FROM mla
WHERE DEPARTMENT != 'Admin'
  AND SALARY < 100000;
#Q4 : Find the average salary in the Admin department
SELECT AVG(SALARY) AS Average_Salary
FROM mla
WHERE DEPARTMENT = 'Admin';
#Q5 : Total salary for HR and Admin departments combined
SELECT AVG(SALARY) AS Average_Salary
FROM mla
WHERE DEPARTMENT = 'Admin';
#Q6 : Total salary for HR and Admin departments combined.
SELECT SUM(SALARY) AS Total_Salary
FROM mla
WHERE DEPARTMENT IN ('HR', 'Admin');
#Q7 : Count employees whose first name starts with 'V'.
SELECT COUNT(*) AS Employee_Count
FROM Worker
WHERE FIRST_NAME LIKE 'V%';
#Q8 : Total salary of employees with salary between 50000 amd 200000
SELECT SUM(SALARY) AS Total_Salary
FROM Worker
WHERE SALARY BETWEEN 50000 AND 200000;
#union
select JOINING_DATE from employee
union
select department from employee;
#case
select first_name ,salary,
case when salary > 100000 then 'Rich'
else 'poor' end as Status
from employee;