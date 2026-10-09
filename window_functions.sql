-- =========================================================
-- 1. CREATE SAMPLE TABLE
-- =========================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary REAL,
    hire_date TEXT
);

INSERT INTO employees VALUES
(1, 'Arun',   'IT',      50000, '2022-01-15'),
(2, 'Priya',  'HR',      40000, '2022-03-10'),
(3, 'Ravi',   'IT',      60000, '2021-06-20'),
(4, 'Divya',  'Finance', 45000, '2023-02-01'),
(5, 'Kumar',  'IT',      60000, '2022-07-12'),
(6, 'Meena',  'HR',      50000, '2021-09-25'),
(7, 'Ajay',   'Finance', 45000, '2022-11-18'),
(8, 'Sneha',  'IT',      70000, '2020-04-05'),
(9, 'Vijay',  'HR',      40000, '2023-05-15'),
(10, 'Anu',   'Finance', 55000, '2021-12-30');


-- =========================================================
-- 2. ROW_NUMBER()
-- =========================================================

SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC, employee_id
    ) AS row_num
FROM employees;


-- ROW_NUMBER WITH PARTITION BY

SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC, employee_id
    ) AS row_num
FROM employees;


-- =========================================================
-- 3. RANK()
-- =========================================================

SELECT
    name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- RANK BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- =========================================================
-- 4. DENSE_RANK()
-- =========================================================

SELECT
    name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS dense_rank
FROM employees;


-- =========================================================
-- 5. NTILE()
-- =========================================================

SELECT
    name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC, employee_id
    ) AS salary_group
FROM employees;


-- NTILE BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    NTILE(2) OVER (
        PARTITION BY department
        ORDER BY salary DESC, employee_id
    ) AS salary_group
FROM employees;


-- =========================================================
-- 6. LAG()
-- =========================================================

SELECT
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;


-- LAG WITH SALARY DIFFERENCE

SELECT
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY employee_id
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY employee_id
    ) AS salary_difference
FROM employees;


-- LAG WITH PARTITION BY

SELECT
    name,
    department,
    salary,
    LAG(salary) OVER (
        PARTITION BY department
        ORDER BY hire_date, employee_id
    ) AS previous_salary
FROM employees;


-- LAG WITH OFFSET 2

SELECT
    name,
    salary,
    LAG(salary, 2) OVER (
        ORDER BY employee_id
    ) AS salary_two_rows_before
FROM employees;


-- LAG WITH DEFAULT VALUE

SELECT
    name,
    salary,
    LAG(salary, 1, 0) OVER (
        ORDER BY employee_id
    ) AS previous_salary
FROM employees;


-- =========================================================
-- 7. LEAD()
-- =========================================================

SELECT
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;


-- LEAD WITH SALARY DIFFERENCE

SELECT
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) AS next_salary,
    LEAD(salary) OVER (
        ORDER BY employee_id
    ) - salary AS next_salary_difference
FROM employees;


-- LEAD WITH OFFSET 2

SELECT
    name,
    salary,
    LEAD(salary, 2) OVER (
        ORDER BY employee_id
    ) AS salary_two_rows_ahead
FROM employees;


-- LEAD WITH DEFAULT VALUE

SELECT
    name,
    salary,
    LEAD(salary, 1, 0) OVER (
        ORDER BY employee_id
    ) AS next_salary
FROM employees;


-- =========================================================
-- 8. SUM() WINDOW FUNCTION
-- =========================================================

-- TOTAL SALARY

SELECT
    name,
    salary,
    SUM(salary) OVER () AS total_salary
FROM employees;


-- TOTAL SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total
FROM employees;


-- RUNNING TOTAL

SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_total
FROM employees;


-- RUNNING TOTAL BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS department_running_total
FROM employees;


-- =========================================================
-- 9. AVG() WINDOW FUNCTION
-- =========================================================

-- OVERALL AVERAGE

SELECT
    name,
    salary,
    AVG(salary) OVER () AS overall_average
FROM employees;


-- DEPARTMENT AVERAGE

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employees;


-- RUNNING AVERAGE

SELECT
    employee_id,
    name,
    salary,
    AVG(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_average
FROM employees;


-- =========================================================
-- 10. MIN() AND MAX()
-- =========================================================

-- MINIMUM SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    MIN(salary) OVER (
        PARTITION BY department
    ) AS department_min_salary
FROM employees;


-- MAXIMUM SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) AS department_max_salary
FROM employees;


-- RUNNING MAXIMUM

