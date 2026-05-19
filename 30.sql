/*
  Description: Show the city and the total number of patients in that city, but only for cities that have more than 5 patients.
*/
SELECT 
    city, 
    COUNT(*) AS total_patients
FROM patients
GROUP BY city
HAVING COUNT(*) > 5
ORDER BY total_patients DESC;
