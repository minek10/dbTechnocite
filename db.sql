-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema heroku_e7d70f13d068f53
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `heroku_e7d70f13d068f53` ;

-- -----------------------------------------------------
-- Schema heroku_e7d70f13d068f53
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heroku_e7d70f13d068f53` DEFAULT CHARACTER SET utf8 ;
USE `heroku_e7d70f13d068f53` ;

-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`formations` (
  `idFormation` INT NOT NULL AUTO_INCREMENT,
  `formationName` VARCHAR(128) NOT NULL,
  `formationNumber` VARCHAR(12) NOT NULL,
  `dateStart` DATE NOT NULL,
  `dateEnd` DATE NOT NULL,
  PRIMARY KEY (`idFormation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nationalRegister` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'formateur', 'stagiaire') NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`proofs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`proofs` (
  `idProof` INT NOT NULL AUTO_INCREMENT,
  `dateStart` DATE NOT NULL,
  `dateEnd` DATE NOT NULL,
  `file` VARCHAR(255) NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idProof`),
  INDEX `fk_proofs_users1_idx` (`users_idUser` ASC),
  CONSTRAINT `fk_proofs_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `heroku_e7d70f13d068f53`.`users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`records` (
  `idRecords` INT NOT NULL AUTO_INCREMENT,
  `dateOfDay` DATE NOT NULL,
  `period` ENUM('AM', 'PM') NOT NULL,
  `recordStatus` ENUM('present', 'abs_just', 'abs_nonJust') NOT NULL,
  `comment` VARCHAR(255) NULL,
  `proofs_idProof` INT NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idRecords`),
  INDEX `fk_presences_justificatifs1_idx` (`proofs_idProof` ASC),
  INDEX `fk_attendances_users1_idx` (`users_idUser` ASC),
  CONSTRAINT `fk_presences_justificatifs1`
    FOREIGN KEY (`proofs_idProof`)
    REFERENCES `heroku_e7d70f13d068f53`.`proofs` (`idProof`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attendances_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `heroku_e7d70f13d068f53`.`users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`users_has_formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`users_has_formations` (
  `idUsersHasFormations` INT NOT NULL AUTO_INCREMENT,
  `isActive` TINYINT NOT NULL DEFAULT 1,
  `formations_idFormation` INT NOT NULL,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idUsersHasFormations`, `formations_idFormation`, `users_idUser`),
  INDEX `fk_utilisateurs_has_formations_formations1_idx` (`formations_idFormation` ASC),
  INDEX `fk_users_has_formations_users1_idx` (`users_idUser` ASC),
  CONSTRAINT `fk_utilisateurs_has_formations_formations1`
    FOREIGN KEY (`formations_idFormation`)
    REFERENCES `heroku_e7d70f13d068f53`.`formations` (`idFormation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_formations_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `heroku_e7d70f13d068f53`.`users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`traineeChecks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`traineeChecks` (
  `idTraineeChecks` INT NOT NULL AUTO_INCREMENT,
  `checkAM` TINYINT NOT NULL DEFAULT 0,
  `checkPM` TINYINT NOT NULL DEFAULT 0,
  `users_idUser` INT NOT NULL,
  PRIMARY KEY (`idTraineeChecks`),
  INDEX `fk_sign_users1_idx` (`users_idUser` ASC),
  CONSTRAINT `fk_sign_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `heroku_e7d70f13d068f53`.`users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroku_e7d70f13d068f53`.`instructorChecks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_e7d70f13d068f53`.`instructorChecks` (
  `idInstructorChecks` INT NOT NULL AUTO_INCREMENT,
  `recordCheck` TINYINT NOT NULL DEFAULT 0,
  `comment` LONGTEXT NULL,
  `instructorSign` LONGTEXT NOT NULL,
  `records_idRecords` INT NOT NULL,
  PRIMARY KEY (`idInstructorChecks`, `records_idRecords`),
  INDEX `fk_recordCheck_records1_idx` (`records_idRecords` ASC),
  UNIQUE INDEX `records_idRecords_UNIQUE` (`records_idRecords` ASC),
  CONSTRAINT `fk_recordCheck_records1`
    FOREIGN KEY (`records_idRecords`)
    REFERENCES `heroku_e7d70f13d068f53`.`records` (`idRecords`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
