

-- Question :

-- Write a query that'll identify returning active users. 
-- A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
-- Output a list of user_ids of these returning active users.

-- Answer :

select 
  distinct a1.user_id
from 
  amazon_transactions a1
join 
  amazon_transactions a2
on a1.user_id=a2.user_id and a2.created_at>=a1.created_at and a1.id!=a2.id
where 
  datediff(a2.created_at,a1.created_at)<=7
order 
  by a1.user_id
