/*
  Description: Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
  Note: Your answer will have 3 rows (Halifax, New Glasgow, Sydney).
*/
SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';
