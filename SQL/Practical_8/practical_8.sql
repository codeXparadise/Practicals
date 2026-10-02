-- PRACTICAL NO.8 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- AIM: To manipulate data using UPDATE and DELETE statements with conditions and sub-queries.

-- CREATING DATABASE
CREATE DATABASE IF NOT EXISTS Practical_Lab;
USE Practical_Lab;


-- ------------------------------------------------------------------
-- EMPLOYEE / DEPARTMENT SCHEMA
-- ------------------------------------------------------------------

-- CREATING Department TABLE
CREATE TABLE IF NOT EXISTS Department(
    Dept_No   INT PRIMARY KEY,
    Dept_Name VARCHAR(30),
    Location  VARCHAR(30)
);

-- CREATING Employee TABLE
CREATE TABLE IF NOT EXISTS Employee(
    Emp_No    INT PRIMARY KEY,
    Emp_Name  VARCHAR(30),
    Job       VARCHAR(20),
    Mgr       INT,
    Hire_Date DATE,
    Salary    DECIMAL(10,2),
    Comm      DECIMAL(10,2),
    Dept_No   INT
);

-- INSERTING DATA INTO Department TABLE
INSERT IGNORE INTO Department VALUES
    (10,'ACCOUNTING','NEW YORK'),
    (20,'RESEARCH','DALLAS'),
    (30,'SALES','CHICAGO'),
    (40,'OPERATIONS','BOSTON');

