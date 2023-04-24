-- Subject: Database development and protection technology
-- Language: SQL
-- Lesson: KT2
-- Theme: Сheckpoint
-- Name: Tulush Ertine
-- Group: 912

USE `flowershop`;

-- Простые запросы

SELECT c.id_category, c.name AS 'category_name'
FROM categories c;


SELECT u.id_user, u.login AS 'user_login', u.pass AS 'user_pass'
FROM users u;

-- Запросы с агрегациями

SELECT count(p.id_product) AS 'products_count'
FROM products p
WHERE p.price < 400;


SELECT
	sum(e.salary) AS 'sum_of_salary'
FROM employees e;

-- Сложные запросы с объединением 2-3 таблиц с помощью Join

SELECT s.id_status, o.id_order, o.address, u.login, u.phone
FROM orders o
	JOIN users u ON o.Users_id_user = u.id_user
	JOIN statuses s ON o.id_order = s.Orders_id_order
WHERE (s.id_status BETWEEN 10 AND 40) AND (u.login LIKE 'E%')
ORDER BY s.id_status DESC;


SELECT
	c.id_category, c.name AS 'category_name',
	p.id_product, p.name AS 'product_name',
	p.price, w.amount
FROM products p
	JOIN categories c ON p.Categories_id_category = c.id_category
	JOIN warehouses w ON p.id_product = w.Products_id_product
WHERE c.name LIKE 'f%' OR c.name LIKE 's%';

-- Сложные запросы с объединениями 2-3 таблиц подзапросами

SELECT
	(SELECT s.id_shop FROM shops s WHERE s.id_shop = 3) AS 'id_shop',
	(SELECT u.id_user FROM users u WHERE u.id_user = 17) AS 'id_user',
	count(o.id_order) AS 'count_orders',
	sum(o.sum_price) AS 'orders_sum',
	o.status
FROM orders o
WHERE o.Shops_id_shop IN (SELECT s.id_shop FROM shops s WHERE s.id_shop = 3 AND s.id_shop = o.Shops_id_shop) AND
	o.Users_id_user IN (SELECT u.id_user FROM users u WHERE u.id_user = 17 AND u.id_user = o.Users_id_user)
GROUP BY o.status;


SELECT
	(SELECT pr.id_provider FROM providers pr WHERE pr.id_provider = d.Providers_id_provider) AS 'id_provider',
	(SELECT w.id_warehouse FROM warehouses w WHERE w.id_warehouse = d.Warehouses_id_warehouse) AS 'id_warehouse',
	IF(
		((year(curdate()) - year(d.delivery_datetime)) -
		(date_format(d.delivery_datetime, '%m%d') > date_format(curdate(), '%m%d'))) > 3,
		'Before the reform', 'After the reform'
	) AS 'Status',
	date_format(d.delivery_datetime, '%Y-%m-%d') AS 'DOD'
FROM deliveries d;
