#INSERT QUERIES

#rocketbook queries

#ordersrocketbook queries
#Changing the orders of columns:
ALTER TABLE `rocketbook`.`customer` 
CHANGE COLUMN `CUST_ID` `CUST_ID` VARCHAR(45) NOT NULL FIRST,
CHANGE COLUMN `CUST_TYPE_DESC` `CUST_TYPE_DESC` VARCHAR(45) NULL DEFAULT NULL AFTER `CUST_TYPE`;


#Changing the size of prod_img_url from 45 to 200
ALTER TABLE `rocketbook`.`products` 
CHANGE COLUMN `PROD_IMAGE_URL` `PROD_IMAGE_URL` VARCHAR(200) NULL DEFAULT NULL ;


#CHANGING THE SIZE OF ORDER_PAID FROM CHAR(1) TO CHAR(10)
ALTER TABLE `rocketbook`.`orders` 
CHANGE COLUMN `ORDER_PAID` `ORDER_PAID` CHAR(10) NULL DEFAULT NULL ;

select * from rocketbook.customer;
#INSERTION CUSTOMER

INSERT INTO rocketbook.customer 
VALUES 
('LrYxRrUn29','Brookhaven',30319,'Marcus','Anderson',null,'3687 Ashfod Creek Trail','E','Faculty','835-1203-37',' m.anderson@randatmail.edu','Anderson12$%','Pets Name','Tenchi'),
('djqUl7CrJu','Marietta',30008,'Carina','Smith','Fischer','1361Fairridge Circle SW Apt 22 K','B','Speakers','786-3031-36','c.smith@randatmail.com','Smith12$%','Mother Maiden Name','Ludwig'),
('U9Xdw8d8FL','Marietta',30060,'Arnold','Hamilton',null,'1269 Barclay Circle','C','Student','451-6833-79','a.hamilton@randatmail.com','Hamilton12$%','High School favourite','Tenchu'),
('6q0IoXreSJ','Ball Ground',30107,'Ada','Myers',null,'1451 Old Canton Road','E','Staff','680-5757-69','a.myers@randatmail.edu','Myers12$%','Pets Name','Topaz'),
('c0r08on5y2','Woodstock',30188,'Oliver','Phillips','Lamarche','403 Jessica Lane','B','Parties Only','836-4999-24','o.phillips@randatmail.com','Phillips12$%','Mother Maiden Name','Think'),
('T0hexsWbe6','Cartersville',30121,'Stella','Howard',null,'41 Cox Rd.','E','Faculty','290-9926-93','s.howard@randatmail.edu','Howard12$%','High School favourite','Disco'),
('8NFRd9AOfP','Marietta',30067,'Paige','Kelley',null,'1131 Penny Lane Se','B','Speakers','999-4957-56','p.kelley@randatmail.com','Kelley12$%','Pets Name','Cinnamon'),
('d98EdVPv9g','Atlanta',30342,'Miranda','Edwards',null,'5252 Roswell Rd Suite 103','C','Student','465-8177-61','m.edwards@randatmail.com','Edwards12$%','Mother Maiden Name','Pecan'),
('9OCZL0T3y1','Marietta',30064,'Harold','Carter','Eze','3894 Due West Rd.','E','Staff','668-0356-08','h.carter@randatmail.edu','Carter12$%','High School favourite','Claudia'),
('QbCvqlt1Zk','Atlanta',30339,'Steven','Lloyd',null,'2024 Powers Ferry Rd. SE #110','B','Parties Only','828-6292-36','s.lloyd@randatmail.com','Lloyd12$%','Pets Name','Dorito'),
('C3Pt9UXw5j','Lavonia',30553,'Belinda','Lloyd',null,'P.O. box 619','C','Athletic Trainers','015-4643-48','b.lloyd@randatmail.com','Lloyd12$%','Mother Maiden Name','Dank'),
('SVzFgX5ug4','Mcdonough',30253,'Martin','Harper',null,'35 Atlanta Street Suite 5-B','E','Faculty','393-2509-78','m.harper@randatmail.edu','Harper12$%','High School favourite','Aesop'),
('5JitqXzP2g','Marietta',30060,'Eleanor','Taylor',null,'1269 Barclay Circle','B','Speakers','756-7023-47','e.taylor@randatmail.com','Taylor12$%','Pets Name','Tyrant'),
('ws8WqZ5oH8','Mableton',30126,'Adele','Mason',null,'161 Saint Anne Court','C','Student','556-3824-04','a.mason@randatmail.com','Mason12$%','Mother Maiden Name','Jafar'),
('yr4lsdDYBO','Dacula',30567,'Ted','Harris',null,'3613 Braselton Hwy Ste 101','E','Staff','250-2185-54','t.harris@randatmail.edu','Harris12$%','High School favourite','Plasma'),
('WShNZfLeQi','Cocoa Beach',32931,'Bruce','Carroll',null,'188 Pinellas Lane Suite 503','B','Parties Only','497-5089-53','b.carroll@randatmail.com','Carroll12$%','Pets Name','Sunny'),
('kFV9b2El7h','Roswell',30075,'Aston','Phillips','Sormeaux','270 South Atlanta Street','C','Athletic Trainers','430-5089-03','a.phillips@randatmail.com','Phillips12$%','Mother Maiden Name','Cyclone'),
('UpZ8RNBjIc','Roswell',30075,'Carina','Richards',null,'930 Woodstock Rd Suite 300','C','Athletic Trainers','992-9747-85','c.richards@randatmail.com','Richards12$%','High School favourite','Voltron'),
('9u3N51E5Oe','Lithia Springs',30122,'Edith','Sullivan',null,'1758 Lee rd','C','Doctor of Chiropractic','606-6434-88','e.sullivan@randatmail.com','Sullivan12$%','Pets Name','Mocha')
;



