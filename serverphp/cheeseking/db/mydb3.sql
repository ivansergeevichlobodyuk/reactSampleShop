SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb3` ;

-- -----------------------------------------------------
-- Table `mydb3`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  `paren_id` INT(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `price_type_1` DOUBLE NULL,
  `images` VARCHAR(100) NULL,
  `price_type_2` FLOAT NULL,
  `goodscol` VARCHAR(45) NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categories_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_goods_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_goods_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `mydb3`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb3`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roles` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `goods_id` INT(11) NOT NULL,
  `time` DATETIME NULL,
  `count` INT(11) NULL,
  `users_id` INT(11) NOT NULL,
  `total_price` FLOAT NULL,
  `progress` TEXT NULL,
  PRIMARY KEY (`id`, `goods_id`, `users_id`),
  INDEX `fk_orders_goods1_idx` (`goods_id` ASC),
  INDEX `fk_orders_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_orders_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `mydb3`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb3`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`warehouses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `locations` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`goods_to_warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`goods_to_warehouses` (
  `idgoods_to_warehouses` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT(11) NOT NULL,
  `warehouses_id` INT(11) NOT NULL,
  `goods_to_warehousescol` VARCHAR(45) NULL,
  `count_remains` INT(11) NULL,
  `count_reserved_by_cart` INT(11) NULL,
  PRIMARY KEY (`idgoods_to_warehouses`, `goods_id`, `warehouses_id`),
  INDEX `fk_goods_to_warehouses_goods1_idx` (`goods_id` ASC),
  INDEX `fk_goods_to_warehouses_warehouses1_idx` (`warehouses_id` ASC),
  CONSTRAINT `fk_goods_to_warehouses_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `mydb3`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_to_warehouses_warehouses1`
    FOREIGN KEY (`warehouses_id`)
    REFERENCES `mydb3`.`warehouses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`cart` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `goods_id` INT NOT NULL,
  `count` INT(11) NULL,
  PRIMARY KEY (`id`, `goods_id`),
  INDEX `fk_cart_goods1_idx` (`goods_id` ASC),
  CONSTRAINT `fk_cart_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `mydb3`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`currencies` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cur_code` VARCHAR(4) NULL,
  `national_convertation_koefficient` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`user_to_currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`user_to_currencies` (
  `currencies_id` INT(11) NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`currencies_id`, `users_id`),
  INDEX `fk_user_to_currencies_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_user_to_currencies_currencies1`
    FOREIGN KEY (`currencies_id`)
    REFERENCES `mydb3`.`currencies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_to_currencies_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb3`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`orders_logger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`orders_logger` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orders_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `orders_id`),
  INDEX `fk_orders_logger_orders1_idx` (`orders_id` ASC),
  CONSTRAINT `fk_orders_logger_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb3`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
