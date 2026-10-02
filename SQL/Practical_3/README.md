# SQL Practical 3 — DML, Aggregate Functions & Sorting

> SQL Lab · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- **DML commands** — `UPDATE` and `DELETE`, which change the *rows* inside a table (unlike `CREATE`/`ALTER`, which change the table itself).
- The **five aggregate functions** — `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` — that turn many rows into a single summary number.
- **`GROUP BY`** — how to run an aggregate *per department* instead of for the whole table.
- **`HAVING` vs `WHERE`** — the single most confusing pair of clauses in beginner SQL, explained clearly.
- **Sorting with `ORDER BY`** — arranging output in `ASC` (ascending) or `DESC` (descending) order.
- **`LIMIT`** — showing only the top few rows, e.g. the top 3 highest-paid employees.
- Reading and writing against the two lab tables: **`Book`** and **`Employee`**.

## 🎯 Aim
To perform DML commands, aggregate functions and sorting concepts on the created tables.

## 🧠 The big idea
So far you have built tables and filled them with rows. This practical is about **working on the data that is already inside** those tables — three ideas, in plain words:

1. **DML (Data Manipulation Language)** = the commands that *change the content* of a table without changing its structure. If a table were a school register, DML is the teacher correcting a wrong mark (`UPDATE`) or striking out a student who left (`DELETE`). The columns stay exactly the same; only the rows change.
2. **Aggregate functions** = the "calculator" functions. Normally SQL gives you back *rows*. An aggregate squashes a whole column of numbers into **one single value**: how many rows (`COUNT`), their total (`SUM`), their average (`AVG`), the biggest (`MAX`), the smallest (`MIN`).
3. **Sorting** = putting the answer in a sensible order, so a human can actually read it — cheapest book first, richest employee first, names A→Z.

A good analogy: imagine a bag of grocery bills. `UPDATE` is crossing out a wrong price and writing the right one. `DELETE` is throwing one bill away. `COUNT` is "how many bills in the bag?", `SUM` is "what's the grand total?", `AVG` is "what's the average bill?". `GROUP BY` is sorting the bills into separate piles — one pile per shop — and then asking those questions **per pile**. `ORDER BY` is finally arranging the answer on the table from smallest to largest.

## 🔍 Deep dive

### 1. DML — `UPDATE` and `DELETE`
`UPDATE` changes existing values. You **must** use a `WHERE` clause, otherwise you update *every* row in the table.

```sql
UPDATE Book
SET Price = 580
WHERE Book_ID = 103;
```
Read it as: "In the `Book` table, set `Price` to 580, but only on the row whose `Book_ID` is 103."

`DELETE` removes whole rows (not single cells). Again, always use `WHERE`:

```sql
DELETE FROM Book
WHERE Book_ID = 105;
```
Read it as: "From `Book`, remove the row whose `Book_ID` is 105."

> ⚠️ `DELETE FROM Book;` (no `WHERE`) wipes the entire table. There is no undo button — always check your `WHERE` first.

### 2. The five aggregate functions
An aggregate takes a column and returns **one number**.

| Function | Question it answers | Example |
| :--- | :--- | :--- |
| `COUNT(*)` | How many rows? | `SELECT COUNT(*) FROM Employee;` → 8 |
| `SUM(col)` | What is the total? | `SELECT SUM(Emp_Salary) FROM Employee;` → 350000 |
| `AVG(col)` | What is the average? | `SELECT AVG(Emp_Salary) FROM Employee;` → 43750 |
| `MAX(col)` | What is the largest value? | `SELECT MAX(Emp_Salary) FROM Employee;` → 60000 |
| `MIN(col)` | What is the smallest value? | `SELECT MIN(Emp_Salary) FROM Employee;` → 25000 |

Two things students must remember:
- `COUNT(*)` counts **rows** (use the star). `COUNT(column)` counts only rows where that column is **not NULL**.
- `SUM` and `AVG` work on **numbers only**. `AVG` ignores NULLs in its calculation, which can surprise you.

Using `AS` gives the output column a friendly name: `SELECT AVG(Emp_Salary) AS Average_Salary FROM Employee;`.

### 3. `GROUP BY` — aggregates per category
A plain `SELECT Dept_No, COUNT(*) FROM Employee;` is wrong: `COUNT(*)` returns one number, but `Dept_No` has many values — SQL would not know which `Dept_No` to print.

`GROUP BY` fixes this by splitting the rows into groups first, then applying the aggregate **inside each group**:

```sql
SELECT Dept_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_No;
```
Read it as: "Make one pile per `Dept_No`; for each pile, count the rows." You get one output row **per department**.

