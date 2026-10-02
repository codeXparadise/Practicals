# SQL Practical 6 — Group Functions (Aggregating Data)

> **SQL Lab — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To apply group functions to aggregate data in SQL.

## 📌 Objective

Summarise many rows into single values and per-group totals using SUM, MAX, MIN, AVG and COUNT.

## 🧠 Concept in simple words

Group (aggregate) functions compute one value from many rows. Combined with GROUP BY they give one result per group, and HAVING filters those groups using the aggregate value. The key difference is that WHERE filters rows before grouping while HAVING filters the groups after the aggregates are computed.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `SUM / AVG / MAX / MIN / COUNT` | Aggregate many rows into one value. |
| `GROUP BY` | One result row per distinct group. |
| `HAVING` | Filters groups after aggregation. |
| `WHERE vs HAVING` | WHERE filters rows, HAVING filters groups. |

## ▶️ How to use

Run the script in MySQL; the queries below show totals, averages and counts per department, branch and city.

### Script file

[`practical_6.sql`](./practical_6.sql)

## 🧾 Queries & Output

### Query 1

**What this does:** Totals all deposits made after 1-Jan-1996.

```sql
SELECT SUM(Amount) AS `Total Deposit` FROM Deposit WHERE Act_Date > '1996-01-01';
```

![Query 1 output](screenshots/q1.png)

### Query 2

**What this does:** Totals deposits of customers living in Nagpur.

```sql
SELECT SUM(d.Amount) AS `Total Deposit` FROM Deposit d JOIN Customer c ON d.Cust_Name=c.Cust_Name WHERE c.City='Nagpur';
```

![Query 2 output](screenshots/q2.png)

### Query 3

**What this does:** Finds the largest deposit among customers living in Bombay.

```sql
SELECT MAX(d.Amount) AS `Max Deposit` FROM Deposit d JOIN Customer c ON d.Cust_Name=c.Cust_Name WHERE c.City='Bombay';
```

![Query 3 output](screenshots/q3.png)

### Query 4

**What this does:** Shows the highest, lowest, total and average salary in one row.

```sql
SELECT MAX(Salary) AS Highest, MIN(Salary) AS Lowest, SUM(Salary) AS Sum, ROUND(AVG(Salary),2) AS Average FROM Employee;
```

![Query 4 output](screenshots/q4.png)

### Query 5

**What this does:** Computes the difference between the highest and lowest salaries.

```sql
SELECT MAX(Salary)-MIN(Salary) AS DIFFERENCE FROM Employee;
```

![Query 5 output](screenshots/q5.png)

### Query 6

**What this does:** Counts employees overall and how many were hired in each of 1995-1998.

```sql
SELECT COUNT(*) AS Total, SUM(YEAR(Hire_Date)=1995) AS `1995`, SUM(YEAR(Hire_Date)=1996) AS `1996`,
       SUM(YEAR(Hire_Date)=1997) AS `1997`, SUM(YEAR(Hire_Date)=1998) AS `1998` FROM Employee;
```

![Query 6 output](screenshots/q6.png)

### Query 7

**What this does:** Averages salaries per department, showing only the averages.

```sql
SELECT ROUND(AVG(Salary),2) AS `Average Salary` FROM Employee GROUP BY Dept_No;
```

![Query 7 output](screenshots/q7.png)

### Query 8

**What this does:** Totals salaries per department and job title.

```sql
SELECT Dept_No, Job, SUM(Salary) AS `Total Salary` FROM Employee GROUP BY Dept_No, Job;
```

![Query 8 output](screenshots/q8.png)

### Query 9

**What this does:** Averages salaries per department and keeps only averages above 2000.

```sql
SELECT ROUND(AVG(Salary),2) AS `Average Salary` FROM Employee GROUP BY Dept_No HAVING AVG(Salary) > 2000;
```

![Query 9 output](screenshots/q9.png)

### Query 10

**What this does:** Totals salary per job (excluding president), keeps totals above 3000 and sorts them.

```sql
SELECT Job, SUM(Salary) AS `Total Salary` FROM Employee WHERE Job <> 'PRESIDENT' GROUP BY Job HAVING SUM(Salary) > 3000 ORDER BY SUM(Salary);
```

![Query 10 output](screenshots/q10.png)

### Query 11

**What this does:** Totals deposits per Bombay branch and keeps branches above 5000.

```sql
SELECT b.Branch_Name, SUM(d.Amount) AS `Total Deposit` FROM Deposit d JOIN Branch b ON d.Branch_Name=b.Branch_Name WHERE b.City='Bombay' GROUP BY b.Branch_Name HAVING SUM(d.Amount) > 5000;
```

![Query 11 output](screenshots/q11.png)

## ✅ Conclusion

Group functions turn detailed rows into meaningful summaries such as totals and averages per group.
