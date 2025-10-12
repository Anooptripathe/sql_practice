# Write your MySQL query statement below
Select distinct(L1.num) as ConsecutiveNums
from Logs L1
inner join Logs L2
on L1.id+1=L2.id and L1.num=L2.num
inner join Logs L3 on  L2.id+1=L3.id and L2.num=L3.num
