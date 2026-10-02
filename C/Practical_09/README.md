# Practical 09 — Positive, Negative or Zero

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To check whether a given number is positive, negative or zero.

## 📌 Objective

Implement a three-way decision using an if-else-if structure.

## 🧠 Concept in simple words

The program reads a number and tests it in order: if it is greater than 0 it is positive; else if it is less than 0 it is negative; else it must be zero. The three conditions are mutually exclusive, so exactly one message is printed.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `num > 0` | Positive number. |
| `num < 0` | Negative number. |
| `else` | The remaining case - zero. |
| `if-else-if` | Checks conditions in order until one is true. |

## ▶️ How to use

Run and enter a number such as 15, -8 or 0; the matching sign is printed.

### Main file

[`practical_09.c`](./practical_09.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

An if-else-if chain handles a three-way choice cleanly when the cases do not overlap.
