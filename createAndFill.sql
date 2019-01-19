DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
CREATE TABLE `test`.`test` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `need` BIT(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`))
COLLATE='utf8_general_ci';

INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('материнская плата', 1, 3);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('звуковая карта', 0, 2);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('процессор', 1, 5);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('подсветка корпуса', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('HDD диск', 1, 8);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('корпус', 1, 10);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('оперативная память', 1, 7);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('видеокарта', 0, 4);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('кулер на процессор', 1, 6);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('CD Rom', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('CD-R Rom', 0, 1);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('CD-RW Rom', 0, 3);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('DVD Rom', 0, 5);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('DVD-R Rom', 0, 2);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('DVD-RW Rom', 0, 4);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('BD Rom', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('BD-R Rom', 0, 6);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('BD-RW Rom', 0, 2);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('FD Drive', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('блок питания', 1, 15);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('ZIP', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('кулер на корпус', 0, 15);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('дополнительные порты USB', 0, 9);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('Card Reader', 0, 4);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('модем', 0, 0);
INSERT INTO `test`.`test` (`name`,`need`,`quantity`) VALUES ('сетевая карта', 0, 11);