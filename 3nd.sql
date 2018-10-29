/* For the name of the account that purchased the most 
(in total over their lifetime as a customer) standard_qty paper, 
how many accounts still had more in total purchases? */

SELECT COUNT(*) FROM
	(SELECT a.name acc_name
	FROM orders o
	JOIN accounts a
	ON a.id = o.account_id
	GROUP BY 1
	HAVING SUM(o.total) > (
		SELECT total_qty FROM
			(SELECT a.name, SUM(standard_qty) std_qty, SUM(total) total_qty
			FROM orders o
			JOIN accounts a
			ON a.id = o.account_id
			GROUP BY 1
			ORDER BY 2 DESC
			LIMIT 1) sub1 )
	) sub2