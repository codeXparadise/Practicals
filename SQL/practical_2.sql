-- PRACTICAL NO.2 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- AIM: CREATE THE GIVEN TABLE AND INSERT THE DATA ACCORDINGLY

-- CREATING DATABASE
CREATE DATABASE IF NOT EXISTS Company;
USE Company;

-- CREATING Job TABLE
CREATE TABLE IF NOT EXISTS Job(
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_sal DECIMAL(10,2),
    max_sal DECIMAL(10,2)
);

-- CREATING EMPLOYEE TABLE
CREATE TABLE IF NOT EXISTS Employee(
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    emp_sal DECIMAL(10,2),
    dept_no INT NOT NULL
);

-- INSERTING DATA INTO JOB TABLE
INSERT IGNORE INTO Job VALUES
        (101, 'Manager', 50000.00, 100000.00),
        (102, 'Software Engineer', 30000.00, 80000.00),
        (103, 'Accountant', 25000.00, 60000.00),
        (104, 'HR Executive', 28000.00, 55000.00),
        (105, 'Sales Executive', 20000.00, 50000.00);

INSERT IGNORE INTO Employee VALUES
        (101,'Amit Sharma',45000.00,10),
        (102, 'Priya Mehta', 55000.00, 20),
        (103, 'Rahul Patil', 60000.00, 10),
        (104, 'Sneha Joshi', 48000.00, 30),
        (105, 'Rohan Desai', 70000.00, 20);

-- QUERY 1: Display all jobs with minimum salary greater than 20000
SELECT * FROM Job WHERE min_sal > 20000.00;

-- QUERY 2: Display name and salary of employee whose department number is 20.Give alias name to name of employee.
SELECT emp_name AS Employee_Name, emp_sal FROM Employee WHERE dept_no = 20;

-- QUERY 3: Display all employees whose name starts with 'A'
SELECT * FROM Employee WHERE emp_name LIKE 'A%';

