-- Joins in SQL
-- This script demonstrates different types of joins in SQL.
-- There are several types of joins, including 

-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL OUTER JOIN
-- CROSS JOIN

-- # INNER JOIN ------------------------------------------------------------------------------------

SELECT *
FROM employees
INNER JOIN departments
    ON employees.department = departments.department;

-- # LEFT JOIN ------------------------------------------------------------------------------------

SELECT *
FROM employees
LEFT JOIN departments
    ON employees.department = departments.department;

-- # RIGHT JOIN -----------------------------------------------------------------------------------

SELECT *
FROM employees
RIGHT JOIN departments
    ON employees.department = departments.department;

-- # FULL OUTER JOIN ------------------------------------------------------------------------------

SELECT *
FROM employees
FULL OUTER JOIN departments
    ON employees.department = departments.department;

-- # CROSS JOIN -----------------------------------------------------------------------------------

SELECT *
FROM employees
CROSS JOIN departments;

