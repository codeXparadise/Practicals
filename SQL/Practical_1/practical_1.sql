-- PRACTICAL NO.1
-- AUTHOR: VISHAL PRAJAPATI


-- CREATING DATABASE ONLY IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS Bank;
USE Bank;

-- CREATING Customer TABLE
CREATE TABLE IF NOT EXISTS Customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_city VARCHAR(50),
    customer_phone VARCHAR(15)
    );

-- CREATING Branch TABLE
CREATE TABLE IF NOT EXISTS Branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    branch_city VARCHAR(50),
    assets DECIMAL(12,2)
);

-- CREATING Borrower TABLE
CREATE TABLE IF NOT EXISTS Borrower(
    loan_no INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    loan_amount DECIMAL(10,2)
);

-- CREATING Depositor TABLE WITH FOREIGN KEY REFERS TO Customer TABLE
CREATE TABLE IF NOT EXISTS Depositor(
    account_no INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- INSERTING DATA INTO Customer TABLE
INSERT IGNORE INTO Customer VALUES
       (101,'Amit Sharma','Mumbai','9876543210'),
       (102, 'Priya Mehta', 'Pune', '9876543211'),
       (103, 'Rahul Patil', 'Nashik', '9876543212'),
       (104, 'Sneha Joshi', 'Nagpur', '9876543213'),
       (105, 'Rohan Desai', 'Thane', '9876543214');

-- INSERTING DATA INTO Branch TABLE
INSERT IGNORE INTO Branch VALUES
        (1,'Andheri','Mumbai',5000000.00),
        (2, 'Shivaji Nagar Branch', 'Pune', 3500000.00),
        (3, 'CIDCO Branch', 'Nashik', 4200000.00),
        (4, 'Sitabuldi Branch', 'Nagpur', 3800000.00);

-- INSERTING DATA INTO Borrower TABLE
INSERT IGNORE INTO Borrower VALUES
        (1001, 101, 1, 250000.00),
        (1002, 102, 2, 500000.00),
        (1003, 103, 3, 300000.00),
        (1004, 104, 4, 450000.00);

-- INSERTING DATA INTO Depositor TABLE
INSERT IGNORE INTO Depositor VALUES
        (2001, 101, 1, 75000.00),
        (2002, 102, 2, 120000.00),
        (2003, 103, 3, 90000.00),
        (2004, 104, 4, 150000.00),
        (2005, 105, 1, 50000.00);

-- DISPLAYING DATA OF Customer and Depositor TABLE
SELECT * FROM Customer;
SELECT * FROM Depositor;

-- Give names of depositors having amount greater than 75000
SELECT c.customer_name FROM Customer c
JOIN Depositor d
    ON c.customer_id = d.customer_id
                       WHERE d.balance > 75000;