/*
  Description: Show all unique birth years from the patients table.
*/
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;
