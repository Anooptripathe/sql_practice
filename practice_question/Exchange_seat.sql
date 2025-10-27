Select 
(case when id%2!=0 and id!=cnt then id+1
     when id%2!=0 and id=cnt then id
     else id-1
     end) as id,student
     from Seat,
(Select count(*) as cnt from Seat)
as sc
order by id