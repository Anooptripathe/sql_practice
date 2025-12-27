Create database if not exists sql_50;

use sql_50;

/*A table named “famous” has two columns called user id and follower id. It represents each user ID has a particular follower
ID. These follower IDs are also users of hashtag#Facebook / hashtag#Meta. Then, find the famous percentage of each user. 
Famous Percentage = number of followers a user has / total number of users on the platform.*/

CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);

with distinct_user as
(
Select user_id from famous
union
Select follower_id from famous
),
follower_Count as
(
Select user_id,count(follower_id) as cnt
from famous group by user_id
)

Select f.user_id,(f.cnt*100.0)/(Select count(*) from distinct_user) as famous_percentage
from follower_count f;

