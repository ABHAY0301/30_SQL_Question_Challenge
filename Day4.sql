/* IBM Data Analyst SQL Question
Q.1
Customer Segmentation Problem:
You have two tables: customers and orders.

customers table has columns: 
  customer_id, customer_name, age, gender.
orders table has columns: 
order_id, customer_id, order_date, total_amount.


Write an SQL query to find the average order amount 
for male and female customers separately
return the results with 2 DECIMAL.
*/

---- My Solution

SELECT
	c.gender,
	ROUND(AVG(o.total_amount),2) AS avg_amount
FROM customer AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.gender

--------------------------------------------------------------------------------------------------

/*
Q.2 You have been given a table named sales with the following columns:

order_id (unique identifier for each order)
order_date (date when the order was placed)
product_id (unique identifier for each product)
quantity (the quantity of the product ordered in that particular order)
price_per_unit (the price per unit of the product)

Write an SQL query to find out the total sales revenue generated for each month in the year 2023.
*/

---- My Solution

SELECT 
	TO_CHAR(order_date, 'month') AS months,
	SUM(quantity * price_per_unit) AS total_sales_revenue
FROM sales
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY months
ORDER BY EXTRACT(MONTH FROM MIN(order_date))