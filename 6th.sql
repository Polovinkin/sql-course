/* What is the lifetime average amount spent in terms of total_amt_usd 
for only the companies that spent more than the average of all orders. */

SELECT AVG(avg_above) FROM
	(SELECT o.account_id, a.name, AVG(o.total_amt_usd) avg_above
	FROM orders o
	JOIN accounts a
	ON a.id = o.account_id
	GROUP BY 1, 2
	HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
								FROM orders o
								JOIN accounts a
								ON a.id = o.account_id)) sub2