-- INSERTING DATA INTO Employee TABLE
INSERT IGNORE INTO Employee VALUES
    (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
    (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
    (7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
    (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
    (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
    (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
    (7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),
    (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
    (7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),
    (7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
    (7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
    (7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10),
    (7935,'ANITA','SALESMAN',7698,'1982-03-15',1600,500,30),
    (7936,'ANAND','CLERK',7782,'1983-07-21',1200,NULL,10),
    (7937,'ANIL','CLERK',7788,'1984-09-10',1100,NULL,20),
    (7938,'ANKIT','SALESMAN',7698,'1985-01-05',1400,200,30),
    (7939,'AMIT','CLERK',7782,'1986-02-11',1300,NULL,10);


-- ------------------------------------------------------------------
-- BANK SCHEMA
-- ------------------------------------------------------------------

-- CREATING Branch TABLE
CREATE TABLE IF NOT EXISTS Branch(
    Branch_Name VARCHAR(30) PRIMARY KEY,
    City        VARCHAR(30),
    Assets      DECIMAL(12,2)
);

-- CREATING Customer TABLE
CREATE TABLE IF NOT EXISTS Customer(
    Cust_Name VARCHAR(30) PRIMARY KEY,
    City      VARCHAR(30)
);

-- CREATING Deposit TABLE
CREATE TABLE IF NOT EXISTS Deposit(
    Act_No      INT PRIMARY KEY,
    Cust_Name   VARCHAR(30),
    Branch_Name VARCHAR(30),
    Amount      DECIMAL(12,2),
    Act_Date    DATE
);

-- CREATING Borrow TABLE
CREATE TABLE IF NOT EXISTS Borrow(
    Loan_No     INT PRIMARY KEY,
    Cust_Name   VARCHAR(30),
    Branch_Name VARCHAR(30),
    Amount      DECIMAL(12,2)
);

-- INSERTING DATA INTO Branch TABLE
INSERT IGNORE INTO Branch VALUES
    ('VRCE','Nagpur',1500000),
    ('AJNI','Nagpur',800000),
    ('KAROLBAGH','Delhi',1200000),
    ('CHANDI','Chandigarh',1000000),
    ('DHARAMPETH','Nagpur',700000),
    ('M.G.ROAD','Bangalore',900000),
    ('ANDHERI','Bombay',1100000),
    ('VIRAR','Bombay',600000),
    ('NEHRU PLACE','Delhi',850000),
    ('POWAI','Bombay',950000);

-- INSERTING DATA INTO Customer TABLE
INSERT IGNORE INTO Customer VALUES
    ('ANIL','Bombay'),
    ('SUNIL','Delhi'),
    ('MEHUL','Bombay'),
    ('MANDAR','Bombay'),
    ('MADHURI','Delhi'),
    ('PRAMOD','Nagpur'),
    ('SANDIP','Nagpur'),
    ('SHIVANI','Delhi'),
    ('RAKESH','Nagpur'),
    ('JAYA','Bombay'),
    ('VIJAY','Bombay');

-- INSERTING DATA INTO Deposit TABLE
INSERT IGNORE INTO Deposit VALUES
    (100,'ANIL','VRCE',1000,'1996-03-01'),
    (101,'SUNIL','AJNI',5000,'1996-01-04'),
    (102,'MEHUL','KAROLBAGH',3000,'1995-11-17'),
    (103,'MANDAR','CHANDI',2000,'1996-12-17'),
    (104,'MADHURI','DHARAMPETH',6000,'1996-04-01'),
    (105,'PRAMOD','M.G.ROAD',7000,'1996-06-01'),
    (106,'SANDIP','ANDHERI',9000,'1996-07-01'),
    (107,'SHIVANI','VIRAR',8000,'1996-08-01'),
    (108,'RAKESH','NEHRU PLACE',4000,'1996-09-01'),
    (109,'JAYA','POWAI',2000,'1996-10-01'),
    (110,'VIJAY','ANDHERI',5000,'1996-11-01');

-- INSERTING DATA INTO Borrow TABLE
INSERT IGNORE INTO Borrow VALUES
    (1001,'ANIL','VRCE',10000),
    (1002,'SUNIL','AJNI',5000),
    (1003,'MEHUL','KAROLBAGH',3000),
    (1004,'MANDAR','CHANDI',2000),
    (1005,'MADHURI','DHARAMPETH',6000),
    (1006,'PRAMOD','M.G.ROAD',7000),
    (1007,'SANDIP','ANDHERI',9000),
    (1008,'SHIVANI','VIRAR',8000);


-- QUERY 1: Give 10% interest to all depositors.
UPDATE Deposit SET Amount = Amount * 1.10;

-- QUERY 2: Display all deposit records.
SELECT * FROM Deposit;

-- QUERY 3: Give 10% interest to all depositors having branch VRCE.
UPDATE Deposit SET Amount = Amount * 1.10 WHERE Branch_Name = 'VRCE';

-- QUERY 4: Give 10% interest to depositors living in NAGPUR and having branch city BOMBAY.
UPDATE Deposit
SET Amount = Amount * 1.10
WHERE Cust_Name IN (SELECT Cust_Name FROM Customer WHERE City = 'Nagpur')
  AND Branch_Name IN (SELECT Branch_Name FROM Branch WHERE City = 'Bombay');

-- QUERY 5: Change the department number of all employees with empno 7788's job to employee 7844's current department number.
UPDATE Employee
SET Dept_No = (SELECT Dept_No FROM (SELECT Dept_No FROM Employee WHERE Emp_No = 7844) t)
WHERE Job = (SELECT Job FROM (SELECT Job FROM Employee WHERE Emp_No = 7788) t2);

-- QUERY 6: Transfer Rs.10 from the account of ANIL to SUNIL if both are in the same branch.
UPDATE Deposit
SET Amount = CASE WHEN Cust_Name = 'ANIL' THEN Amount - 10
                   WHEN Cust_Name = 'SUNIL' THEN Amount + 10
                   ELSE Amount END
WHERE Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Deposit WHERE Cust_Name = 'ANIL') t)
  AND Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Deposit WHERE Cust_Name = 'SUNIL') t2);

-- QUERY 7: Give Rs.100 more to all depositors who are the maximum depositors in their respective branch.
UPDATE Deposit d
JOIN (SELECT Branch_Name, MAX(Amount) AS mx FROM Deposit GROUP BY Branch_Name) m
  ON d.Branch_Name = m.Branch_Name AND d.Amount = m.mx
SET d.Amount = d.Amount + 100;

-- QUERY 8: Delete depositors of branches having number of CUSTOMER between 1 and 3.
DELETE FROM Deposit
WHERE Branch_Name IN (SELECT Branch_Name FROM
                      (SELECT Branch_Name FROM Deposit GROUP BY Branch_Name HAVING COUNT(*) BETWEEN 1 AND 3) t);

-- QUERY 9: Delete deposit of VIJAY.
DELETE FROM Deposit WHERE Cust_Name = 'VIJAY';

-- QUERY 10: Delete borrower of branches having average loan less than 1000.
DELETE FROM Borrow
WHERE Branch_Name IN (SELECT Branch_Name FROM
                      (SELECT Branch_Name FROM Borrow GROUP BY Branch_Name HAVING AVG(Amount) < 1000) t);

-- QUERY 11: Display all borrowing records.
SELECT * FROM Borrow;
