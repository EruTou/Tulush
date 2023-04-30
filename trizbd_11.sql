-- Subject: Database development and protection technology
-- Language: SQL
-- DBMS: MySQL
-- Lesson: 11
-- Theme: Database administration
-- Name: Tulush Ertine
-- Group: 912

use flowershop;

-- Задача 1 +
-- Cоздайте резервную копию вашей базы данных

-- Перехожу в папку MySQL через cmd: cd C:\Program Files\MySQL\MySQL Server 8.0\bin
-- Далее прописываю:

mysqldump -u root -p flowershop > flowershopdump.sql

-- Ввожу на следующей строке свой пароль от root для создания дампа БД
-- Дамп базы данных создался в папке C:\Program Files\MySQL\MySQL Server 8.0\bin
-- с названием flowershopdump.sql, в котором пришлось изменять экранированные апострофы
-- в именах пользователей, т.к. из-за них комментировались блоки кода для создания таблиц


-- Задача 2 +
-- Cоздайте 3х пользователей с хэшированными паролями: superuser, admin, username.
-- superuser имеет полный доступ к вашей базе данных, admin может выполнять все типы запросов
-- (SELECT, UPDATE, DELETE, INSERT), username имеет доступ только к SELECT запросам к одной любой таблице

select host, user from mysql.user; -- проверка существующих пользователей
show grants for 'superuser'@'localhost'; -- проверка привилегий пользователей (нужно изменить имя)

create user 'username'@'localhost' identified with sha256_password by 'username';
create user 'admin'@'localhost' identified with sha256_password by 'admin';
create user 'superuser'@'localhost' identified with sha256_password by 'superuser';

grant select on flowershop.* to 'username'@'localhost';
grant select, update, insert, delete on flowershop.* to 'admin'@'localhost';
grant all on flowershop.* to 'superuser'@'localhost';


-- Задача 3 +
-- Переименуйте пользователя username на user,  добавьте ему привилегий, чтобы он мог
-- делать SELECT и INSERT запросы к любой другой таблице

rename user 'username'@'localhost' to 'user'@'localhost';
grant select, insert on flowershop.* to 'user'@'localhost';

-- проверить имя и привилегии пользователя можно с помощью команд в задаче 2

-- Задача 4 +
-- Удалите пользователя admin

drop user 'admin'@'localhost';

-- проверить отсутствие пользователя можно с помощью команды в задаче 2

