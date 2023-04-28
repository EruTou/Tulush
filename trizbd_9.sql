-- Subject: Database development and protection technology
-- Language: SQL
-- DBMS: MySQL
-- Lesson: 9
-- Theme: Views, temporary tables, transactions
-- Name: Tulush Ertine
-- Group: 912

use vk;

-- Задача 1
-- Создайте динамический запрос, который будет выводить имя, email, город и
-- все файлы пользователя в зависимости от введенного id

prepare userinfo
from 'select
		u.id, u.firstname, u.lastname,
		u.email, p.hometown, m.filename
	  from users u
		join profiles p on u.id = p.user_id
		join media m on u.id = m.user_id
	  where u.id = ?';
	 
set @id_user = 2;
execute userinfo using @id_user; -- проверка


-- Задача 2
-- Создайте временную таблицу для вычисления количество
-- файлов согласно категориям ( музыка, видео, фото)

create temporary table sortedfiles (
	select
		count(m.id) as files_count, mt.name as category_names
	from media m
		join media_types mt on m.media_type_id = mt.id
	where mt.name = 'Video' or mt.name = 'Photo' or mt.name = 'Music'
	group by mt.name
);

select * from sortedfiles; -- проверка


-- Задача 3
-- Создайте представление, в котором будут отображены сгруппированные по
-- городам пользовательские атрибуты (name = firstname+lastname, age(возраст))

create or replace view grouped_users
as select
	p.hometown as hometown,
	concat(u.firstname, ' ', u.lastname) as name,
	( year(curdate()) - year(p.birthday) - 
		( date_format(p.birthday, '%m%d') > date_format(curdate() , '%m%d')  ) 
	) as age
from users u
	join profiles p on u.id = p.user_id
order by p.hometown;

select * from grouped_users; -- проверка


-- Задача 4
-- Создайте представление, в котором будут отображены
-- сгруппированные по группам имена пользователей

create or replace view names
as select
	u.firstname, u.lastname
from users u
order by u.firstname;

select * from names; -- проверка


-- Задача 5
-- Создайте транзакцию, которая будет вводить нового пользователя:
-- Jack Nicholson 22-04-1937 Neptune JackNIk@gmail.com +1234567899

start transaction;
	insert into users(id, firstname, lastname, email, phone) values(101, 'Jack', 'Nicholson', 'JackNIk@gmail.com', 1234567899);
	insert into profiles(user_id, gender, birthday, photo_id, created_at, hometown) values(101, 'm', '1937-04-22', default, current_timestamp(), 'Neptune');
commit;

select * from users u, profiles p where u.id = 101 and p.user_id = 101; -- проверка

-- Задача 6
-- Создайте транзакцию, которая изменяет город пользователя по имени
-- Frederik Upton на NewYork

start transaction;
	update profiles p set p.hometown = 'NewYork'
	where p.user_id = (select u.id from users u
						where u.firstname = 'Frederik' and u.lastname = 'Upton'
					  );
commit;

select p.hometown -- проверка
from profiles p
where p.user_id = (select u.id 
				  	  from users u
				  	  where u.firstname = 'Frederik' and u.lastname = 'Upton'
				  );
