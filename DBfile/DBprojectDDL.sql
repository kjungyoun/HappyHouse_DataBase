-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema happyhouseDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema happyhouseDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `happyhouseDB` DEFAULT CHARACTER SET utf8 ;
USE `happyhouseDB` ;

-- -----------------------------------------------------
-- Table `happyhouseDB`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`member` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`member` (
  `userid` VARCHAR(15) NOT NULL,
  `userpwd` VARCHAR(15) NOT NULL,
  `email` VARCHAR(30) NULL,
  `username` VARCHAR(15) NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`baseaddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`baseaddress` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`baseaddress` (
  `code` INT NOT NULL,
  `city` VARCHAR(10) NULL,
  `gugun` VARCHAR(10) NULL,
  `dong` VARCHAR(10) NULL,
  `lat` DOUBLE NULL,
  `lng` DOUBLE NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`houseinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`houseinfo` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`houseinfo` (
  `dong` VARCHAR(10) NULL,
  `aptname` VARCHAR(15) NULL,
  `code` INT NULL,
  `buildYear` INT NULL,
  `jubun` VARCHAR(10) NULL,
  `lat` DOUBLE NULL,
  `lag` DOUBLE NULL,
  `img` BLOB NULL,
  `houseId` INT NOT NULL AUTO_INCREMENT,
  INDEX `houseinfo_code_fk_idx` (`code` ASC) VISIBLE,
  PRIMARY KEY (`houseId`),
  CONSTRAINT `houseinfo_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`housedeal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`housedeal` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`housedeal` (
  `dealNo` INT NOT NULL AUTO_INCREMENT,
  `dealAmount` INT NULL,
  `dealDate` DATE NULL,
  `area` DOUBLE NULL,
  `floor` INT NULL,
  `type` TINYINT NULL,
  `rentMoney` INT NULL,
  `houseId` INT NULL,
  PRIMARY KEY (`dealNo`),
  INDEX `housedeal_houseid_fk_idx` (`houseId` ASC) VISIBLE,
  CONSTRAINT `housedeal_houseid_fk`
    FOREIGN KEY (`houseId`)
    REFERENCES `happyhouseDB`.`houseinfo` (`houseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`commercialCode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`commercialCode` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`commercialCode` (
  `category` VARCHAR(10) NOT NULL,
  `codeName` VARCHAR(30) NULL,
  `codetype` INT NULL,
  `categoryup` VARCHAR(10) NULL,
  PRIMARY KEY (`category`),
  INDEX `commercialCode_categoryup_fk_idx` (`categoryup` ASC) VISIBLE,
  CONSTRAINT `commercialCode_categoryup_fk`
    FOREIGN KEY (`categoryup`)
    REFERENCES `happyhouseDB`.`commercialCode` (`category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`commercialArea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`commercialArea` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`commercialArea` (
  `commNo` INT NOT NULL AUTO_INCREMENT,
  `shopName` VARCHAR(45) NULL,
  `localname` VARCHAR(30) NULL,
  `category` VARCHAR(10) NULL,
  `code` INT NULL,
  `address` VARCHAR(100) NULL,
  `lat` DOUBLE NULL,
  `lng` DOUBLE NULL,
  PRIMARY KEY (`commNo`),
  INDEX `commercialArea_category_fk_idx` (`category` ASC) VISIBLE,
  INDEX `commercialArea_code_fk_idx` (`code` ASC) VISIBLE,
  CONSTRAINT `commercialArea_category_fk`
    FOREIGN KEY (`category`)
    REFERENCES `happyhouseDB`.`commercialCode` (`category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `commercialArea_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`likeArea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`likeArea` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`likeArea` (
  `userid` VARCHAR(15) NOT NULL,
  `code` INT NOT NULL,
  PRIMARY KEY (`userid`, `code`),
  INDEX `likearea_code_fk_idx` (`code` ASC) VISIBLE,
  CONSTRAINT `likearea_userid_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouseDB`.`member` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `likearea_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`environment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`environment` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`environment` (
  `code` INT NOT NULL,
  `fineDust` DOUBLE NULL,
  `ultraFineDust` DOUBLE NULL,
  PRIMARY KEY (`code`),
  CONSTRAINT `environment_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`coronaClinic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`coronaClinic` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`coronaClinic` (
  `coronaid` INT NOT NULL AUTO_INCREMENT,
  `code` INT NULL,
  `clinicName` VARCHAR(30) NULL,
  `patient_cnt` INT NULL,
  `address` VARCHAR(100) NULL,
  `lat` DOUBLE NULL,
  `lng` DOUBLE NULL,
  PRIMARY KEY (`coronaid`),
  INDEX `coronaclinic_code_fk_idx` (`code` ASC) VISIBLE,
  CONSTRAINT `coronaclinic_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `happyhouseDB`.`hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouseDB`.`hospital` ;

CREATE TABLE IF NOT EXISTS `happyhouseDB`.`hospital` (
  `hospitalid` INT NOT NULL AUTO_INCREMENT,
  `code` INT NULL,
  `hospitalName` VARCHAR(30) NULL,
  `address` VARCHAR(100) NULL,
  `careType` VARCHAR(20) NULL,
  `lat` DOUBLE NULL,
  `lng` DOUBLE NULL,
  PRIMARY KEY (`hospitalid`),
  INDEX `hospital_code_fk_idx` (`code` ASC) VISIBLE,
  CONSTRAINT `hospital_code_fk`
    FOREIGN KEY (`code`)
    REFERENCES `happyhouseDB`.`baseaddress` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
