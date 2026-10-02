# SQL Practical 1 — DDL (CREATE) & DML (INSERT)

> **SQL Lab — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To study DDL (CREATE) and DML (INSERT) commands in SQL.

## 📌 Objective

Learn how to define a database's structure with CREATE and fill it with rows using INSERT, then read it back with SELECT.

## 🧠 Concept in simple words

DDL (Data Definition Language) defines the structure: CREATE DATABASE makes a database and CREATE TABLE makes tables such as Customer, Branch, Borrower and Depositor with their columns and data types. DML (Data Manipulation Language) works with the data: INSERT adds rows and SELECT reads them. A table must exist before rows can be inserted into it, so the order is always database, then tables, then data.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `DDL` | Defines structure - CREATE, ALTER, DROP. |
| `DML` | Works with data - INSERT, UPDATE, DELETE, SELECT. |
| `CREATE TABLE` | Defines a table's columns and their data types. |
| `INSERT INTO` | Adds one or more rows to a table. |
| `Primary key` | A column that uniquely identifies each row. |
| `Foreign key` | A column that refers to a primary key in another table. |

## ▶️ How to use

Run the script in MySQL. It creates the Bank database and its tables, inserts sample rows and then runs the SELECT queries shown below.

### Script file

[`practical_1.sql`](./practical_1.sql)

## 🧾 Queries & Output

### Query 1

**What this does:** Shows every row of the Customer table.

```sql
SELECT * FROM Customer;
```

![Query 1 output](screenshots/q1.png)

### Query 2

**What this does:** Shows every row of the Depositor table.

```sql
SELECT * FROM Depositor;
```

![Query 2 output](screenshots/q2.png)

### Query 3

**What this does:** Joins Customer and Depositor and keeps only customers whose balance is above 75000.

```sql
SELECT c.customer_name FROM Customer c
JOIN Depositor d
    ON c.customer_id = d.customer_id
                       WHERE d.balance > 75000;
```

![Query 3 output](screenshots/q3.png)

## ✅ Conclusion

Structure (DDL) is created first, data (DML) is inserted next, and SELECT confirms that everything was stored correctly.
