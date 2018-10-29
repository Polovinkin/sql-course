/* What is the lifetime average amount spent in terms of 
total_amt_usd for the top 10 total spending accounts? */

SELECT AVG(sum) FROM
	(SELECT a.name acc_name, SUM(total_amt_usd) sum
	FROM orders o
	JOIN accounts a
	ON a.id = o.account_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 10) top10