/*
  Description: Show the patient's first_name, last_name, and their admission diagnosis using a RIGHT JOIN.
  This returns all records from the admissions table (right), and matched records from patients (left).
  If there is an admission without a matching patient, the patient's name will appear as NULL.
*/
SELECT 
    patients.first_name, 
    patients.last_name, 
    admissions.diagnosis
FROM patients
RIGHT JOIN admissions ON patients.patient_id = admissions.patient_id;
