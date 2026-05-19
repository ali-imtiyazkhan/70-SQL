# 70 SQL Exercises

This repository contains SQL exercise solutions and reference materials. It serves as a structured learning environment to master SQL queries.

## Repository Structure

* **SQL Exercise Solutions:** Individual files numbered sequentially (e.g., `1.sql`, `2.sql`, etc.).
* **Database Schema:** The structure of the database tables is defined in [schema.sql](schema.sql).

---

## Database Schema Overview

The database simulates a hospital environment and includes the following tables:

1. **`province_names`**: Maps province IDs to full province names.
2. **`patients`**: Stores patient profiles (name, gender, birth date, height, weight, allergies, province).
3. **`doctors`**: Stores doctor details and their specialty.
4. **`admissions`**: Records patient visits, including admission/discharge dates, diagnosis, and the attending doctor.

---

## SQL Functions & Clauses Reference Guide

Below is a detailed guide to all SQL functions, clauses, and logical expressions used in these exercises.

### 1. Aggregate Functions
Aggregate functions perform a calculation on a set of values and return a single value.

#### `COUNT()`
* **Purpose:** Counts the number of rows that match a specific criteria.
* **Example:** `COUNT(*)` counts all rows in a table or group.
* **Used in:** `13.sql`, `15.sql`, `20.sql`, `26.sql`, `27.sql`, `29.sql`, `30.sql`
* **Syntax:**
  ```sql
  SELECT COUNT(*) AS total_admissions FROM admissions;
  ```

#### `SUM()`
* **Purpose:** Calculates the total sum of a numeric column or expression.
* **Used in:** `24.sql`, `37.sql`
* **Syntax:**
  ```sql
  -- Summing values conditionally
  SELECT SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count FROM patients;
  ```

#### `MAX()`
* **Purpose:** Returns the maximum (largest) value in a set.
* **Used in:** `38.sql`
* **Syntax:**
  ```sql
  SELECT MAX(weight) FROM patients;
  ```

#### `MIN()`
* **Purpose:** Returns the minimum (smallest) value in a set.
* **Used in:** `38.sql`
* **Syntax:**
  ```sql
  SELECT MIN(weight) FROM patients;
  ```

---

### 2. Scalar Functions
Scalar functions operate on a single value and return a single value.

#### `LENGTH()`
* **Purpose:** Returns the number of characters in a string.
* **Used in:** `21.sql`, `23.sql`
* **Syntax:**
  ```sql
  -- Order names by how long they are
  SELECT first_name FROM patients ORDER BY LENGTH(first_name);
  ```

#### `YEAR()`
* **Purpose:** Extracts the year part from a date value.
* **Used in:** `19.sql`
* **Syntax:**
  ```sql
  -- Show years only
  SELECT YEAR(birth_date) FROM patients;
  ```
  *(Note: In SQLite, you might use `strftime('%Y', date_column)` instead).*

#### `DAY()`
* **Purpose:** Extracts the day of the month (1-31) from a date value.
* **Used in:** `39.sql`
* **Syntax:**
  ```sql
  -- Show days only
  SELECT DAY(admission_date) FROM admissions;
  ```
  *(Note: In SQLite, you might use `CAST(strftime('%d', date_column) AS INTEGER)` instead).*

#### `CONCAT()`
* **Purpose:** Concatenates two or more strings together.
* **Used in:** `6.sql`, `36.sql`
* **Syntax:**
  ```sql
  SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM patients;
  ```

#### `UPPER()`
* **Purpose:** Converts a string to uppercase.
* **Used in:** `36.sql`
* **Syntax:**
  ```sql
  SELECT UPPER(last_name) FROM patients;
  ```

#### `LOWER()`
* **Purpose:** Converts a string to lowercase.
* **Used in:** `36.sql`
* **Syntax:**
  ```sql
  SELECT LOWER(first_name) FROM patients;
  ```

---

### 3. Logical and Conditional Expressions

#### `CASE` Statement
* **Purpose:** Acts like an `if-then-else` statement. It evaluates conditions and returns a value when the first condition is met.
* **Used in:** `24.sql`
* **Syntax:**
  ```sql
  CASE 
      WHEN condition1 THEN result1
      WHEN condition2 THEN result2
      ELSE default_result
  END
  ```

---

### 4. Key Clauses & Operators

