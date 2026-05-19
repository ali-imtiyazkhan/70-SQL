/*
  Description: Show unique first names from the patients table which only occur once in the list.
*/
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name) = 1;
