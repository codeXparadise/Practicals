# SQL Practical 4 — Single-Row Functions

> **SQL Lab — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To study single-row functions in SQL.

## 📌 Objective

Use character, number, date and conversion functions to transform and format column values.

## 🧠 Concept in simple words

Single-row functions work on one row at a time and return one result per row. Character functions change case and join text, number functions round values, and date functions read the current date and work with dates. They can be used anywhere an expression is allowed - in the SELECT list, in WHERE or in ORDER BY - and can be nested to build formatted output.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `CURDATE()` | Returns today's date. |
| `CONCAT()` | Joins two or more strings. |
| `UPPER() / LOWER()` | Change text to upper or lower case. |
| `ROUND()` | Rounds a number to given decimals. |
| `TIMESTAMPDIFF()` | Difference between two dates in a chosen unit. |
| `DATE_FORMAT()` | Formats a date as text. |
| `IFNULL()` | Replaces a NULL with a given value. |

## ▶️ How to use

Run the script in MySQL; each query below shows the function and its result.

### Script file

[`practical_4.sql`](./practical_4.sql)

## 🧾 Queries & Output

### Query 1

**What this does:** CURDATE() returns today's date, labelled Date.

```sql
SELECT CURDATE() AS Date;
```

![Query 1 output](screenshots/q1.png)

### Query 2

**What this does:** Shows salary increased by 15% (rounded) as New Salary.

```sql
SELECT Emp_No, Job, Salary, ROUND(Salary*1.15) AS `New Salary` FROM Employee;
```

![Query 2 output](screenshots/q2.png)

### Query 3

**What this does:** Adds an Increase column = new salary minus old salary.

```sql
SELECT Emp_No, Job, Salary, ROUND(Salary*1.15) AS `New Salary`,
       ROUND(Salary*1.15)-Salary AS Increase FROM Employee;
```

![Query 3 output](screenshots/q3.png)

### Query 4

**What this does:** Capitalises the first letter, lowercases the rest and shows the name length, for names starting with J, A or M.

```sql
SELECT CONCAT(UPPER(SUBSTRING(Emp_Name,1,1)), LOWER(SUBSTRING(Emp_Name,2))) AS Name,
       LENGTH(Emp_Name) AS Length
FROM Employee WHERE SUBSTRING(Emp_Name,1,1) IN ('J','A','M') ORDER BY Emp_Name;
```

![Query 4 output](screenshots/q4.png)

### Query 5

**What this does:** CONCAT builds the sentence '<name> earns <salary> monthly.'.

```sql
SELECT CONCAT(Emp_Name,' earns ',Salary,' monthly.') AS `Employee Salary` FROM Employee;
```

![Query 5 output](screenshots/q5.png)

### Query 6

**What this does:** Shows months employed (TIMESTAMPDIFF) and the weekday the employee started, ordered from Monday.

```sql
SELECT Emp_Name, Hire_Date, TIMESTAMPDIFF(MONTH,Hire_Date,CURDATE()) AS `Months Employed`,
       DAYNAME(Hire_Date) AS Day
FROM Employee
ORDER BY FIELD(DAYNAME(Hire_Date),'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
```

![Query 6 output](screenshots/q6.png)

### Query 7

**What this does:** DATE_FORMAT prints the hire date in a readable 'day of month year' form.

```sql
SELECT Emp_Name, DATE_FORMAT(Hire_Date,'%D of %M %Y %r') AS `Hire Date` FROM Employee;
```

![Query 7 output](screenshots/q7.png)

### Query 8

**What this does:** Annual compensation = salary plus commission, using IFNULL for NULL commissions.

```sql
SELECT Emp_No, Emp_Name, Salary, Comm, Salary + IFNULL(Comm,0) AS `Annual Compensation` FROM Employee;
```

![Query 8 output](screenshots/q8.png)

## ✅ Conclusion

Single-row functions reshape raw stored values into the exact form needed for reporting.
