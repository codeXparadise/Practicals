# Practical 16A — Even Series Sum (while loop)

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To display the sum of the even-number series 2 + 4 + 6 + ... + n using a while loop.

## 📌 Objective

Accumulate a running total over even numbers using a while loop.

## 🧠 Concept in simple words

The program reads a limit n and starts a counter i at 2. While i is less than or equal to n it adds i to the sum and increases i by 2, which steps through only the even numbers. For n = 10 the series is 2 + 4 + 6 + 8 + 10 = 30. The sum of the first k even numbers is k(k+1).

![Concept diagram](screenshots/diagram_16.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `while loop` | Repeats while a condition stays true. |
| `Step of 2` | i += 2 skips odd numbers. |
| `Running sum` | sum += i accumulates the total. |
| `k(k+1)` | Formula for the sum of the first k even numbers. |

## ▶️ How to use

Run and enter a limit such as 10; the program prints the sum (30).

### Main file

[`practical_16a.c`](./practical_16a.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

A while loop with a step of 2 generates even numbers and accumulates their sum.
