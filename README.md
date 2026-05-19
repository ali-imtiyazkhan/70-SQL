# 70 SQL Exercises

This repository contains SQL exercise solutions and reference materials. It serves as a structured learning environment to master SQL queries.

## Repository Structure

* **SQL Exercise Solutions:** Individual files numbered sequentially (e.g., `1.sql`, `2.sql`, etc.).
* **Database Schema:** The structure of the database tables is defined in [schema.sql](schema.sql).
* **Cheat Sheet:** A comprehensive guide to the SQL functions and clauses used in these solutions can be found in [sql_functions_cheatsheet.md](sql_functions_cheatsheet.md).

## Schema Overview

The database simulates a hospital environment and includes the following tables:

1. **`province_names`**: Maps province IDs to full province names.
2. **`patients`**: Stores patient profiles (name, gender, birth date, height, weight, allergies, province).
3. **`doctors`**: Stores doctor details and their specialty.
4. **`admissions`**: Records patient visits, including admission/discharge dates, diagnosis, and the attending doctor.
