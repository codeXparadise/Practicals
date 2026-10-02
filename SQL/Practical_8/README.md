# SQL Practical 8 — Manipulating Data (UPDATE & DELETE)

> SQL Lab · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- Changing existing values in a table with the `UPDATE ... SET` statement.
- Removing whole rows from a table with the `DELETE FROM` statement.
- How the `WHERE` clause decides *exactly which rows* are affected.
- Using **sub-queries** inside `WHERE` to pick rows dynamically.
- Using **`CASE`** to give different rows different new values in one statement.
- Updating rows using a **JOIN** (matching a table against a summary of itself).

## 🎯 Aim
To manipulate data using `UPDATE` and `DELETE` statements with conditions and sub-queries.

## 🧠 The big idea
So far you have mostly *asked* the database questions (`SELECT`). This practical is about the opposite: *changing* the data that is already sitting in the tables. `UPDATE` edits values inside rows that already exist, and `DELETE` throws whole rows away. Nothing new is added — you are reshaping what is already there.

Think of the tables like a school attendance register. `SELECT` is *reading* the register. `UPDATE` is taking an eraser and correcting a mark — you find the right student's line and change the number. `DELETE` is striking out a whole line because that student left. The key question in both cases is: **which lines am I touching?** That question is answered by the `WHERE` clause. If you forget `WHERE`, you don't correct one student — you rub out the marks of the *entire class*. That is why this practical spends so much time on conditions and sub-queries: they are your steering wheel.

## 🔍 Deep dive

### UPDATE — changing values that already exist
The basic shape of an `UPDATE` is:

```sql
UPDATE table_name
SET column_name = new_value
WHERE condition;
```

Read it as a sentence: *"In this table, set this column to this value, but only for rows that match this condition."* The `SET` part is what changes; the `WHERE` part is *who* it changes. For example, giving every employee a flat ₹1000 raise:

```sql
UPDATE Employee SET Salary = Salary + 1000;
```

Notice the new value can be computed from the old value (`Salary + 1000`, `Amount * 1.10`). SQL reads the current value, calculates the new one, and writes it back.

### The WHERE clause decides everything
`WHERE` is the *selector*. It tests each row and keeps only the ones that pass. So:

```sql
UPDATE Deposit SET Amount = Amount * 1.10 WHERE Branch_Name = 'VRCE';
```

means "multiply the amount by 1.10 **only** for deposits in the VRCE branch." Every other branch is untouched. Remove the `WHERE` and the same line would multiply **every** deposit in the table. The rule to memorise: **no `WHERE` = whole table changes.**

### Sub-queries inside WHERE — deciding rows dynamically
Sometimes you don't know the exact value to filter on; you only know it *lives in another table*. Then you nest a query inside the condition:

```sql
... WHERE Branch_Name IN (SELECT Branch_Name FROM Branch WHERE City = 'Bombay')
```

The inner `SELECT` runs first, produces a list of branch names (e.g. `VRCE`, `ANDHERI`), and the outer `UPDATE` treats that list like a hand-written set: "change rows whose branch is in this list." `IN` is the natural partner for sub-queries because a sub-query can return *many* values. You can also join two such conditions with `AND`, so a row must satisfy both lists.

### CASE inside SET — many different new values in one pass
A normal `SET` gives every matched row the *same* new value. `CASE` breaks that: it lets you give *different* rows *different* values in a single statement.

```sql
SET Amount = CASE
    WHEN Cust_Name = 'ANIL' THEN Amount - 10
    WHEN Cust_Name = 'SUNIL' THEN Amount + 10
    ELSE Amount
END
```

`CASE` works like a small if/else chain, evaluated **row by row**. For an ANIL row, subtract 10; for a SUNIL row, add 10; for anyone else, keep the amount unchanged (`ELSE Amount`). The `ELSE` is your safety net — without it, unmatched rows would become `NULL`. Always end a `CASE` with the keyword `END`.

### JOIN-based UPDATE — matching a table to a summary of itself
Sometimes the new value depends on an aggregate (like the *maximum* amount per branch). You cannot easily put an aggregate directly in `SET`, so you build a small summary table with a sub-query, give it an alias, and **join** it to the main table:

```sql
UPDATE Deposit d
JOIN (SELECT Branch_Name, MAX(Amount) AS mx
      FROM Deposit GROUP BY Branch_Name) m
  ON d.Branch_Name = m.Branch_Name AND d.Amount = m.mx
SET d.Amount = d.Amount + 100;
```

The inner query (`m`) lists each branch and its biggest amount. The `ON` line says "match a row in `d` to its branch's summary **and** only when this row *is* that maximum." So only the top deposit in each branch gets the extra 100. This "self-summary join" is a very common real-world pattern. (This `UPDATE ... JOIN` syntax is MySQL-style; other databases write it as `UPDATE ... SET ... FROM ...`.)

