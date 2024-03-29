# Write your MySQL query statement below

Select round( count(distinct player_id)/(select count(distinct player_id)from activity),2) as fraction
from activity
WHERE (player_id,DATE_SUB(event_date,INTERVAL 1 day)) 
IN
(select player_id,min(event_date) as first_login
from activity
group by player_id)