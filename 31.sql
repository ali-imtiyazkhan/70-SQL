/*
  Description: Show the patient's first_name and last_name.
  Then, use the admissions table to find out how many patients were admitted for each diagnosis. Show the result in two columns: diagnosis and patient_count.
*/
SELECT 
    admissions.diagnosis,
    COUNT(patients.patient_id) AS patient_count
FROM patients
JOIN admissions ON patients.patient_id = admissions.patient_id
GROUP BY admissions.diagnosis;
