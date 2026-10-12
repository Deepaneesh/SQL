-- IF CLAUSE IN SQL

SELECT 
 *,
 IIF(was_successful = 1, 'No action required', 'Perform an audit') AS  audit
FROM
 transactions;

-- BETWEEN IN SQL

SELECT
  employee_name,
  salary
FROM
  employees
WHERE
  salary BETWEEN 30000 AND 60000;

SELECT
  product_name,
  quantity
FROM
  products
WHERE
  quantity NOT BETWEEN 20 AND 100;

-- -----------------------USING DISTINCT IN SQL----------------------------------------------------------------

SELECT 
  DISTINCT country_code
FROM
 users;

-- ------------------------ multiple logics -----------------------------------------------------------------------

SELECT
  *
FROM
  users
WHERE
  country_code = 'CA' AND
  age < 18;


-- ------------------------------ we need to use conditions seperatelly.-----------------------------------------

SELECT 
  COUNT(*) AS junior_count
FROM
  users
WHERE
  (
  country_code = 'CA' 
  OR country_code = 'US'
  ) 
  AND age < 18;

-- -------- IN CASE IN SQL --------------------------------------------

SELECT 
  name,
  age,
  country_code
FROM
  users
WHERE
 country_code IN ('US','CA','MX');


-- --------- LIKE ----------------------------------------------------

-- STARTS WITH BA
SELECT
  *
FROM
  products
WHERE
  product_name LIKE 'BA%';

-- ENDS WITH BA

SELECT
  *
FROM
  products
WHERE
  product_name LIKE '%BA';

-- CONTAINS 'BA'

SELECT
  *
FROM
  products
WHERE
  product_name LIKE '%BA%';

-- Starts with Bo and have 5 Characters 

SELECT
  *
FROM
  users
WHERE
  name LIKE 'Bo___';


-- ORDER BY 

-- BY DEFAULT THE ORDER BY IS ASCENDING ORDER


SELECT
  *
FROM
  transactions
WHERE
  amount BETWEEN 10 AND 80
ORDER BY
 amount DESC;

-- ABORTGROUP BY AND AGGRIGATION

SELECT
  user_id,
  SUM(amount) AS balance
FROM
  transactions
WHERE
  was_successful = 1
GROUP BY
  user_id;

-- multiple conditions ---------------------------------------------
-- Note having should be used only on the grouped calculated value

SELECT
  sender_id,
  SUM(amount) AS balance
FROM
  transactions
WHERE
  note LIKE '%lunch%'
  AND sender_id NOT NULL
  AND was_successful = 1
GROUP BY
  sender_id
HAVING 
  SUM(amount) >20
ORDER BY
  balance;
