# SQL Practical 9 — LIKE Predicate

> SQL Lab · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- The `LIKE` predicate for matching text against a **pattern**, not an exact value.
- The `%` wildcard — stands for *any number of characters* (including zero).
- The `_` wildcard — stands for *exactly one character*.
- Building patterns: starts-with, ends-with, fixed length, "character in a given position".
- Combining `LIKE` with `IS NULL` / `IS NOT NULL` for extra filtering.
- The `ESCAPE` clause, which lets you search for a *literal* `%` or `_`.

## 🎯 Aim
To study the various options of the `LIKE` predicate in SQL.

## 🧠 The big idea
An `=` sign is strict: `Emp_Name = 'ANIL'` matches only the exact word ANIL. But real questions are often fuzzy — "show me all names *starting with* A", "all four-letter names", "names whose second letter is n". `LIKE` is the tool for that. Instead of one fixed value, you give it a **pattern** built from ordinary letters plus two special symbols (wildcards) that stand for "something here."

Think of `LIKE` like a search box that understands mystery letters. If you write a pattern such as `'A_a%'`, you are saying: *"first letter A, then any single character, then a, then anything at all."* The database walks through each name and asks "do you fit this shape?" Names that fit come back; the rest are ignored. Once you understand that `%` means *many* characters and `_` means *one* character, you can describe almost any text shape you can imagine.

## 🔍 Deep dive

### The LIKE predicate — matching a shape, not a word
`LIKE` is used in a `WHERE` clause just like `=`, but its right-hand side is a **pattern**:

```sql
SELECT * FROM Employee WHERE Emp_Name LIKE 'A%';
```

This returns every employee whose name *begins* with A. The pattern is written inside single quotes. `LIKE` is case-sensitivity depends on the database (in MySQL it is usually case-insensitive for standard collations), but the logic is the same.

### The `%` wildcard — any number of characters
`%` matches **zero or more** characters. It is the "anything here" symbol:

- `'A%'` → starts with A (`Anil`, `Anita`, `A`).
- `'%a'` → ends with a (`Rita`, `Sonia`, `a`).
- `'%an%'` → contains `an` anywhere (`Anand`, `Vijay Anand`, `Sundar`).
- `'%'` alone → matches every non-`NULL` string.

Because `%` can match *zero* characters, `'A%'` also matches a name that is just the single letter `A`.

### The `_` wildcard — exactly one character
`_` matches **exactly one** character — no more, no less. This is how you control *length* and *position*:

- `'Ani__'` → `Ani` followed by exactly two characters → `Anita`, `Anil` is only 4 letters so it fails; `Anita` (5) fits, `Aniket` (6) fails.
- `'_n___'` → exactly 5 letters, second letter is `n` → `Anita`, `Anand`, `Uncle` — anything shaped `_n___`.

So `%` is the loose "anything, any length" and `_` is the precise "one slot."

### Building patterns — mixing wildcards and letters
You build a pattern the way you describe a shape out loud. Reading `'A_a%'` left to right:

- `A` — a literal capital A
- `_` — any single character
- `a` — a literal lowercase a
- `%` — anything after that

So the name must *start* with A, have *some* character second, then an `a` third, then anything. Examples that fit: `Aya` + anything, `Abhay` (A, b, h... wait — third letter must be `a`) — be careful and always trace the letters one by one. `Ara%`, `Asha`, `Agarwal` all fit the shape A-_-a-…. This tracing discipline is the whole skill: line up pattern and name position by position.

Common patterns to memorise:

| Pattern | Meaning |
| :--- | :--- |
| `'A%'` | Starts with A |
| `'%z'` | Ends with z |
| `'%ar%'` | Contains `ar` anywhere |
| `'____'` | Exactly four characters |
| `'_a%'` | Second character is `a` |
| `'A_a%'` | Starts with A, third character is `a` |

### Combining LIKE with NULL checks
`LIKE` only tests real text. `NULL` is not text at all — it means "unknown" — so a `NULL` never matches a pattern. To filter on whether a column has a value, use `IS NULL` / `IS NOT NULL` *alongside* `LIKE`:

```sql
WHERE Comm IS NOT NULL AND Emp_Name LIKE '_n___'
```

This means "employees who *have* a commission **and** whose name is a five-letter word with `n` second." The two conditions are combined with `AND`, so both must be true.

### The ESCAPE clause — matching a literal wildcard
What if a value genuinely *contains* the `%` or `_` character and you want to search for it literally? For example, some job titles are written like `Sales_Manager` or `50%_Bonus`. A plain `_` in your pattern would be treated as "any one character." To say "I mean the real underscore," you declare an **escape character** and put it before the wildcard:

