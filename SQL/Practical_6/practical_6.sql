-- PRACTICAL NO.6 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- AIM: To apply group functions to aggregate data in SQL.

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


-- QUERY 1: Total deposit of CUSTOMER having account date after 1-Jan-96.
SELECT SUM(Amount) AS `Total Deposit`
FROM Deposit
WHERE Act_Date > '1996-01-01';

-- QUERY 2: Total deposit of CUSTOMER living in city NAGPUR.
SELECT SUM(d.Amount) AS `Total Deposit`
FROM Deposit d
JOIN Customer c ON d.Cust_Name = c.Cust_Name
WHERE c.City = 'Nagpur';

-- QUERY 3: Maximum deposit of CUSTOMER living in BOMBAY.
SELECT MAX(d.Amount) AS `Max Deposit`
FROM Deposit d
JOIN Customer c ON d.Cust_Name = c.Cust_Name
WHERE c.City = 'Bombay';

-- QUERY 4: Highest, lowest, sum and average salary of all employees.
SELECT MAX(Salary) AS Highest, MIN(Salary) AS Lowest,
       SUM(Salary) AS Sum, ROUND(AVG(Salary), 2) AS Average
FROM Employee;

-- QUERY 5: Difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE FROM Employee;

-- QUERY 6: Total number of employees, and of that total, the number hired in 1995, 1996, 1997 and 1998.
SELECT COUNT(*) AS Total,
       SUM(YEAR(Hire_Date) = 1995) AS `1995`,
       SUM(YEAR(Hire_Date) = 1996) AS `1996`,
       SUM(YEAR(Hire_Date) = 1997) AS `1997`,
       SUM(YEAR(Hire_Date) = 1998) AS `1998`
FROM Employee;

-- QUERY 7: Average salaries for each department without displaying the department numbers.
SELECT ROUND(AVG(Salary), 2) AS `Average Salary`
FROM Employee
GROUP BY Dept_No;

-- QUERY 8: Total salary paid to each job title, within each department.
SELECT Dept_No, Job, SUM(Salary) AS `Total Salary`
FROM Employee
GROUP BY Dept_No, Job;

-- QUERY 9: Average salaries > 2000 for each department without displaying the department numbers.
SELECT ROUND(AVG(Salary), 2) AS `Average Salary`
FROM Employee
GROUP BY Dept_No
HAVING AVG(Salary) > 2000;

-- QUERY 10: Job and total salary for each job with total salary exceeding 3000, excluding president, sorted by total salary.
SELECT Job, SUM(Salary) AS `Total Salary`
FROM Employee
WHERE Job <> 'PRESIDENT'
GROUP BY Job
HAVING SUM(Salary) > 3000
ORDER BY SUM(Salary);

-- QUERY 11: Branches having sum of deposit more than 5000 and located in city BOMBAY.
SELECT b.Branch_Name, SUM(d.Amount) AS `Total Deposit`
FROM Deposit d
JOIN Branch b ON d.Branch_Name = b.Branch_Name
WHERE b.City = 'Bombay'
GROUP BY b.Branch_Name
HAVING SUM(d.Amount) > 5000;
