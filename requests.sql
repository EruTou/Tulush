USE `flowershop`;

SELECT c.name AS 'Category name'
FROM categories c;

SELECT u.login AS 'User login'
FROM users u;

SELECT count(p.id_product) AS 'Products count'
FROM products p
WHERE p.price < 400;

SELECT
	sum(e.salary) AS 'Sum of salary'
FROM employees e;

SELECT o.id_order, o.address, u.login, u.phone
FROM orders o
		JOIN users u ON o.Users_id_user = u.id_user;

SELECT c.id_category, c.name, p.id_product, p.name, p.price
FROM products p
	JOIN categories c ON p.Categories_id_category = c.id_category;