/*
  Description: Show all unique birth years from the patients table and the count of patients for each year.
*/
SELECT 
  YEAR(birth_date) AS birth_year,
  COUNT(*) AS total_patients
FROM patients
GROUP BY YEAR(birth_date)
ORDER BY birth_year;
