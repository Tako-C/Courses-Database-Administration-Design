-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema bobsbooties
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bobsbooties
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bobsbooties` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_id` BIGINT NOT NULL,
  `customer_first_name` VARCHAR(100) NOT NULL,
  `customer_last_name` VARCHAR(100) NOT NULL,
  `customer_email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `employee_id` BIGINT NOT NULL,
  `employee_first_name` VARCHAR(100) NOT NULL,
  `employee_last_name` VARCHAR(100) NOT NULL,
  `position` VARCHAR(100) NOT NULL,
  `hiret_date` DATE NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_id` BIGINT NOT NULL,
  `product_name` VARCHAR(100) NOT NULL,
  `launched_date` DATE NOT NULL,
  UNIQUE INDEX `product-id_UNIQUE` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers_purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers_purchases` (
  `customers_purchases_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `product_id` BIGINT NOT NULL,
  `employee_is` BIGINT NOT NULL,
  `purchased_at` TIMESTAMP NOT NULL,
  `amount_usd` INT NOT NULL,
  UNIQUE INDEX `customers_purchases_id_UNIQUE` (`customers_purchases_id` ASC) VISIBLE,
  PRIMARY KEY (`customers_purchases_id`),
  INDEX `cp_customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `cp_products_idx` (`product_id` ASC) VISIBLE,
  INDEX `cp_employees_idx` (`employee_is` ASC) VISIBLE,
  CONSTRAINT `cp_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cp_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cp_employees`
    FOREIGN KEY (`employee_is`)
    REFERENCES `mydb`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bobsbooties` ;

-- -----------------------------------------------------
-- Table `bobsbooties`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bobsbooties`.`customers` (
  `customer_id` BIGINT NOT NULL,
  `customer_firstname` VARCHAR(45) NOT NULL,
  `customer_lastname` VARCHAR(45) NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_email_UNIQUE` (`customer_email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bobsbooties`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bobsbooties`.`employees` (
  `employee_id` BIGINT NOT NULL,
  `employee_firstname` VARCHAR(45) NOT NULL,
  `employee_lastname` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bobsbooties`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bobsbooties`.`products` (
  `product_id` BIGINT NOT NULL,
  `produc_name` VARCHAR(45) NOT NULL,
  `launch_at` DATE NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `produc_name_UNIQUE` (`produc_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bobsbooties`.`customer_purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bobsbooties`.`customer_purchases` (
  `customer_purchase_id` BIGINT NOT NULL,
  `customer_id` BIGINT NOT NULL,
  `employee_id` BIGINT NOT NULL,
  `product_id` BIGINT NOT NULL,
  `purchased_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`customer_purchase_id`),
  INDEX `cp_customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `cp_employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `cp_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `cp_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `bobsbooties`.`customers` (`customer_id`),
  CONSTRAINT `cp_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `bobsbooties`.`employees` (`employee_id`),
  CONSTRAINT `cp_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `bobsbooties`.`products` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
