-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Kraj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kraj` (
  `idKraj` INT NOT NULL AUTO_INCREMENT,
  `ImeKraja` VARCHAR(45) NOT NULL,
  `PoštnaŠt` INT NOT NULL,
  PRIMARY KEY (`idKraj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Naslov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Naslov` (
  `idNaslov` INT NOT NULL AUTO_INCREMENT,
  `Ulica` VARCHAR(45) NOT NULL,
  `HišnaŠt` VARCHAR(45) NOT NULL,
  `Kraj_idKraj` INT NOT NULL,
  PRIMARY KEY (`idNaslov`),
  INDEX `fk_Naslov_Kraj_idx` (`Kraj_idKraj` ASC),
  CONSTRAINT `fk_Naslov_Kraj`
    FOREIGN KEY (`Kraj_idKraj`)
    REFERENCES `mydb`.`Kraj` (`idKraj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VrstaNepremičnine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VrstaNepremičnine` (
  `idVrstaNepremičnine` INT NOT NULL AUTO_INCREMENT,
  `Vrsta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVrstaNepremičnine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agent` (
  `idAgent` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  `EMailNaslov` VARCHAR(45) NOT NULL,
  `TelŠt` VARCHAR(9) NULL,
  `Geslo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAgent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nepremičnina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nepremičnina` (
  `idNepremičnina` INT NOT NULL AUTO_INCREMENT,
  `Cena` DOUBLE NOT NULL,
  `KvadraturaBivalnegaProstora` DOUBLE,
  `SkupnaKvadratura` DOUBLE NOT NULL,
  `ŠtSob` INT NULL,
  `LetnikIzgradnje` INT NULL,
  `Nadstropje` INT NULL,
  `LetoPrenove` INT NULL,
  `Garaža` TINYINT(1) NULL,
  `Balkon` TINYINT(1) NULL,
  `Opis` VARCHAR(400) NULL,
  `VrstaHiše` VARCHAR(45) NULL,
  `TipPosesti` VARCHAR(45) NULL,
  `Prodano` TINYINT(1) NOT NULL,
  `DatumObjave` DATE NOT NULL,
  `Naslov_idNaslov` INT NOT NULL,
  `VrstaNepremičnine_idVrstaNepremičnine` INT NOT NULL,
  `Agent_idAgent` INT NOT NULL,
  PRIMARY KEY (`idNepremičnina`),
  INDEX `fk_Nepremičnina_Naslov1_idx` (`Naslov_idNaslov` ASC),
  INDEX `fk_Nepremičnina_VrstaNepremičnine1_idx` (`VrstaNepremičnine_idVrstaNepremičnine` ASC),
  INDEX `fk_Nepremičnina_Agent1_idx` (`Agent_idAgent` ASC),
  CONSTRAINT `fk_Nepremičnina_Naslov1`
    FOREIGN KEY (`Naslov_idNaslov`)
    REFERENCES `mydb`.`Naslov` (`idNaslov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nepremičnina_VrstaNepremičnine1`
    FOREIGN KEY (`VrstaNepremičnine_idVrstaNepremičnine`)
    REFERENCES `mydb`.`VrstaNepremičnine` (`idVrstaNepremičnine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nepremičnina_Agent1`
    FOREIGN KEY (`Agent_idAgent`)
    REFERENCES `mydb`.`Agent` (`idAgent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Slika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Slika` (
  `idSlika` INT NOT NULL AUTO_INCREMENT,
  `UrlSlike` BLOB NOT NULL,
  `OpisSlike` VARCHAR(20) NOT NULL,
  `Nepremičnina_idNepremičnina` INT NOT NULL,
  `Agent_idAgent` INT NOT NULL,
  PRIMARY KEY (`idSlika`),
  INDEX `fk_Slika_Nepremičnina1_idx` (`Nepremičnina_idNepremičnina` ASC),
  INDEX `fk_Slika_Agent1_idx` (`Agent_idAgent` ASC),
  CONSTRAINT `fk_Slika_Nepremičnina1`
    FOREIGN KEY (`Nepremičnina_idNepremičnina`)
    REFERENCES `mydb`.`Nepremičnina` (`idNepremičnina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Slika_Agent1`
    FOREIGN KEY (`Agent_idAgent`)
    REFERENCES `mydb`.`Agent` (`idAgent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
