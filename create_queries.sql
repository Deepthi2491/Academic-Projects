#CREATE QUERIES
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RocketBook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RocketBook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RocketBook` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
USE `RocketBook` ;

-- -----------------------------------------------------
-- Table `RocketBook`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`Products` (
  `PRODUCT_ID` INT NOT NULL,
  `PRODUCT_NAME` VARCHAR(45) NOT NULL,
  `PRODUCT_PRICE` INT NOT NULL,
  `OPT_COLOR` VARCHAR(45) NULL,
  `OPT_SIZE` VARCHAR(45) NULL,
  `OPT_LAYOUT` VARCHAR(45) NULL,
  `OPT_VALUE` VARCHAR(45) NULL,
  `PROD_IMAGE_URL` VARCHAR(45) NULL,
  PRIMARY KEY (`PRODUCT_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`CUSTOMER` (
  `CUST_CITY` VARCHAR(45) NULL,
  `CUST_ZIP` VARCHAR(45) NULL,
  `CUST_ID` VARCHAR(45) NOT NULL,
  `CUST_LNAME` VARCHAR(45) NULL,
  `CUST_FNAME` VARCHAR(45) NULL,
  `CUST_MNAME` VARCHAR(45) NULL,
  `CUST_ADR_LINE1` VARCHAR(45) NULL,
  `CUST_TYPE` VARCHAR(45) NULL,
  `CUST_PHONE_NUM` VARCHAR(45) NULL,
  `LOGIN_USERNAME` VARCHAR(45) NOT NULL,
  `LOGIN_PASSWD` VARCHAR(45) NULL,
  `SEC_QUESTION` VARCHAR(45) NULL,
  `SEC_ANSWER` VARCHAR(45) NULL,
  `CUST_TYPE_DESC` VARCHAR(45) NULL,
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`ORDERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`ORDERS` (
  `ORDER_ID` INT NOT NULL,
  `DISCOUNT_PERCENT` INT NULL,
  `CUST_ID` VARCHAR(45) NOT NULL,
  `ORDER_DATE` DATETIME NULL,
  `ORDER_PAID` CHAR(1) NULL,
  `ORDER_AMOUNT` FLOAT NULL,
  PRIMARY KEY (`ORDER_ID`),
  INDEX `fk_ORDER_CUSTOMER1_idx` (`CUST_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ORDER_CUSTOMER1`
    FOREIGN KEY (`CUST_ID`)
    REFERENCES `RocketBook`.`CUSTOMER` (`CUST_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`PAY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`PAY` (
  `ORDER_ID` INT NOT NULL,
  `PAYMENT_ID` VARCHAR(45) NOT NULL,
  `PAYEE_NAME` VARCHAR(45) NULL,
  `PAYEE_CARDNUM` VARCHAR(45) NULL,
  `PAYEE_CARD_EXPDATE` DATE NULL,
  PRIMARY KEY (`ORDER_ID`, `PAYMENT_ID`),
  INDEX `fk_ORDER_has_CART_ORDER1_idx` (`ORDER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ORDER_has_CART_ORDER1`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `RocketBook`.`ORDERS` (`ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`RETURNED`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`RETURNED` (
  `RETURN_ID` INT NOT NULL,
  `RETURN_DATE` DATE NULL,
  `ORDER_ID` INT NOT NULL,
  `RETURN_VALID` VARCHAR(45) NULL,
  PRIMARY KEY (`RETURN_ID`),
  INDEX `fk_RETURN_ORDER1_idx` (`ORDER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_RETURN_ORDER1`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `RocketBook`.`ORDERS` (`ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`ORDERED_ITEMS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`ORDERED_ITEMS` (
  `PRODUCT_ID` INT NOT NULL,
  `ORDER_ID` INT NOT NULL,
  `ORDERED_ITEMS_COUNT` INT NULL,
  PRIMARY KEY (`PRODUCT_ID`, `ORDER_ID`),
  INDEX `fk_Products_has_ORDER_ORDER1_idx` (`ORDER_ID` ASC) VISIBLE,
  INDEX `fk_Products_has_ORDER_Products1_idx` (`PRODUCT_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Products_has_ORDER_Products1`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `RocketBook`.`Products` (`PRODUCT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_ORDER_ORDER1`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `RocketBook`.`ORDERS` (`ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RocketBook`.`RETURNED_ITEMS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RocketBook`.`RETURNED_ITEMS` (
  `RETURNED_ITEM_ID` INT NOT NULL,
  `RETURN_REASON` VARCHAR(45) NULL,
  `RETURN_AMOUNT` VARCHAR(45) NULL,
  `ORDERED_ITEMS_PRODUCT_ID` INT NOT NULL,
  `ORDERED_ITEMS_ORDER_ID` INT NOT NULL,
  `RETURN_ID` INT NOT NULL,
  PRIMARY KEY (`RETURNED_ITEM_ID`),
  INDEX `fk_RETURNED_ITEMS_ORDERED_ITEMS1_idx` (`ORDERED_ITEMS_PRODUCT_ID` ASC, `ORDERED_ITEMS_ORDER_ID` ASC) VISIBLE,
  INDEX `fk_RETURNED_ITEMS_RETURN1_idx` (`RETURN_ID` ASC) VISIBLE,
  CONSTRAINT `fk_RETURNED_ITEMS_ORDERED_ITEMS1`
    FOREIGN KEY (`ORDERED_ITEMS_PRODUCT_ID` , `ORDERED_ITEMS_ORDER_ID`)
    REFERENCES `RocketBook`.`ORDERED_ITEMS` (`PRODUCT_ID` , `ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RETURNED_ITEMS_RETURN1`
    FOREIGN KEY (`RETURN_ID`)
    REFERENCES `RocketBook`.`RETURNED` (`RETURN_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