#### `DISTINCT`
* **Purpose:** Removes duplicate rows from the result set, showing only unique values.
* **Used in:** `16.sql`, `19.sql`
* **Syntax:**
  ```sql
  SELECT DISTINCT city FROM patients WHERE province_id = 'NS';
  ```

#### `LIKE`
* **Purpose:** Searches for a specified pattern in a column.
  * `%` represents zero, one, or multiple characters.
  * `_` represents a single character.
* **Used in:** `21.sql`
* **Syntax:**
  ```sql
  -- Finds names starting with 's' and ending with 's'
  SELECT first_name FROM patients WHERE first_name LIKE 's%s';
  ```

#### `IN`
* **Purpose:** Allows you to specify multiple values in a `WHERE` clause (shorthand for multiple `OR` conditions).
* **Used in:** `25.sql`
* **Syntax:**
  ```sql
  SELECT first_name FROM patients WHERE allergies IN ('Penicillin', 'Morphine');
  ```

#### `JOIN` / `INNER JOIN`
* **Purpose:** Combines rows from two or more tables based on a related column. It only returns rows where there is a match in both tables.
* **Used in:** `22.sql`, `31.sql`
* **Syntax:**
  ```sql
  SELECT patients.first_name, admissions.diagnosis
  FROM patients
  INNER JOIN admissions ON patients.patient_id = admissions.patient_id;
  ```

#### `LEFT JOIN` / `LEFT OUTER JOIN`
* **Purpose:** Returns all rows from the left table, and the matched rows from the right table. If there is no match, the result is NULL on the right side.
* **Used in:** `32.sql`
* **Syntax:**
  ```sql
  SELECT patients.first_name, admissions.diagnosis
  FROM patients
  LEFT JOIN admissions ON patients.patient_id = admissions.patient_id;
  ```

#### `RIGHT JOIN` / `RIGHT OUTER JOIN`
* **Purpose:** Returns all rows from the right table, and the matched rows from the left table. If there is no match, the result is NULL on the left side.
* **Used in:** `33.sql`
* **Syntax:**
  ```sql
  SELECT patients.first_name, admissions.diagnosis
  FROM patients
  RIGHT JOIN admissions ON patients.patient_id = admissions.patient_id;
  ```

#### `FULL JOIN` / `FULL OUTER JOIN`
* **Purpose:** Returns all rows when there is a match in either the left or the right table. If there is no match, the non-matching side will contain NULLs.
* **Used in:** `34.sql`
* **Syntax:**
  ```sql
  SELECT patients.first_name, admissions.diagnosis
  FROM patients
  FULL OUTER JOIN admissions ON patients.patient_id = admissions.patient_id;
  ```

#### `GROUP BY`
* **Purpose:** Groups rows that have the same values in specified columns into summary rows (like "total patients by city").
* **Used in:** `20.sql`, `26.sql`, `27.sql`, `29.sql`, `30.sql`, `37.sql`
* **Syntax:**
  ```sql
  SELECT city, COUNT(*) FROM patients GROUP BY city;
  ```

#### `HAVING`
* **Purpose:** Filters groups created by the `GROUP BY` clause (used instead of `WHERE` when filtering aggregates).
* **Used in:** `20.sql`, `26.sql`, `30.sql`, `37.sql`
* **Syntax:**
  ```sql
  -- Only show groups where the count is greater than 1
  SELECT patient_id, diagnosis 
  FROM admissions 
  GROUP BY patient_id, diagnosis 
  HAVING COUNT(*) > 1;
  ```

#### `ORDER BY`
* **Purpose:** Sorts the result set in ascending (`ASC`, default) or descending (`DESC`) order. You can sort by multiple columns.
* **Used in:** `19.sql`, `23.sql`, `25.sql`, `27.sql`, `29.sql`, `30.sql`
* **Syntax:**
  ```sql
  SELECT city FROM patients ORDER BY total_patients DESC, city ASC;
  ```

---

### 5. Set Operators

#### `UNION` / `UNION ALL`
* **Purpose:** Combines the result sets of two or more `SELECT` statements into a single result set.
  * `UNION` removes duplicate rows between the combined queries.
  * `UNION ALL` keeps all rows, including duplicates (which is faster).
* **Used in:** `28.sql`
* **Syntax:**
  ```sql
  SELECT first_name, last_name, 'Patient' AS role FROM patients
  UNION ALL
  SELECT first_name, last_name, 'Doctor' AS role FROM doctors;
  ```
