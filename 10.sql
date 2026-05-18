/*
  Description: Show the count of all unique birth years from the patients table.
*/
SELECT COUNT(DISTINCT YEAR(birth_date)) AS unique_birth_years
FROM patients;
