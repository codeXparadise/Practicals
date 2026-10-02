-- PRACTICAL NO.9 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- AIM: To study the various options of the LIKE predicate in SQL.

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


-- QUERY 1: Display all employees whose name starts with 'A' and whose third character is 'a'.
SELECT * FROM Employee
WHERE Emp_Name LIKE 'A_a%';

-- QUERY 2: Display name, number and salary of employees whose name is 5 characters long and whose first three characters are 'Ani'.
SELECT Emp_Name, Emp_No, Salary
FROM Employee
WHERE Emp_Name LIKE 'Ani__';

-- QUERY 3: Display the non-null commission employees whose name's second character is 'n' and whose name is 5 characters long.
SELECT Emp_Name, Comm
FROM Employee
WHERE Comm IS NOT NULL
  AND Emp_Name LIKE '_n___';

-- QUERY 4: Display the null commission employees whose name's third character is 'a'.
SELECT Emp_Name
FROM Employee
WHERE Comm IS NULL
  AND Emp_Name LIKE '__a%';

-- QUERY 5: Output of LIKE predicate '%\_%' ESCAPE '\' (matches a value containing a literal underscore).
SELECT Job FROM Employee
WHERE Job LIKE '%\_%' ESCAPE '\';
