CREATE DATABASE IF NOT EXISTS `SellingPlatform2`;
USE `SellingPlatform2`;

--  ceditCard _Customer TABLE 
CREATE TABLE IF NOT EXISTS  `ceditCard_Customer` (
`cardNaumber`               BigINT(16)    CHECK(LENGTH(`cardNaumber`)=16),
`name_onCard`               VARCHAR(60)   NOT NULL,
`Exp_date`                  DATE          CHECK(`Exp_date` > '23/6/30'),
CONSTRAINT `ceditCard_PK` PRIMARY KEY (`cardNaumber`)
);


--  Customer TABLE 
CREATE TABLE IF NOT EXISTS  `Customer` (
`customerID`                INT(10)           ,
`Fname`                     VARCHAR(30)     NOT NULL ,
`Lname`                     VARCHAR(30)              ,
`email`                     VARCHAR(60)     CHECK((`email`  LIKE  '%gmail.com' OR `email`  LIKE  '%hotmail.com')),
`Address`                   VARCHAR(50)     NOT NULL,
`Password`                  VARCHAR(10)     CHECK(LENGTH(`Password`) >7 AND LENGTH(`Password`) <11 ),														
`cardNaumber`               BigINT(16)      NOT NULL UNIQUE ,

 CONSTRAINT `Customer_PK` PRIMARY KEY (`customerID`),
 CONSTRAINT `ceditCard_FK` FOREIGN KEY (`cardNaumber`) REFERENCES `ceditCard_Customer`(`cardNaumber`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE
 

 
 ); 

CREATE TABLE IF NOT EXISTS  `PhoneNumbers` (
`CustomerID`                INT(5)    ,
`phoneNumbers`              INT(9)    CHECK(LENGTH(`phoneNumbers`)=9),
  CONSTRAINT `PhoneNumbers` PRIMARY KEY (`CustomerID` ,`phoneNumbers`),
CONSTRAINT ` PhoneNumbers_FK1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE
 ); 


-- INSERT MULTIPLE ROWS 
INSERT INTO `ceditCard_Customer`
 VALUES
 ('1234567891234567', 'Danah Anas', '23/7/1'),
 ('9876543211234567', 'Ahmed Fahad ', ' 24/4/1'),
 ('1234567893216549', 'Reem Khaled', '23/12/1'),
 ('6789543219876543', 'Badr Salem', '25/2/1'),
 ('3217654896541230', 'Sarah Fahad', '26/1/1');
INSERT INTO `Customer`
VALUES
('54738', 'Danah', 'Anas' , 'Danah@gmail.com', 'Riyadh', '2345@Danah', '1234567891234567'),
('29407', 'Ahmed', 'Fahad', 'Ahmed@gmail.com', 'Najran', 'Ahmed@9871 ', '9876543211234567'),
('13582', 'Reem', 'Khaled', 'Reem@gmail.com', 'Hail', '8172Reem@ ', '1234567893216549'),
('79463', 'Badr', 'Salem', 'Badr@gmail.com', 'Jazan', 'Badr80@01', '6789543219876543'),
('65352', 'Sarah', 'Fahad', 'Sarah@gmail.com', 'Qassim', 'S@Fahad123', '3217654896541230');

 -- UPDAYE A ROW
 INSERT INTO `ceditCard_Customer`
 VALUES
 ('1239382391045670', 'lami Ahmed', '28/2/6'),
 ('1297382391045670', 'daleen amjad', '24/1/9');
INSERT INTO `Customer`
VALUES
('34983', 'lami' , 'Ahmed', 'lami@hotmail.com' , 'Riyadh', '349@lami' , '1239382391045670'),
('20915', 'daleen' , 'amjad', 'daleen@hotmail.com' , 'Qassim', '51@daleen' , '1297382391045670');

INSERT INTO`phonenumbers`
 VALUES 
 ('54738 ', '0533187654'),
 ('54738 ', '0587612301'),
 (' 29407 ', '0511098451'),
 (' 29407 ', '0598238410'),
 (' 29407 ', '0544434177'),
 (' 13582', '0568222193'),
 ('79463 ', '0591251920'),
 ('79463 ', '0501623947'),
 ('65352', '0519835732'),
 ('34983', '0533498354') , 
 ('20915', '0502915301');


 


-- COUNT  the number of customer from each city 
SELECT `Address`,
count(`Address`) AS TOTAL 
FROM `Customer`
GROUP BY `Address`;
 
 -- Displaying users who entered more than one mobile number when they registered 
 -- with a display of the total number of mobile numbers they entered
 SELECT `CustomerID`,
count(*) AS TOTAL 
FROM `PhoneNumbers`
GROUP BY `CustomerID`
HAVING count(*)> 1 ;

-- VIEW USERS WHO USE GMAIL
SELECT `Fname` , `CustomerID` , `email`
FROM `Customer`
WHERE (`email`  LIKE  '%gmail.com');

-- VIEW USERS WHO USE hotmail
SELECT `Fname` , `CustomerID` , `email`
FROM `Customer`
WHERE (`email`  LIKE  '%hotmail.com');

 SELECT * 
 FROM Customer;
-- -----------------------------------------
CREATE TABLE `CeditCard_Seller` (
`CardNumber`  BIGINT(16)  NOT NULL UNIQUE CHECK(LENGTH(`CardNumber`) = 16),
`Name_onCard`  VARCHAR(50) NOT NULL,
`Exp_date`   date   NOT NULL,

CONSTRAINT `CeditCard_Seller_PK` PRIMARY KEY  (`CardNumber`)
);

CREATE TABLE `Seller` (
`sellerID`   BIGINT(8)  NOT NULL UNIQUE,
`Fname`   VARCHAR(50) NOT NULL,
`Lname`   VARCHAR(50),
`email`   VARCHAR(50) NOT NULL UNIQUE CHECK( `email` LIKE ('%@gmail.com') OR `email` LIKE ('%@hotmail.com') OR `email` LIKE ('%@ymail.com')  ),
`PhoneNumber`  VARCHAR(10) NOT NULL   CHECK(LENGTH(`PhoneNumber`) = 10),
`Address`   VARCHAR(50) NOT NULL, 
`password`   VARCHAR(8)  NOT NULL   CHECK (LENGTH(`password`) = 7),    
                                            
`CardNumber`  BIGINT(16)  NOT NULL UNIQUE ,

CONSTRAINT `Seller_PK`  PRIMARY KEY  (`sellerID`),
CONSTRAINT `Seller_FK1` FOREIGN KEY (`CardNumber`) REFERENCES `CeditCard_Seller`(`CardNumber`) 
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO `CeditCard_Seller`(`CardNumber`, `Name_onCard`, `Exp_date`)
    VALUES(1345245345637656, 'Majed Saad', STR_TO_DATE('2023-08-01', '%Y-%m-%d')),
		  (1123454565787328, 'Abdullah Fahad', STR_TO_DATE('2024-01-01', '%Y-%m-%d')),
		  (1345456288789001, 'Ali Naser', STR_TO_DATE('2023-10-01', '%Y-%m-%d')),
          (6473425457894509, 'Kareem Ali', STR_TO_DATE('2023-03-01', '%Y-%m-%d')),
		  (8756452130082321, 'Faisal Jaber', STR_TO_DATE('2024-02-01', '%Y-%m-%d')),
		  (1013435672341524, 'Ahmed Abdullah', STR_TO_DATE('2023-6-01', '%Y-%m-%d'));


INSERT INTO `Seller`(`sellerID`, `Fname`, `Lname`, `email`, `PhoneNumber`, `Address`, `password`, `CardNumber`)
	VALUES(11338574, 'Majed', 'Saad', 'Majed@gmail.com', '0563452674', 'Mecca', 'MA_1234', 1345245345637656), 
		  (66779984, 'Abdullah', 'Fahad', 'Abdullah@gmail.com', '0564428965', 'Jeddah', 'Abd@323', 1123454565787328),
		  (11225588, 'Ali', 'Naser', 'Ali@hotmail.com', '0554878429', 'Riyadh', 'Ali_004', 1345456288789001),
          (32167832, 'Kareem', 'Ali', 'Kareem@gmail.com', '0556746890', 'Qassim', 'Ka.r234', 6473425457894509), 
          (11203987, 'Faisal', 'Jaber', 'Faisal@gmail.com', '0524314783', 'Jeddah', 'Fsl@100', 8756452130082321),
		  (10144658, 'Ahmed', 'Abdullah', 'Ahmed@hotmail.com', '0532451678', 'Madinah', 'Ahm34.4', 1013435672341524);
          
-- ------------------------------------------------------------------------
-- These modifications were added to correct the errors of the second phase\
 
-- Delete the Seller_FK1 `CardNumber`
ALTER TABLE `Seller` 
DROP FOREIGN KEY `Seller_FK1`;

-- Delete the INDEX of `CardNumber`
ALTER TABLE `Seller` 
DROP INDEX `CardNumber` ;

-- ADD the Seller_FK1 `CardNumber`
ALTER TABLE `Seller` 
ADD CONSTRAINT `Seller_FK1`
  FOREIGN KEY (`CardNumber`)
  REFERENCES `CeditCard_Seller` (`CardNumber`) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Delete the Seller_FK1 `CardNumber`
ALTER TABLE `Seller` 
DROP FOREIGN KEY `Seller_FK1`;

-- Delete `CardNumber` column:
ALTER TABLE `Seller` 
DROP COLUMN `CardNumber`;

-- Add `IBAN` as a new column
ALTER TABLE `Seller`
ADD `IBAN` BIGINT(16) NOT NULL;

-- Update the default value(0)
UPDATE `Seller`
SET `IBAN` = 1345245345637656
WHERE `sellerID` =  11338574;
UPDATE `Seller`
SET `IBAN` = 1123454565787328
WHERE `sellerID` =  66779984;
UPDATE `Seller`
SET `IBAN` = 1345456288789001
WHERE `sellerID` =  11225588;
UPDATE `Seller`
SET `IBAN` = 6473425457894509
WHERE `sellerID` =  32167832;
UPDATE `Seller`
SET `IBAN` = 8756452130082321
WHERE `sellerID` =  11203987;
UPDATE `Seller`
SET `IBAN` = 1013435672341524
WHERE `sellerID` =  10144658;

-- Delete `CeditCard_Seller` Table:
DROP TABLE `CeditCard_Seller`;


-- Calculate derived attribute (#Seller)
SELECT COUNT(`Seller`.`sellerID`) AS NumberOfSeller 
FROM `SellingPlatform2`.`Seller`;

    SELECT *
    FROM seller;
-- ----------------------------------------
CREATE TABLE `ProductData`(
`ProductNum` BIGINT(12) NOT NULL,
`Name` VARCHAR(50) NOT NULL,
`ProductInfo` VARCHAR(500),
`Price` DECIMAL(10,3) NOT NULL,
CONSTRAINT `ProductData_PK` PRIMARY KEY(ProductNum)
);

CREATE TABLE `Product`(
`ProductNum` BIGINT(12),
`sellerID` BIGINT(8) NOT NULL,
`Quantity`  INT(3) NOT NULL,
CONSTRAINT `Product_PK` PRIMARY KEY(`ProductNum`,`SellerId`),
CONSTRAINT `Product_FK` FOREIGN KEY(`ProductNum`)  -- FK1
REFERENCES `ProductData`(`ProductNum`),
CONSTRAINT `Product_FK2` FOREIGN KEY(`sellerID`)   -- FK2
REFERENCES `Seller`(`sellerID`)
ON DELETE CASCADE
ON UPDATE CASCADE
);


INSERT INTO `ProductData` (`ProductNum`,`Name`,`ProductInfo`,`Price`)
VALUES(8346512303,'Samsung Galaxy Buds Pro','Samsung Galaxy Buds Pro,Phantom Violet',577),
(3547482928,'Samsung Galaxy Buds Plus','Samsung Galaxy Buds Plus, White',549),
(2345565657,'Samsung Galaxy Z Flip 4','Samsung Galaxy Z Flip 4, 5G, 256GB, Bora Purple',3999),
(3452633736,'Samsung Galaxy Z Flip 4','Samsung Galaxy Z Flip 4, 5G, 256GB, Blue',3999),
(1325389630,'Samsung Galaxy Watch 5','Samsung Galaxy Watch 5, 40MM, Silver',1099);

INSERT INTO `ProductData` (`ProductNum`,`Name`,`ProductInfo`,`Price`)
VALUES (8745421568,'Apple AirPods','color:white,2nd Gen with Charging case',800),(9872435745,'Apple Watch','Series 8 GPS 45mm RED Case With RED Sport Band',1649),(5476577432,'iphone 14','iphone 14 Pro max ,5G,256GB,Deep Purple',5000)
,(4688785425,'iphone 14','iphone 14 Pro max ,5G,128GB,Deep Purple',4499),(8753246754,'Apple Watch','Series 8 GPS 41mm Midnight Case With Midnight Sport Band',1549);


INSERT INTO `Product` (`ProductNum`,`SellerId`,`Quantity`)
VALUES (8346512303,32167832,14),(3547482928,11203987,20),(2345565657,10144658,18)
,(3452633736,10144658,42),(1325389630,10144658,19);

INSERT INTO `Product` (`ProductNum`,`sellerID`,`Quantity`)
VALUES (8745421568,11338574,12),(9872435745,66779984,20),(5476577432,11225588,36)
,(4688785425,11225588,22),(8753246754,11338574,18);
SELECT * FROM `Product`;

-- --------------------------------------------
-- Display the (Maximum Quantity For One Product) and the (Total Products Available) for each seller,
-- and Some seller information.
SELECT  `product`.SellerId, CONCAT(`Fname`, ' ', `Lname`) AS SellerFullName, MAX(`Quantity`) AS MaximumQuantityForOneProduct, SUM(`Quantity`) AS TotalProductsAvailable
FROM  		`SellingPlatform2`.`Seller` -- left table
INNER JOIN 	`SellingPlatform2`.`product` -- right table
ON   (`Seller`.sellerID = `product`.SellerId)
GROUP BY `product`.SellerId
ORDER BY MaximumQuantityForOneProduct DESC;  

-- -----------------------------------------           

create table `weightPrice`(
`weight`          INT(3) NOT NULL,
`shippingPrice`   INT(3) NOT NULL,

CONSTRAINT `weightPrice_PK` PRIMARY KEY (`weight`)

);

create table `shippingOrder`(
TrackingNum VARCHAR(12) NOT NULL,
weight INT(3),
location VARCHAR(30) NOT NULL,

CONSTRAINT `shippingOrder_PK` PRIMARY KEY (`TrackingNum`,`weight`),

CONSTRAINT `weight_FK2` FOREIGN KEY (`weight`)
REFERENCES `weightPrice` (`weight`)
ON DELETE CASCADE
ON UPDATE CASCADE

);



INSERT INTO `weightPrice` (`weight`, `shippingPrice`)  VALUES
(1,15),
(2,20),
(6,40),
(4,30),
(3,25),
(5,35),
(7,45),
(8,50),
(9,55),
(10,70);


INSERT INTO `shippingOrder` (`TrackingNum`, `weight`,`location`)  VALUES
('AY1223456789',2,'Al-buhayrat'),
('AM6987654212',6,'Al-nawwariyah'),
('SA1234567890',4,'Al-zahir'),
('HJ1974368346',3,'Al-shoqiyah'),
('BN9842135678',6,'Al-zahir'),
('KW1234457890',7,'Al-buhayrat');
 
-- UPDATE weightPrice TABLE 
UPDATE weightPrice
SET shippingPrice = 60
WHERE weight = 10;

-- DELETE A ROW FROM weightPrice TABLE WHERE WEIGHT EQUALS 1
DELETE FROM weightPrice
WHERE weight = 1;


-- DISPLAY weightPrice TABLE IN ASCENDING ORDER 
SELECT *
FROM weightPrice
ORDER BY weight ASC;

--  DISPLAY shippingOrder TABLE IN DESCENDING ORDER 
SELECT *
FROM shippingOrder
ORDER BY weight DESC;


-- DISPLAY HOW MANY ORDER LOCATED IN 'Al-buhayrat' 
SELECT COUNT(TrackingNum) AS count
FROM shippingOrder
GROUP BY location
HAVING location = 'Al-buhayrat';

-- INNER JOIN BETWEEN shippingOrder TABLE AND weightPrice TABLE 
-- TO LIST THE TrackingNum, location, weight AND ITS shippingPrice
SELECT TrackingNum, location, w.weight, shippingPrice
FROM shippingOrder s, weightPrice w
WHERE s.weight = w.weight;

-- ORDER TABLE
CREATE TABLE `Order`(
`OrederNum` INT(10) NOT NULL,
`date` date ,
`CustomerID` INT(10) NOT NULL,        
`TrackingNum` VARCHAR(11) NOT NULL unique,  
constraint PK PRIMARY KEY (OrederNum),
constraint FK2 FOREIGN KEY (customerID) references Customer(customerID),  -- FK --
constraint FK3 FOREIGN KEY (TrackingNum) references shippingOrder(TrackingNum)  -- FK --
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- Contains Products TABLE
CREATE TABLE `ContainsProducts`(
`ProductNum` BIGINT(12) NOT NULL,       
`OrederNum` INT(10) NOT NULL, 
`quantity` INT(2),
constraint PK PRIMARY KEY (OrederNum,ProductNum),                
constraint FK1 FOREIGN KEY (OrederNum) references `Order`(OrederNum), -- FK1
constraint FKP2 FOREIGN KEY (ProductNum) references Product(ProductNum) -- FK2
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- ALTER A Secheme --------------------------------
ALTER TABLE `Order` 
modify `TrackingNum` VARCHAR(12) NOT NULL;
ALTER TABLE `ContainsProducts` 
modify `ProductNum` BIGINT(12) NOT NULL;

-- INSERT new row (ONE ROW) -----------------------
INSERT INTO `Order` (OrederNum,date,CustomerID,TrackingNum)
values(1,STR_TO_DATE('2022-03-12', '%Y-%m-%d'),54738,'AY1223456789');
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(8346512303,1,12);
INSERT INTO `Order` (OrederNum,date,CustomerID,TrackingNum)
values(6,STR_TO_DATE('2023-04-04', '%Y-%m-%d'),54738,'KW1234457890');
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(4688785425,6,5);
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(8346512303,6,9);
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(5476577432,6,8);
-- INSERT MUlTIPLE ROWS ---------------------------
INSERT INTO `Order` (OrederNum,CustomerID,date,TrackingNum)
values(2,29407,STR_TO_DATE('2021-08-25', '%Y-%m-%d'),'AM6987654212'),
(3,13582,STR_TO_DATE('2021-05-08', '%Y-%m-%d'),'SA1234567890'),
(4,79463,STR_TO_DATE('2022-06-03', '%Y-%m-%d'),'HJ1974368346'),
(5,65352,STR_TO_DATE('2022-09-22', '%Y-%m-%d'),'BN9842135678');
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(9872435745,2,20),(5476577432,3,36),(4688785425,4,22),(8753246754,5,18);
INSERT INTO `ContainsProducts` (ProductNum,OrederNum,quantity)
values(8753246754,2,1),(4688785425,3,4),(9872435745,4,5),(5476577432,5,6);
SELECT *
from `Order`;
-- SUBQUERIES && JOIN ---------------------------------------
-- View the information of the most recent customer order with the order number
SELECT O.OrederNum, C.Fname, C.email
from `Order` As O
INNER JOIN Customer As C
On O.CustomerID = C.CustomerID
Where O.date = (Select MAX(date) from `Order`);
-- View the information of the oldest customer request with the order number
SELECT O.OrederNum, C.Fname, C.email
from `Order` As O
INNER JOIN Customer As C
On O.CustomerID = C.CustomerID
Where O.date = (Select MIN(date) from `Order`);
-- view the most requested customer ----------------------------
SELECT concat(Fname,' ',Lname) As FullName, email, Address
from Customer 
Where CustomerID  in ( SELECT CustomerID from `Order` where 1);
sELECT *
from Customer;
-- View Order details -----------------------------------------
Select O.OrederNum, C.Fname, C.email, S.weight, S.TrackingNum
from `Order` As O
INNER join Customer As C
On O.CustomerID = C.CustomerID
INNER join shippingOrder As S 
ON( S.TrackingNum =  O.TrackingNum)
order by O.OrederNum ;
-- Displaying the names of sellers, their identified numbers, who have a Google account and have a quantity 
-- of more than or equal to 20 products         
SELECT `Seller`.sellerID, CONCAT(`Fname`, ' ', `Lname`) AS SellerFullName
FROM 	`SellingPlatform2`.`Seller`,
		`SellingPlatform2`.`Product`  
WHERE( `Seller`.`sellerID` = `Product`.`SellerId` AND `email` IN (	SELECT  `email`
																	FROM  `SellingPlatform2`.`Seller` 
																	WHERE   (`email` LIKE ('%@gmail.com')) AND `ProductNum` IN (	SELECT  `ProductNum`
																																	FROM  	`SellingPlatform2`.`Product` 
																																WHERE   (`Quantity` >= 20)			)));
-- View Order details -----------------------------------------
Select O.OrederNum, C.Fname, C.email, S.weight, S.TrackingNum
from `Order` As O
INNER join Customer As C
On O.CustomerID = C.CustomerID
INNER join shippingOrder As S 
ON( S.TrackingNum =  O.TrackingNum)
order by O.OrederNum ;
-- Show the orders order by the quantity of the product --------
SELECT O.OrederNum, P.Name as `Product name` ,C.quantity
from `Order` As O
INNER JOIN Productdata As P
INNER JOIN ContainsProducts As C
On P.ProductNum = C.ProductNum
On O.OrederNum = C.OrederNum
Order by C.quantity ;