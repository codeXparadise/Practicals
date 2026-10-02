# SQL Practical 2 — Create Tables, Insert Data & Basic Queries

> **SQL Lab — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To create the given tables with appropriate data types, insert the data and perform basic retrieval queries.

## 📌 Objective

Choose the right data type for each column and retrieve rows using WHERE, aliases and LIKE.

## 🧠 Concept in simple words

This practical builds the Job and Employee tables with suitable data types, inserts records and runs simple queries. WHERE filters rows by a condition, AS gives a column a friendlier name in the output, and LIKE 'A%' matches values that start with a given letter. The correct data type for each column decides what values it can hold.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Data type` | int for whole numbers, varchar for text, decimal for money. |
| `WHERE` | Keeps only the rows that match a condition. |
| `AS (alias)` | Renames a column in the result. |
| `LIKE 'A%'` | Matches text that starts with 'A'; % means any characters. |

## ▶️ How to use

Run the script in MySQL, then read the result tables below to see which rows each condition returned.

### Script file

[`practical_2.sql`](./practical_2.sql)

## 🧾 Queries & Output

### Query 1

**What this does:** Lists all jobs whose minimum salary is greater than 20000.

```sql
SELECT * FROM Job WHERE min_sal > 20000.00;
```

![Query 1 output](screenshots/q1.png)

### Query 2

**What this does:** Shows the employee name (renamed with AS) and salary for department 20 only.

```sql
SELECT emp_name AS Employee_Name, emp_sal FROM Employee WHERE dept_no = 20;
```

![Query 2 output](screenshots/q2.png)

### Query 3

**What this does:** Uses LIKE 'A%' to list employees whose name starts with the letter A.

```sql
SELECT * FROM Employee WHERE emp_name LIKE 'A%';
```

![Query 3 output](screenshots/q3.png)

## ✅ Conclusion

A table is only as good as its data types, and WHERE, aliases and LIKE make it easy to pull out exactly the rows you need.
