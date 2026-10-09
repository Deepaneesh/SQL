-- Select all columns
SELECT *
FROM employees;

-- Select specific columns
SELECT name, salary
FROM employees;

-- Select unique values
SELECT DISTINCT department
FROM employees;

-- Retrieve the first 5 rows
SELECT *
FROM employees
LIMIT 5;

-- Filter using a condition
SELECT *
FROM employees
WHERE salary > 40000;

-- Multiple conditions
SELECT *
FROM employees
WHERE department = 'IT'
  AND salary > 40000;

-- OR condition
SELECT *
FROM employees
WHERE department = 'IT'
   OR department = 'HR';

-- NOT condition
SELECT *
FROM employees
WHERE department <> 'IT';

-- Filter within a range
SELECT *
FROM employees
WHERE salary BETWEEN 35000 AND 45000;

-- Match multiple values
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

-- Match a text pattern
SELECT *
FROM employees
WHERE name LIKE 'A%';

-- Find missing values
SELECT *
FROM employees
WHERE salary IS NULL;


-- Ascending order
SELECT *
FROM employees
ORDER BY salary ASC;

-- Descending order
SELECT *
FROM employees
ORDER BY salary DESC;

-- Sort using multiple columns
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;