**Golden rule:** every column in the `SELECT` list that is *not* inside an aggregate must appear in `GROUP BY`. Here `Dept_No` is in `SELECT`, so it must be in `GROUP BY` — and it is.

### 4. `HAVING` vs `WHERE`
This is the classic exam question. The difference is **when** each filter runs:

- `WHERE` filters **rows before grouping**.
- `HAVING` filters **groups after grouping**.

You cannot write `WHERE COUNT(*) > 2` — at the moment `WHERE` runs, the groups do not exist yet. So when you want to filter on the *result of an aggregate*, you use `HAVING`:

```sql
SELECT Dept_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_No
HAVING COUNT(*) > 2;
```
Read it as: "Group by department, then keep only those groups having more than 2 employees."

Mental model: **`WHERE` = pick rows, `HAVING` = pick groups.** You can use both in one query — `WHERE` first, then `GROUP BY`, then `HAVING`.

### 5. Sorting with `ORDER BY`
`ORDER BY` sorts the output. It is the **last** clause (before `LIMIT`).

- `ASC` = ascending (small → large, A → Z). This is the **default**, so `ORDER BY Price` and `ORDER BY Price ASC` mean the same thing.
- `DESC` = descending (large → small, Z → A).

```sql
SELECT * FROM Book ORDER BY Price ASC;    -- cheapest first
SELECT * FROM Book ORDER BY Quantity DESC; -- most copies first
SELECT * FROM Employee ORDER BY Emp_Name ASC; -- A to Z by name
```

You can sort by a column that is **not** in the `SELECT` list, and by more than one column: `ORDER BY Dept_No ASC, Emp_Salary DESC` sorts by department first, then by salary inside each department.

### 6. `LIMIT` — show only the top few
`LIMIT n` keeps only the first `n` rows of the result. Combined with `ORDER BY DESC`, it gives the **top-n**:

```sql
SELECT * FROM Employee
ORDER BY Emp_Salary DESC
LIMIT 3;
```
Read it as: "Sort everyone from richest to poorest, then show only the first 3." This is the standard way to answer "top 3" questions.

### 7. The two tables used in this lab
- **`Book(Book_ID`** PK`, Book_Title, Author_Name, Category, Price, Quantity, Publisher)`
- **`Employee(Emp_No`** PK`, Emp_Name, Emp_Salary, Dept_No)`

