CREATE DATABASE Pearson_Hardman;

use Pearson_Hardman;
--- ================= DDL Statment  ================= ---
CREATE TABLE Client (
    Client_National_ID int not null primary key,
    Gender varchar(255),
    DateOfBirth varchar(255),
    Client_Name varchar(255),
    PhoneNo int,
    Client_Address varchar(255)
);

CREATE TABLE Law_Case (
    case_ID int not null primary key,
    case_status varchar(255),
    case_name varchar(255),
    Attorney_National_ID int,
    Client_National_ID int,
    constraint fk_Attorney_handel_Case foreign key (Attorney_National_ID) references Attorney (Attorney_National_ID) on delete cascade,
    constraint fk_clieny_file_Case foreign key (Client_National_ID) references client (Client_National_ID) on delete cascade

);

CREATE TABLE Category (
    case_type varchar(255) not null primary key,
    case_name varchar(255),
    case_description varchar(255),
    case_ID int,
    Attorney_National_ID int,
    constraint fk_Case_has_Category foreign key (case_ID) references Law_Case (case_ID) on delete cascade,
    constraint fk_Attorney_specialize_Category foreign key (Attorney_National_ID) references Attorney (Attorney_National_ID) on delete cascade
);

CREATE TABLE Payment(
    payment_ID int not null primary key,
    payment_amount varchar(255),
    payment_date varchar(255),
    Attorney_National_ID int,
    Client_National_ID int,
    constraint fk_Attorney_receives_Payment foreign key (Attorney_National_ID) references Attorney (Attorney_National_ID) on delete cascade,
    constraint fk_Client_Pays_Payment foreign key (Client_National_ID) references Client (Client_National_ID) on delete cascade
    
);

CREATE TABLE Attorney (
    Attorney_National_ID int not null primary key,
    Gender varchar(255),
    DateOfBirth int,
    Years_of_experience int,
    Attorney_Address varchar(255),
    PhoneNo int,
    Attorney_name varchar(255)
);

CREATE TABLE communicatewith(
    Client_National_ID int,
    Attorney_National_ID int,
    constraint fk_Client_communicateWith_Attorney foreign key (Client_National_ID) references Client (Client_National_ID) on delete cascade,
    constraint fk_Attorney_communicateWith_Client foreign key (Attorney_National_ID) references Attorney (Attorney_National_ID) on delete cascade,
    PRIMARY KEY (Client_National_ID,Attorney_National_ID)
);

CREATE TABLE FileR(
    Client_National_ID int,
    case_ID int,
    constraint fk_Client_File_Case foreign key (Client_National_ID) references Client (Client_National_ID) on delete cascade,
    constraint fk_case_File_Client foreign key (case_ID) references Law_Case (case_ID) on delete cascade,
    PRIMARY KEY (Client_National_ID,case_ID)
);
--- ================= DML Statment  ================= ---
INSERT INTO Client VALUES
(851324785,'Female',STR_TO_DATE('17-6-2017','%d-%m-%Y'),'Malak',01254789632,'cairo'),
(947393785,'Male',STR_TO_DATE('13-11-2013','%d-%m-%Y'),'Mohamed',01291681942,'Giza'),
(781648785,'Female',STR_TO_DATE('4-5-2022','%d-%m-%Y'),'Mariam',01674954832,'new cairo'),
(679473785,'Male',STR_TO_DATE('20-5-2013','%d-%m-%Y'),'ahmed',01299173942,'zayed');

INSERT INTO Attorney VALUES
(851324012,'Female',STR_TO_DATE('1-4-2004','%d-%m-%Y'),'cairo',01254789183,'Nada'),
(859513012,'Male',STR_TO_DATE('10-10-2010','%d-%m-%Y'),7,'hurghada',01251037183,'Abdullah'),
(027324012,'Female',STR_TO_DATE('19-9-2019','%d-%m-%Y'),2,'alexandria',01254789362,'Ganna'),
(85910274,'Male',STR_TO_DATE('10-2-2001','%d-%m-%Y'),9,'giza',01251039461,'Yehya');

INSERT INTO law_case VALUES
(1,'In progress','Malak insurance case',851324012,851324785)
(2,'In progress','Mohamed divorce case',85910274,947393785),
(3,'Files','Ahmed real estate case',027324012,679473785),
(4,'complete','Mariam murder case',859513012,781648785);

INSERT INTO category VALUES
('insurance','Malaks insurance case','An issue occured when malak forgot to renew her insurance',1,851324012),
('family','Mohamed divorce case','An issue between mohamed in the divorce papers and negotiations',2,85910274),
('Real estate','Ahmed real estate case','A problem between ahmed and his landlord after a damage occured in the apartment',3,027324012),
('Murder','Mona murder case','Mona is being wrongfully accussed of the murder of her neighbour',4,859513012);

INSERT INTO payment VALUES
(1,200,STR_TO_DATE('1-01-2010','%d-%m-%Y'),851324012,851324785),
(2,3000,STR_TO_DATE('5-3-2001','%d-%m-%Y'),85910274,947393785),
(3,1500,STR_TO_DATE('7-8-2012','%d-%m-%Y'),027324012,679473785),
(4,10000,STR_TO_DATE('3-3-1991','%d-%m-%Y'),859513012,781648785);

INSERT INTO communicatewith VALUES
(851324785,851324012),
(947393785,85910274),
(679473785,027324012),
(781648785,859513012);
INSERT INTO filer VALUES
(851324785,1),
(947393785,2),
(679473785,3),
(781648785,4);
--- ================= DQL Statment  ================= ---
--- ================= Aggregate Queries  ================= ---
--- ================= Count number of cases  ================= ---
SELECT * , COUNT(*) as "Number of cases" FROM law_case;
--- ================= Count number of clients  ================= ---
SELECT * , COUNT(Client_National_ID) as "Number of clients" FROM client;
--- ================= Count number of distinct cases  ================= ---
SELECT * , COUNT(distinct case_name) as "Number of distinct cases" FROM law_case;
--- ================= Get the maximum payment amount  ================= ---
SELECT MAX (payment_amount) as "The maxmimum amount payed" FROM payment;
--- ================= Nested Queries  ================= ---
--- ================= Grabing the client ID of the maximum payment done  ================= ---
SELECT Client_National_ID,payment_amount
 FROM payment 
 WHERE payment_amount = (select MAX(payment_amount)FROM payment);
--- ================= Group By  ================= ---
--- ================= Grouping attorneys according to the experience in years  ================= ---
SELECT * FROM attorney GROUP BY Years_of_experience;
--- ================= Count attorneys who live in distinct places  ================= ---
SELECT *, 
COUNT (Attorney_Address)
as "distinct living location"
FROM attorney
GROUP BY Attorney_Address;
--- ================= Joining the case and category tables ================= ---
SELECT law_case.case_ID, law_case.case_name,category.case_type
FROM law_case
INNER JOIN category ON law_case.case_ID=category.case_ID;
--- ================= Grabbing attorneys who have payment ================= ---
SELECT payment.payment_amount,attorney.Attorney_National_ID, attorney.`Attorney_name`
FROM payment
INNER JOIN attorney ON attorney.`Attorney_National_ID`=payment.`Attorney_National_ID`;