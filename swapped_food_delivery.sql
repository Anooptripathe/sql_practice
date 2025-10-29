SELECT o1.order_id as corrected_order_id,COALESCE(o2.item,o1.item)
FROM orders o1 LEFT JOIN orders o2
ON (o1.order_id % 2=1 AND o1.order_id=o2.order_id-1)OR(o1.order_id % 2=0 AND o1.order_id=o2.order_id+1);
