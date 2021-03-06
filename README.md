# 📑 관통프로젝트: HappyHouse_DB

### 📆 제출일: 2021.04.09 일 23시 59분

### 참여 페어
- 김정윤, 이서영

### 처리된 요구사항 목록
  
|난이도|구현기능|세부|작성여부(O/X)|
|:---:|---|---|:---:|
|기본|회원관리|DB에 데이타 구축|O|
|기본|아파트 실거래가 데이타|DB에 데이타 구축|O|
|기본|주택 실거래가 데이타|DB에 데이타 구축|O|
|추가|관심지역 동네 업종 정보|DB에 데이타 구축|O|
|추가|관심지역 대기 오염 정보|DB에 데이타 구축|O|
|심화|코로나 선별 진료소 정보 데이타 관리|DB에 데이터 구축|O|
|심화|국가 안심 병원 정보 데이타 관리|DB에 데이터 구축|O|

<span style="color:red">
* 작성된 기능은 반드시 캡쳐되어야 합니다.<br>
* 추가로 구현한 기능을 표에 추가시키세요.
</span>

## 실행화면 캡쳐 - 

TODO: 요구사항 목록에서 완료 처리된 사항의 캡쳐 이미지를 등록하세요.


💯 ER Diagram, Schema (DDL sql 파일) 제출

![Untitled](https://user-images.githubusercontent.com/48318620/113992610-99520780-988e-11eb-863d-88d3ae3c0c20.png)


## ⁉️ 추가 설계 사항

- 관심 지역 데이터 관리 (likearea table)
- 동네 환경 정보 데이터 관리 (environment table)
- 코로나 선별 진료소 정보 데이터 관리 (corona table)
- 국가 안심 병원 정보 데이터 관리 (hospital table)

---

## ⁉️ 기존 데이터 이용

- 회원 정보 데이터 관리 (member Table)
- 아파트 매매 실거래가 데이터 관리 (baseaddress(도시정보) & housedeal(거래정보) & houseinfo)
- 상점 정보 (commercialarea(상권 상세 정보) & commercialcode(상권 카테고리))


## !? Database Table
- 사용자(아이디, 비번, 이름, 이메일)
- 주택(주택id, 위치정보fk, 아파트이름, 건축년도, 지번 , 위도, 경도, 이미지)
- 거래내역(거래번호pk, 위치정보fk, 아파트이름, 동이름, 거래유형, 거래날짜, 거래가격, 전월세, 평수, 층)
- 위치정보(시, 구군, 동, 코드, 위도, 경도)
- 상점(상점Id, 상점이름, 지점명, 카테고리fk, 위치정보fk, 상세주소, 위도, 경도) 
- 카테고리(위치정보fk, 코드이름)
- 환경정보(위치정보pk, 미세먼지량, 초미세먼지량)
- 코로나 진료소 (id, 위치정보fk, 진료소이름, 당일 확진자수, 상세주소, 위도, 경도)
- 병원 (id, 위치정보fk, 병원이름, 병원종류, 상세주소, 위도, 경도)
- 관심지역 (사용자fk, 위치정보fk)

## 📑 설계 초안

![스크린샷 2021-04-08 오후 11 01 25](https://user-images.githubusercontent.com/48318620/114040262-6889c680-98be-11eb-94c7-402d168063f9.png)

## 📊 ER-Diagram

![스크린샷 2021-04-09 오전 11 52 46](https://user-images.githubusercontent.com/48318620/114121981-5c3b5300-992a-11eb-8f8a-98bbee2fb739.png)

## 📑 DDL Code

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