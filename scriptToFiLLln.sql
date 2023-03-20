-- -----------------------------------------------------
-- Table `Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(50) NOT NULL,
  `pass` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categories` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Products` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `price` FLOAT NOT NULL,
  `expiration_date` DATETIME NOT NULL,
  `Categories_id_category` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_Products_Categories1_idx` (`Categories_id_category` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`Categories_id_category`)
    REFERENCES `Categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouses` (
  `id_warehouse` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `Products_id_product` INT NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  INDEX `fk_Warehouses_Products1_idx` (`Products_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouses_Products1`
    FOREIGN KEY (`Products_id_product`)
    REFERENCES `Products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Employees` (
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
-- Table `Shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shops` (
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
    REFERENCES `Employees` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
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
    REFERENCES `Users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Warehouses1`
    FOREIGN KEY (`Warehouses_id_warehouse`)
    REFERENCES `Warehouses` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shops1`
    FOREIGN KEY (`Shops_id_shop`)
    REFERENCES `Shops` (`id_shop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Providers` (
  `id_provider` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  PRIMARY KEY (`id_provider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Statuses` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `Orders_id_order` INT NOT NULL,
  PRIMARY KEY (`id_status`, `Orders_id_order`),
  INDEX `fk_Statuses_Orders1_idx` (`Orders_id_order` ASC) VISIBLE,
  CONSTRAINT `fk_Statuses_Orders1`
    FOREIGN KEY (`Orders_id_order`)
    REFERENCES `Orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Deliveries` (
  `id_delivery` INT NOT NULL AUTO_INCREMENT,
  `delivery_datetime` DATETIME NOT NULL,
  `Providers_id_provider` INT NOT NULL,
  `Warehouses_id_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_delivery`),
  INDEX `fk_Deliveries_Providers_idx` (`Providers_id_provider` ASC) VISIBLE,
  INDEX `fk_Deliveries_Warehouses1_idx` (`Warehouses_id_warehouse` ASC) VISIBLE,
  CONSTRAINT `fk_Deliveries_Providers`
    FOREIGN KEY (`Providers_id_provider`)
    REFERENCES `Providers` (`id_provider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deliveries_Warehouses1`
    FOREIGN KEY (`Warehouses_id_warehouse`)
    REFERENCES `Warehouses` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
