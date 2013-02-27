SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `hyacinth` ;
CREATE SCHEMA IF NOT EXISTS `hyacinth` DEFAULT CHARACTER SET utf8 ;
USE `hyacinth` ;

-- -----------------------------------------------------
-- Table `hyacinth`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`USER` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`USER` (
  `USER_ID` VARCHAR(32) NOT NULL ,
  `USER_LOGIN_ID` VARCHAR(45) NOT NULL ,
  `USER_NAME` VARCHAR(45) NOT NULL ,
  `USER_PASSWORD` VARCHAR(45) NOT NULL ,
  `USER_EMAIL` VARCHAR(45) NULL ,
  `USER_QQ_NUM` VARCHAR(45) NULL ,
  `USER_CREDIT` VARCHAR(45) NULL ,
  `USER_SECURITY` INT NULL ,
  `USER_REGISTER_DATE` DATETIME NULL ,
  `url` VARCHAR(100) NULL DEFAULT 'images/default_user.jpg' ,
  `pic_url` VARCHAR(100) NULL DEFAULT 'images/default_headPic.jpg' ,
  PRIMARY KEY (`USER_ID`) ,
  UNIQUE INDEX `USER_LOGIN_ID_UNIQUE` (`USER_LOGIN_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`USER_RELATIONSHIP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`USER_RELATIONSHIP` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`USER_RELATIONSHIP` (
  `hostid` VARCHAR(32) NOT NULL ,
  `targetid` VARCHAR(32) NOT NULL ,
  `relationship` TINYINT(1)  NULL ,
  INDEX `fk_USER_has_USER_USER2` (`targetid` ASC) ,
  INDEX `fk_USER_has_USER_USER1` (`hostid` ASC) ,
  CONSTRAINT `fk_USER_has_USER_USER1`
    FOREIGN KEY (`hostid` )
    REFERENCES `hyacinth`.`USER` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USER_has_USER_USER2`
    FOREIGN KEY (`targetid` )
    REFERENCES `hyacinth`.`USER` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`RESOURCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`RESOURCE` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`RESOURCE` (
  `id` VARCHAR(32) NOT NULL ,
  `date` DATETIME NULL ,
  `rank` INT NULL DEFAULT 0 ,
  `pic_url` VARCHAR(100) NULL DEFAULT 'images/defaultPo.jpg' ,
  `title` VARCHAR(100) NULL ,
  `url` VARCHAR(100) NULL ,
  `userid` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_RESOURCE_USER1` (`userid` ASC) ,
  CONSTRAINT `fk_RESOURCE_USER1`
    FOREIGN KEY (`userid` )
    REFERENCES `hyacinth`.`USER` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`COMMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`COMMENT` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`COMMENT` (
  `id` VARCHAR(32) NOT NULL ,
  `date` DATETIME NULL ,
  `content` VARCHAR(100) NULL ,
  `floor` INT NULL ,
  `resourceId` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_COMMENT_RESOURCE1` (`resourceId` ASC) ,
  CONSTRAINT `fk_COMMENT_RESOURCE1`
    FOREIGN KEY (`resourceId` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`FAVORITE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`FAVORITE` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`FAVORITE` (
  `USER_ID` VARCHAR(32) NOT NULL ,
  `FAVORITE_MY_TAG` TINYTEXT NULL ,
  PRIMARY KEY (`USER_ID`) ,
  CONSTRAINT `fk_FAVORITE_USER1`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `hyacinth`.`USER` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`FAVORITE_has_RESOURCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`FAVORITE_has_RESOURCE` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`FAVORITE_has_RESOURCE` (
  `FAVORITE_USER_ID` VARCHAR(32) NOT NULL ,
  `RESOURCE_RESOURCE_ID` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`FAVORITE_USER_ID`, `RESOURCE_RESOURCE_ID`) ,
  INDEX `fk_FAVORITE_has_RESOURCE_RESOURCE1` (`RESOURCE_RESOURCE_ID` ASC) ,
  INDEX `fk_FAVORITE_has_RESOURCE_FAVORITE1` (`FAVORITE_USER_ID` ASC) ,
  CONSTRAINT `fk_FAVORITE_has_RESOURCE_FAVORITE1`
    FOREIGN KEY (`FAVORITE_USER_ID` )
    REFERENCES `hyacinth`.`FAVORITE` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FAVORITE_has_RESOURCE_RESOURCE1`
    FOREIGN KEY (`RESOURCE_RESOURCE_ID` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`TAGs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`TAGs` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`TAGs` (
  `TAG_ID` VARCHAR(32) NOT NULL ,
  `TAG_NAME` VARCHAR(32) NULL ,
  PRIMARY KEY (`TAG_ID`) ,
  UNIQUE INDEX `TAG_NAME_UNIQUE` (`TAG_NAME` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`TAGs_has_RESOURCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`TAGs_has_RESOURCE` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`TAGs_has_RESOURCE` (
  `TAGs_TAG_ID` VARCHAR(32) NOT NULL ,
  `RESOURCE_RESOURCE_ID` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`TAGs_TAG_ID`, `RESOURCE_RESOURCE_ID`) ,
  INDEX `fk_TAGs_has_RESOURCE_RESOURCE1` (`RESOURCE_RESOURCE_ID` ASC) ,
  INDEX `fk_TAGs_has_RESOURCE_TAGs1` (`TAGs_TAG_ID` ASC) ,
  CONSTRAINT `fk_TAGs_has_RESOURCE_TAGs1`
    FOREIGN KEY (`TAGs_TAG_ID` )
    REFERENCES `hyacinth`.`TAGs` (`TAG_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TAGs_has_RESOURCE_RESOURCE1`
    FOREIGN KEY (`RESOURCE_RESOURCE_ID` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`VIDEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`VIDEO` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`VIDEO` (
  `VIDEO_ID` VARCHAR(32) NULL ,
  `VIDEO_URL` VARCHAR(45) NULL ,
  `RESOURCE_ID` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`RESOURCE_ID`) ,
  INDEX `fk_PASSAGE_RESOURCE1` (`RESOURCE_ID` ASC) ,
  CONSTRAINT `fk_PASSAGE_RESOURCE10`
    FOREIGN KEY (`RESOURCE_ID` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`MUSIC_ALBUM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`MUSIC_ALBUM` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`MUSIC_ALBUM` (
  `MUSIC_ID` INT NULL ,
  `MUSIC_RANK` INT NULL ,
  `MUSIC_URL` VARCHAR(45) NULL ,
  `RESOURCE_ID` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`RESOURCE_ID`) ,
  INDEX `fk_PASSAGE_RESOURCE1` (`RESOURCE_ID` ASC) ,
  CONSTRAINT `fk_PASSAGE_RESOURCE11`
    FOREIGN KEY (`RESOURCE_ID` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`PHOTO_ALBUM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`PHOTO_ALBUM` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`PHOTO_ALBUM` (
  `PHOTO_ID` INT NULL ,
  `PHOTO_RANK` INT NULL ,
  `PHOTO_URL` VARCHAR(45) NULL ,
  `RESOURCE_ID` VARCHAR(32) NOT NULL ,
  INDEX `fk_PASSAGE_RESOURCE1` (`RESOURCE_ID` ASC) ,
  PRIMARY KEY (`RESOURCE_ID`) ,
  CONSTRAINT `fk_PASSAGE_RESOURCE110`
    FOREIGN KEY (`RESOURCE_ID` )
    REFERENCES `hyacinth`.`RESOURCE` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hyacinth`.`USER_SPECIAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hyacinth`.`USER_SPECIAL` ;

CREATE  TABLE IF NOT EXISTS `hyacinth`.`USER_SPECIAL` (
  `USER_ID` VARCHAR(32) NOT NULL ,
  `USER_TYPE` INT NULL ,
  INDEX `USER_ID` (`USER_ID` ASC) ,
  CONSTRAINT `fk_USER_SPECIAL_USER1`
    FOREIGN KEY (`USER_ID` )
    REFERENCES `hyacinth`.`USER` (`USER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
