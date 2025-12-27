use sql_50;

/*You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans.
 There is only one user named Karl and one named Hans in the dataset.

The output should contain 'user_id' and 'user_name' columns.*/

CREATE TABLE users(user_id INT, user_name varchar(30));
INSERT INTO users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'),
 (8, 'Lucas'), (9, 'Anna'), (10, 'John');

CREATE TABLE friends(user_id INT, friend_id INT);
INSERT INTO friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9);

with Karl_friend as
(
Select u.user_id,u.user_name,f.friend_id
from users u left join friends f
on u.user_id=f.user_id
where u.user_name='Karl'
)
,
Hans_friend as
(
Select u.user_id,u.user_name,f.friend_id
from users u left join friends f
on u.user_id=f.user_id
where u.user_name='Hans'
)
,
mutual_friend as
(
Select K.friend_id as friend_id
from Karl_friend K inner join 
Hans_friend H on K.friend_id=H.friend_id
)
SELECT user_id, user_name
FROM users
WHERE user_id IN (
    SELECT friend_id 
    FROM mutual_friend
);