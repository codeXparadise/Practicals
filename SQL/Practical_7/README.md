# SQL Practical 7 — Sub-queries

> SQL Lab · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- What a **sub-query** (a query nested inside another query) is and why we need it
- How the **inner query runs first** and hands its result to the **outer query**
- **Single-row sub-queries** compared with `=`, `>`, `<`
- **Multiple-row sub-queries** used with `IN`
- **Correlated sub-queries** that reference the outer query's row
- Using sub-queries inside the `FROM` clause (a **derived table**) and inside `HAVING`
- Choosing between a sub-query and a `JOIN` for the same question

## 🎯 Aim
To solve queries using the concept of sub-queries.

## 🧠 The big idea
A **sub-query** is simply a `SELECT` statement written *inside* another `SELECT` statement. The database solves the **inner** query first, and whatever it produces becomes an input — a value or a list of values — for the **outer** query. It is a way of asking a two-step question in one go: "Who earns more than the average?" is really two questions: (1) what is the average salary? (2) who earns more than that number? A sub-query lets you compute the average in step 1 and feed it straight into step 2.

Think of it like a chain of instructions. If someone asks you, "Bring me the book that Priya recommended," you first ask "Which book did Priya recommend?" and only then fetch that book. The inner question produces the answer you plug into the outer instruction. In SQL, the inner query returns either a **single value** (like one average salary) or a **list of values** (like all names in a city), and the outer query uses it with `=`, `>`, `<` or `IN`.

## 🔍 Deep dive

### What is a sub-query?
A sub-query is a complete `SELECT ... FROM ... WHERE ...` placed inside parentheses `( )` within another query. The parentheses are important — they tell SQL "solve this part first and treat the result as a value". A sub-query almost always appears on the right-hand side of a comparison, or inside `IN`, or in the `FROM` clause.

```sql
SELECT Emp_Name, Salary
FROM Employee
WHERE Salary > ( SELECT AVG(Salary) FROM Employee );
--              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--              this inner query runs first, returns one number
```

### How the inner query runs first
The database evaluates the innermost query, obtains its result, and only then uses that result to run the outer query. So in the example above, `(SELECT AVG(Salary) FROM Employee)` produces something like `2073.21`, and the outer query effectively becomes `WHERE Salary > 2073.21`. This "solve inside-out" mental model will explain every query in this practical.

### Single-row sub-queries
If the inner query returns **exactly one row and one column** (a single value), you can compare it using the usual operators: `=`, `>`, `<`, `>=`, `<=`, `<>`. You are comparing the outer column against that one value.

```sql
-- One value comes back: the Dept_No of SCOTT.
SELECT Emp_Name, Hire_Date
FROM Employee
WHERE Dept_No = ( SELECT Dept_No FROM Employee WHERE Emp_Name = 'SCOTT' );
```

A caution: if the inner query unexpectedly returns *more than one row*, SQL raises an error — you cannot compare one column with several values using `=`. Use `IN` in that case (next section).

### Multiple-row sub-queries and IN
If the inner query can return **many rows**, you must not use `=`. Use `IN`, which checks whether the outer value matches *any* value in the inner list.

```sql
-- The inner query returns many customer names (all in one city).
SELECT *
FROM Deposit
WHERE Cust_Name IN ( SELECT Cust_Name FROM Customer WHERE City = 'Nagpur' );
```

`IN` is the "is it in this list?" test. Other multi-row operators (`ANY`, `ALL`, `EXISTS`) exist, but `IN` is the one you will use most.

### Correlated sub-queries
A normal sub-query is independent — it can be solved on its own. A **correlated** sub-query is different: it refers to a column from the *outer* query, so it cannot run until the outer query supplies a row. In practice it re-runs for each row of the outer query. You will meet these more formally later; for now, remember that a sub-query that mentions the outer table's alias is *correlated*.

