SHOW DATABASES;
CREATE DATABASE TRAINING ;
USE TRAINING;
CREATE TABLE EMPLOYEE
(
emp_ID INT UNSIGNED NOT NULL,
name   varchar(20)  NOT NULL,
mojor  varchar(50),
grade  varchar(5)
);
SHOW TABLES;

DESCRIBE EMPLOYEE;
ALTER TABLE EMPLOYEE ADD PRIMARY KEY(emp_ID);
INSERT INTO EMPLOYEE (emp_ID, name, mojor, grade) 
VALUES ('1','Rithu','cst','A++');
SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE (emp_ID, name, mojor, grade) 
VALUES ('2','Jeevi','cst','A++++');
ALTER TABLE EMPLOYEE
ADD Email varchar(200);
ALTER TABLE EMPLOYEE;
UPDATE EMPLOYEE
SET Email = 'rithu@gmail.com'
WHERE emp_ID = 1;
ALTER TABLE EMPLOYEE
RENAME COLUMN mojor to Dept;
ALTER TABLE EMPLOYEE
DROP PRIMARY KEY;
UPDATE EMPLOYEE
SET Email = 'jeevi@gmail.com'
WHERE emp_ID = 2;
CREATE DATABASE ORDERS;
USE ORDERS;
USE TRAINING ;
DROP TABLE Customers;
CREATE TABLE Customers (
    Customer_ID INT,
    Customer_Name VARCHAR(100) NOT NULL,
    Customer_Address VARCHAR(100) NOT NULL,
    PRIMARY KEY(Customer_ID)
);
DELETE FROM Customers
WHERE Customer_ID IN (101,102);
INSERT INTO Customers(Customer_ID,Customer_Name,Customer_Address)
VALUES
	  (101,'Rithu','Erode'),
	  (102,'Jeevi','Namakkal'),
      (103,'Kani','Tiruchengode'),
      (104,'Sillu','Coim');
