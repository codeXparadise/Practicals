# Practical 07 — Increment & Decrement Operators

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To demonstrate the pre-increment, post-increment, pre-decrement and post-decrement operators.

## 📌 Objective

See the difference between the value an expression returns and the side effect on the variable.

## 🧠 Concept in simple words

The program starts with a value x and shows four cases. In post-increment (x++) the old value is used first and then x increases; in pre-increment (++x) x increases first and then the new value is used. Post-decrement (x--) and pre-decrement (--x) do the same in reverse. The printed x and y show how the timing changes the result.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `x++` | Post-increment - use the value, then add 1. |
| `++x` | Pre-increment - add 1, then use the value. |
| `x--` | Post-decrement - use the value, then subtract 1. |
| `--x` | Pre-decrement - subtract 1, then use the value. |

## ▶️ How to use

Run and enter an initial value such as 5; the program prints x and y for each of the four cases.

### Main file

[`practical_07.c`](./practical_07.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Whether ++ / -- is written before or after the variable changes which value the expression returns.
