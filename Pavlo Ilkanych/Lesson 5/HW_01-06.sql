-- -----------------------------------------------------
-- Schema social_network
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `social_network`;
USE `social_network` ;
drop database social_network;

-- -----------------------------------------------------
-- Table `social_network`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS user (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `userc_surname` VARCHAR(45) NOT NULL,
  `user_age` INT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `social_network`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS account (
  `login` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `account_id` INT,
  CONSTRAINT `fk_account_user`
    FOREIGN KEY (`account_id`)
    REFERENCES `social_network`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `social_network`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS message (
  `message_id` INT NOT NULL,
  `message_text` TINYTEXT NOT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `fk_message_account1_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `social_network`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `social_network`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS album (
  `album_id` INT NOT NULL,
  `album_title` VARCHAR(45) NULL,
  `number_of_photo` INT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_album_account1_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `social_network`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `social_network`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS photo (
  `photo_id` INT NOT NULL,
  `photo_title` VARCHAR(45) NULL,
  `photo_size` VARCHAR(100) NULL,
  PRIMARY KEY (`photo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `social_network`.`photo_has_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS photo_has_album (
  `photo_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`photo_id`, `album_id`),
  INDEX `fk_photo_has_album_album1_idx` (`album_id` ASC) VISIBLE,
  INDEX `fk_photo_has_album_photo1_idx` (`photo_id` ASC) VISIBLE,
  CONSTRAINT `fk_photo_has_album_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `social_network`.`photo` (`photo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_has_album_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `social_network`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- 1. Вибрати всю інформацію про user , які не мають account
select user_name, userc_surname, user_age
from user left join account on user.user_id = account.account_id
where account_id is null;


-- 2. Вибрати всі повідомлення для account = 1;
select message_id, message_text
from message left join account on message.account_id = account.account_id
where account.account_id = 1;

-- 3. Вибрати всі повідомлення для account login = test
select message_id, message_text
from message left join account on message.account_id = account.account_id
where account.login = "test";

-- 4. Вибрати всі повідомлення для user = Петро
select message_id, message_text
from message left join user on message.account_id = user.user_id
where user.user_name = "Петро";

-- 5. Вивести скільки повідомлень є у кожного користувача (таблиця)
select user_id, count(message_id) as qty
from message join user on message.account_id = user.user_id;

-- 6. Показати акаунт користовуча Борис Лалал
select * from account left join user on account.account_id = user.user_id
where user.user_name = "Борис" and user.userc_surname = "Лалал";

-- 7. Вивести всі альбоми, які є у акаунта = “sonia_43‘
select album_id, album_title from album 
left join account on account.account_id = album.account_id
where account.login = "sonia_43";

-- 8. Вивести скільки альбомів є у user = “Petro”
select user_id, count(album_id) as qty
from album join user on album.album_id = user.user_id
where user.user_name = "Petro";

-- 9. Вивести всі фотки, які є у альбомі номер 3
select photo_id, photo_title from photo
left join album on photo.photo_id = album.album_id
where album.album_id = 3;

-- 10. Вивести всі фото, які є у альбомі з назвою ‘Nature’
select photo_id, photo_title from photo
left join album on photo.photo_id = album.album_id
where album.album_title = "Nature";

-- 11. Вивести всі фото, які в користувача “Петро”
select photo_id, photo_title from photo
left join user on photo.photo_id = user.user_id
where user.user_name = "Петро";

