/* For the customer that spent the most (in total over their lifetime as a customer)
 total_amt_usd, how many web_events did they have for each channel? */
 
SELECT sub1.name, w.channel, COUNT(*)
FROM
	(SELECT a.id, a.name, SUM(total_amt_usd)
	FROM accounts a
	JOIN orders o
	ON o.account_id = a.id
	GROUP BY 1,2
	ORDER BY 3 DESC
	LIMIT 1) sub1

JOIN web_events w
ON w.account_id = sub1.id
GROUP BY 1,2
