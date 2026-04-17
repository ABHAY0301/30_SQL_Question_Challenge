/*
-- UBER DATA ANALYST INTERVIEW QUESTION
Question:
Write a SQL query to obtain the third transaction of every user. 
Output the user id, spend, and transaction date.

--Question Link -- https://datalemur.com/questions/sql-third-transaction

*/

---- My Solution 

WITH CTE
AS (SELECT 
	user_id,
	spend,
	transaction_date,
	ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS third_trans
FROM transactions
)

SELECT user_id,
	spend,
	transaction_date
FROM CTE 
WHERE third_trans  = 3

--------------------------------------------------------------------------------------------------------------

/*
Question:
Find the top 5 products whose revenue has decreased in comparison to the 
previous year (both 2022 and 2023). Return the product name, 
revenue for the previous year, revenue for the current year, 
revenue decreased, and the decreased ratio (percentage).
*/

---- My Solution 

WITH CTE1
AS (
	SELECT 
		product_name,
		SUM(revenue) AS revenue
	FROM product_revenue
	WHERE year = '2022'
	GROUP BY product_name
	)
,
CTE2
AS (
	SELECT 
		product_name,
		SUM(revenue) AS revenue
	FROM product_revenue
	WHERE year = '2023'
	GROUP BY product_name
)

SELECT
	CTE1.product_name,
	CTE1.revenue AS previous_year_revenue,
	CTE2.revenue AS current_year_revenue,
	(CTE1.revenue - CTE2.revenue) AS revenue_decreased,
	ROUND((CTE1.revenue - CTE2.revenue) * 100.0/CTE1.revenue,2) AS revenue_decreased_ratio
FROM CTE1
JOIN CTE2
ON CTE1.product_name = CTE2.product_name
WHERE CTE1.revenue > CTE2.revenue
ORDER BY revenue_decreased DESC
LIMIT 5

