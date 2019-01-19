-- USE test;
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `ID` INT(8) NOT NULL AUTO_INCREMENT,
  `PARTS_NAME` VARCHAR(30) NOT NULL,
  `IS_NEED` TINYINT(1) NOT NULL DEFAULT '0',
  `AMOUNT` INT(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (1, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (2, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (3, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (4, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (5, 'processor', TRUE , 0);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (6, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (7, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (8, 'processor', TRUE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (9, 'processor', FALSE , 0);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (10, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (11, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (12, 'processor', TRUE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (13, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (14, 'processor', FALSE , 0);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (15, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (16, 'processor', TRUE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (17, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (18, 'processor', FALSE , 0);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (19, 'processor', FALSE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (20, 'processor', TRUE , 5);
INSERT into `parts`(ID, PARTS_NAME, IS_NEED,AMOUNT) VALUES (21, 'processor', FALSE , 5);