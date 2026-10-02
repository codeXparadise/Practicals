# Practical 13 — Palindrome Number Check

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To check whether a number is a palindrome (reads the same backward as forward).

## 📌 Objective

Reverse the number and compare it with the original.

## 🧠 Concept in simple words

The program reverses the number by taking the last digit and rebuilding the value: rev = rev*10 + (n%10), repeating while the number lasts. It then compares the reversed value with the original. If they are equal the number is a palindrome, like 121 or 454; otherwise it is not, like 123.

![Concept diagram](screenshots/diagram_13.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Palindrome` | A number that reads the same forwards and backwards. |
| `rev = rev*10 + (n%10)` | Builds the reversed number one digit at a time. |
| `n / 10` | Removes the last digit after it is used. |
| `Equality test` | original == reversed decides the answer. |

## ▶️ How to use

Run and enter a number such as 121; the program prints that it is a PALINDROME.

### Main file

[`practical_13.c`](./practical_13.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Reversing a number is the sum-of-digits technique with the digits recombined in the opposite order.