```sql
-- For each employee, this compares against a value that depends on
-- the outer row (conceptually re-evaluated per row).
SELECT Emp_Name
FROM Employee e
WHERE Salary > ( SELECT AVG(Salary) FROM Employee WHERE Dept_No = e.Dept_No );
```

### Sub-queries in the FROM clause (derived tables)
A sub-query does not have to live in `WHERE`. It can sit in the `FROM` clause, where it acts like a *temporary table* the outer query selects from. Such a temporary table must be given an alias (here, `t`). This is how you can put a group function's result inside another computation.

```sql
SELECT MAX(cnt)
FROM ( SELECT COUNT(*) AS cnt FROM Branch GROUP BY City ) t;
--   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--   the inner query builds a little table of city-counts, aliased t
```

### Sub-queries in HAVING and in the SELECT list
- In `HAVING`, a sub-query can supply the threshold a group must beat.
- In the `SELECT` list, a scalar sub-query can supply a value shown alongside each row.

```sql
SELECT City
FROM Branch
GROUP BY City
HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Branch GROUP BY City ) t );
```

### Sub-query versus JOIN
Many questions can be answered *either* with a sub-query or with a `JOIN`. A `JOIN` combines tables side by side and is often faster and clearer for "show columns from both tables". A sub-query shines when you need a *value computed from one table* to filter *another table* — like "more than the average" or "in the same city as SUNIL". Both are correct; pick whichever reads more clearly.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Sub-query | A `SELECT` written inside another query, wrapped in parentheses. |
| Inner query | The nested query; it is solved first. |
| Outer query | The main query; it uses the inner query's result. |
| Single-row sub-query | Inner query returning exactly one value; used with `=`, `>`, `<`. |
| Multiple-row sub-query | Inner query returning several values; used with `IN`. |
| `IN` | True if a value matches any value in a list. |
| Correlated sub-query | A sub-query that references a column from the outer query. |
| Derived table | A sub-query used in the `FROM` clause; it must have an alias. |
| Scalar sub-query | A sub-query that returns a single value usable as a column. |
| `DISTINCT` | Removes duplicate rows from the result. |

## 🧾 Query-by-query walkthrough

### Query 1 — Same department as SCOTT
**What it does:** Finds SCOTT's department using an inner query, then lists everyone in that department except SCOTT himself.
```sql
SELECT Emp_Name, Hire_Date FROM Employee WHERE Dept_No = (SELECT Dept_No FROM Employee WHERE Emp_Name = 'SCOTT') AND Emp_Name <> 'SCOTT';
```
![Query 1 output](screenshots/q1.png)

### Query 2 — Depositors in SUNIL's city
**What it does:** The inner query finds the city of SUNIL's branch; the outer query lists the distinct customers who deposited through branches in that same city.
```sql
SELECT DISTINCT d.Cust_Name FROM Deposit d JOIN Branch b ON d.Branch_Name = b.Branch_Name WHERE b.City = (SELECT b2.City FROM Deposit d2 JOIN Branch b2 ON d2.Branch_Name = b2.Branch_Name WHERE d2.Cust_Name = 'SUNIL');
```
![Query 2 output](screenshots/q2.png)

### Query 3 — Deposits by customers in PRAMOD's city
**What it does:** The inner query finds PRAMOD's city, the next query lists customers there, and the outer query shows all deposits made by those customers.
```sql
SELECT * FROM Deposit WHERE Cust_Name IN (SELECT Cust_Name FROM Customer WHERE City = (SELECT City FROM Customer WHERE Cust_Name = 'PRAMOD'));
```
![Query 3 output](screenshots/q3.png)

### Query 4 — Earners above the average
**What it does:** Computes the company-wide average salary in the inner query, then lists employees earning more than it, sorted by salary.
```sql
SELECT Emp_No, Emp_Name, Salary FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) ORDER BY Salary;
```
![Query 4 output](screenshots/q4.png)

