 /* Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers
 have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date,
 non-paying downloads, paying downloads*/
 
 CREATE TABLE ms_user_dimension (user_id INT PRIMARY KEY,acc_id INT);
INSERT INTO ms_user_dimension (user_id, acc_id) VALUES (1, 101),(2, 102),(3, 103),(4, 104),(5, 105);

CREATE TABLE ms_acc_dimension (acc_id INT PRIMARY KEY,paying_customer VARCHAR(10));
INSERT INTO ms_acc_dimension (acc_id, paying_customer) VALUES (101, 'Yes'),(102, 'No'),(103, 'Yes'),(104, 'No'),(105, 'No');

CREATE TABLE ms_download_facts (date DATETIME,user_id INT,downloads INT);
INSERT INTO ms_download_facts (date, user_id, downloads) VALUES ('2024-10-01', 1, 10),('2024-10-01', 2, 15),('2024-10-02', 1, 8),('2024-10-02', 3, 12),('2024-10-02', 4, 20),('2024-10-03', 2, 25),('2024-10-03', 5, 18);

Select date(mf.date) as download_date,
sum(case when ma.paying_customer='No' then mf.downloads else 0 end) as non_paying_downloads,
sum(case when ma.paying_customer='Yes' then mf.downloads else 0 end) as paying_downloads
from ms_user_dimension mu
left join ms_acc_dimension ma
on mu.acc_id=ma.acc_id
left join ms_download_facts mf
on mu.user_id=mf.user_id
group by date(mf.date)
having 
sum(case when ma.paying_customer='No' then mf.downloads else 0 end)
> sum(case when ma.paying_customer='Yes' then mf.downloads else 0 end);