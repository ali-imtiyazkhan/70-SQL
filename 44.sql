/*
  Description: Display the province name and the total amount of patients for each province. Order by descending.
*/
SELECT 
    province_names.province_name, 
    COUNT(*) AS patient_count
FROM patients
JOIN province_names ON province_names.province_id = patients.province_id
GROUP BY province_names.province_name
ORDER BY patient_count DESC;
