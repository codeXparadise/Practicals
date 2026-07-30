-- 28 July 2026 

CREATE DATABASE IF NOT EXISTS Library;
USE Library;

CREATE TABLE IF NOT EXISTS Books
(
	Book_id INT PRIMARY KEY,
    Book_title VARCHAR(100),
    Author_name VARCHAR(50),
    Catogery VARCHAR(50),
    Price DECIMAL(8,2),
    Quantity INT,
    Publisher VARCHAR(50)
);

INSERT IGNORE INTO Books VALUES
(101,'DBMS','Korth','Education',650,15,'McGraw Hill'),
(102,'Operating System','Galvin','Education',720,10,'Wiley'),
(103,'Python Programming','Reema Thareja','Programming',550,20,'Oxford'),
(104,'Computer Network','Forouzan','Networking',680,12,'McGraw Hill'),
(105,'Java Programming','Herbert Schildt','Programming',600,18,'Oracle Press');

SELECT * FROM Books;
SELECT * FROM Books WHERE Catogery = 'Education';

UPDATE Books SET Price = 580 WHERE Book_id = 103;
