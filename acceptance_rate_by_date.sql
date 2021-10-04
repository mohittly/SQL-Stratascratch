

-- Question :

-- What is the overall friend acceptance rate by date? 
-- Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in 
-- the table with action = 'sent'. 

-- If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

-- Answer :

select 
  f1.date, 
  1.0*count(f2.action)/count(f1.action)
from 
  fb_friend_requests as f1
left outer join 
  fb_friend_requests as f2 
  on f1.user_id_sender=f2.user_id_sender and f2.action in ('accepted')
where 
  f1.action='sent' 
group by 
  f1.date
;

