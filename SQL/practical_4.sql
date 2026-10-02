-- PRACTICAL NO.4 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- AIM: To study single-row functions in SQL.

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


-- QUERY 1: Display the current date. Label the column Date.
SELECT CURDATE() AS `Date`;

-- QUERY 2: For each employee display employee number, job, salary and salary increased by 15% (whole number). Label the column New Salary.
SELECT Emp_No, Job, Salary, ROUND(Salary * 1.15) AS `New Salary` FROM Employee;

-- QUERY 3: Modify the above query to add a column that subtracts the old salary from the new salary. Label the column Increase.
SELECT Emp_No, Job, Salary, ROUND(Salary * 1.15) AS `New Salary`,
       ROUND(Salary * 1.15) - Salary AS Increase
FROM Employee;

-- QUERY 4: Display employee names with first letter capital and other letters lowercase, with name length, for names starting with J, A or M. Sort by name.
SELECT CONCAT(UPPER(SUBSTRING(Emp_Name,1,1)), LOWER(SUBSTRING(Emp_Name,2))) AS Name,
       LENGTH(Emp_Name) AS Length
FROM Employee
WHERE SUBSTRING(Emp_Name,1,1) IN ('J','A','M')
ORDER BY Emp_Name;

-- QUERY 5: Produce: <employee name> earns <salary> monthly.
SELECT CONCAT(Emp_Name, ' earns ', Salary, ' monthly.') AS `Employee Salary`
FROM Employee;

-- QUERY 6: Display name, hire date, number of months employed and day of week on which the employee started. Order by day of week starting with Monday.
SELECT Emp_Name, Hire_Date,
       TIMESTAMPDIFF(MONTH, Hire_Date, CURDATE()) AS `Months Employed`,
       DAYNAME(Hire_Date) AS Day
FROM Employee
ORDER BY FIELD(DAYNAME(Hire_Date),'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- QUERY 7: Display the hire date in a format that appears as: Seventh of June 1994 12:00:00 AM.
SELECT Emp_Name, DATE_FORMAT(Hire_Date, '%D of %M %Y %r') AS `Hire Date`
FROM Employee;

-- QUERY 8: Calculate the annual compensation of all employees (sal + comm).
SELECT Emp_No, Emp_Name, Salary, Comm,
       Salary + IFNULL(Comm, 0) AS `Annual Compensation`
FROM Employee;
