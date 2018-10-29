/* For the region with the largest (sum) of sales total_amt_usd,
how many total (count) orders were placed?  */

SELECT sub1.reg_name, sub2.orders_count
FROM
/* Returns largest region name and sum of dollars ordered */
	(SELECT r.name reg_name, SUM(standard_amt_usd)
	FROM orders o
	JOIN accounts a
	ON o.account_id = a.id
	JOIN sales_reps s
	ON s.id = a.sales_rep_id
	JOIN region r
	ON s.region_id = r.id
	GROUP BY reg_name
	ORDER BY 2 DESC
	LIMIT 1) sub1

JOIN 
	/*Reg name and total count of orders in each */
	(SELECT r.name reg_name, COUNT(*) orders_count
	FROM orders o
	JOIN accounts a
	ON o.account_id = a.id
	JOIN sales_reps s
	ON s.id = a.sales_rep_id
	JOIN region r
	ON s.region_id = r.id
	GROUP BY reg_name) sub2
ON sub1.reg_name = sub2.reg_name