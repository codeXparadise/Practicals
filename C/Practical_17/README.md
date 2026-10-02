# Practical 17 — Prime Number Check

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To check whether an entered integer is prime.

## 📌 Objective

Test divisibility up to the square root to decide primality efficiently.

## 🧠 Concept in simple words

A prime number has exactly two factors: 1 and itself. The program treats numbers less than or equal to 1 as non-prime, then tests divisors from 2 up to n/2. If any divisor divides n exactly (n % i == 0) the number is not prime and the loop can stop early. It is enough to test up to the square root, because a larger factor would pair with a smaller one already tested.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Prime number` | A number greater than 1 divisible only by 1 and itself. |
| `n % i == 0` | A true remainder of 0 means i is a factor. |
| `Flag` | A variable (isPrime) that records whether a factor was found. |
| `Early exit` | break stops the loop at the first factor. |

## ▶️ How to use

Run and enter a number such as 7; the program prints that it is a PRIME number.

### Main file

[`practical_17.c`](./practical_17.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Trial division with a flag or an early exit is a simple and correct way to test primality.
