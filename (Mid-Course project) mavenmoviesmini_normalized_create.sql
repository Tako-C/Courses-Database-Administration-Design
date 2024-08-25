-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mavenmoviesmini
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mavenmoviesmini
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mavenmoviesmini` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema mavenmoviesmini_normalized
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mavenmoviesmini_normalized
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mavenmoviesmini_normalized` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE `mavenmoviesmini_normalized` ;

-- -----------------------------------------------------
-- Table `mavenmoviesmini_normalized`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavenmoviesmini_normalized`.`films` (
  `film_id` SMALLINT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` YEAR NULL DEFAULT NULL,
  `rental_rate` DECIMAL(4,2) NOT NULL,
  `rating` ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') NULL DEFAULT NULL,
  UNIQUE INDEX `film_id` (`film_id` ASC) VISIBLE,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mavenmoviesmini_normalized`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavenmoviesmini_normalized`.`stores` (
  `store_id` TINYINT UNSIGNED NOT NULL,
  `store_manager_first_name` VARCHAR(45) NOT NULL,
  `store_manager_last_name` VARCHAR(45) NOT NULL,
  `store_address` VARCHAR(255) NOT NULL,
  `store_city` VARCHAR(255) NOT NULL,
  `store_district` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `store_id_UNIQUE` (`store_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mavenmoviesmini_normalized`.`inventorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavenmoviesmini_normalized`.`inventorys` (
  `inventory_id` BIGINT UNSIGNED NOT NULL,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `film_id` SMALLINT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE INDEX `inventory_id_UNIQUE` (`inventory_id` ASC) VISIBLE,
  INDEX `stores_store_id_idx` (`store_id` ASC) VISIBLE,
  INDEX `films_film_id_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `stores_store_id`
    FOREIGN KEY (`store_id`)
    REFERENCES `mavenmoviesmini_normalized`.`stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `films_film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `mavenmoviesmini_normalized`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
