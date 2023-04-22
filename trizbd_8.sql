-- Subject: Database development and protection technology
-- Language: MySQL
-- Lesson: 8
-- Theme: Connections
-- Name: Tulush Ertine
-- Group: 912

use vk;

/* 1. + Вывести все файлы видео с расширениями .avi и .mp4 */

select m.filename
from media m
where m.filename like "%.avi"

union

select m.filename
from media m
where m.filename like "%.mp4";



/* 2. + Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
 который больше всех общался с выбранным пользователем (написал ему сообщений). */

select
	concat(u.firstname, ' ', u.lastname) as sender,
	count(m.from_user_id) as letters_count
from users u
	join messages m on m.to_user_id = 1
	join friend_requests fr on fr.target_user_id = 1
where fr.status = 'approved'
group by sender
limit 1;



/* 3. + Подсчитать общее количество лайков, которые получили пользователи младше 11 лет. */

select 
	concat(u.firstname, ' ', u.lastname) as username,
	count(*) as likes_count
from users u
	join likes l on u.id = l.user_id
	join profiles p on
		u.id = p.user_id and
		11 > ((year(curdate()) - year(p.birthday)) -
			(date_format(p.birthday, '%m%d') > date_format(curdate(), '%m%d'))
    	)
group by u.id
order by likes_count desc;



/* 4. + Определить кто больше поставил лайков (всего): мужчины или женщины. */

select 
	case
	    when gender = 'f' 
	        then 'Женщины'
	    when gender = 'm'  
	        then 'Мужчины'
	    else 'Пол не определен'
	end as gender,
	count(*) as likes
from likes l
	join profiles p on l.user_id = p.user_id
group by p.gender;



/* 5. + Вывести количество групп каждого пользователя */

select
	concat(u.firstname, ' ', u.lastname) as username,
	count(u_c.community_id) as amount_communities
from users u
	join users_communities u_c on u.id = u_c.user_id
group by u.id
order by amount_communities desc;



/* 6. + Найти количество пользователей в сообществах */

select
	c.name as group_name,
	count(u_c.user_id) as amount_users
from users_communities u_c 
	join  communities c on u_c.community_id = c.id
group by c.id
order by amount_users desc;



/* 7. + Найти 3 пользователей с наибольшим количеством лайков */

select
	concat(u.firstname, ' ', u.lastname) as username,
	count(l.user_id) as likes
from users u
	join likes l on u.id = l.user_id
group by u.id
order by likes desc
limit 3;


