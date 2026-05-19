/*
  Description: Show all allergies ordered by popularity. Remove NULL values from query.
*/
SELECT 
    allergies, 
    COUNT(*) AS popularity
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY popularity DESC;
