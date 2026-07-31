-- PRACTICAL NO.3 (official codes provided from collage)
-- AUTHOR: VISHAL PRAJAPATI

-- CREATING DATABASE 1 (Library)
CREATE DATABASE Library;
USE Library;

-- CREATING Book TABLE
CREATE TABLE Book
(
    Book_ID     INT PRIMARY KEY,
    Book_Title  VARCHAR(100),
    Author_Name VARCHAR(50),
    Category    VARCHAR(30),
    Price       DECIMAL(8, 2),
    Quantity    INT,
    Publisher   VARCHAR(50)
);

-- INSERTING DATA INTO Book TABLE
INSERT INTO Book
VALUES
(101,'DBMS','Korth','Education',650,15,'McGraw Hill'),
(102,'OS','Galvin','Education',720,10,'Wiley'),
(103,'PP','Reema Thareja','Programming',550,20,'Oxford'),
(104,'CN','Forouzan','Networking',680,12,'McGraw Hill'),
(105,'JP','Herbert Schildt','Programming',600,18,'Oracle Press');

-- Query: Display all records from Book table
SELECT * FROM Book;

-- Query: Update the price of Book_ID 103
UPDATE Book SET Price = 580 WHERE Book_ID = 103;

-- Query: Display updated records
SELECT * FROM Book;

-- Query: Delete Book_ID 105
DELETE FROM Book WHERE Book_ID = 105;

-- Query: Display remaining records
SELECT * FROM Book;

-- Query: Display book title and author
SELECT Book_Title, Author_Name FROM Book;

-- Query: Display books with price greater than 600
SELECT * FROM Book WHERE Price > 600;

-- Query: Display books in ascending order of price
SELECT * FROM Book ORDER BY Price ASC;

-- Query: Display books in descending order of quantity
SELECT * FROM Book ORDER BY Quantity DESC;

-- ------------------------------------------------------------------
-- CREATING DATABASE 2 (Employee)

CREATE DATABASE Employee;
USE Employee;


-- CREATING Employee TABLE
CREATE TABLE Employee
(
Emp_No INT PRIMARY KEY,
Emp_Name VARCHAR(50) NOT NULL,
Emp_Salary DECIMAL(10,2),
Dept_No INT
);

-- INSERTING DATA INTO Employee TABLE
INSERT IGNORE INTO Employee VALUES
(101,'Amit',35000,10),
(102,'Priya',42000,20),
(103,'Rahul',28000,10),
(104,'Neha',50000,30),
(105,'Kiran',39000,20);

-- QUERY 1: Display all records
SELECT * FROM Employee;

-- QUERY 2: Count total employees
SELECT COUNT(*) AS Total_Employees
FROM Employee;

-- QUERY 3: Display highest salary
SELECT MAX(Emp_Salary) AS Highest_Salary
FROM Employee;

-- QUERY 4: Display lowest salary
SELECT MIN(Emp_Salary) AS Lowest_Salary
FROM Employee;

-- QUERY 5: Display average salary
SELECT AVG(Emp_Salary) AS Average_Salary
FROM Employee;

-- QUERY 6: Display total salary
SELECT SUM(Emp_Salary) AS Total_Salary
FROM Employee;

-- QUERY 7: Display employee count by department
SELECT Dept_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_No;

-- QUERY 8: Display total salary by department
SELECT Dept_No, SUM(Emp_Salary) AS Total_Salary
FROM Employee
GROUP BY Dept_No;

-- QUERY 9: Display average salary by department
SELECT Dept_No, AVG(Emp_Salary) AS Average_Salary
FROM Employee
GROUP BY Dept_No;

-- QUERY 10: Display highest salary by department
SELECT Dept_No, MAX(Emp_Salary) AS Highest_Salary
FROM Employee
GROUP BY Dept_No;

-- QUERY 11: Display lowest salary by department
SELECT Dept_No, MIN(Emp_Salary) AS Lowest_Salary
FROM Employee
GROUP BY Dept_No;

-- QUERY 12: Display department with more than 2 employees
SELECT Dept_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_No
HAVING COUNT(*) > 2;

-- QUERY 13: Display department with average salary greater than 40000
SELECT Dept_No, AVG(Emp_Salary) AS Average_Salary
FROM Employee
GROUP BY Dept_No
HAVING AVG(Emp_Salary) > 40000;

-- QUERY 14: Display employees in ascending order of salary
SELECT *
FROM Employee
ORDER BY Emp_Salary ASC;

-- QUERY 15: Display employees in descending order of salary
SELECT *
FROM Employee
ORDER BY Emp_Salary DESC;

-- QUERY 16: Display employees in ascending order of name
SELECT *
FROM Employee
ORDER BY Emp_Name ASC;

-- QUERY 17: Display employees in ascending order of department number
SELECT *
FROM Employee
ORDER BY Dept_No ASC;

-- QUERY 18: Display employee name and salary in descending order of salary
SELECT Emp_Name, Emp_Salary
FROM Employee
ORDER BY Emp_Salary DESC;

-- QUERY 19: Display employees with salary greater than 35000 in ascending order of salary
SELECT *
FROM Employee
WHERE Emp_Salary > 35000
ORDER BY Emp_Salary ASC;

-- QUERY 20: Display top 3 employees with highest salary
SELECT *
FROM Employee
ORDER BY Emp_Salary DESC
LIMIT 3;