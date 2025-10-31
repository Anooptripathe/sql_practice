with cte AS 
(
SELECT transaction_date, user_id, count(product_id) AS purchase_count,
ROW_NUMBER() over(partition by user_id order by transaction_date desc) as RN
FROM  user_transactions
group by transaction_date, user_id
)

select transaction_date, user_id, purchase_count
from cte
where RN=1
order by transaction_date;