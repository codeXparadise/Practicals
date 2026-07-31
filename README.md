# 🎓 College Practicals Repository (C & SQL)

Welcome to the **College Computer Practicals Repository**. This repository contains fully documented, clean, and Turbo C-compatible C programming practicals, as well as SQL lab queries for easy reference and college submission.


## 💻 C Language Practicals Index

All C programs include **concept definitions**, **real-world examples**, **uncommented `clrscr()`** for Turbo C compatibility, and **clean ASCII-bordered outputs**.

| Practical No. | Topic / Title | Description & Logic | File Link |
| :--- | :--- | :--- | :---: |
| **Practical 1** | Pseudo Code & Flowchart | Algorithm & Flowchart for Max of 3 numbers & Sum of N numbers | [practical_1.pdf](./C/practical_1.pdf) |
| **Practical 2** | Arithmetic & Logical Operators | Demonstration of `+`, `-`, `*`, `/`, `%` and `&&`, `||`, `!` | [practical_2.c](./C/practical_2.c) |
| **Practical 3** | Formatted Data Types I/O | Reading and printing `char`, `int`, and `float` variables | [practical_3.c](./C/practical_3.c) |
| **Practical 4** | Area & Volume Calculations | Calculate area of Circle/Rectangle and volume of Sphere/Box | [practical_4.c](./C/practical_4.c) |
| ↳ **Practical 5 (A)** | Max of 3 (`if-else`) | Finding maximum among 3 numbers using conditional `if-else` | [practical_5a.c](./C/practical_5a.c) |
| ↳ **Practical 5 (B)** | Max of 3 (`Ternary`) | Finding maximum using inline ternary operator `(?:)` | [practical_5b.c](./C/practical_5b.c) |
| **Practical 6** | Multiplication Table | Generating table for a given number using `for` loop | [practical_6.c](./C/practical_6.c) |
| **Practical 7** | Increment & Decrement | Demonstrating Pre (`++x`, `--x`) and Post (`x++`, `x--`) operators | [practical_7.c](./C/practical_7.c) |
| **Practical 8** | Even or Odd Check | Checking number parity using modulus operator `% 2` | [practical_8.c](./C/practical_8.c) |
| **Practical 9** | Positive, Negative or Zero | Determining number sign using multi-branch conditional checks | [practical_9.c](./C/practical_9.c) |
| **Practical 10** | Grade Calculation | Multi-way grade allocation using `else-if` ladder | [practical_10.c](./C/practical_10.c) |
| **Practical 11** | Sum of Digits | Extracting and summing digits of an integer (`% 10` & `/ 10`) | [practical_11.c](./C/practical_11.c) |
| ↳ **Practical 12** | Sum of N Numbers (`Recursion`) | Recursive cumulative sum of first N natural numbers | [practical_12.c](./C/practical_12.c) |
| ↳ **Practical 12 (A)**| Factorial (`Recursion`) | Computing `n!` recursively using base case `n <= 1` | [practical_12a.c](./C/practical_12a.c) |
| ↳ **Practical 12 (B)**| Fibonacci Series (`Recursion`) | Generating Fibonacci sequence recursively | [practical_12b.c](./C/practical_12b.c) |
| **Practical 13** | Palindrome Number Check | Reversing number to verify if `original == reversed` | [practical_13.c](./C/practical_13.c) |
| **Practical 14** | Armstrong Number Check | Verifying if number equals sum of cubes of its digits | [practical_14.c](./C/practical_14.c) |
| **Practical 15** | Menu-Driven Calculator | Interactive calculator using `switch-case` statements | [practical_15.c](./C/practical_15.c) |
| ↳ **Practical 16 (A)**| Sum of Even Series (`While`) | Sum of even numbers (2 + 4 + ... + n) using `while` loop | [practical_16a.c](./C/practical_16a.c) |
| ↳ **Practical 16 (B)**| Sum of Even Series (`For`) | Sum of even numbers (2 + 4 + ... + n) using `for` loop | [practical_16b.c](./C/practical_16b.c) |
| **Practical 17** | Prime Number Check | Verifying primality by divisibility test up to `n / 2` | [practical_17.c](./C/practical_17.c) |
| **Practical 18** | Bubble Sort Array | Sorting integer array in ascending order via adjacent swaps | [practical_18.c](./C/practical_18.c) |
| **Practical 19** | Linear Search Array | Sequentially searching for a target key in an array | [practical_19.c](./C/practical_19.c) |
| **Practical 20** | Matrix Transpose | Interchanging matrix rows and columns (`trans[j][i] = mat[i][j]`) | [practical_20.c](./C/practical_20.c) |
| **Practical 21** | Matrix Addition | Element-wise addition of two matrices of equal dimensions | [practical_21.c](./C/practical_21.c) |
| **Practical 22** | File Handling (Write Details)| Saving student details to disk file (`details.txt`) via `fprintf` | [practical_22.c](./C/practical_22.c) |

---

## 🗄️ SQL Language Practicals Index

Dedicated index for database & SQL query lab practicals.

| Practical No. | Topic / Query Description | Key Concepts Covered | File Link |
| :--- | :--- | :--- | :---: |
| **SQL Practical 1** | Bank Database Operations | Table creation, Foreign Keys, Insert, Basic selection & Join filtering | [practical_1.sql](./SQL/practical_1.sql) |
| **SQL Practical 2** | Company Database & Selection Queries | Table creation (Job & Employee), `SELECT` with `WHERE`, Aliasing (`AS`), `LIKE` pattern | [practical_2.sql](./SQL/practical_2.sql) |
| **SQL Practical 3** | Library & Employee Databases | DDL/DML (`UPDATE`, `DELETE`), Aggregates (`COUNT`, `MAX`, `MIN`, `AVG`, `SUM`), `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT` | [practical_3.sql](./SQL/practical_3.sql) |

---

## ⚙️ How to Compile & Run

### 1. In Turbo C / Turbo C++ (IDE)
1. Copy the `.c` files into your Turbo C `INCLUDE` / `BIN` directory (e.g. `C:\TURBOC3\BIN`).
2. Open Turbo C IDE, navigate to `File -> Open` and load the `.c` file.
3. Press `Ctrl + F9` to **Compile & Run**.
4. Press `Alt + F5` or view output directly (handled by `clrscr()` and `getch()`).

### 2. In VS Code / GCC Compiler
To run in VS Code using `gcc`:
```bash
gcc C/practical_14.c -o C/practical_14.exe
./C/practical_14.exe
```
*(Note: If compiling with modern GCC, `clrscr()` is supported in Turbo C environments via `<conio.h>`).*

---

## 📝 License & Usage
Shared for educational and college lab practical submission purposes. Feel free to clone or download for study reference!
