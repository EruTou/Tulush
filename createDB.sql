-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema flowerShop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flowerShop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flowerShop` DEFAULT CHARACTER SET cp1251 ;
USE `flowerShop` ;

-- -----------------------------------------------------
-- Table `flowerShop`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(50) NOT NULL,
  `pass` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Categories` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Products` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `price` FLOAT NOT NULL,
  `expiration_date` DATETIME NOT NULL,
  `Categories_id_category` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_Products_Categories1_idx` (`Categories_id_category` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`Categories_id_category`)
    REFERENCES `flowerShop`.`Categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Warehouses` (
  `id_warehouse` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `Products_id_product` INT NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  INDEX `fk_Warehouses_Products1_idx` (`Products_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouses_Products1`
    FOREIGN KEY (`Products_id_product`)
    REFERENCES `flowerShop`.`Products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `post` VARCHAR(50) NOT NULL,
  `birthday` DATE NOT NULL,
  `salary` FLOAT NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Shops` (
  `id_shop` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `Employees_id_employee` INT NOT NULL,
  PRIMARY KEY (`id_shop`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE,
  INDEX `fk_Shops_Employees1_idx` (`Employees_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_Shops_Employees1`
    FOREIGN KEY (`Employees_id_employee`)
    REFERENCES `flowerShop`.`Employees` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Orders` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `sum_price` FLOAT NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `order_datetime` DATETIME NOT NULL,
  `amount` INT NOT NULL,
  `status` TINYINT NOT NULL,
  `Users_id_user` INT NOT NULL,
  `Warehouses_id_warehouse` INT NOT NULL,
  `Shops_id_shop` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE,
  INDEX `fk_Orders_Users1_idx` (`Users_id_user` ASC) VISIBLE,
  INDEX `fk_Orders_Warehouses1_idx` (`Warehouses_id_warehouse` ASC) VISIBLE,
  INDEX `fk_Orders_Shops1_idx` (`Shops_id_shop` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Users1`
    FOREIGN KEY (`Users_id_user`)
    REFERENCES `flowerShop`.`Users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Warehouses1`
    FOREIGN KEY (`Warehouses_id_warehouse`)
    REFERENCES `flowerShop`.`Warehouses` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shops1`
    FOREIGN KEY (`Shops_id_shop`)
    REFERENCES `flowerShop`.`Shops` (`id_shop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Providers` (
  `id_provider` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  PRIMARY KEY (`id_provider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Statuses` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `Orders_id_order` INT NOT NULL,
  PRIMARY KEY (`id_status`, `Orders_id_order`),
  INDEX `fk_Statuses_Orders1_idx` (`Orders_id_order` ASC) VISIBLE,
  CONSTRAINT `fk_Statuses_Orders1`
    FOREIGN KEY (`Orders_id_order`)
    REFERENCES `flowerShop`.`Orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flowerShop`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flowerShop`.`Deliveries` (
  `id_delivery` INT NOT NULL AUTO_INCREMENT,
  `delivery_datetime` DATETIME NOT NULL,
  `Providers_id_provider` INT NOT NULL,
  `Warehouses_id_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_delivery`),
  INDEX `fk_Deliveries_Providers_idx` (`Providers_id_provider` ASC) VISIBLE,
  INDEX `fk_Deliveries_Warehouses1_idx` (`Warehouses_id_warehouse` ASC) VISIBLE,
  CONSTRAINT `fk_Deliveries_Providers`
    FOREIGN KEY (`Providers_id_provider`)
    REFERENCES `flowerShop`.`Providers` (`id_provider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deliveries_Warehouses1`
    FOREIGN KEY (`Warehouses_id_warehouse`)
    REFERENCES `flowerShop`.`Warehouses` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
