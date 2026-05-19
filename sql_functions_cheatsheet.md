# SQL Functions and Clauses Cheat Sheet

This reference document explains the SQL functions, clauses, and expressions used in your exercises, along with examples of how they work.

---

## 1. Aggregate Functions

Aggregate functions perform a calculation on a set of values and return a single value.

### `COUNT()`
* **Purpose:** Counts the number of rows that match a specific criteria.
* **Example:** `COUNT(*)` counts all rows in a table or group.
* **Used in:** `13.sql`, `15.sql`, `20.sql`, `26.sql`, `27.sql`
* **Syntax:**
  ```sql
  SELECT COUNT(*) AS total_admissions FROM admissions;
  ```

### `SUM()`
* **Purpose:** Calculates the total sum of a numeric column or expression.
* **Used in:** `24.sql`
* **Syntax:**
  ```sql
  -- Summing values conditionally
  SELECT SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count FROM patients;
  ```

---

## 2. Scalar Functions

Scalar functions operate on a single value and return a single value based on the input.

### `LENGTH()`
* **Purpose:** Returns the number of characters in a string. (Note: in some SQL dialects, this is `LEN()`).
* **Used in:** `21.sql`, `23.sql`
* **Syntax:**
  ```sql
  -- Order names by how long they are
  SELECT first_name FROM patients ORDER BY LENGTH(first_name);
  ```

### `YEAR()`
* **Purpose:** Extracts the year part from a date value.
* **Used in:** `19.sql`
* **Syntax:**
  ```sql
  -- Show years only
  SELECT YEAR(birth_date) FROM patients;
  ```
  *(Note: In SQLite, you might use `strftime('%Y', date_column)` instead).*

---

## 3. Logical and Conditional Expressions

### `CASE` Statement
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

## 4. Key Clauses & Operators

### `DISTINCT`
* **Purpose:** Removes duplicate rows from the result set, showing only unique values.
* **Used in:** `16.sql`, `19.sql`
* **Syntax:**
  ```sql
  SELECT DISTINCT city FROM patients WHERE province_id = 'NS';
  ```

### `LIKE`
* **Purpose:** Searches for a specified pattern in a column.
  * `%` represents zero, one, or multiple characters.
  * `_` represents a single character.
* **Used in:** `21.sql`
* **Syntax:**
  ```sql
  -- Finds names starting with 's' and ending with 's'
  SELECT first_name FROM patients WHERE first_name LIKE 's%s';
  ```

### `IN`
* **Purpose:** Allows you to specify multiple values in a `WHERE` clause (shorthand for multiple `OR` conditions).
* **Used in:** `25.sql`
* **Syntax:**
  ```sql
  SELECT first_name FROM patients WHERE allergies IN ('Penicillin', 'Morphine');
  ```

### `JOIN` (Inner Join)
* **Purpose:** Combines rows from two or more tables based on a related column between them.
* **Used in:** `22.sql`
* **Syntax:**
  ```sql
  SELECT patients.first_name, admissions.diagnosis
  FROM patients
  JOIN admissions ON patients.patient_id = admissions.patient_id;
  ```

### `GROUP BY`
* **Purpose:** Groups rows that have the same values in specified columns into summary rows (like "total patients by city").
* **Used in:** `20.sql`, `26.sql`, `27.sql`
* **Syntax:**
  ```sql
  SELECT city, COUNT(*) FROM patients GROUP BY city;
  ```

### `HAVING`
* **Purpose:** Filters groups created by the `GROUP BY` clause (used instead of `WHERE` when filtering aggregates).
* **Used in:** `20.sql`, `26.sql`
* **Syntax:**
  ```sql
  -- Only show groups where the count is greater than 1
  SELECT patient_id, diagnosis 
  FROM admissions 
  GROUP BY patient_id, diagnosis 
  HAVING COUNT(*) > 1;
  ```

### `ORDER BY`
* **Purpose:** Sorts the result set in ascending (`ASC`, default) or descending (`DESC`) order. You can sort by multiple columns.
* **Used in:** `19.sql`, `23.sql`, `25.sql`, `27.sql`
* **Syntax:**
  ```sql
  SELECT city FROM patients ORDER BY total_patients DESC, city ASC;
  ```

---

## 5. Set Operators

### `UNION` / `UNION ALL`
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

