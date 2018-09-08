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
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUsers` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ContactNo` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Userscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Items` (
  `idItems` INT NOT NULL,
  `IName` VARCHAR(45) NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` INT NOT NULL,
  `Users_idUsers` INT NOT NULL,
  PRIMARY KEY (`idItems`),
  INDEX `fk_Items_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Items_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `Quantity` INT NOT NULL,
  `Users_idUsers` INT NOT NULL,
  `Items_idItems` INT NOT NULL,
  PRIMARY KEY (`Users_idUsers`, `Items_idItems`),
  INDEX `fk_Order_Items1_idx` (`Items_idItems` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Items1`
    FOREIGN KEY (`Items_idItems`)
    REFERENCES `mydb`.`Items` (`idItems`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arduino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arduino` (
  `idArduino` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CropName` VARCHAR(45) NOT NULL,
  `Humidity` INT NOT NULL,
  `SoilMoisture` DECIMAL NOT NULL,
  `WaterAmount` INT NOT NULL,
  `Duration` INT NOT NULL,
  `Rate` INT NOT NULL,
  `Users_idUsers1` INT NOT NULL,
  PRIMARY KEY (`idArduino`),
  INDEX `fk_Arduino_Users2_idx` (`Users_idUsers1` ASC) VISIBLE,
  CONSTRAINT `fk_Arduino_Users2`
    FOREIGN KEY (`Users_idUsers1`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arduino_Crop_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arduino_Crop_Type` (
  `Crop_type` VARCHAR(30) NOT NULL,
  `Arduino_idArduino` DATETIME NOT NULL,
  PRIMARY KEY (`Crop_type`, `Arduino_idArduino`),
  INDEX `fk_Arduino_Crop_Type_Arduino1_idx` (`Arduino_idArduino` ASC) VISIBLE,
  CONSTRAINT `fk_Arduino_Crop_Type_Arduino1`
    FOREIGN KEY (`Arduino_idArduino`)
    REFERENCES `mydb`.`Arduino` (`idArduino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arduino_Crop_Stage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arduino_Crop_Stage` (
  `Stage` VARCHAR(30) NOT NULL,
  `Arduino_idArduino` DATETIME NOT NULL,
  PRIMARY KEY (`Stage`, `Arduino_idArduino`),
  INDEX `fk_Arduino_Crop_Stage_Arduino1_idx` (`Arduino_idArduino` ASC) VISIBLE,
  CONSTRAINT `fk_Arduino_Crop_Stage_Arduino1`
    FOREIGN KEY (`Arduino_idArduino`)
    REFERENCES `mydb`.`Arduino` (`idArduino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
