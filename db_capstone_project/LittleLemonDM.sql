-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `tableNo` INT NOT NULL,
  `customerId` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Bookings_1_idx` (`customerId` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`customerId`)
    REFERENCES `mydb`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuItems` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  `starterName` VARCHAR(45) NOT NULL,
  `dessertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `menuItemsId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Menus_1_idx` (`menuItemsId` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_1`
    FOREIGN KEY (`menuItemsId`)
    REFERENCES `mydb`.`MenuItems` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `menuId` INT NOT NULL,
  `customerId` INT NOT NULL,
  `totalCost` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Orders_1_idx` (`menuId` ASC) VISIBLE,
  INDEX `fk_Orders_2_idx` (`customerId` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`menuId`)
    REFERENCES `mydb`.`Menus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_2`
    FOREIGN KEY (`customerId`)
    REFERENCES `mydb`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderStatus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orderId` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_OrderStatus_1_idx` (`orderId` ASC) VISIBLE,
  CONSTRAINT `fk_OrderStatus_1`
    FOREIGN KEY (`orderId`)
    REFERENCES `mydb`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
