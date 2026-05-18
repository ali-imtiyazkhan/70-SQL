-- 4. List all patients weighing between 100 and 120
-- Retrieve the first name and last name of all patients whose weight is between 100 and 120 (inclusive).
-- Write a SQL query to fetch the first_name and last_name from the patients table for all patients where the weight is between 100 and 120.

SELECT first_name, last_name
FROM patients
WHERE weight >= 100 AND weight <= 120;
-- or --
SELECT first_name, last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;
