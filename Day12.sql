/*
SQL Question 1: Identify IBM's High Capacity Users

SQL Question: 
Identify users who have made purchases 
totaling more than $10,000 in the last month 
from the purchases table. 
The table contains information about purchases, 
including the user ID, date of purchase, product ID, 
and amount spent.
*/

-- ---------------------------------
-- My Solution
-- ---------------------------------

SELECT 
	user_id,
	SUM(amount_spent) AS total_spend
FROM purchases
WHERE date_of_purchase BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY user_id
HAVING SUM(amount_spent) >10000

--------------------------------------------------------------------------------------

/*
SQL Question 2: Average Duration of Employee's Service
Given the data on IBM employees, can you find the average duration 
of service for employees across different departments? 
The Duration of service is represented as end_date - start_date. 
If end_date is NULL, consider it as the current date.
*/

-- ---------------------------------
-- My Solution
-- ---------------------------------

SELECT 
	department,
	ROUND(AVG((COALESCE(end_date, CURRENT_DATE) - start_date) ::NUMERIC ),1) AS duration_of_service
FROM employee_service
GROUP BY department
ORDER BY duration_of_service
