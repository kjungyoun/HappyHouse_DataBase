# ๐ ๊ดํตํ๋ก์ ํธ: HappyHouse_DB

### ๐ ์ ์ถ์ผ: 2021.04.09 ์ผ 23์ 59๋ถ

### ์ฐธ์ฌ ํ์ด
- ๊น์ ์ค, ์ด์์

### ์ฒ๋ฆฌ๋ ์๊ตฌ์ฌํญ ๋ชฉ๋ก
  
|๋์ด๋|๊ตฌํ๊ธฐ๋ฅ|์ธ๋ถ|์์ฑ์ฌ๋ถ(O/X)|
|:---:|---|---|:---:|
|๊ธฐ๋ณธ|ํ์๊ด๋ฆฌ|DB์ ๋ฐ์ดํ ๊ตฌ์ถ|O|
|๊ธฐ๋ณธ|์ํํธ ์ค๊ฑฐ๋๊ฐ ๋ฐ์ดํ|DB์ ๋ฐ์ดํ ๊ตฌ์ถ|O|
|๊ธฐ๋ณธ|์ฃผํ ์ค๊ฑฐ๋๊ฐ ๋ฐ์ดํ|DB์ ๋ฐ์ดํ ๊ตฌ์ถ|O|
|์ถ๊ฐ|๊ด์ฌ์ง์ญ ๋๋ค ์์ข ์ ๋ณด|DB์ ๋ฐ์ดํ ๊ตฌ์ถ|O|
|์ถ๊ฐ|๊ด์ฌ์ง์ญ ๋๊ธฐ ์ค์ผ ์ ๋ณด|DB์ ๋ฐ์ดํ ๊ตฌ์ถ|O|
|์ฌํ|์ฝ๋ก๋ ์ ๋ณ ์ง๋ฃ์ ์ ๋ณด ๋ฐ์ดํ ๊ด๋ฆฌ|DB์ ๋ฐ์ดํฐ ๊ตฌ์ถ|O|
|์ฌํ|๊ตญ๊ฐ ์์ฌ ๋ณ์ ์ ๋ณด ๋ฐ์ดํ ๊ด๋ฆฌ|DB์ ๋ฐ์ดํฐ ๊ตฌ์ถ|O|

<span style="color:red">
* ์์ฑ๋ ๊ธฐ๋ฅ์ ๋ฐ๋์ ์บก์ณ๋์ด์ผ ํฉ๋๋ค.<br>
* ์ถ๊ฐ๋ก ๊ตฌํํ ๊ธฐ๋ฅ์ ํ์ ์ถ๊ฐ์ํค์ธ์.
</span>

## ์คํํ๋ฉด ์บก์ณ - 

TODO: ์๊ตฌ์ฌํญ ๋ชฉ๋ก์์ ์๋ฃ ์ฒ๋ฆฌ๋ ์ฌํญ์ ์บก์ณ ์ด๋ฏธ์ง๋ฅผ ๋ฑ๋กํ์ธ์.


๐ฏ ER Diagram, Schema (DDL sql ํ์ผ) ์ ์ถ

![Untitled](https://user-images.githubusercontent.com/48318620/113992610-99520780-988e-11eb-863d-88d3ae3c0c20.png)


## โ๏ธ ์ถ๊ฐ ์ค๊ณ ์ฌํญ

- ๊ด์ฌ ์ง์ญ ๋ฐ์ดํฐ ๊ด๋ฆฌ (likearea table)
- ๋๋ค ํ๊ฒฝ ์ ๋ณด ๋ฐ์ดํฐ ๊ด๋ฆฌ (environment table)
- ์ฝ๋ก๋ ์ ๋ณ ์ง๋ฃ์ ์ ๋ณด ๋ฐ์ดํฐ ๊ด๋ฆฌ (corona table)
- ๊ตญ๊ฐ ์์ฌ ๋ณ์ ์ ๋ณด ๋ฐ์ดํฐ ๊ด๋ฆฌ (hospital table)

---

## โ๏ธ ๊ธฐ์กด ๋ฐ์ดํฐ ์ด์ฉ

- ํ์ ์ ๋ณด ๋ฐ์ดํฐ ๊ด๋ฆฌ (member Table)
- ์ํํธ ๋งค๋งค ์ค๊ฑฐ๋๊ฐ ๋ฐ์ดํฐ ๊ด๋ฆฌ (baseaddress(๋์์ ๋ณด) & housedeal(๊ฑฐ๋์ ๋ณด) & houseinfo)
- ์์  ์ ๋ณด (commercialarea(์๊ถ ์์ธ ์ ๋ณด) & commercialcode(์๊ถ ์นดํ๊ณ ๋ฆฌ))


## !? Database Table
- ์ฌ์ฉ์(์์ด๋, ๋น๋ฒ, ์ด๋ฆ, ์ด๋ฉ์ผ)
- ์ฃผํ(์ฃผํid, ์์น์ ๋ณดfk, ์ํํธ์ด๋ฆ, ๊ฑด์ถ๋๋, ์ง๋ฒ , ์๋, ๊ฒฝ๋, ์ด๋ฏธ์ง)
- ๊ฑฐ๋๋ด์ญ(๊ฑฐ๋๋ฒํธpk, ์์น์ ๋ณดfk, ์ํํธ์ด๋ฆ, ๋์ด๋ฆ, ๊ฑฐ๋์ ํ, ๊ฑฐ๋๋ ์ง, ๊ฑฐ๋๊ฐ๊ฒฉ, ์ ์์ธ, ํ์, ์ธต)
- ์์น์ ๋ณด(์, ๊ตฌ๊ตฐ, ๋, ์ฝ๋, ์๋, ๊ฒฝ๋)
- ์์ (์์ Id, ์์ ์ด๋ฆ, ์ง์ ๋ช, ์นดํ๊ณ ๋ฆฌfk, ์์น์ ๋ณดfk, ์์ธ์ฃผ์, ์๋, ๊ฒฝ๋) 
- ์นดํ๊ณ ๋ฆฌ(์์น์ ๋ณดfk, ์ฝ๋์ด๋ฆ)
- ํ๊ฒฝ์ ๋ณด(์์น์ ๋ณดpk, ๋ฏธ์ธ๋จผ์ง๋, ์ด๋ฏธ์ธ๋จผ์ง๋)
- ์ฝ๋ก๋ ์ง๋ฃ์ (id, ์์น์ ๋ณดfk, ์ง๋ฃ์์ด๋ฆ, ๋น์ผ ํ์ง์์, ์์ธ์ฃผ์, ์๋, ๊ฒฝ๋)
- ๋ณ์ (id, ์์น์ ๋ณดfk, ๋ณ์์ด๋ฆ, ๋ณ์์ข๋ฅ, ์์ธ์ฃผ์, ์๋, ๊ฒฝ๋)
- ๊ด์ฌ์ง์ญ (์ฌ์ฉ์fk, ์์น์ ๋ณดfk)

## ๐ ์ค๊ณ ์ด์

![แแณแแณแแตแซแแฃแบ 2021-04-08 แแฉแแฎ 11 01 25](https://user-images.githubusercontent.com/48318620/114040262-6889c680-98be-11eb-94c7-402d168063f9.png)

## ๐ ER-Diagram

![แแณแแณแแตแซแแฃแบ 2021-04-09 แแฉแแฅแซ 11 52 46](https://user-images.githubusercontent.com/48318620/114121981-5c3b5300-992a-11eb-8f8a-98bbee2fb739.png)

## ๐ DDL Code

```sql=
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

```