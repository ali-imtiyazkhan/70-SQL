/*
  Description: Show first_name, last_name, and the total number of admissions attended for each doctor.
*/
SELECT 
    first_name, 
    last_name, 
    COUNT(*) AS admissions_count
FROM admissions
JOIN doctors ON doctors.doctor_id = admissions.attending_doctor_id
GROUP BY doctor_id;
