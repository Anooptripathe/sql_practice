with cte as
(Select e.*,d.department_name
from employee e 
left join department d 
on e.department_id=d.department_id),

cte2 as 
(
Select cte.*,
dense_rank()over(partition by department_name order by salary desc) rn 
from cte
)
Select department_name,name,salary 
from cte2
where rn<=3
order by department_name ASC, salary desc ,name ASC;