/*
  Description: Show the patient's first_name, last_name, and their admission diagnosis using a FULL OUTER JOIN.
  This returns all records when there is a match in either left (patients) or right (admissions) table records.
  If a patient has no admissions, the diagnosis is NULL. If an admission matches no patient, the patient's name is NULL.
*/
SELECT 
    patients.first_name, 
    patients.last_name, 
    admissions.diagnosis
FROM patients
FULL OUTER JOIN admissions ON patients.patient_id = admissions.patient_id;
