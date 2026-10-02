# Practical 23 — Star Pyramid Pattern

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To print a centered star pyramid using nested loops.

## 📌 Objective

Use nested loops to control the number of spaces and stars per row.

## 🧠 Concept in simple words

The program reads a height and prints a pyramid. For every row i it uses one inner loop to print the leading spaces (height - i of them) and a second inner loop to print the stars (2*i - 1 of them, an odd count). Because the spaces decrease and the stars increase as the row number grows, the pyramid stays centered and symmetric.

![Concept diagram](screenshots/diagram_23.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Nested loops` | An outer loop for rows and inner loops for spaces and stars. |
| `Leading spaces` | height - i spaces before the stars on row i. |
| `Star count` | 2*i - 1 stars on row i (odd numbers). |
| `Symmetry` | Equal spaces on both sides keep the pyramid centered. |

## ▶️ How to use

Run and enter a height such as 5; the program prints a centered pyramid of 5 rows.

### Main file

[`practical_23.c`](./practical_23.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Carefully chosen loop bounds for spaces and stars are enough to draw any centered pattern.
