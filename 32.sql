/*
  Description: Show the patient's first_name, last_name, and their admission diagnosis using a LEFT JOIN.
  This will show ALL patients from the patients table, even if they have never had an admission (their diagnosis will show as NULL).
*/
SELECT 
    patients.first_name, 
    patients.last_name, 
    admissions.diagnosis
FROM patients
LEFT JOIN admissions ON patients.patient_id = admissions.patient_id;
