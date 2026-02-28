Show databases;

use practicedb;

-- Find user who made a purchase twice within 24 hr

Create table purchase_user
( id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    purchase_time DATETIME NOT NULL);
    
INSERT INTO purchase_user (user_id, purchase_time) VALUES
(1, '2026-01-01 10:00:00'),
(1, '2026-01-02 09:00:00'),  -- within 23 hrs
(1, '2026-01-05 10:00:00'),
(2, '2026-01-01 08:00:00'),
(2, '2026-01-03 08:00:00'),  -- 48 hrs
(3, '2026-01-02 12:00:00'),
(3, '2026-01-02 18:00:00');


Select distinct user_id
from
(
Select user_id,purchase_time,
lag(purchase_time) over
(partition by user_id
order by purchase_time) as prev_purchase_time
from purchase_user
)t
where prev_purchase_time is not null
AND purchase_time <= DATE_ADD(prev_purchase_time, INTERVAL 24 HOUR);