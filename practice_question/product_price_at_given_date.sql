# Write your MySQL query statement below
 With cte1 as
 (
    Select distinct product_id from Products
 ),
 cte2 as
 (Select product_id,new_price as price 
    from Products where
    (product_id,change_date) in
    (
        Select product_id , MAX(change_date) as change_date
        from Products
        where change_date<='2019-08-16'
        group by product_id
    )
    )
    Select cte1.product_id,ifnull(price,10) as price
    from cte1
    left join cte2
    on cte1.product_id=cte2.product_id
    