SELECT * FROM Customers;
CREATE TABLE Orders (
    Order_ID INT,
    Order_Date DATE,
    Customer_ID INT,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
INSERT INTO Orders (Order_ID,Order_Date,Customer_ID)
VALUES(111,'2025-04-08',102);
SELECT * FROM Orders;
DELETE FROM Orders
WHERE Order_ID=1;
DROP TABLE Products;
CREATE TABLE Products (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Unit_Price DECIMAL(10, 2),
    PRIMARY KEY(Product_ID)
);
INSERT INTO Products(Product_ID,Product_Name,Unit_Price)
VALUES
	  (21,'Watch',100),
	  (22,'Phone',200);
USE TRAINING;
SHOW TABLES;
CREATE TABLE OrderLine (
    Order_ID INT,
    Product_ID INT,
    Ordered_Quantity INT,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
SELECT * FROM OrderLine;
INSERT INTO OrderLine(Order_ID, Product_ID, Ordered_Quantity)
VALUES (111,21,5); 
SELECT 
DROP TABLE C1;
CREATE TABLE C1 (
C_Name VARCHAR(50) NOT NULL,
Age INT NOT NULL,
Roll_No INT UNIQUE,
PRIMARY KEY(Roll_No)
);
SELECT * FROM C1;
DELETE FROM C1
WHERE Roll_No IN (30,31);
INSERT INTO C1(C_Name,Age,Roll_No)
VALUES
	  ('Kani',21,30),
      ('Sillu',22,31),
      ('Atti',23,32),
      ('Deva',23,34);
SELECT distinct(Age)
FROM C1;
SELECT Age FROM C1 WHERE C_Name='Kani';
SELECT C_Name AS NAME ,Roll_No AS REG
FROM C1;
SELECT * FROM C1
WHERE Roll_No>30 AND Age=23;
SELECT * FROM C1
WHERE Roll_No=31 OR Roll_No=34;
SELECT C_Name,Age FROM C1
WHERE Age BETWEEN 21 AND 24;
SELECT C_Name,Age FROM C1
WHERE Age NOT BETWEEN 23 AND 24;
SELECT C_Name,Age
FROM C1
WHERE Roll_No IN (31,32,33);
SELECT C_Name,Age
FROM C1
WHERE Roll_No NOT IN (32,33);
SELECT C_Name,Age,Roll_No
FROM C1
WHERE C_Name LIKE 'K%';
CREATE DATABASE HEXAWARE;
CREATE TABLE AGENTS
   (	
    AGENT_CODE CHAR(6) NOT NULL PRIMARY KEY, 
	AGENT_NAME CHAR(40), 
	WORKING_AREA CHAR(35), 
	COMMISSION DECIMAL(10,2), 
	PHONE_NO CHAR(15), 
	COUNTRY VARCHAR(25) 
	);
INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');
CREATE TABLE  CUSTOMER 
   (	
    CUST_CODE  VARCHAR(6) NOT NULL PRIMARY KEY, 
	CUST_NAME VARCHAR(40) NOT NULL, 
	CUST_CITY CHAR(35), 
	WORKING_AREA VARCHAR(35) NOT NULL, 
	CUST_COUNTRY VARCHAR(20) NOT NULL, 
	GRADE INT, 
	OPENING_AMT DECIMAL(12,2) NOT NULL, 
	RECEIVE_AMT DECIMAL(12,2) NOT NULL, 
	PAYMENT_AMT DECIMAL(12,2) NOT NULL, 
	OUTSTANDING_AMT DECIMAL(12,2) NOT NULL, 
	PHONE_NO VARCHAR(17) NOT NULL, 
	AGENT_CODE CHAR(6) NOT NULL REFERENCES AGENTS
); 
INSERT INTO CUSTOMER VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
INSERT INTO CUSTOMER VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
INSERT INTO CUSTOMER VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
INSERT INTO CUSTOMER VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
INSERT INTO CUSTOMER VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
INSERT INTO CUSTOMER VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
INSERT INTO CUSTOMER VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
INSERT INTO CUSTOMER VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
INSERT INTO CUSTOMER VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
INSERT INTO CUSTOMER VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
INSERT INTO CUSTOMER VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
INSERT INTO CUSTOMER VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
INSERT INTO CUSTOMER VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
INSERT INTO CUSTOMER VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
INSERT INTO CUSTOMER VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
INSERT INTO CUSTOMER VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
INSERT INTO CUSTOMER VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
INSERT INTO CUSTOMER VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
INSERT INTO CUSTOMER VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
INSERT INTO CUSTOMER VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
INSERT INTO CUSTOMER VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
INSERT INTO CUSTOMER VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
INSERT INTO CUSTOMER VALUES ('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');
SELECT * FROM ORDERS1;
DROP TABLE ORDERS1;
CREATE TABLE ORDERS1 (
    ORD_NUM INT NOT NULL PRIMARY KEY,
    ORD_AMOUNT DECIMAL(12,2) NOT NULL,
    ADVANCE_AMOUNT DECIMAL(12,2) NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUST_CODE VARCHAR(6) NOT NULL,
    AGENT_CODE CHAR(6) NOT NULL,
    ORD_DESCRIPTION VARCHAR(60) NOT NULL,
    FOREIGN KEY (CUST_CODE) REFERENCES CUSTOMER(CUST_CODE),
    FOREIGN KEY (AGENT_CODE) REFERENCES AGENTS(AGENT_CODE)
);
INSERT INTO ORDERS1 VALUES ('200100', '1000.00', '600.00', '2008-08-01', 'C00013', 'A003', 'SOD');
INSERT INTO ORDERS1 VALUES('200110', '3000.00', '500.00', '2008-04-15', 'C00019', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200107', '4500.00', '900.00', '2008-08-30', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200112', '2000.00', '400.00', '2008-05-30', 'C00016', 'A007', 'SOD'); 
INSERT INTO ORDERS1 VALUES('200113', '4000.00', '600.00', '2008-06-10', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200102', '2000.00', '300.00', '2008-05-25', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS1 VALUES('200114', '3500.00', '2000.00', '2008-08-15', 'C00002', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200122', '2500.00', '400.00', '2008-09-16', 'C00003', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200118', '500.00', '100.00', '2008-07-20', 'C00023', 'A006', 'SOD');
INSERT INTO ORDERS1 VALUES('200119', '4000.00', '700.00', '2008-09-16', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200121', '1500.00', '600.00', '2008-09-23', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200130', '2500.00', '400.00', '2008-07-30', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS1 VALUES('200134', '4200.00', '1800.00', '2008-09-25', 'C00004', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200108', '4000.00', '600.00', '2008-02-15', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200103', '1500.00', '700.00', '2008-05-15', 'C00021', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200105', '2500.00', '500.00', '2008-07-18', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS1 VALUES('200109', '3500.00', '800.00', '2008-07-30', 'C00011', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200101', '3000.00', '1000.00', '2008-07-15', 'C00001', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200111', '1000.00', '300.00', '2008-07-10', 'C00020', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200104', '1500.00', '500.00', '2008-03-13', 'C00006', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200106', '2500.00', '700.00', '2008-04-20', 'C00005', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200125', '2000.00', '600.00', '2008-10-10', 'C00018', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200117', '800.00', '200.00', '2008-10-20', 'C00014', 'A001', 'SOD');
INSERT INTO ORDERS1 VALUES('200123', '500.00', '100.00', '2008-09-16', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200120', '500.00', '100.00', '2008-07-20', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200116', '500.00', '100.00', '2008-07-13', 'C00010', 'A009', 'SOD');
INSERT INTO ORDERS1 VALUES('200124', '500.00', '100.00', '2008-06-20', 'C00017', 'A007', 'SOD'); 
INSERT INTO ORDERS1 VALUES('200126', '500.00', '100.00', '2008-06-24', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200129', '2500.00', '500.00', '2008-07-20', 'C00024', 'A006', 'SOD');
INSERT INTO ORDERS1 VALUES('200127', '2500.00', '400.00', '2008-07-20', 'C00015', 'A003', 'SOD');
INSERT INTO ORDERS1 VALUES('200128', '3500.00', '1500.00', '2008-07-20', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200135', '2000.00', '800.00', '2008-09-16', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200131', '900.00', '150.00', '2008-08-26', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS1 VALUES('200133', '1200.00', '400.00', '2008-06-29', 'C00009', 'A002', 'SOD');
SELECT AGENT_CODE,SUM(ORD_AMOUNT - ADVANCE_AMOUNT) AS BALANCE_AMOUNT
FROM ORDERS1 GROUP BY AGENT_CODE;
DROP TABLE ORDERS1;
DROP TABLE CUSTOMER;
DROP TABLE AGENTS;
USE HEXAWARE;
CREATE TABLE AGENTS (
    AGENT_CODE CHAR(6) PRIMARY KEY, 
    AGENT_NAME CHAR(40), 
    WORKING_AREA CHAR(35), 
    COMMISSION DECIMAL(10,2), 
    PHONE_NO CHAR(15), 
    COUNTRY VARCHAR(25)
);

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

CREATE TABLE CUSTOMER (
    CUST_CODE VARCHAR(6) NOT NULL PRIMARY KEY, 
    CUST_NAME VARCHAR(40) NOT NULL, 
    CUST_CITY CHAR(35), 
    WORKING_AREA VARCHAR(35) NOT NULL, 
    CUST_COUNTRY VARCHAR(20) NOT NULL, 
    GRADE INT, 
    OPENING_AMT DECIMAL(12,2) NOT NULL, 
    RECEIVE_AMT DECIMAL(12,2) NOT NULL, 
    PAYMENT_AMT DECIMAL(12,2) NOT NULL, 
    OUTSTANDING_AMT DECIMAL(12,2) NOT NULL, 
    PHONE_NO VARCHAR(17) NOT NULL, 
    AGENT_CODE CHAR(6) NOT NULL,
    FOREIGN KEY (AGENT_CODE) REFERENCES AGENTS(AGENT_CODE)
);

INSERT INTO CUSTOMER VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
INSERT INTO CUSTOMER VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
INSERT INTO CUSTOMER VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
INSERT INTO CUSTOMER VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
INSERT INTO CUSTOMER VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
INSERT INTO CUSTOMER VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
INSERT INTO CUSTOMER VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
INSERT INTO CUSTOMER VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
INSERT INTO CUSTOMER VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
INSERT INTO CUSTOMER VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
INSERT INTO CUSTOMER VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
INSERT INTO CUSTOMER VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
INSERT INTO CUSTOMER VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
INSERT INTO CUSTOMER VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
INSERT INTO CUSTOMER VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
INSERT INTO CUSTOMER VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
INSERT INTO CUSTOMER VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
INSERT INTO CUSTOMER VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
INSERT INTO CUSTOMER VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
INSERT INTO CUSTOMER VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
INSERT INTO CUSTOMER VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
INSERT INTO CUSTOMER VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
INSERT INTO CUSTOMER VALUES ('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');

CREATE TABLE ORDERS1 (
    ORD_NUM INT NOT NULL PRIMARY KEY,
    ORD_AMOUNT DECIMAL(12,2) NOT NULL,
    ADVANCE_AMOUNT DECIMAL(12,2) NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUST_CODE VARCHAR(6) NOT NULL,
    AGENT_CODE CHAR(6) NOT NULL,
    ORD_DESCRIPTION VARCHAR(60) NOT NULL,
    FOREIGN KEY (CUST_CODE) REFERENCES CUSTOMER(CUST_CODE),
    FOREIGN KEY (AGENT_CODE) REFERENCES AGENTS(AGENT_CODE)
);
INSERT INTO ORDERS1 VALUES('200100', '1000.00', '600.00', '2008-08-01', 'C00013', 'A003', 'SOD');
INSERT INTO ORDERS1 VALUES('200110', '3000.00', '500.00', '2008-04-15', 'C00019', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200107', '4500.00', '900.00', '2008-08-30', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200112', '2000.00', '400.00', '2008-05-30', 'C00016', 'A007', 'SOD'); 
INSERT INTO ORDERS1 VALUES('200113', '4000.00', '600.00', '2008-06-10', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200102', '2000.00', '300.00', '2008-05-25', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS1 VALUES('200114', '3500.00', '2000.00', '2008-08-15', 'C00002', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200122', '2500.00', '400.00', '2008-09-16', 'C00003', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200118', '500.00', '100.00', '2008-07-20', 'C00023', 'A006', 'SOD');
INSERT INTO ORDERS1 VALUES('200119', '4000.00', '700.00', '2008-09-16', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200121', '1500.00', '600.00', '2008-09-23', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200130', '2500.00', '400.00', '2008-07-30', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS1 VALUES('200134', '4200.00', '1800.00', '2008-09-25', 'C00004', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200108', '4000.00', '600.00', '2008-02-15', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200103', '1500.00', '700.00', '2008-05-15', 'C00021', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200105', '2500.00', '500.00', '2008-07-18', 'C00025', 'A011', 'SOD');
INSERT INTO ORDERS1 VALUES('200109', '3500.00', '800.00', '2008-07-30', 'C00011', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200101', '3000.00', '1000.00', '2008-07-15', 'C00001', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200111', '1000.00', '300.00', '2008-07-10', 'C00020', 'A008', 'SOD');
INSERT INTO ORDERS1 VALUES('200104', '1500.00', '500.00', '2008-03-13', 'C00006', 'A004', 'SOD');
INSERT INTO ORDERS1 VALUES('200106', '2500.00', '700.00', '2008-04-20', 'C00005', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200125', '2000.00', '600.00', '2008-10-10', 'C00018', 'A005', 'SOD');
INSERT INTO ORDERS1 VALUES('200117', '800.00', '200.00', '2008-10-20', 'C00014', 'A001', 'SOD');
INSERT INTO ORDERS1 VALUES('200123', '500.00', '100.00', '2008-09-16', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200120', '500.00', '100.00', '2008-07-20', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200116', '500.00', '100.00', '2008-07-13', 'C00010', 'A009', 'SOD');
INSERT INTO ORDERS1 VALUES('200124', '500.00', '100.00', '2008-06-20', 'C00017', 'A007', 'SOD'); 
INSERT INTO ORDERS1 VALUES('200126', '500.00', '100.00', '2008-06-24', 'C00022', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200129', '2500.00', '500.00', '2008-07-20', 'C00024', 'A006', 'SOD');
INSERT INTO ORDERS1 VALUES('200127', '2500.00', '400.00', '2008-07-20', 'C00015', 'A003', 'SOD');
INSERT INTO ORDERS1 VALUES('200128', '3500.00', '1500.00', '2008-07-20', 'C00009', 'A002', 'SOD');
INSERT INTO ORDERS1 VALUES('200135', '2000.00', '800.00', '2008-09-16', 'C00007', 'A010', 'SOD');
INSERT INTO ORDERS1 VALUES('200131', '900.00', '150.00', '2008-08-26', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS1 VALUES('200133', '1200.00', '400.00', '2008-06-29', 'C00009', 'A002', 'SOD');
SELECT AGENT_CODE,ORD_AMOUNT,ADVANCE_AMOUNT,SUM(ORD_AMOUNT - ADVANCE_AMOUNT) AS BALANCE_AMOUNT
FROM ORDERS1 GROUP BY AGENT_CODE;
SELECT UPPER(CUST_NAME) FROM CUSTOMER;
SELECT MIN(ADVANCE_AMOUNT) AS TOT_AMT
FROM ORDERS1;
SELECT COUNT(*) AS TOTAL
FROM CUSTOMER;
CREATE DATABASE BANK;
USE BANK;
DROP TABLE CUSTOMERS;
CREATE TABLE CUSTOMERS (
		Customer_id INT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        Email VARCHAR(50),
        Phone VARCHAR(50),
        City VARCHAR(50),
        dob DATE,
        PRIMARY KEY(Customer_id)
        );
DROP TABLE Accounts;
CREATE TABLE Accounts (
		Account_id INT PRIMARY KEY,
        Account_type VARCHAR(50),
        Account_balance VARCHAR(50),
        dop DATE,
        Customer_id INT,
        FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id)
        );
DROP TABLE Branch;
ALTER TABLE 
CREATE TABLE Branch (
		Branch_id INT PRIMARY KEY,
        Branch_name VARCHAR(50),
        City VARCHAR(50)
        );
DROP TABLE Loan;
ALTER TABLE Loan
ADD loan_amount INT;
UPDATE Loan SET loan_amount = 500000 WHERE loan_id = 201;
UPDATE Loan SET loan_amount = 300000 WHERE loan_id = 202;
UPDATE Loan SET loan_amount = 200000 WHERE loan_id = 203;
UPDATE Loan SET loan_amount = 100000 WHERE loan_id = 204;
UPDATE Loan SET loan_amount = 150000 WHERE loan_id = 205;
ALTER TABLE Loan ADD PRIMARY KEY(Loan_id);
CREATE TABLE Loan (
		Loan_id INT,
        Loan_type VARCHAR(50),
        Customer_id INT,
        Account_id INT,
        Branch_id INT,
        FOREIGN KEY(Customer_id) REFERENCES CUSTOMERS(Customer_id),
        FOREIGN KEY (Account_id) REFERENCES Accounts(Account_id),
		FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
        );
INSERT INTO Customers VALUES
(1, 'Ravi', 'Kumar', 'ravi@gmail.com', '9876543210', 'Chennai', '1990-06-15'),
(2, 'Anita', 'Sharma', 'anita@gmail.com', '9876501234', 'Delhi', '1985-03-10'),
(3, 'John', 'Doe', 'john@gmail.com', '9812345678', 'Mumbai', '1998-12-20'),
(4, 'Priya', 'Singh', 'priya@gmail.com', '9898989898', 'Bangalore', '1995-04-25'),
(5, 'Deepak', 'Verma', 'deepak@gmail.com', '9845098450', 'Chennai', '1992-08-30');
INSERT INTO Accounts VALUES
(101, 'Savings', 50000, '2025-01-09', 1),
(102, 'Current', 100000, '2024-01-20', 2),
(103, 'Savings', 30000, '2023-11-15', 3),
(104, 'Current', 40000, '2024-03-01', 4),
(105, 'Savings', 25000, '2024-02-20', 5);
INSERT INTO Branch VALUES
(1, 'Chennai_Main', 'Chennai'),
(2, 'Delhi_Main', 'Delhi'),
(3, 'Mumbai_Center', 'Mumbai'),
(4, 'Bangalore_Central', 'Bangalore'),
(5, 'Chennai_North', 'Chennai');
INSERT INTO Loan VALUES
(201, 'Home', 1, 101, 1),
(202, 'Car', 2, 102, 2),
(203, 'Education', 3, 103, 3),
(204, 'Personal', 5, 105, 5),
(205, 'Gold', 1, 101, 1),
(206, 'Jeevi', NULL, NULL, NULL),
(207, 'Kani', NULL, NULL, NULL);
ALTER TABLE Accounts
MODIFY Account_balance INT; 
DESCRIBE Accounts;
SELECT Customer_id,first_name,Account_balance FROM Customers JOIN Accounts USING(Customer_id) ORDER BY first_name,dob ASC;
SELECT * FROM Customers JOIN Accounts;
SELECT COUNT(*) AS Cust_Count FROM Customers
WHERE City = 'Chennai';
SELECT * FROM Loan WHERE Loan_type = 'NULL';
SELECT 
		Customers.Customer_id,
        Customers.first_name
FROM
		Customers
LEFT JOIN 
		Loan ON Customers.Customer_id=Loan.Customer_id
WHERE
		Loan.Customer_id IS NULL;
SELECT City,COUNT(Branch_name) FROM Branch GROUP BY City;
SELECT 
    c.Customer_id,
    c.first_name,
    c.last_name,
    c.Email,
    c.Phone,
    c.City,
    c.dob,
    COUNT(l.Loan_id) AS Number_of_Loans
FROM 
    Customers c
JOIN 
    Loan l ON c.Customer_id = l.Customer_id
GROUP BY 
    c.Customer_id
ORDER BY 
    Number_of_Loans DESC;
SELECT 
    c.Customer_id,
    c.first_name,
    c.last_name,
    c.Email,
    c.Phone,
    c.City,
    c.dob,
    a.Account_id,
    a.Account_type,
    a.Account_balance,
    a.dop
FROM 
    Customers c
JOIN 
    Accounts a ON c.Customer_id = a.Customer_id
WHERE 
    a.dop >= CURDATE() - INTERVAL 3 MONTH;
SELECT 
		a.Account_id,
        c.first_name,
        c.last_name
FROM Customers c
JOIN Accounts a ON c.Customer_id=a.Customer_id
WHERE Account_type IN('Savings');

SELECT 
    c.Customer_id,
    c.first_name,
    l.Branch_id,
    l.Loan_amount
FROM 
    Loan l
JOIN 
    Customers c ON l.Customer_id = c.Customer_id
WHERE 
    l.Customer_id IS NOT NULL;
SELECT 
	c.Customer_id,
    c.first_name,
    c.Last_name,
    a.Account_id,
    a.Account_balance
FROM
	Customers c
JOIN
	Accounts a ON c.Customer_id=a.Customer_id
WHERE
	a.Account_balance >10000;
SELECT
	c.Customer_id AS Customer_number,
    CONCAT(c.first_name,' ',c.last_name) AS Customer_name,
    c.City,
    b.City