### DELETE FROM — removing whole rows
`DELETE` removes entire rows, not single values:

```sql
DELETE FROM Deposit WHERE Cust_Name = 'VIJAY';
```

This erases *every column* of every row where the customer is VIJAY — the row simply stops existing. The same `WHERE` logic applies: conditions and sub-queries choose the victims, and **no `WHERE` empties the whole table.** You can build the condition from an aggregate too:

```sql
DELETE FROM Borrow
WHERE Branch_Name IN (
    SELECT Branch_Name FROM Borrow GROUP BY Branch_Name HAVING AVG(Amount) < 1000
);
```

Here the inner query finds branches whose *average* loan is below 1000, and the outer `DELETE` removes all loans in those branches.

### Why a careful WHERE clause matters
`UPDATE` and `DELETE` change the database *permanently* — there is no undo button in plain SQL. A single missing or mistyped condition can silently rewrite or wipe thousands of rows, and the query will still report "success." Professional habits:
- Always write the `WHERE` **first**, then the `SET`.
- Before running a `DELETE`, run the same condition as a `SELECT` to see exactly which rows you are about to hit.
- Prefer precise conditions (`IN (sub-query)`) over vague ones.
- On real systems, wrap changes in a **transaction** so you can `ROLLBACK` if something looks wrong.

## 📖 Key terms

| Term | Meaning |
| :--- | :--- |
| `UPDATE` | Statement that changes the values inside existing rows. |
| `SET` | The part of `UPDATE` that names the column(s) and their new value(s). |
| `DELETE` | Statement that removes whole rows from a table. |
| `WHERE` | Condition that selects which rows an `UPDATE`/`DELETE` affects. |
| Sub-query | A `SELECT` written inside another statement; it runs first and feeds its result outward. |
| Derived table (alias) | A sub-query wrapped in brackets and given a short name (`... ) t`) so it can be treated like a table. |
| `CASE ... WHEN ... THEN ... ELSE ... END` | Row-by-row if/else that lets `SET` give different rows different values. |
| `JOIN` (in UPDATE) | Matching the table being changed against another table (often a summary of itself) to decide the change. |
| Aggregate | A summary value such as `MAX`, `COUNT`, or `AVG`, computed over a group of rows. |
| `HAVING` | Filter applied *after* grouping, used with `GROUP BY` to keep only some groups. |
| Transaction | A group of changes that can be committed or rolled back as one unit. |

## 🧾 Query-by-query walkthrough

### Query 1 — Give every deposit a 10% raise
**What it does:** Multiplies `Amount` by 1.10 for **every** row in `Deposit`. There is no `WHERE`, so the whole table changes.
```sql
UPDATE Deposit SET Amount = Amount * 1.10;
```
![Query 1 output](screenshots/q1.png)

### Query 2 — Show the updated table
**What it does:** Displays all columns and rows of `Deposit` so you can see the effect of Query 1.
```sql
SELECT * FROM Deposit;
```
![Query 2 output](screenshots/q2.png)

### Query 3 — 10% raise for one branch only
**What it does:** Same multiplication as Query 1, but the `WHERE` limits it to the `'VRCE'` branch. Other branches keep their (already raised) values from Query 1.
```sql
UPDATE Deposit SET Amount = Amount * 1.10 WHERE Branch_Name = 'VRCE';
```
![Query 3 output](screenshots/q3.png)

### Query 4 — Raise deposits using two sub-query conditions
**What it does:** Raises the amount only for deposits whose customer lives in `'Nagpur'` **and** whose branch is in `'Bombay'`. Both filters come from other tables via sub-queries.
```sql
UPDATE Deposit SET Amount = Amount * 1.10 WHERE Cust_Name IN (SELECT Cust_Name FROM Customer WHERE City = 'Nagpur') AND Branch_Name IN (SELECT Branch_Name FROM Branch WHERE City = 'Bombay');
```
![Query 4 output](screenshots/q4.png)

### Query 5 — Copy one employee's Dept_No to another's job group
**What it does:** Sets `Dept_No` to the department of employee 7844, but only for employees whose `Job` matches employee 7788's job. The sub-queries are wrapped in derived tables (`t`, `t2`) so the table being updated can also be read safely.
```sql
UPDATE Employee SET Dept_No = (SELECT Dept_No FROM (SELECT Dept_No FROM Employee WHERE Emp_No = 7844) t) WHERE Job = (SELECT Job FROM (SELECT Job FROM Employee WHERE Emp_No = 7788) t2);
```
![Query 5 output](screenshots/q5.png)

