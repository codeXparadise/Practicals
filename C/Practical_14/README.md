# Practical 14 — Armstrong Number Check

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To check whether a three-digit number is an Armstrong number.

## 📌 Objective

Extract each digit, cube it, add the cubes and compare with the original.

## 🧠 Concept in simple words

An Armstrong number (for three digits) equals the sum of the cubes of its digits. For 153: 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153, so 153 is an Armstrong number. The program extracts each digit with % 10 and / 10, cubes it and accumulates the total, then compares that total with the original number.

![Concept diagram](screenshots/diagram_14.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Armstrong number` | A number equal to the sum of its digits each raised to the power of the digit count. |
| `Digit extraction` | n % 10 and n / 10 peel off one digit at a time. |
| `Cube` | d * d * d |
| `Comparison` | sum == original decides the result. |

## ▶️ How to use

Run and enter a three-digit number such as 153; the program prints that it is an ARMSTRONG number.

### Main file

[`practical_14.c`](./practical_14.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Digit extraction combined with repeated multiplication is enough to test the Armstrong property.