```sql
WHERE Job LIKE '%\_%' ESCAPE '\'
```

Here `\` is named as the escape character, so `\_` means "a literal underscore." The pattern reads: anything, then a real `_`, then anything — i.e. jobs that *contain an underscore*. Without the `ESCAPE '\'`, the `_` would just be a wildcard and the query would be meaningless.

## 📖 Key terms

| Term | Meaning |
| :--- | :--- |
| `LIKE` | Predicate that matches a text value against a pattern instead of an exact value. |
| Pattern | The string on the right of `LIKE`, built from literal characters plus wildcards. |
| `%` (percent) | Wildcard meaning "zero or more characters". |
| `_` (underscore) | Wildcard meaning "exactly one character". |
| Wildcard | A symbol in a pattern that stands for other characters. |
| `IS NULL` | Test that a column has no value (unknown). |
| `IS NOT NULL` | Test that a column does have a value. |
| `ESCAPE` | Clause that names a character used to make a wildcard mean itself (e.g. a literal `_`). |
| Literal character | An ordinary character in a pattern that must appear exactly as written. |

## 🧾 Query-by-query walkthrough

### Query 1 — Names shaped A, any letter, then a
**What it does:** Returns all columns for employees whose name starts with `A`, has any one character next, then an `a`, then anything.
```sql
SELECT * FROM Employee WHERE Emp_Name LIKE 'A_a%';
```
![Query 1 output](screenshots/q1.png)

### Query 2 — Five-letter names starting with "Ani"
**What it does:** Returns name, number and salary for employees whose name is exactly `Ani` followed by two characters (`_` twice) — i.e. five-letter names beginning `Ani`.
```sql
SELECT Emp_Name, Emp_No, Salary FROM Employee WHERE Emp_Name LIKE 'Ani__';
```
![Query 2 output](screenshots/q2.png)

### Query 3 — Five-letter names with "n" second, only if commission exists
**What it does:** Returns name and commission for employees who *have* a commission (`Comm IS NOT NULL`) and whose name is exactly five letters with `n` as the second character.
```sql
SELECT Emp_Name, Comm FROM Employee WHERE Comm IS NOT NULL AND Emp_Name LIKE '_n___';
```
![Query 3 output](screenshots/q3.png)

### Query 4 — Names with "a" third, only if commission is missing
**What it does:** Returns just the name for employees whose commission is empty (`Comm IS NULL`) and whose name has `a` as the third character (any length from there).
```sql
SELECT Emp_Name FROM Employee WHERE Comm IS NULL AND Emp_Name LIKE '__a%';
```
![Query 4 output](screenshots/q4.png)

### Query 5 — Jobs that literally contain an underscore
**What it does:** Returns jobs that contain a real `_` character. The `ESCAPE '\'` tells SQL that `\_` means a literal underscore, not the "one character" wildcard.
```sql
SELECT Job FROM Employee WHERE Job LIKE '%\_%' ESCAPE '\';
```
![Query 5 output](screenshots/q5.png)

## ⚠️ Common mistakes
- **Using `=` with a wildcard.** `Emp_Name = 'A%'` looks for a name literally equal to `A%`; you must use `LIKE`.
- **Confusing `%` and `_`.** `%` is *any number* of characters; `_` is *exactly one*. Mixing them up gives wrong lengths.
- **Expecting `LIKE` to match `NULL`.** `NULL` is unknown, not text — it never matches any pattern; use `IS NULL` / `IS NOT NULL` instead.
- **Forgetting `ESCAPE`.** Without it, a `_` or `%` you meant literally is treated as a wildcard.
- **Losing track of position.** `'A_a%'` and `'A%a%'` are very different shapes — trace the pattern letter by letter against a sample name.

## ✅ Key takeaways
- `LIKE` matches text against a **pattern**, unlocking fuzzy searches that `=` cannot do.
- `%` means "zero or more characters" and `_` means "exactly one character" — together they describe almost any text shape.
- Read a pattern left to right and align it with the value position by position; that is the core skill.
- `LIKE` never matches `NULL`; combine it with `IS NULL` / `IS NOT NULL` to filter on presence of a value.
- Use `ESCAPE` to search for a literal `%` or `_` when those characters are part of the actual data.

## 🏋️ Try it yourself
1. List all employees whose name ends with the letter `a`.
2. Find employees whose name is exactly four characters long.
3. Show employees whose name has `i` as the second character and who earn more than 2000.
4. Find all `Deposit` customers whose name contains the substring `an` anywhere.
5. Write a query that finds jobs containing a literal percent sign `%`, using the `ESCAPE` clause.