### Query 6 — Different changes for ANIL and SUNIL using CASE
**What it does:** In branches shared by ANIL and SUNIL, subtracts 10 from ANIL's deposits and adds 10 to SUNIL's — in a single statement — while leaving all other customers unchanged.
```sql
UPDATE Deposit SET Amount = CASE WHEN Cust_Name = 'ANIL' THEN Amount - 10 WHEN Cust_Name = 'SUNIL' THEN Amount + 10 ELSE Amount END WHERE Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Deposit WHERE Cust_Name = 'ANIL') t) AND Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Deposit WHERE Cust_Name = 'SUNIL') t2);
```
![Query 6 output](screenshots/q6.png)

### Query 7 — Add 100 to the largest deposit in each branch
**What it does:** Joins `Deposit` to a per-branch summary of its maximum amount, and bumps the amount by 100 only for rows that are that maximum.
```sql
UPDATE Deposit d JOIN (SELECT Branch_Name, MAX(Amount) AS mx FROM Deposit GROUP BY Branch_Name) m ON d.Branch_Name = m.Branch_Name AND d.Amount = m.mx SET d.Amount = d.Amount + 100;
```
![Query 7 output](screenshots/q7.png)

### Query 8 — Delete deposits from small branches
**What it does:** Removes every deposit belonging to branches that hold between 1 and 3 deposits (found via a `GROUP BY ... HAVING COUNT(*)` sub-query).
```sql
DELETE FROM Deposit WHERE Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Deposit GROUP BY Branch_Name HAVING COUNT(*) BETWEEN 1 AND 3) t);
```
![Query 8 output](screenshots/q8.png)

### Query 9 — Delete one customer's deposits
**What it does:** Removes all `Deposit` rows belonging to customer `'VIJAY'`.
```sql
DELETE FROM Deposit WHERE Cust_Name = 'VIJAY';
```
![Query 9 output](screenshots/q9.png)

### Query 10 — Delete loans from low-average branches
**What it does:** Removes all `Borrow` rows whose branch has an average loan amount below 1000.
```sql
DELETE FROM Borrow WHERE Branch_Name IN (SELECT Branch_Name FROM (SELECT Branch_Name FROM Borrow GROUP BY Branch_Name HAVING AVG(Amount) < 1000) t);
```
![Query 10 output](screenshots/q10.png)

### Query 11 — Show what is left in Borrow
**What it does:** Displays all remaining rows of `Borrow` after Query 10's deletions.
```sql
SELECT * FROM Borrow;
```
![Query 11 output](screenshots/q11.png)

## ⚠️ Common mistakes
- **Forgetting the `WHERE` clause.** This is the classic disaster — `UPDATE ... SET` or `DELETE FROM ...` with no condition hits *every* row.
- **Writing `DELETE *` or `DELETE column`.** The correct form is `DELETE FROM table WHERE ...`; you delete whole rows, never a single column.
- **Mismatching the sub-query result.** A sub-query used with `IN` must return one column of the same type you are comparing against.
- **Forgetting `ELSE` in a `CASE`.** Rows that match no `WHEN` become `NULL` instead of keeping their old value.
- **Updating a table while reading it in a plain sub-query.** MySQL refuses this; wrap the inner `SELECT` in a derived table (`... ) t`) as Queries 5, 6, 8 and 10 do.
- **Confusing `WHERE` with `HAVING`.** `WHERE` filters individual rows; `HAVING` filters groups after `GROUP BY`.

## ✅ Key takeaways
- `UPDATE` edits values in existing rows; `DELETE` removes whole rows — neither adds new data.
- The `WHERE` clause is the steering wheel: it decides exactly which rows are touched, and omitting it affects the entire table.
- Sub-queries inside `WHERE` let conditions depend on other tables or on summaries of the same table.
- `CASE` inside `SET` gives different rows different new values in one statement; always close with `ELSE ... END`.
- A JOIN-based `UPDATE` matches rows to an aggregate summary — the standard way to update "the top row per group."
- Because changes are permanent, preview your condition with a `SELECT` before you run any `UPDATE` or `DELETE`.

## 🏋️ Try it yourself
1. Write an `UPDATE` that gives every `Employee` in department 20 a 5% salary increase, and preview which rows it will change with a `SELECT` first.
2. Using `CASE`, raise `Salary` by 2000 for `'MANAGER'`s and by 1000 for `'CLERK'`s in a single statement.
3. Delete all `Deposit` rows whose `Amount` is below the average `Amount` of the whole `Deposit` table (use a sub-query in `WHERE`).
4. Update each branch's deposits so that the smallest deposit in every branch gets an extra 50, using a JOIN against a per-branch `MIN(Amount)` summary.
5. Delete every `Borrow` row for customers who live in a city that appears in `Customer` but not in `Branch`, using two sub-queries.
