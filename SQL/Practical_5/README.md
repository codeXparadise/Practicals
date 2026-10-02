# SQL Practical 5 — Joins (Data from Multiple Tables)

> **SQL Lab — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To display data from multiple tables using joins.

## 📌 Objective

Combine rows from related tables with equi-joins, self-joins and multi-table joins.

## 🧠 Concept in simple words

A join links two or more tables using a related column (usually a foreign key to a primary key). An equi-join matches rows where the keys are equal, a self-join joins a table to itself (for example an employee to their manager), and a multi-table join chains several tables together. The join condition is what connects the tables and avoids repeating data in every table.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `JOIN ... ON` | Combines rows from two tables where the ON condition is true. |
| `Equi-join` | Joins using equality of a key column. |
| `Self-join` | A table joined to itself with two aliases. |
| `Alias (e, d)` | Short names for tables in a join. |
| `Inner join` | Keeps only rows that match in both tables. |

## ▶️ How to use

Run the script in MySQL; the queries below read from two or more tables at once.

### Script file

[`practical_5.sql`](./practical_5.sql)

## 🧾 Queries & Output

### Query 1

**What this does:** Finds the customer named ANIL.

```sql
SELECT * FROM Customer WHERE Cust_Name='ANIL';
```

![Query 1 output](screenshots/q1.png)

### Query 2

**What this does:** Finds customers who are both borrowers and depositors and live in Nagpur.

```sql
SELECT c.Cust_Name FROM Customer c WHERE c.City='Nagpur'
  AND c.Cust_Name IN (SELECT Cust_Name FROM Borrow)
  AND c.Cust_Name IN (SELECT Cust_Name FROM Deposit);
```

![Query 2 output](screenshots/q2.png)

### Query 3

**What this does:** Joins Deposit, Customer and Branch to find customers whose branch is in their own city.

```sql
SELECT d.Cust_Name, c.City FROM Deposit d
JOIN Customer c ON d.Cust_Name=c.Cust_Name
JOIN Branch b ON d.Branch_Name=b.Branch_Name WHERE c.City=b.City;
```

![Query 3 output](screenshots/q3.png)

### Query 4

**What this does:** Joins Employee and Department to show each employee's department name.

```sql
SELECT e.Emp_Name, e.Dept_No, d.Dept_Name FROM Employee e JOIN Department d ON e.Dept_No=d.Dept_No;
```

![Query 4 output](screenshots/q4.png)

### Query 5

**What this does:** Shows the distinct jobs in department 30 together with the department location.

```sql
SELECT DISTINCT e.Job, d.Location FROM Employee e JOIN Department d ON e.Dept_No=d.Dept_No WHERE e.Dept_No=30;
```

![Query 5 output](screenshots/q5.png)

### Query 6

**What this does:** Shows employees whose department is located in NEW YORK.

```sql
SELECT e.Emp_Name, e.Dept_No, d.Dept_Name FROM Employee e JOIN Department d ON e.Dept_No=d.Dept_No WHERE d.Location='NEW YORK';
```

![Query 6 output](screenshots/q6.png)

### Query 7

**What this does:** Self-join: pairs each employee with their manager using the mgr column.

```sql
SELECT w.Emp_Name AS Employee, w.Emp_No AS Emp_No, m.Emp_Name AS Manager, m.Emp_No AS Mgr_No
FROM Employee w JOIN Employee m ON w.Mgr=m.Emp_No;
```

![Query 7 output](screenshots/q7.png)

### Query 8

**What this does:** Finds employees hired after SCOTT by comparing hire dates.

```sql
SELECT Emp_Name, Hire_Date FROM Employee WHERE Hire_Date > (SELECT Hire_Date FROM Employee WHERE Emp_Name='SCOTT');
```

![Query 8 output](screenshots/q8.png)

## ✅ Conclusion

Joins let related data that lives in separate tables be brought together in one result.
