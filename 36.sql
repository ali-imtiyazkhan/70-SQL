/*
  Description: Display each patient's full name in a single column. 
  Their last_name in all upper letters must appear first, then first_name in all lower case letters, separated by a comma. 
  Order the list by the first_name in descending order.
  EX: SMITH,jane
*/
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS formatted_name
FROM patients
ORDER BY first_name DESC;
