-- Subject: Database development and protection technology
-- Language: SQL
-- DBMS: MySQL
-- Lesson: 10
-- Theme: Stored procedures, functions and triggers
-- Name: Tulush Ertine
-- Group: 912

use vk;

-- Задача 1 +
-- Создайте хранимую процедуру, которая создает временную
-- таблицу для подсчета из каких городов пользователи в бд.

drop procedure if exists create_temp_table;
delimiter //
create procedure create_temp_table()
begin
	create temporary table count_users_in_cities (
		select
			p.hometown,
			count(p.user_id) as amount_of_users
		from profiles p
		group by p.hometown
		order by amount_of_users desc
	);
end //
delimiter ;

show procedure status like 'create_temp_table'; -- Проверка существования процедуры
call create_temp_table(); -- Вызов процедуры
select * from count_users_in_cities; -- Вызов временной таблицы


-- Задача 2 +
-- Создайте триггер, который при удалении пользователя удаляет также его файлы

drop trigger if exists delete_user;
delimiter //
create trigger delete_user after delete on users
for each row
begin
	delete from media m where m.user_id = old.id;
end //
delimiter ;

show triggers; -- Проверка существования триггера


-- Задача 3 +
-- Создайте триггер, который при добавлении пользователя проверяет его
-- дату рождения и устанавливает текущую дату, если дата из "будущего"

drop trigger if exists check_set_data_when_add_user;
delimiter //
create trigger check_set_data_when_add_user before insert on profiles
for each row
begin
	if new.birthday > curdate() then
		set new.birthday = curdate();
	end if;
end //
delimiter ;

show triggers; -- Проверка существования триггера


-- Задача 4 +
-- Создайте триггер, который при обновлении данных в таблице media
-- будет ставить текущую дату и время в колонку updated_at

drop trigger if exists update_media_data;
delimiter //
create trigger update_media_date before update on media
for each row
begin
	set new.updated_at = now();
end //
delimiter ;

show triggers; -- Проверка существования триггера


-- Задача 5 +
-- Создайте триггер, который проверяет на правильность ввод данных
-- о пользователе при вставке нового пользователя ( fristname и lastname, email не должны быть пустыми,
-- phone начинается с 7), и выводит на экран ошибку "Invalid user data"

drop trigger if exists check_userdata_input;
delimiter //
create trigger check_userdata_input before insert on users
for each row
begin
	if (
		(new.firstname is null) or
		(new.lastname is null) or
		(new.email is null) or
		new.phone not like '7%'
	   )
	then signal sqlstate '45000' set message_text = 'Invalid user data';
	end if;
end //
delimiter ;

show triggers; -- Проверка существования триггера

insert into users values (default, '', '', '', 9); -- Проверка работоспособности триггера провалилась


-- Задача 6 +
-- Создайте функцию, которая удаляет пользователя по id вместе с его профилем

drop function if exists delete_user_profile;
delimiter //
create function delete_user_profile(del_id_user int)
returns tinytext reads sql data not deterministic
begin
	delete from profiles where user_id = del_id_user;
	delete from users where id = del_id_user;
	return 'Removal completed';
end //
delimiter ;

set @id_user = 101; -- Переменная для выборочного удаления пользователя
insert into users values(101, 'Test', 'Test', 'test@gmail.com', 79998887777); -- Вставка тестового юзера в users
insert into profiles values(101, 'm', '1999-10-10', default, default, 'Kazan'); -- Вставка тестового профиля юзера в profiles
select * from users where id = 101; -- Проверка существования тестового юзера
select * from profiles where user_id = 101; -- Проверка существования профиля тестового пользователя

select delete_user_profile(@id_user); -- Вызов функции

show function status where Name like 'delete_user_profile'; -- Проверка существования функции delete_user_profile


-- Задача 7 +
-- Создайте функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать
-- фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи"

drop function if exists hello;
delimiter //
create function hello()
returns tinytext reads sql data not deterministic
begin
	declare greeting tinytext;
	if hour(curtime()) between 6 and 12 then
		set greeting = 'Доброе утро';
	elseif hour(curtime()) between 12 and 18 then
		set greeting = 'Добрый день';
	elseif hour(curtime()) between 18 and 0 then
		set greeting = 'Добрый вечер';
	elseif hour(curtime()) between 0 and 6 then
		set greeting = 'Доброй ночи';
	end if;
	return greeting;
end //
delimiter ;

select hello(); -- Вызов функции hello для проверки работоспособности
show function status where Name like 'hello'; -- Проверка сущестования функции

