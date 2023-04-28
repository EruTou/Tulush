-- Subject: Database development and protection technology
-- Language: SQL
-- Lesson: 9
-- Theme: Views, temporary tables, transactions
-- Name: Tulush Ertine
-- Group: 912

use vk;

-- Задание 1
-- Создайте динамический запрос, который будет выводить имя, email, город и все файлы пользователя в зависимости от введенного id

prepare userinfo
from 'select
		u.id, u.firstname, u.lastname,
		u.email, p.hometown, m.filename
	  from users u
		join profiles p on u.id = p.user_id
		join media m on u.id = m.user_id
	  where u.id = ?';
set @id_user = 1;
execute userinfo using @id_user;


-- Задание 2
-- Создайте временную таблицу для вычисления количество файлов согласно категориям ( музыка, видео, фото)

create temporary table sortedfiles (
	select
		count(m.id) as files_count, mt.name group_names
	from media m
		join media_types mt on m.media_type_id = mt.id
	where mt.name = 'Video' or mt.name = 'Photo' or mt.name = 'Music'
	group by mt.name
);

select * from sortedfiles; -- Сначала стоит запустить скрипт создания временной таблицы, а потом уже этот

-- Задание 3
-- Создайте представление, в котором будут отображены сгруппированные по городам пользовательские атрибуты ( name = firstname+lastname, age(возраст))



-- Задание 4
-- Создайте представление, в котором будут отображены сгруппированные по группам имена пользователей



-- Задание 5
-- Создайте транзакцию, которая будет вводить нового пользователя: 
--  Jack Nicholson 22-04-1937 Neptune JackNIk@gmail.com +123456789
	
	
	
-- Задание 6
-- Создайте транзакцию, которая изменяет город пользователя по имени Frederik Upton на NewYork
