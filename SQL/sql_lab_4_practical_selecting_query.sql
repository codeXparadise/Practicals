CREATE DATABASE IF NOT EXISTS Company;
USE Company;

CREATE TABLE IF NOT EXISTS job(
job_id INT,
job_title VARCHAR(100),
min_salary DECIMAL(10,2),
max_salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Employee(
emp_id INT,
emp_name VARCHAR(100),
emp_sal INT,
dept_no INT
);


INSERT INTO job VALUES
(101,'Manager',50000.00,100000.00),
(102,'Software Engineer',30000.00,80000.00),
(103,'Accountant',25000.00,60000.00),
(104,'HR Executive',28000.00,550000.00),
(105,'Sales Executive',20000.00,50000.00);

INSERT INTO Employee VALUES
(101,'Amit Sharma',45000.00,10),
(102,'Harshad Mehta',55000.00,20),
(103,'Neeta Ambani',60000.00,10),
(104,'Saurav Joshi',48000.00,30),
(105,'Balchand Desai',70000.00,20);

SELECT * FROM Employee where emp_sal < 50000.00;
SELECT * FROM Employee WHERE emp_name LIKE 'A%';



