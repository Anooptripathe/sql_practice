with ranked as (Select item_count as mode,
rank()over(order by order_occurrences DESC) rn
from items_per_order)
Select mode from ranked where rn=1
order by mode ASC