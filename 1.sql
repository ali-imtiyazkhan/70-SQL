-- Description: This query retrieves the first name, last name, and gender of all male patients.
select first_name, last_name,gender
FROM patients
where gender = 'M'

