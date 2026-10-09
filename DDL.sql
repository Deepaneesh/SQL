-- DDL ====================================================

-- Data Definition Language

-- DDL => Create, Alter, Drop, Truncate


-- =========================================================
-- 1. CREATE DATABASE OBJECTS
-- =========================================================

-- SQLite creates or opens a database file when connected
-- to a database. It does not support CREATE DATABASE.

-- =========================================================
-- 2. CREATE TABLE
-- =========================================================

-- Create a new table named employees

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    department TEXT,
    salary REAL DEFAULT 0,
    email TEXT UNIQUE
);


-- =========================================================
-- 3. CREATE TABLE IF NOT EXISTS
-- =========================================================

-- Create the table only if it does not already exist

CREATE TABLE IF NOT EXISTS departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);


-- =========================================================
-- 4. ALTER TABLE: ADD COLUMN & Drop COLUMN
-- =========================================================

-- Add a new column to the existing employees table

ALTER TABLE employees
ADD COLUMN city TEXT;

-- =========================================================
-- Drop a column from the employees table
-- SQLite does not support dropping columns directly.
-- =========================================================

ALTER TABLE employees
DROP COLUMN city; 
-- Note: This is not supported in SQLite. You would need to create a new table without the column and copy the data over.


-- =========================================================
-- 5. ALTER TABLE: RENAME COLUMN
-- =========================================================

-- Rename the city column to location

ALTER TABLE employees
RENAME COLUMN city TO location;


-- =========================================================
-- 6. ALTER TABLE: RENAME TABLE
-- =========================================================

-- Rename the employees table

ALTER TABLE employees
RENAME TO employee_details;


-- =========================================================
-- 7. CREATE INDEX
-- =========================================================

-- Create an index to help queries filtering by department

CREATE INDEX idx_employee_department
ON employee_details(department);


-- Create a unique index to prevent duplicate email values
-- SQLite also allows multiple NULL values in a unique index

CREATE UNIQUE INDEX idx_employee_email
ON employee_details(email);


-- =========================================================
-- 8. DROP INDEX
-- =========================================================

-- Remove an index without deleting the table

DROP INDEX idx_employee_department;


-- =========================================================
-- 9. CREATE VIEW
-- =========================================================

-- Create a virtual table based on a saved query

CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    name,
    department,
    salary
FROM employee_details
WHERE salary > 40000;


-- =========================================================
-- 10. DROP VIEW
-- =========================================================

-- Delete the view definition

DROP VIEW high_salary_employees;


-- =========================================================
-- 11. DROP TABLE
-- =========================================================

-- Delete the departments table and its data

DROP TABLE departments;


-- =========================================================
-- 12. DROP TABLE IF EXISTS
-- =========================================================

-- Delete employee_details only if it exists

DROP TABLE IF EXISTS employee_details;


-- =========================================================
-- END OF DDL SCRIPT
-- =========================================================