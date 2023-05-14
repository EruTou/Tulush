-- Subject: Database development and protection technology
-- Language: SQL
-- DBMS: MySQL
-- Lesson: Last on the 2nd course
-- Theme: Semester project
-- Name: Tulush Ertine
-- Group: 912

use flowershop;

-- Процедуры

CREATE PROCEDURE calcSuccessfulOrdSum ()
SELECT SUM(sum_price) AS Sum_Orders
FROM orders
WHERE Warehouses_id_warehouse = 2 AND status = 1;

CALL calcSuccessfulOrdSum ();
SHOW PROCEDURE status WHERE Db = 'flowershop';

-- Триггеры

DELIMITER //
CREATE TRIGGER delete_employee AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
  DELETE FROM Shops WHERE Employees_id_employee = OLD.id_employee;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER insert_user BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
  IF ((NEW.login IS NULL) OR
     (NEW.pass IS NULL) OR
     (NEW.phone NOT LIKE '7%'))
  THEN SIGNAL SQLSTATE '45000' SET message_text = 'Invalid user data';
  END IF;
END //
DELIMITER ;

SHOW triggers\G;

-- Запросы с агрегациями

SELECT COUNT(id_product) FROM Products WHERE price < 400;


SELECT SUM(salary) FROM Employees WHERE id_employee < 6;

-- Сложные запросы с объединением 2-3 таблиц с помощью Join

SELECT
  c.id_category, c.name AS 'category_name',
  p.id_product, p.name AS 'product_name',
  p.price, w.amount
FROM Products p
  JOIN Categories c ON p.Categories_id_category = c.id_category
  JOIN Warehouses w ON p.id_product = w.Products_id_product
WHERE c.name LIKE 'F%' OR c.name LIKE 'P%';


SELECT o.id_order, o.address, s.id_status, u.login, u.phone
FROM orders o
  JOIN users u ON o.Users_id_user = u.id_user
  JOIN statuses s ON o.id_order = s.Orders_id_order
WHERE s.id_status BETWEEN 3 AND 8 AND u.login LIKE 'K%';


SELECT 
  id_delivery, delivery_datetime,
  Providers_id_provider, Warehouses_id_warehouse
FROM Deliveries d
  JOIN Warehouses w ON d.Warehouses_id_warehouse = w.id_warehouse
  JOIN Providers p ON d.Providers_id_provider = p.id_provider
WHERE delivery_datetime BETWEEN '2023-01-05' AND '2023-01-10' AND Providers_id_provider = 3;

-- Сложные запросы с объединениями 2-3 таблиц подзапросами

SELECT
  (SELECT id_shop FROM shops WHERE id_shop = 7) AS 'id_shop',
  (SELECT id_user FROM users WHERE id_user = 7) AS 'id_user',
   COUNT(id_order) AS 'count_orders',
   SUM(sum_price) AS 'orders_sum',
   status
FROM orders
WHERE Users_id_user IN (SELECT id_user FROM users WHERE id_user = 7)
  AND status = 1;


SELECT
   id_delivery,
  (SELECT id_provider FROM Providers
   WHERE id_provider = Providers_id_provider) AS 'id_provider',
  (SELECT id_warehouse FROM Warehouses
   WHERE id_warehouse = Warehouses_id_warehouse) AS 'id_warehouse',
   IF(((YEAR(CURDATE()) - YEAR(delivery_datetime)) -
    (DATE_FORMAT(delivery_datetime, '%m%d') > DATE_FORMAT(CURDATE(),
     '%m%d'))) > 3, 'Expecting', 'Delivered') AS 'Status',
     DATE_FORMAT(delivery_datetime, '%Y-%m-%d') AS 'DOD'
FROM deliveries
WHERE id_delivery < 5;


SELECT
   id_shop,
   name,
  (SELECT id_employee FROM Employees
   WHERE id_employee = Employees_id_employee) AS 'id_employee',
  (SELECT name FROM Employees
   WHERE id_employee = Employees_id_employee) AS 'name_employee',
  (SELECT id_order FROM Orders
   WHERE Shops_id_shop = id_shop) AS 'id_order'
FROM Shops
LIMIT 5;

-- Динамический запрос

PREPARE AmountOfProducts
FROM 'SELECT
		w.id_warehouse, p.Categories_id_category, p.name, w.amount, p.price, p.expiration_date
	  FROM Warehouses w
		JOIN Products p ON w.Products_id_product = p.id_product
	  WHERE w.id_warehouse = ?';

SET @warehouse_id = 5;
EXECUTE AmountOfProducts USING @warehouse_id;

-- Временная таблица

CREATE TEMPORARY TABLE Employees_DOB (
	SELECT e.id_employee, s.id_shop, e.name, e.post, e.birthday
	FROM Employees e
		JOIN Shops s ON id_employee = Employees_id_employee
);

SELECT * FROM Employees_DOB;

-- Представление 

CREATE VIEW RevenueForApril
AS SELECT
  Shops_id_shop AS id_shop,
  IF(SUM(sum_price) > 0, SUM(sum_price), NULL) AS revenue
FROM Orders
WHERE order_datetime BETWEEN '2023-04-01' AND '2023-04-30'
GROUP BY id_shop;

SELECT * FROM RevenueForApril;

-- Создание пользователей и настройка прав

SELECT host, USER FROM mysql.user; -- проверка существующих пользователей
SHOW grants FOR 'superuser'@'localhost'; -- проверка привилегий пользователей (нужно изменить имя)

CREATE USER 'username'@'localhost' identified WITH sha256_password BY 'username';
CREATE USER 'admin'@'localhost' identified WITH sha256_password BY 'admin';
CREATE USER 'superuser'@'localhost' identified WITH sha256_password BY 'superuser';

GRANT SELECT ON flowershop.* TO 'username'@'localhost';
GRANT SELECT, UPDATE, INSERT, DELETE ON flowershop.* TO 'admin'@'localhost';
GRANT ALL ON flowershop.* TO 'superuser'@'localhost';
