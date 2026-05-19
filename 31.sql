/*
  Description: Show the patient's first_name, last_name, and their admission diagnosis using an INNER JOIN.
  This will only show patients who have actually been admitted (have a matching record in the admissions table).
*/
SELECT 
    patients.first_name, 
    patients.last_name, 
    admissions.diagnosis
FROM patients
INNER JOIN admissions ON patients.patient_id = admissions.patient_id;
