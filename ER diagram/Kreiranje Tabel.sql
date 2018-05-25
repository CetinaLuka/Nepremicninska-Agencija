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
  `imeKraja` VARCHAR(45) NOT NULL,
  `postnaSt` INT NOT NULL,
  PRIMARY KEY (`idKraj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Naslov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Naslov` (
  `idNaslov` INT NOT NULL AUTO_INCREMENT,
  `ulica` VARCHAR(45) NOT NULL,
  `hisnaSt` VARCHAR(45) NOT NULL,
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
-- Table `mydb`.`VrstaNepremicnine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VrstaNepremicnine` (
  `idVrstaNepremicnine` INT NOT NULL AUTO_INCREMENT,
  `vrsta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVrstaNepremicnine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agent` (
  `idAgent` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `priimek` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefonskaSt` VARCHAR(9) NULL,
  `geslo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAgent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nepremičnina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nepremicnina` (
  `idNepremicnina` INT NOT NULL AUTO_INCREMENT,
  `cena` DOUBLE NOT NULL,
  `kvadraturaBivalnegaProstora` DOUBLE,
  `skupnaKvadratura` DOUBLE NOT NULL,
  `steviloSob` INT NULL,
  `letoIzgradnje` INT NULL,
  `nadstropje` INT NULL,
  `letoPrenove` INT NULL,
  `garaza` TINYINT(1) NULL,
  `balkon` TINYINT(1) NULL,
  `opis` VARCHAR(400) NULL,
  `vrstaHise` VARCHAR(45) NULL,
  `tipPosesti` VARCHAR(45) NULL,
  `prodano` TINYINT(1) NOT NULL,
  `datumObjave` DATE NOT NULL,
  `Naslov_idNaslov` INT NOT NULL,
  `VrstaNepremicnine_idVrstaNepremicnine` INT NOT NULL,
  `Agent_idAgent` INT NOT NULL,
  PRIMARY KEY (`idNepremicnina`),
  INDEX `fk_Nepremicnina_Naslov1_idx` (`Naslov_idNaslov` ASC),
  INDEX `fk_Nepremicnina_VrstaNepremicnine1_idx` (`VrstaNepremicnine_idVrstaNepremicnine` ASC),
  INDEX `fk_Nepremicnina_Agent1_idx` (`Agent_idAgent` ASC),
  CONSTRAINT `fk_Nepremicnina_Naslov1`
    FOREIGN KEY (`Naslov_idNaslov`)
    REFERENCES `mydb`.`Naslov` (`idNaslov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nepremicnina_VrstaNepremicnine1`
    FOREIGN KEY (`VrstaNepremicnine_idVrstaNepremicnine`)
    REFERENCES `mydb`.`VrstaNepremicnine` (`idVrstaNepremicnine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nepremicnina_Agent1`
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
  `urlSlike` BLOB NOT NULL,
  `opisSlike` VARCHAR(20) NOT NULL,
  `Nepremicnina_idNepremicnina` INT NOT NULL,
  `Agent_idAgent` INT NOT NULL,
  PRIMARY KEY (`idSlika`),
  INDEX `fk_Slika_Nepremicnina1_idx` (`Nepremicnina_idNepremicnina` ASC),
  INDEX `fk_Slika_Agent1_idx` (`Agent_idAgent` ASC),
  CONSTRAINT `fk_Slika_Nepremicnina1`
    FOREIGN KEY (`Nepremicnina_idNepremicnina`)
    REFERENCES `mydb`.`Nepremicnina` (`idNepremicnina`)
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
