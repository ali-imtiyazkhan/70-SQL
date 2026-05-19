/*
  Description: Find the first_name, last_name, and birth_date of patients who have height greater than 160 and weight greater than 70.
*/
SELECT 
    first_name, 
    last_name, 
    birth_date
FROM patients
WHERE height > 160 
  AND weight > 70;
