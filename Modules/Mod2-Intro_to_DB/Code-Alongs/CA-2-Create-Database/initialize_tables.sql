CREATE DATABASE `carsome_clone`;

CREATE TABLE `carsome_clone`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NULL,
  `email` VARCHAR(155) NOT NULL,
  `username` CHAR(12) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `type` CHAR(12) DEFAULT 'customer',
  `zipCode` CHAR(7) NULL,
  `createdBy` INT NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` INT NULL,
  `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE `carsome_clone`.`car_model` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `make` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `transmission` CHAR(20) NOT NULL,
  `bodyType` TINYINT(4) NOT NULL,
  `createdBy` INT NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` INT NULL,
  `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- DROP TABLE `carsome_clone`.`car_model`;
CREATE TABLE `carsome_clone`.`car_lot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ownerId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `createdBy` INT NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` INT NULL,
  `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

ALTER TABLE
  `carsome_clone`.`car_lot`
ADD
  CONSTRAINT `user_car_lot_ownerId` FOREIGN KEY (`ownerId`) REFERENCES `carsome_clone`.`user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `carsome_clone`.`car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `carLotId` INT NOT NULL,
  `carModelId` INT NOT NULL,
  `colour` VARCHAR(45) NOT NULL DEFAULT 'BLACK',
  `price` DOUBLE NOT NULL,
  `regNo` VARCHAR(45) NULL,
  `regDate` DATE NULL,
  `initialMileage` BIGINT NULL DEFAULT 0,
  `status` CHAR(45),
  `createdBy` INT NOT NULL,
  `createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` INT NULL,
  `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `car_lot_car_car_lot_id _idx` (`carLotId` ASC) VISIBLE,
  INDEX `car_model_car_car_model_id_idx` (`carModelId` ASC) VISIBLE,
  CONSTRAINT `car_lot_car_car_lot_id` FOREIGN KEY (`carLotId`) REFERENCES `carsome_clone`.`car_lot` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `car_model_car_car_model_id` FOREIGN KEY (`carModelId`) REFERENCES `carsome_clone`.`car_model` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `carsome_clone`.`car_payment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `carId` INT NOT NULL,
  `userId` INT NOT NULL,
  `paymentMode` VARCHAR(45) NOT NULL DEFAULT 'CREDIT_CARD',
  `amountPaid` DOUBLE NOT NULL,
  `priceDifference` DOUBLE NOT NULL DEFAULT 0,
  `status` TINYINT(4) NOT NULL,
  `createdBy` INT NOT NULL,
  `createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` INT NULL,
  `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_car_payment_userId_idx` (`userId` ASC) VISIBLE,
  INDEX `car_car_payment_carId_idx` (`carId` ASC) VISIBLE,
  CONSTRAINT `user_car_payment_userId` FOREIGN KEY (`userId`) REFERENCES `carsome_clone`.`user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_car_payment_carId` FOREIGN KEY (`carId`) REFERENCES `carsome_clone`.`car` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- INSERT TO USER TABLE
INSERT INTO `carsome_clone`.`user` VALUES (1,'Pavi','Weerasinghe','pavi@gmail.com','pavi_w','osdufa0d87f98yio','customer','42321',1,'2022-08-14 16:58:36',NULL,NULL),(2,'John','Tavern','jotave@gmail.com','jon','1234123241fs','customer','21332',2,'2022-08-14 16:58:37',NULL,NULL),(3,'Rom','Mesh','romesh@gmail.com','david_rom','1421fdsaffas','owner','21332',2,'2022-08-14 16:58:38',NULL,NULL);

-- INSERT TO CAR_LOT TABLE
INSERT INTO `carsome_clone`.`car_lot` VALUES (1,3,'Mega Lot','Ampang',3,'2022-08-13 20:17:19',NULL,NULL),(2,3,'Smaller lot','PJ',3,'2022-08-13 20:17:19',NULL,NULL);

-- INSERT TO CAR_LOT TABLE
INSERT INTO `carsome_clone`.`car_model` VALUES (1,'Camry','Toyata',1993,'auto',1,1,'2022-08-14 16:58:45',NULL,NULL),(2,'Altis','Toyata',2010,'auto',1,1,'2022-08-14 16:58:49',NULL,NULL),(3,'Vios','Toyata',2011,'auto',1,1,'2022-08-14 16:58:49',NULL,NULL),(4,'Accord','Honda',1995,'manual',1,1,'2022-08-14 16:58:51',NULL,NULL),(5,'Accord','Honda',2020,'auto',1,1,'2022-08-14 16:58:52',NULL,NULL),(6,'Yaris','Toyota',2022,'auto',1,1,'2022-08-14 16:58:52',NULL,NULL),(7,'Civic','Honda',2009,'manual',1,1,'2022-08-14 16:58:53',NULL,NULL),(8,'City','Honda',2012,'manual',1,1,'2022-08-14 16:58:54',NULL,NULL);

-- INSERT TO CAR
INSERT INTO `carsome_clone`.`car` VALUES (1,1,1,'BLACK',5000,NULL,'1993-12-20 00:00:00',2330000,'sold',3,'2022-08-13 20:19:20',NULL,'2022-08-14 14:37:04'),(2,1,1,'BLACK',10000,NULL,'1994-12-20 00:00:00',23300,'sold',3,'2022-08-13 20:19:57',NULL,'2022-08-14 14:37:04'),(3,1,3,'BLACK',23000,NULL,'2010-12-20 00:00:00',80000,NULL,3,'2022-08-13 20:20:50',NULL,NULL),(4,2,3,'BLACK',30000,NULL,'2011-01-21 00:00:00',20000,NULL,3,'2022-08-13 20:21:27',NULL,NULL),(6,2,3,'WHITE',30000,NULL,'2011-01-20 00:00:00',25000,NULL,3,'2022-08-13 20:33:05',NULL,NULL),(7,2,5,'BLUE',90000,NULL,NULL,0,NULL,3,'2022-08-13 20:33:05',NULL,NULL),(8,2,5,'WHITE',92000,NULL,NULL,0,'sold',3,'2022-08-13 20:33:05',NULL,'2022-08-14 14:37:04'),(9,1,6,'RED',80000,NULL,NULL,0,NULL,3,'2022-08-13 20:33:05',NULL,NULL),(10,1,7,'BLACK',40000,NULL,'2009-10-12 00:00:00',320000,'stolen',3,'2022-08-13 20:33:05',NULL,'2022-08-14 16:15:03'),(11,1,8,'RED',39000,NULL,'2012-03-12 00:00:00',300000,NULL,3,'2022-08-13 20:39:22',NULL,NULL),(12,2,8,'RED',43000,NULL,'2012-04-05 00:00:00',300000,NULL,3,'2022-08-13 20:39:22',NULL,NULL),(13,2,2,'BLUE',32000,NULL,'2011-06-13 00:00:00',40000,NULL,3,'2022-08-13 20:39:22',NULL,NULL),(14,2,2,'BLACK',32000,NULL,'2011-05-30 00:00:00',30000,'sold',3,'2022-08-13 20:39:22',NULL,'2022-08-14 14:37:04'),(15,1,4,'BLACK',10000,NULL,'1995-12-23 00:00:00',1000000,NULL,3,'2022-08-13 20:39:22',NULL,NULL),(16,1,4,'BLUE',10000,NULL,'1995-12-23 00:00:00',900000,NULL,3,'2022-08-14 17:33:05',NULL,NULL);

-- INSERT TO CAR_PAYMENT
INSERT INTO `carsome_clone`.`car_payment` VALUES (1,1,1,'CREDIT_CARD',5000,0,2,1,'2022-08-13 20:51:04',NULL,NULL),(2,1,2,'CASH',4000,-1000,1,2,'2022-08-13 20:51:04',NULL,NULL),(3,8,1,'CASH',92000,0,1,1,'2022-08-13 20:51:04',NULL,NULL),(4,14,2,'CREDIT_CARD',29000,-3000,1,2,'2022-08-13 20:51:04',NULL,NULL),(5,2,1,'CREDIT_CARD',12000,2000,2,1,'2022-08-13 20:51:04',NULL,'2022-08-14 14:36:17'),(6,2,2,'CASH',13000,3000,1,2,'2022-08-13 20:51:04',NULL,NULL),(7,3,3,'CASH',10000,-13000,1,3,'2022-08-14 15:57:49',NULL,NULL),(8,4,3,'CASH',10000,-13000,2,3,NULL,NULL,NULL);