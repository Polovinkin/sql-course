/* Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
*/

SELECT sub3.rep_name, sub2.reg_name, sub2.max_cash
FROM 
	(SELECT reg_name, MAX(cash_earned) max_cash
	FROM
		(SELECT r.name reg_name, s.name rep_name, SUM(total_amt_usd) cash_earned
		FROM orders o
		JOIN accounts a
		ON o.account_id = a.id
		JOIN sales_reps s
		ON s.id = a.sales_rep_id
		JOIN region r
		ON s.region_id =
		r.id
		GROUP BY 1,2
		ORDER BY 3 DESC) sub1
	GROUP BY 1) sub2
JOIN 
	(SELECT r.name reg_name, s.name rep_name, SUM(total_amt_usd) cash_earned
	FROM orders o
	JOIN accounts a
	ON o.account_id = a.id
	JOIN sales_reps s
	ON s.id = a.sales_rep_id
	JOIN region r
	ON s.region_id = r.id
	GROUP BY 1,2
	ORDER BY 3 DESC) sub3
ON sub2.max_cash = sub3.cash_earned AND sub2.reg_name = sub3.reg_name;

-------------

WITH sub1 AS(
	SELECT r.name reg_name, s.name rep_name, SUM(total_amt_usd) cash_earned
	FROM orders o
	JOIN accounts a
	ON o.account_id = a.id
	JOIN sales_reps s
	ON s.id = a.sales_rep_id
	JOIN region r
	ON s.region_id =
	r.id
	GROUP BY 1,2
	ORDER BY 3 DESC),
	
	sub2 AS(
	SELECT 

SELECT sub3.rep_name, sub2.reg_name, sub2.max_cash
FROM 
	(SELECT reg_name, MAX(cash_earned) max_cash
	FROM sub1)
GROUP BY 1
JOIN 