/*Write a SQL query to compare source and target table*/

Create table source(ID int,Name varchar(50));

Insert into source (ID,Name)
value
(1,'A'),(2,'B'),(3,'C'),(4,'D');

Create table target(ID int,Name varchar(50));

Insert into target (ID,Name)
value
(1,'A'),(2,'B'),(4,'X'),(5,'E');

/*ID in source table not present in target*/

Select ID,'New in source' as comment from source where source.ID Not in 
(Select target.ID from target left join
source on target.ID= source.ID)

UNION all
/*ID in target table not present in source*/

Select ID,'New in target' as comment from target where target.ID Not in 
(Select source.ID from source left join
target on source.ID= target.ID)

UNION all

Select S.ID,'Mismatch' as comment from
source s inner join target t
on s.ID= t.ID
where s.name<>t.name;