SELECT * FROM rocketbook.products;
#Insertion PRODUCTS
INSERT INTO rocketbook.products
VALUES ('871499'	,'rocketbook Everlast'	,'32'	,'Black' ,'6 in x 8.8 in' ,'Rectangle' ,'12.8' ,'https://getrocketbook.com/collections/all-products/products/everlast-rocketbook?variant=31416131534'),
('692833'	,'rocketbook Fusion'	,'35'	,'Black'	,'8.5 in x 9.5 in'	,'Rectangle'	,'14'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-fusion?variant=29152884195389'),
('329119'	,'rocketbook Beacons'	,'15'	,'Orange'	,'2.5 in'	,'Triangle'	,'6'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-beacons?variant=14176264028221'),
('692933'	,'rocketbook Spacepack'	,'65'	,'Grey'	,'19.5" H, 13.75" W, 6.5" D'	,'Rectangle'	,'26'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-spacepack'),
('134450'	,'rocketbook One'	,'12'	,'Maroon'	,'8.5 in x 9.5 in'	,'Rectangle'	,'4.8'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-one?variant=34620342030'),
('354854'	,'Cozy Capsule Gift Bundle'	,'55'	,'Black'	,'8.5 in x 9.5 in'	,'Rectangle'	,'22'	,'https://getrocketbook.com/collections/all-products/products/cozy-capsule?variant=31376845734027'),
('280319'	,'Star Scholar Bundle'	,'90'	,'Black/Grey'	,'8.5 in x 11 in'	,'Multiple'	,'36'	,'https://getrocketbook.com/collections/all-products/products/star-scholar-bundle'),
('942526'	,'Complete Everlast Bundle'	,'75'	,'Black/Grey',null,'Multiple'	,'30'	,'https://getrocketbook.com/collections/all-products/products/complete-everlast-bundle?variant=12440637636669'),
('20369'	,'Cosmic Double Feature'	,'75'	,'Black/Grey',null,'Multiple'	,'30'	,'https://getrocketbook.com/collections/all-products/products/cosmic-double-feature?variant=12440696586301'),
('837185'	,'Beacons with Think Board Whiteboard'	,'50'	,'White'	,'2 feet by 3 feet'	,'Rectangle'	,'20'	,'https://getrocketbook.com/collections/all-products/products/beacons-with-think-board-whiteboard?variant=30679522508939'),
('114657'	,'rocketbook T-shirt'	,'15'	,'Multiple' ,'S/M/L' 	,null,'6'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-t-shirt?variant=28543698305085'),
('975870'	,'Pen Station'	,'5'	,'Black',null,null,'2','https://getrocketbook.com/collections/all-products/products/pen-station?variant=1088865009678'),
('354890'	,'Spray Bottle'	,'3'	,'Multiple',null,null,'1.2','https://getrocketbook.com/collections/all-products/products/spray-bottle'),
('656490'	,'rocketbook Mug'	,'12'	,'Black',null,null,'4.8','https://getrocketbook.com/collections/all-products/products/rocketbook-mug'),
('708122'	,'rocketbook Sunglasses'	,'9'	,'Black',null,null,'3.6','https://getrocketbook.com/collections/all-products/products/rocketbook-sunglasses'),
('94530'	,'Microfiber Towel'	,'3'	,'Multiple','6 in x 8.8 in',null,'1.2','https://getrocketbook.com/collections/all-products/products/microfiber-towel?variant=6910753046589'),
('703489'	,'Unique Gift Idea - rocketbook Gift Cards'	,'10'	,'Green',null,null,'4','https://getrocketbook.com/collections/all-products/products/gift-card?variant=29528590531'),
('810456'	,'rocketbook Everlast Mini'	,'16'	,'Black'	,'3.5 in x 5.5 in'	,'Rectangle'	,'6.4'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-everlast-mini?variant=8195364061245'),
('544245'	,'rocketbook Wave'	,'25'	,'Blue'	,'6 in x 8.8 in'	,'Rectangle'	,'10'	,'https://getrocketbook.com/collections/all-products/products/rocketbook-wave?variant=19252863043');


SELECT * FROM rocketbook.orders;

#Insertion:
INSERT INTO rocketbook.orders
VALUES 
('6002'	,'0'	,'djqUl7CrJu'	,'2019-10-24'	,'Yes'	,'175'),
('6003'	,'0'	,'U9Xdw8d8FL'	,'2019-10-25'	,'Yes'	,'30'),
('6004'	,'0'	,'6q0IoXreSJ'	,'2019-10-28'	,'Yes'	,'45'),
('6005'	,'0'	,'c0r08on5y2'	,'2019-11-02'	,'Yes'	,'64'),
('6006'	,'10'	,'T0hexsWbe6'	,'2019-10-16'	,'Yes'	,'247.5'),
('6007'	,'0'	,'8NFRd9AOfP'	,'2019-10-20'	,'Yes'	,'60'),
('6008'	,'0'	,'d98EdVPv9g'	,'2019-11-02'	,'No'	,'110'),
('6009'	,'0'	,'9OCZL0T3y1'	,'2019-11-06'	,'No'	,'270'),
('6010'	,'0'	,'QbCvqlt1Zk'	,'2019-11-11'	,'Yes'	,'300'),
('6011'	,'0'	,'C3Pt9UXw5j'	,'2019-10-10'	,'No'	,'75'),
('6012'	,'0'	,'SVzFgX5ug4'	,'2019-10-20'	,'Yes'	,'250'),
('6013'	,'0'	,'5JitqXzP2g'	,'2019-10-20'	,'Yes'	,'30'),
('6014'	,'0'	,'ws8WqZ5oH8'	,'2019-11-03 '	,'Yes'	,'15'),
('6015'	,'0'	,'yr4lsdDYBO'	,'2019-11-04'	,'Yes'	,'12'),
('6016'	,'0'	,'WShNZfLeQi'	,'2019-10-13'	,'No'	,'12'),
('6017'	,'0'	,'kFV9b2El7h'	,'2019-10-16'	,'Yes'	,'45'),
('6018'	,'0'	,'UpZ8RNBjIc'	,'2019-10-21'	,'Yes'	,'6'),
('6019'	,'0'	,'LrYxRrUn29'	,'2019-10-28'	,'Yes'	,'30'),
('6020'	,'0'	,'djqUl7CrJu'	,'2019-11-09'	,'Yes'	,'128'),
('6021'	,'0'	,'U9Xdw8d8FL'	,'2019-10-10'	,'No'	,'16'),
('6022'	,'0'	,'6q0IoXreSJ'	,'2019-10-13'	,'No'	,'450'),
('6023'	,'0'	,'c0r08on5y2'	,'2019-10-21'	,'Yes'	,'32'),
('6024'	,'0'	,'T0hexsWbe6'	,'2019-10-23'	,'Yes'	,'48'),
('6025'	,'0'	,'LrYxRrUn29'	,'2019-11-03'	,'Yes'	,'128'),
('6026'	,'0'	,'djqUl7CrJu'	,'2019-10-09'	,'Yes'	,'75'),
('6027'	,'0'	,'U9Xdw8d8FL'	,'2019-10-15'	,'Yes'	,'375'),
('6028'	,'0'	,'6q0IoXreSJ'	,'2019-10-17'	,'No'	,'64'),
('6029'	,'0'	,'c0r08on5y2'	,'2019-10-23'	,'Yes'	,'45'),
('6030'	,'0'	,'T0hexsWbe6'	,'2019-10-29'	,'Yes'	,'128'),
('6031'	,'0'	,'8NFRd9AOfP'	,'2019-10-06'	,'Yes'	,'35'),
('6032'	,'0'	,'d98EdVPv9g'	,'2019-10-10'	,'Yes'	,'160'),
('6033'	,'10'	,'9OCZL0T3y1'	,'2019-10-12'	,'No'	,'472.5'),
('6034'	,'0'	,'QbCvqlt1Zk'	,'2019-10-08'	,'Yes'	,'45'),
('6035'	,'0'	,'C3Pt9UXw5j'	,'2019-10-16'	,'Yes'	,'128'),
('6036'	,'0'	,'SVzFgX5ug4'	,'2019-09-25'	,'Yes'	,'90'),
('6037'	,'0'	,'5JitqXzP2g'	,'2019-10-06'	,'Yes'	,'80'),
('6038'	,'0'	,'ws8WqZ5oH8'	,'2019-10-09'	,'No'	,'64'),
('6039'	,'0'	,'yr4lsdDYBO'	,'2019-10-10'	,'Yes'	,'96'),
('6040'	,'0'	,'WShNZfLeQi'	,'2019-10-10'	,'Yes'	,'60'),
('6001'	,'0'	,'LrYxRrUn29'	,'2019-10-18'	,'Yes'	,'32');
#===================================================================================

SELECT * FROM rocketbook.ordered_items;

INSERT INTO `rocketbook`.`ordered_items` (`PRODUCT_ID`, `ORDER_ID`, `ORDERED_ITEMS_COUNT`) 
VALUES (871499,6001,1),
(692833, 6002, 5),
(329119, 6003, 2),
(329119, 6004, 3),
(810456, 6005, 4),
(544245, 6006, 11),
(134450, 6007, 5),
(354854, 6008, 2),
(280319, 6009, 3),
(942526, 6010, 4),
(20369, 6011,  1),
(837185, 6012, 5),
(114657, 6013, 2),
(975870, 6014, 3),
(354890, 6015, 4),
(656490, 6016, 1),
(708122, 6017, 5),
(94530, 6018, 2),
(703489, 6019, 3),
(871499, 6020, 4),
(810456, 6021, 1),
(280319, 6022, 5),
(810456, 6023, 2),
(810456, 6024, 3),
(871499, 6025, 4),
(942526, 6026, 1),
(20369, 6027, 5),
(871499, 6028, 2),
(329119, 6029, 3),
(871499, 6030, 4),
(692833, 6031, 1),
(871499, 6032, 5),
(692833, 6033, 15),
(329119, 6034, 3),
(871499, 6035, 4),
(280319, 6036, 1),
(810456, 6037, 5),
(871499, 6038, 2),
(871499, 6039, 3),
(329119, 6040, 4);




SELECT * FROM rocketbook.returned;

INSERT INTO `rocketbook`.`returned` (`RETURN_ID`, `RETURN_DATE`, `ORDER_ID`, `RETURN_VALID`) VALUES ('3003', '2019-10-29', '6003', 'Yes'),
('3004', '2019-11-01', '6004', 'Yes'),
('3008', '2019-11-06', '6008', 'Yes'),
('3009', '2019-11-10', '6009', 'Yes'),
('3010', '2019-11-15', '6010', 'Yes'),
 ('3018', '2019-11-28', '6018', 'No'),
 ('3019', '2019-11-07', '6019', 'Yes'),
 ('3025', '2019-11-18', '6025', 'Yes'),
 ('3032', '2019-11-25', '6032', 'No'),
 ('3033', '2019-11-12', '6033', 'No'),
 ('3034', '2019-11-06', '6034', 'Yes'),
 ('3035', '2019-10-26', '6035', 'Yes'),
 ('3036', '2019-10-16', '6036', 'No');


SELECT * FROM rocketbook.returned_items;

INSERT INTO ROCKETBOOK.RETURNED_ITEMS
VALUES('9001'	,'Poor quality'	,'30'	,'329119'	,'6003'	,'3003'),
('9002'	,'Other'	,'45'	,'329119'	,'6004'	,'3004'),
('9003'	,'Poor quality'	,'110'	,'354854'	,'6008'	,'3008'),
('9004'	,'Other'	,'270'	,'280319'	,'6009'	,'3009'),
('9005'	,'Did not like design'	,'300'	,'942526'	,'6010'	,'3010'),
('9006'	,'Poor quality'	,'6'	,'94530'	,'6018'	,'3018'),
('9007'	,'Other'	,'30'	,'703489'	,'6019'	,'3019'),
('9008'	,'Did not like design'	,'128'	,'871499'	,'6025'	,'3025'),
('9009'	,'Shipment did not reach in time'	,'160'	,'871499'	,'6032'	,'3032'),
('9010'	,'Got better price'	,'472.5'	,'692833'	,'6033'	,'3033'),
('9011'	,'Other'	,'45'	,'329119'	,'6034'	,'3034'),
('9012'	,'Did not like design'	,'128'	,'871499'	,'6035'	,'3035'),
('9013'	,'Wrong Item Delivered'	,'90'	,'280319'	,'6036'	,'3036');

#UPDATED A FIELD VALUE FROM 472 TO 472.5
UPDATE `rocketbook`.`returned_items` SET `RETURN_AMOUNT` = '472.5' WHERE (`RETURNED_ITEM_ID` = '9010');

#Inserting into PAY table

SELECT * FROM rocketbook.pay;


INSERT INTO rocketbook.pay 
VALUES 
('6001'	,'8001'	,'Marcus Anderson'	,'8980233250103164'	,'2019-10-18'),
('6002'	,'8002'	,'Carina Smith'	,'2047857430458776'	,'2019-10-24'),
('6003'	,'8003'	,'Arnold Hamilton'	,'0361114179035314'	,'2019-10-25'),
('6004'	,'8004'	,'Ada Myers'	,'0162853506149972'	,'2019-10-28'),
('6005'	,'8005'	,'Oliver Phillips'	,'5728880917995823'	,'2019-11-02'),
('6006'	,'8006'	,'Stella Howard'	,'8143068701358328'	,'2019-10-16'),
('6007'	,'8007'	,'Paige Kelley'	,'4221082403400816'	,'2019-10-20'),
('6008'	,'8008'	,'Miranda Edwards'	,'2555573320024346'	,'2019-11-02'),
('6009'	,'8009'	,'Harold Carter'	,'8393014501462569'	,'2019-11-06'),
('6010'	,'8010'	,'Steven Lloyd'	,'1076877667246454'	,'2019-11-11'),
('6011'	,'8011'	,'Belinda Lloyd'	,'9247487708328630'	,'2019-10-10'),
('6012'	,'8012'	,'Martin Harper'	,'9653656769859747'	,'2019-10-20'),
('6013'	,'8013'	,'Eleanor Taylor'	,'6521103520300201'	,'2019-10-29'),
('6014'	,'8014'	,'Adele Mason'	,'5151116448921308'	,'2019-11-03'),
('6015'	,'8015'	,'Ted Harris'	,'5665663307776891'	,'2019-11-04'),
('6016'	,'8016'	,'Bruce Carroll'	,'4834561125256486'	,'2019-10-13'),
('6017'	,'8017'	,'Aston Phillips'	,'6927093439856454'	,'2019-10-16'),
('6018'	,'8018'	,'Carina Richards'	,'8535687000137497'	,'2019-10-21'),
('6019'	,'8019'	,'Marcus Anderson'	,'1204765634131640'	,'2019-10-28'),
('6020'	,'8020'	,'Carina Smith'	,'7283128701667884'	,'2019-11-09'),
('6021'	,'8021'	,'Arnold Hamilton'	,'3398603160700289'	,'2019-10-10'),
('6022'	,'8022'	,'Ada Myers'	,'3843065747384792'	,'2019-10-13'),
('6023'	,'8023'	,'Oliver Phillips'	,'1649844855906523'	,'2019-10-21'),
('6024'	,'8024'	,'Stella Howard'	,'1286924464654433'	,'2019-10-23'),
('6025'	,'8025'	,'Marcus Anderson'	,'7274239334038604'	,'2019-11-03'),
('6026'	,'8026'	,'Carina Smith'	,'1956317582755170'	,'2019-10-09'),
('6027'	,'8027'	,'Arnold Hamilton'	,'8738124687866229'	,'2019-10-15'),
('6028'	,'8028'	,'Ada Myers'	,'9775616618640134'	,'2019-10-17'),
('6029'	,'8029'	,'Oliver Phillips'	,'7629827314683562'	,'2019-10-23'),
('6030'	,'8030'	,'Stella Howard'	,'8671553045282416'	,'2019-10-29'),
('6031'	,'8031'	,'Paige Kelley'	,'4271537671391708'	,'2019-10-06'),
('6032'	,'8032'	,'Miranda Edwards'	,'9328720425065923'	,'2019-10-10'),
('6033'	,'8033'	,'Harold Carter'	,'4566497841414028'	,'2019-10-12'),
('6034'	,'8034'	,'Steven Lloyd'	,'5085755461716889'	,'2019-10-08'),
('6035'	,'8035'	,'Belinda Lloyd'	,'3307561085245944'	,'2019-10-16'),
('6036'	,'8036'	,'Martin Harper'	,'9451929714252713'	,'2019-09-25'),
('6037'	,'8037'	,'Eleanor Taylor'	,'8696743769662607'	,'2019-10-06'),
('6038'	,'8038'	,'Adele Mason'	,'1881820918994377'	,'2019-10-09'),
('6039'	,'8039'	,'Ted Harris'	,'2871068378027290'	,'2019-10-10'),
('6040'	,'8040'	,'Bruce Carroll'	,'3898108718392785'	,'2019-10-10')
;

	

