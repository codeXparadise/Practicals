# Practical 12B — Fibonacci Series using Recursion

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To generate and display the Fibonacci series using recursion.

## 📌 Objective

Use a recurrence with two base cases to generate a sequence.

## 🧠 Concept in simple words

Each Fibonacci number is the sum of the two before it: F(n) = F(n-1) + F(n-2), with F(0) = 0 and F(1) = 1. The program calls the function for each term and prints the series 0, 1, 1, 2, 3, 5, 8 ... Recursion recomputes the same terms many times, which is why an iterative version is faster for large n.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Fibonacci` | Each term = sum of the previous two terms. |
| `Two base cases` | F(0) = 0 and F(1) = 1. |
| `Recurrence` | F(n) = F(n-1) + F(n-2) |
| `Overlapping calls` | The same term is computed repeatedly. |

## ▶️ How to use

Run and enter the number of terms, e.g. 7; the series 0 1 1 2 3 5 8 is printed.

### Main file

[`practical_12b.c`](./practical_12b.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

A recurrence with two base cases produces a sequence, though it repeats work that a loop would avoid.