SELECT
    employee_id,
    name,
    salary,
    MAX(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_maximum
FROM employees;


-- RUNNING MINIMUM

SELECT
    employee_id,
    name,
    salary,
    MIN(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_minimum
FROM employees;


-- =========================================================
-- 11. COUNT()
-- =========================================================

-- TOTAL EMPLOYEE COUNT

SELECT
    name,
    COUNT(*) OVER () AS total_employees
FROM employees;


-- EMPLOYEE COUNT BY DEPARTMENT

SELECT
    name,
    department,
    COUNT(*) OVER (
        PARTITION BY department
    ) AS department_count
FROM employees;


-- RUNNING COUNT

SELECT
    employee_id,
    name,
    COUNT(*) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_count
FROM employees;


-- =========================================================
-- 12. FIRST_VALUE()
-- =========================================================

-- HIGHEST SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC, employee_id
    ) AS highest_salary
FROM employees;


-- FIRST EMPLOYEE HIRED BY DEPARTMENT

SELECT
    name,
    department,
    hire_date,
    FIRST_VALUE(name) OVER (
        PARTITION BY department
        ORDER BY hire_date, employee_id
    ) AS first_hired_employee
FROM employees;


-- =========================================================
-- 13. LAST_VALUE()
-- =========================================================

-- LAST HIRED EMPLOYEE'S SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY department
        ORDER BY hire_date, employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS last_hired_salary
FROM employees;


-- LAST HIRED EMPLOYEE NAME

SELECT
    name,
    department,
    hire_date,
    LAST_VALUE(name) OVER (
        PARTITION BY department
        ORDER BY hire_date, employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS last_hired_employee
FROM employees;


-- =========================================================
-- 14. NTH_VALUE()
-- =========================================================

-- SECOND-HIGHEST SALARY BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    NTH_VALUE(salary, 2) OVER (
        PARTITION BY department
        ORDER BY salary DESC, employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS second_highest_salary
FROM employees;


-- =========================================================
-- 15. PERCENT_RANK()
-- =========================================================

SELECT
    name,
    salary,
    PERCENT_RANK() OVER (
        ORDER BY salary
    ) AS percent_rank
FROM employees;


-- PERCENT_RANK BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    PERCENT_RANK() OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS department_percent_rank
FROM employees;


-- =========================================================
-- 16. CUME_DIST()
-- =========================================================

SELECT
    name,
    salary,
    CUME_DIST() OVER (
        ORDER BY salary
    ) AS cumulative_distribution
FROM employees;


-- CUME_DIST BY DEPARTMENT

SELECT
    name,
    department,
    salary,
    CUME_DIST() OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS department_cume_dist
FROM employees;


-- =========================================================
-- 17. ROWS WINDOW FRAMES
-- =========================================================

-- CURRENT ROW AND TWO PRECEDING ROWS

SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN 2 PRECEDING
                 AND CURRENT ROW
    ) AS rolling_sum
FROM employees;


-- CURRENT ROW AND TWO FOLLOWING ROWS

SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN CURRENT ROW
                 AND 2 FOLLOWING
    ) AS forward_sum
FROM employees;


-- TWO PRECEDING THROUGH TWO FOLLOWING ROWS

SELECT
    employee_id,
    name,
    salary,
    AVG(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN 2 PRECEDING
                 AND 2 FOLLOWING
    ) AS moving_average
FROM employees;


-- =========================================================
-- 18. RANGE WINDOW FRAME
-- =========================================================

SELECT
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
        RANGE BETWEEN UNBOUNDED PRECEDING
                  AND CURRENT ROW
    ) AS cumulative_salary
FROM employees;


-- =========================================================
-- 19. EXCLUDE CURRENT ROW
-- =========================================================

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
        EXCLUDE CURRENT ROW
    ) AS average_of_other_employees
FROM employees;


-- =========================================================
-- 20. EXCLUDE GROUP
-- =========================================================

SELECT
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
        RANGE BETWEEN UNBOUNDED PRECEDING
                  AND UNBOUNDED FOLLOWING
        EXCLUDE GROUP
    ) AS sum_excluding_salary_peers
FROM employees;


-- =========================================================
-- 21. MULTIPLE WINDOW FUNCTIONS IN ONE QUERY
-- =========================================================

SELECT
    name,
    department,
    salary,

    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC, employee_id
    ) AS row_num,

    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dense_rank,

    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average,

    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total,

    LAG(salary) OVER (
        PARTITION BY department
        ORDER BY employee_id
    ) AS previous_salary,

    LEAD(salary) OVER (
        PARTITION BY department
        ORDER BY employee_id
    ) AS next_salary

FROM employees;


-- =========================================================
-- 22. NAMED WINDOWS
-- =========================================================

SELECT
    name,
    department,
    salary,

    AVG(salary) OVER department_window
        AS department_average,

    SUM(salary) OVER department_window
        AS department_total,

    MAX(salary) OVER department_window
        AS department_maximum

FROM employees

WINDOW department_window AS (
    PARTITION BY department
);


-- =========================================================
-- 23. ADVANCED ANALYTICAL QUERY USING A CTE
-- =========================================================

WITH employee_analysis AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        hire_date,

        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank,

        AVG(salary) OVER (
            PARTITION BY department
        ) AS department_average,

        LAG(salary) OVER (
            PARTITION BY department
            ORDER BY hire_date, employee_id
        ) AS previous_hired_salary,

        SUM(salary) OVER (
            PARTITION BY department
            ORDER BY hire_date, employee_id
            ROWS BETWEEN UNBOUNDED PRECEDING
                     AND CURRENT ROW
        ) AS department_running_salary

    FROM employees
)

SELECT
    *,
    salary - department_average AS difference_from_average
FROM employee_analysis
ORDER BY department, salary_rank;


-- =========================================================
-- 24. FILTER TOP-RANKED EMPLOYEES USING A CTE
-- =========================================================

WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,

        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC, employee_id
        ) AS row_num

    FROM employees
)

SELECT *
FROM ranked_employees
WHERE row_num = 1;


-- =========================================================
-- 25. FILTER TOP THREE EMPLOYEES PER DEPARTMENT
-- =========================================================

WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,

        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank

    FROM employees
)

SELECT *
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY department, salary_rank;


-- =========================================================
-- END OF WINDOW FUNCTIONS SCRIPT
-- =========================================================