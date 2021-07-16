-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema technociteDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `technociteDB` ;

-- -----------------------------------------------------
-- Schema technociteDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `technociteDB` DEFAULT CHARACTER SET utf8 ;
USE `technociteDB` ;

-- -----------------------------------------------------
-- Table `technociteDB`.`formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`formations` (
  `idFormation` INT NOT NULL AUTO_INCREMENT,
  `formationName` VARCHAR(128) NOT NULL,
  `formationNumber` VARCHAR(12) NOT NULL,
  `dateStart` DATE NOT NULL,
  `dateEnd` DATE NOT NULL,
  PRIMARY KEY (`idFormation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technociteDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nationalRegister` LONGTEXT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `password` LONGTEXT NOT NULL,
  `role` ENUM('admin', 'formateur', 'stagiaire') NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technociteDB`.`proofs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`proofs` (
  `idProof` INT NOT NULL AUTO_INCREMENT,
  `dateStart` DATE NOT NULL,
  `dateEnd` DATE NOT NULL,
  `file` VARCHAR(255) NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idProof`),
  INDEX `fk_proofs_users1_idx` (`users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_proofs_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `technociteDB`.`users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technociteDB`.`records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`records` (
  `idRecords` INT NOT NULL AUTO_INCREMENT,
  `dateOfDay` DATE NOT NULL,
  `period` ENUM('AM', 'PM') NOT NULL,
  `recordStatus` ENUM('present', 'abs_just', 'abs_nonJust') NOT NULL,
  `comment` VARCHAR(255) NULL,
  `proofs_idProof` INT NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idRecords`),
  INDEX `fk_presences_justificatifs1_idx` (`proofs_idProof` ASC) VISIBLE,
  INDEX `fk_attendances_users1_idx` (`users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_presences_justificatifs1`
    FOREIGN KEY (`proofs_idProof`)
    REFERENCES `technociteDB`.`proofs` (`idProof`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attendances_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `technociteDB`.`users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technociteDB`.`users_has_formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`users_has_formations` (
  `idUsersHasFormations` INT NOT NULL AUTO_INCREMENT,
  `isActive` TINYINT NOT NULL DEFAULT 1,
  `formations_idFormation` INT NOT NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idUsersHasFormations`, `formations_idFormation`, `users_idUser`),
  INDEX `fk_utilisateurs_has_formations_formations1_idx` (`formations_idFormation` ASC) VISIBLE,
  INDEX `fk_users_has_formations_users1_idx` (`users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_utilisateurs_has_formations_formations1`
    FOREIGN KEY (`formations_idFormation`)
    REFERENCES `technociteDB`.`formations` (`idFormation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_formations_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `technociteDB`.`users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technociteDB`.`instructorChecks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `technociteDB`.`instructorChecks` (
  `idInstructorChecks` INT NOT NULL AUTO_INCREMENT,
  `recordCheck` TINYINT NOT NULL DEFAULT 0,
  `comment` LONGTEXT NULL,
  `records_idRecords` INT NOT NULL,
  PRIMARY KEY (`idInstructorChecks`, `records_idRecords`),
  INDEX `fk_recordCheck_records1_idx` (`records_idRecords` ASC) VISIBLE,
  UNIQUE INDEX `records_idRecords_UNIQUE` (`records_idRecords` ASC) VISIBLE,
  CONSTRAINT `fk_recordCheck_records1`
    FOREIGN KEY (`records_idRecords`)
    REFERENCES `technociteDB`.`records` (`idRecords`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
