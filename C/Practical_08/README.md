# Practical 08 — Even or Odd Check

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To check whether a given integer is even or odd using the modulus operator.

## 📌 Objective

Use the remainder (n % 2) to classify a number into two cases.

## 🧠 Concept in simple words

The program reads an integer n and tests n % 2. If the remainder is 0 the number is even, otherwise it is odd. The modulus operator gives the remainder after division, so it is the simplest way to test divisibility by 2.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `n % 2` | Remainder when n is divided by 2 (0 or 1). |
| `Even` | n % 2 == 0 |
| `Odd` | n % 2 != 0 |
| `if-else` | Chooses between the two messages. |

## ▶️ How to use

Run and enter a number, e.g. 14; the program prints that it is EVEN.

### Main file

[`practical_08.c`](./practical_08.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

The modulus operator turns divisibility into a simple comparison, which is used in many number programs.
