with cte AS
(
Select measurement_id,measurement_value, cast(measurement_time as date) as measurement_day,
row_number() over(PARTITION BY cast(measurement_time as date))
order by measurement_time as row_no
from measurements
)
Select measurement_day,
CASE
Sum(WHEN row_no%2==1 then measurement_value else 0 end) as odd_sum
Sum(WHEN row_no%2==0 then measurement_value else 0 end) as even_sum
from cte
