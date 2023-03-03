USE `flowershop`;
SHOW tables;

DROP TABLE IF EXISTS `Providers`;
CREATE TABLE `Providers`(
id_provider INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
address VARCHAR(70) NOT NULL,
phone VARCHAR(15) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees`(
id_employee INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
phone VARCHAR(15) UNIQUE NOT NULL,
post VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
salary FLOAT NOT NULL
);

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`(
id_user INT PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(50) NOT NULL,
pass VARCHAR(50) NOT NULL,
phone VARCHAR(15) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories`(
id_category INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS `Statuses`;
CREATE TABLE `Statuses`(
id_status INT PRIMARY KEY AUTO_INCREMENT
);

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products`(
id_product INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
price FLOAT NOT NULL,
expiration_date DATE NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES Categories (id_category)
);

DROP TABLE IF EXISTS `Deliveries`;
CREATE TABLE `Deliveries`(
id_delivery INT PRIMARY KEY AUTO_INCREMENT,
delivery_datetime DATETIME NOT NULL,
provider_id INT NOT NULL,
FOREIGN KEY (provider_id) REFERENCES Providers (id_provider)
);

DROP TABLE IF EXISTS `Warehouses`;
CREATE TABLE `Warehouses`(
id_warehouse INT PRIMARY KEY AUTO_INCREMENT,
amount INT NOT NULL,
product_id INT NOT NULL,
delivery_id INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES Products (id_product),
FOREIGN KEY (delivery_id) REFERENCES Deliveries (id_delivery)
);

DROP TABLE IF EXISTS `Shops`;
CREATE TABLE `Shops`(
id_shop INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
address VARCHAR(70) UNIQUE NOT NULL,
phone VARCHAR(15) NOT null,
employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES Employees (id_employee)
);

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders`(
id_order INT PRIMARY KEY AUTO_INCREMENT,
sum_price FLOAT NOT NULL,
address VARCHAR(70) UNIQUE NOT NULL,
order_datetime DATETIME NOT NULL,
amount FLOAT NOT NULL,
status BOOLEAN DEFAULT(0) NOT NULL,
status_id INT NOT NULL,
user_id INT NOT NULL,
product_id INT NOT NULL,
shop_id INT NOT NULL,
FOREIGN KEY (status_id) REFERENCES Statuses (id_status),
FOREIGN KEY (user_id) REFERENCES Users (id_user),
FOREIGN KEY (product_id) REFERENCES Products (id_product),
FOREIGN KEY (shop_id) REFERENCES Shops (id_shop)
);