-- Count rows
SELECT COUNT(*)
FROM employees;

-- Count non-NULL salary values
SELECT COUNT(salary)
FROM employees;

-- Calculate the total salary
SELECT SUM(salary)
FROM employees;

-- Calculate the average salary
SELECT AVG(salary)
FROM employees;

-- Find the maximum salary
SELECT MAX(salary)
FROM employees;

-- Find the minimum salary
SELECT MIN(salary)
FROM employees;

-- Calculate average salary by department

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Filter departments with average salary greater than 40000

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 40000;