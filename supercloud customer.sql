Select customer_id
from
(Select cc.customer_id,cc.product_id,p.product_category from customer_contracts cc
left join products p 
on cc.product_id=p.product_id) as join_table
group by customer_id
having count(DISTINCT(product_category))=(Select count(distinct product_category) from
products)