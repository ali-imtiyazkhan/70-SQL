/*
  Description: Find the first_name, last_name, and allergies of patients from 'Hamilton' who have non-null allergies.
*/
SELECT 
    first_name, 
    last_name, 
    allergies
FROM patients
WHERE city = 'Hamilton' 
  AND allergies IS NOT NULL;
