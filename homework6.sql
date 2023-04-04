/* Домашнее задание к уроку №6 - Простые запросы */

/* 1. Вывести имена, фамилии и email пользователей в алфавитном порядке по фамилии */
-- Решение:

select u.firstname, u.lastname, u.email
from users u
order by u.lastname asc;



/* 2. Вывести имена всех женщин в алфавитном порядке */
-- Решение:

select u.firstname 
from users u
where u.id IN (select p.user_id from profiles p where p.gender = 'f')
order by u.firstname asc;



/* 3. Вывести имена и фамилии 5 первых пользователей */
-- Решение:

select u.firstname, u.lastname
from users u where u.id <= 5;



/* 4. Вывести все названия файлов с фотографиями, у которых размер файла не превышает 100 000 */
-- Решение:

select m.filename, m.`size` -- Дополнительно вывожу размер для проверки
from media m
where (m.filename like '%.jpg') and (m.`size` < 100000);



/* 5. Вывести все города, в которых находятся пользователи */
-- Решение:

select distinct p.hometown from profiles p;



/* 6. Вывести все файлы, которые загрузил пользователь по имени Frederik Upton */
-- Решение:

select m.filename
from media m
where m.user_id in (
	select u.id
	from users u
	where u.firstname='Frederik' and u.lastname='Upton'
);



/* 7. Посчитайте количество женщин и количество мужчин */
-- Решение:

select count(p.user_id) as women from profiles p where p.gender='f';
select count(p.user_id) as men from profiles p where p.gender='m';



/* 8. Найдите все города пользователей, начинающиеся на букву 'P' */
-- Решение:

select distinct p.hometown from profiles p where p.hometown like 'P%';



/* 9. Выведите имя самого молодого пользователя */
-- Решение:

select
	concat(u.firstname, ' ', u.lastname) as name,
	(select max(p.birthday)
		from profiles p
	) as dateOfBirth
from users u
where u.id = (
	select p2.user_id
	from profiles p2
	where p2.birthday = (
		select max(p3.birthday)
		from profiles p3
	)
);



/* 10. Выведите количество женщин из каждого города */
-- Решение:

select p.hometown, count(p.user_id) as women
from profiles p
where p.gender='f'
group by p.hometown;


