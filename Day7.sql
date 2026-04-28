/*
-- Amazon Interview question

Question:
Write a query to identify the top two highest-grossing products 
within each category in the year 2022. Output should include the category,
product, and total spend.

*/



-- ----------------------------------------------
-- My solution
-- ----------------------------------------------


WITH ranked_products AS (
  SELECT 
    category,
    product,
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rn
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY 1,2
)
SELECT
  category,
  product,
  total_spend
FROM ranked_products
WHERE rn = 1 OR rn = 2



-- Question link https://datalemur.com/questions/sql-highest-grossing
