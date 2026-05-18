-- 5. Update allergies to 'NKA' for null values
-- Update the patients table to set allergies to 'NKA' where allergies is currently null.
-- Write a SQL query to update the allergies column to 'NKA' for all patients who have null in the allergies column.
-- Hint: Use UPDATE statement with SET and WHERE clause.

UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;