`PK` = Primary Key, a column that uniquely identifies each row.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| DML | Data Manipulation Language — commands (`INSERT`, `UPDATE`, `DELETE`) that change the *data* in a table, not its structure. |
| `UPDATE` | Changes existing values in one or more rows; always use `WHERE`. |
| `DELETE` | Removes whole rows from a table; always use `WHERE`. |
| Aggregate function | A function that reduces many rows to a single summary value (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`). |
| `COUNT(*)` | Counts the number of rows. |
| `SUM` / `AVG` | Total / average of a numeric column. |
| `MAX` / `MIN` | Largest / smallest value in a column. |
| `GROUP BY` | Splits rows into groups (e.g. per department) before applying an aggregate. |
| `WHERE` | Filters individual rows *before* grouping. |
| `HAVING` | Filters groups *after* grouping; used with aggregates. |
| `ORDER BY` | Sorts the result set; `ASC` (default) or `DESC`. |
| `LIMIT` | Restricts the output to the first *n* rows. |
| `AS` | Gives a column (or result) an alias / friendly name. |
| Primary Key (PK) | A column whose value uniquely identifies each row. |
| NULL | A missing / unknown value; ignored by `SUM` and `AVG`. |

## 🧾 Query-by-query walkthrough

### Query 1 — Show all books
**What it does:** Displays every column of every row in the `Book` table. This is our starting snapshot.
```sql
SELECT * FROM Book;
```
![Query 1 output](screenshots/q1.png)

### Query 2 — Raise one book's price
**What it does:** Uses `UPDATE` to set the price of the book with `Book_ID = 103` to 580. Only that one row changes.
```sql
UPDATE Book SET Price = 580 WHERE Book_ID = 103;
```
![Query 2 output](screenshots/q2.png)

### Query 3 — Verify the update
**What it does:** Selects all books again so you can *see* that Book 103's price is now 580 and nothing else changed.
```sql
SELECT * FROM Book;
```
![Query 3 output](screenshots/q3.png)

### Query 4 — Delete one book
**What it does:** Uses `DELETE` to remove the entire row of the book with `Book_ID = 105`.
```sql
DELETE FROM Book WHERE Book_ID = 105;
```
![Query 4 output](screenshots/q4.png)

### Query 5 — Verify the delete
**What it does:** Shows the `Book` table once more; Book 105 is now gone, so the table has one fewer row.
```sql
SELECT * FROM Book;
```
![Query 5 output](screenshots/q5.png)

### Query 6 — Show only two columns
**What it does:** Uses a column list instead of `*` to display just the title and author of every book.
```sql
SELECT Book_Title, Author_Name FROM Book;
```
![Query 6 output](screenshots/q6.png)

### Query 7 — Filter expensive books
**What it does:** Uses `WHERE` to show only books priced above 600.
```sql
SELECT * FROM Book WHERE Price > 600;
```
![Query 7 output](screenshots/q7.png)

### Query 8 — Books cheapest first
**What it does:** `ORDER BY Price ASC` sorts the books from the lowest price to the highest.
```sql
SELECT * FROM Book ORDER BY Price ASC;
```
![Query 8 output](screenshots/q8.png)

### Query 9 — Books by most stock
**What it does:** `ORDER BY Quantity DESC` puts the books with the highest quantity in stock at the top.
```sql
SELECT * FROM Book ORDER BY Quantity DESC;
```
![Query 9 output](screenshots/q9.png)

### Query 10 — Show all employees
**What it does:** Displays the full `Employee` table — our base data for all the aggregate queries that follow.
```sql
SELECT * FROM Employee;
```
![Query 10 output](screenshots/q10.png)

### Query 11 — Count the employees
**What it does:** `COUNT(*)` returns the total number of rows in `Employee`, labelled `Total_Employees`.
```sql
SELECT COUNT(*) AS Total_Employees FROM Employee;
```
![Query 11 output](screenshots/q11.png)

### Query 12 — Highest salary
**What it does:** `MAX(Emp_Salary)` returns the largest salary in the table.
```sql
SELECT MAX(Emp_Salary) AS Highest_Salary FROM Employee;
```
![Query 12 output](screenshots/q12.png)

### Query 13 — Lowest salary
**What it does:** `MIN(Emp_Salary)` returns the smallest salary in the table.
```sql
SELECT MIN(Emp_Salary) AS Lowest_Salary FROM Employee;
```
![Query 13 output](screenshots/q13.png)

### Query 14 — Average salary
**What it does:** `AVG(Emp_Salary)` returns the mean salary of all employees.
```sql
SELECT AVG(Emp_Salary) AS Average_Salary FROM Employee;
```
![Query 14 output](screenshots/q14.png)

### Query 15 — Total salary bill
**What it does:** `SUM(Emp_Salary)` adds up every salary to give the company's total salary cost.
```sql
SELECT SUM(Emp_Salary) AS Total_Salary FROM Employee;
```
![Query 15 output](screenshots/q15.png)

### Query 16 — Employees per department
**What it does:** Groups by `Dept_No` and counts the rows in each group, giving a headcount per department.
```sql
SELECT Dept_No, COUNT(*) AS Employee_Count FROM Employee GROUP BY Dept_No;
```
![Query 16 output](screenshots/q16.png)

### Query 17 — Salary total per department
**What it does:** Groups by department and sums the salaries, showing each department's total salary bill.
```sql
SELECT Dept_No, SUM(Emp_Salary) AS Total_Salary FROM Employee GROUP BY Dept_No;
```
![Query 17 output](screenshots/q17.png)

### Query 18 — Average salary per department
**What it does:** Groups by department and averages the salaries, showing the mean pay in each department.
```sql
SELECT Dept_No, AVG(Emp_Salary) AS Average_Salary FROM Employee GROUP BY Dept_No;
```
![Query 18 output](screenshots/q18.png)

### Query 19 — Highest salary per department
**What it does:** Groups by department and shows the maximum salary within each department.
```sql
SELECT Dept_No, MAX(Emp_Salary) AS Highest_Salary FROM Employee GROUP BY Dept_No;
```
![Query 19 output](screenshots/q19.png)

### Query 20 — Lowest salary per department
**What it does:** Groups by department and shows the minimum salary within each department.
```sql
SELECT Dept_No, MIN(Emp_Salary) AS Lowest_Salary FROM Employee GROUP BY Dept_No;
```
![Query 20 output](screenshots/q20.png)

### Query 21 — Departments with more than 2 employees
**What it does:** Groups by department, then `HAVING COUNT(*) > 2` keeps only the groups that have more than two employees.
```sql
SELECT Dept_No, COUNT(*) AS Employee_Count FROM Employee GROUP BY Dept_No HAVING COUNT(*) > 2;
```
![Query 21 output](screenshots/q21.png)

### Query 22 — Departments paying above 40000 on average
**What it does:** Groups by department and uses `HAVING AVG(Emp_Salary) > 40000` to keep only departments whose average salary exceeds 40000.
```sql
SELECT Dept_No, AVG(Emp_Salary) AS Average_Salary FROM Employee GROUP BY Dept_No HAVING AVG(Emp_Salary) > 40000;
```
![Query 22 output](screenshots/q22.png)

### Query 23 — Employees lowest salary first
**What it does:** Sorts the whole `Employee` table by salary ascending — the lowest earner appears first.
```sql
SELECT * FROM Employee ORDER BY Emp_Salary ASC;
```
![Query 23 output](screenshots/q23.png)

### Query 24 — Employees highest salary first
**What it does:** Sorts the table by salary descending — the highest earner appears first.
```sql
SELECT * FROM Employee ORDER BY Emp_Salary DESC;
```
![Query 24 output](screenshots/q24.png)

### Query 25 — Employees sorted by name
**What it does:** Sorts the employees alphabetically by `Emp_Name`, A to Z.
```sql
SELECT * FROM Employee ORDER BY Emp_Name ASC;
```
![Query 25 output](screenshots/q25.png)

### Query 26 — Employees sorted by department
**What it does:** Sorts the employees by `Dept_No` ascending, so each department's staff sit together.
```sql
SELECT * FROM Employee ORDER BY Dept_No ASC;
```
![Query 26 output](screenshots/q26.png)

### Query 27 — Name and salary, richest first
**What it does:** Shows only two columns — name and salary — sorted from highest salary to lowest.
```sql
SELECT Emp_Name, Emp_Salary FROM Employee ORDER BY Emp_Salary DESC;
```
![Query 27 output](screenshots/q27.png)

### Query 28 — Well-paid staff, lowest first
**What it does:** `WHERE` keeps only employees earning above 35000, then `ORDER BY ... ASC` lists them from the lowest of that group upward.
```sql
SELECT * FROM Employee WHERE Emp_Salary > 35000 ORDER BY Emp_Salary ASC;
```
![Query 28 output](screenshots/q28.png)

### Query 29 — Top 3 earners
**What it does:** Sorts by salary descending and `LIMIT 3` keeps only the first three rows — the three highest-paid employees.
```sql
SELECT * FROM Employee ORDER BY Emp_Salary DESC LIMIT 3;
```
![Query 29 output](screenshots/q29.png)

## ⚠️ Common mistakes
- **Forgetting `WHERE` in `UPDATE`/`DELETE`.** Without it, *every* row is changed or removed. Always write and re-check the `WHERE` first.
- **Confusing `WHERE` and `HAVING`.** You cannot filter an aggregate with `WHERE` (`WHERE COUNT(*) > 2` fails). Use `HAVING` for aggregates and `WHERE` for plain row conditions.
- **Selecting a non-grouped column.** Every column in `SELECT` that is not inside an aggregate must be listed in `GROUP BY`, otherwise the query errors.
- **Assuming `ORDER BY` is required.** Without it, SQL may return rows in any order — if order matters, say so explicitly.
- **Mixing up `ASC` and `DESC`.** `ASC` is smallest-first and is the default; "top 3" needs `DESC` (plus `LIMIT 3`).
- **Thinking `COUNT(column)` = `COUNT(*)`.** `COUNT(*)` counts rows; `COUNT(column)` skips rows where that column is `NULL`.

## ✅ Key takeaways
- **DML changes data, not structure:** `UPDATE` edits rows, `DELETE` removes rows — and `WHERE` is your safety belt.
- **Aggregates collapse many rows into one number:** `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`.
- **`GROUP BY` = aggregates per category;** one output row per group, and non-aggregated columns must be in `GROUP BY`.
- **`WHERE` filters rows before grouping; `HAVING` filters groups after grouping** — this is the order SQL actually runs them in.
- **`ORDER BY` sorts the result** (`ASC` default, `DESC` for largest-first) and is written last.
- **`ORDER BY ... DESC LIMIT n` is the standard "top n" pattern.**

## 🏋️ Try it yourself
1. Increase the `Price` of every book in the `'Fiction'` category by 10% using a single `UPDATE` with a `WHERE Category = 'Fiction'`.
2. Count how many books have a `Price` greater than 500.
3. Find the average `Price` of books **per `Category`** using `GROUP BY`, then show only the categories whose average price is above 400 (hint: `HAVING`).
4. List all employees whose `Emp_Name` starts with a given letter, sorted alphabetically.
5. Show the **top 2 highest-paid employees in each department** (hint: combine `ORDER BY Dept_No, Emp_Salary DESC` with `LIMIT` and think about how grouping affects the result).
6. Delete all employees earning below 26000 in one `DELETE` statement, then verify with a `SELECT COUNT(*)`.
