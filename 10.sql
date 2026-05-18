SELECT COUNT(*) AS unique_birth_years
FROM (SELECT DISTINCT YEAR(birth_date) FROM patients) AS unique_years;
