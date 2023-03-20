-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema flowershop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `flowershop` ;

-- -----------------------------------------------------
-- Schema flowershop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flowershop` DEFAULT CHARACTER SET cp1251 ;
USE `flowershop` ;

-- -----------------------------------------------------
-- Table `flowershop`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Users` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `pass_hash` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Employees` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `post` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `salary` FLOAT NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Shops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Shops` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Shops` (
  `id_shop` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `Employees_id_employee` INT NOT NULL,
  PRIMARY KEY (`id_shop`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE,
  INDEX `fk_Shops_Employees1_idx` (`Employees_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_Shops_Employees1`
    FOREIGN KEY (`Employees_id_employee`)
    REFERENCES `flowershop`.`Employees` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Providers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Providers` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Providers` (
  `id_provider` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_provider`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Deliveries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Deliveries` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Deliveries` (
  `id_delivery` INT NOT NULL AUTO_INCREMENT,
  `delivery_datetime` DATETIME NOT NULL,
  `Providers_id_provider` INT NOT NULL,
  PRIMARY KEY (`id_delivery`),
  INDEX `fk_Deliveries_Providers_idx` (`Providers_id_provider` ASC) VISIBLE,
  CONSTRAINT `fk_Deliveries_Providers`
    FOREIGN KEY (`Providers_id_provider`)
    REFERENCES `flowershop`.`Providers` (`id_provider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Warehouses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Warehouses` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Warehouses` (
  `id_warehouse` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `Deliveries_id_delivery` INT NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  INDEX `fk_Warehouses_Deliveries1_idx` (`Deliveries_id_delivery` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouses_Deliveries1`
    FOREIGN KEY (`Deliveries_id_delivery`)
    REFERENCES `flowershop`.`Deliveries` (`id_delivery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Categories` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Categories` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Products` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Products` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `price` FLOAT NOT NULL,
  `expiration_date` DATE NOT NULL,
  `Warehouses_id_warehouse` INT NOT NULL,
  `Categories_id_category` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_Products_Warehouses1_idx` (`Warehouses_id_warehouse` ASC) VISIBLE,
  INDEX `fk_Products_Categories1_idx` (`Categories_id_category` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Warehouses1`
    FOREIGN KEY (`Warehouses_id_warehouse`)
    REFERENCES `flowershop`.`Warehouses` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`Categories_id_category`)
    REFERENCES `flowershop`.`Categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Orders` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Orders` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `sum_price` FLOAT NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `order_datetime` DATETIME NOT NULL,
  `amount` INT NOT NULL,
  `status` TINYINT NOT NULL,
  `Users_id_user` INT NOT NULL,
  `Shops_id_shop` INT NOT NULL,
  `Products_id_product` INT NOT NULL,
  PRIMARY KEY (`id_order`, `Users_id_user`, `Shops_id_shop`, `Products_id_product`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE,
  INDEX `fk_Orders_Users1_idx` (`Users_id_user` ASC) VISIBLE,
  INDEX `fk_Orders_Shops1_idx` (`Shops_id_shop` ASC) VISIBLE,
  INDEX `fk_Orders_Products1_idx` (`Products_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Users1`
    FOREIGN KEY (`Users_id_user`)
    REFERENCES `flowershop`.`Users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shops1`
    FOREIGN KEY (`Shops_id_shop`)
    REFERENCES `flowershop`.`Shops` (`id_shop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Products1`
    FOREIGN KEY (`Products_id_product`)
    REFERENCES `flowershop`.`Products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowershop`.`Statuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flowershop`.`Statuses` ;

CREATE TABLE IF NOT EXISTS `flowershop`.`Statuses` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `Orders_id_order` INT NOT NULL,
  `Orders_Users_id_user` INT NOT NULL,
  `Orders_Shops_id_shop` INT NOT NULL,
  `Orders_Products_id_product` INT NOT NULL,
  PRIMARY KEY (`id_status`),
  INDEX `fk_Statuses_Orders1_idx` (`Orders_id_order` ASC, `Orders_Users_id_user` ASC, `Orders_Shops_id_shop` ASC, `Orders_Products_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Statuses_Orders1`
    FOREIGN KEY (`Orders_id_order` , `Orders_Users_id_user` , `Orders_Shops_id_shop` , `Orders_Products_id_product`)
    REFERENCES `flowershop`.`Orders` (`id_order` , `Users_id_user` , `Shops_id_shop` , `Products_id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