### Query 5 — Big deposits by customers in ANIL's city
**What it does:** Finds ANIL's city, finds all customers in that city, then shows deposits over 2000 made by those customers.
```sql
SELECT d.Cust_Name, d.Amount FROM Deposit d WHERE d.Cust_Name IN (SELECT Cust_Name FROM Customer WHERE City = (SELECT City FROM Customer WHERE Cust_Name = 'ANIL')) AND d.Amount > 2000;
```
![Query 5 output](screenshots/q5.png)

### Query 6 — Employees managed by FORD
**What it does:** The inner query finds FORD's employee number, and the outer query lists everyone whose manager (`Mgr`) is that number.
```sql
SELECT Emp_Name, Salary FROM Employee WHERE Mgr = (SELECT Emp_No FROM Employee WHERE Emp_Name = 'FORD');
```
![Query 6 output](screenshots/q6.png)

### Query 7 — Everyone in the ACCOUNTING department
**What it does:** The inner query translates the department *name* ACCOUNTING into its department *number*; the outer query lists that department's employees.
```sql
SELECT e.Dept_No, e.Emp_Name, e.Job FROM Employee e WHERE e.Dept_No = (SELECT Dept_No FROM Department WHERE Dept_Name = 'ACCOUNTING');
```
![Query 7 output](screenshots/q7.png)

### Query 8 — Branch with the most deposits
**What it does:** Groups deposits by branch, orders by the count of deposits descending, and keeps only the top branch.
```sql
SELECT Branch_Name FROM Deposit GROUP BY Branch_Name ORDER BY COUNT(*) DESC LIMIT 1;
```
![Query 8 output](screenshots/q8.png)

### Query 9 — Cities that hold the most branches
**What it does:** The derived table `t` counts branches per city; the outer query keeps only those cities whose count equals the maximum of those counts.
```sql
SELECT City FROM Branch GROUP BY City HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Branch GROUP BY City) t);
```
![Query 9 output](screenshots/q9.png)

### Query 10 — City with the most deposits
**What it does:** The inner query finds the city with the highest deposit count; the outer query lists customers who live in that city.
```sql
SELECT Cust_Name FROM Customer WHERE City = (SELECT b.City FROM Deposit d JOIN Branch b ON d.Branch_Name = b.Branch_Name GROUP BY b.City ORDER BY COUNT(*) DESC LIMIT 1);
```
![Query 10 output](screenshots/q10.png)

## ⚠️ Common mistakes
- **Using `=` when the inner query returns many rows.** `=` needs exactly one value; use `IN` for a list, or you get an error.
- **Forgetting the parentheses.** The inner query must be wrapped in `( )`, otherwise SQL cannot tell where it ends.
- **No alias on a derived table.** A sub-query in `FROM` must be given a name (`... ) t`), or the query fails.
- **Assuming the sub-query runs once.** A correlated sub-query re-runs per outer row, so it can be slower.
- **Nesting so deeply it becomes unreadable.** Build it inside-out: write and test the inner query first, then wrap it.
- **Confusing "same city as X" with "same person as X".** Check whether you want the *value* (a city) or the *identity* (a name).

## ✅ Key takeaways
- A sub-query is a `SELECT` inside another query; the **inner query runs first** and feeds the outer one.
- A **single-row** sub-query is compared with `=`, `>`, `<`; a **multiple-row** sub-query is used with `IN`.
- A **correlated** sub-query references the outer query and is evaluated per outer row.
- Sub-queries can live in `WHERE`, `HAVING`, the `SELECT` list, or the `FROM` clause (as a **derived table** needing an alias).
- Sub-queries are perfect for "more than the average", "in the same city as", and "the maximum of a count" style questions.
- When a `JOIN` reads more clearly, prefer the `JOIN`; use a sub-query when you need a computed value to filter by.

## 🏋️ Try it yourself
1. List the names of employees who work in the same department as 'ALLEN'.
2. Show all deposits whose amount is greater than the average deposit amount.
3. Find the branch name that appears most often in the `Borrow` table, using a sub-query.
