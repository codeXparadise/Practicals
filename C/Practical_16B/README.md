# Practical 16B — Even Series Sum (for loop)

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To display the sum of the even-number series 2 + 4 + 6 + ... + n using a for loop.

## 📌 Objective

Produce the same even-series sum using a for loop.

## 🧠 Concept in simple words

This is the same calculation as 16A but written with a for loop: for (i = 2; i <= n; i += 2) sum += i. It gives the identical answer, which shows that a for loop and a while loop can express the same repetition.

![Concept diagram](screenshots/diagram_16.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `for loop` | Packs start, condition and update into one line. |
| `i += 2` | Increases the counter by 2 each pass. |
| `Running sum` | Accumulates the even numbers. |
| `Equivalent to while` | Both loops give the same result. |

## ▶️ How to use

Run and enter a limit such as 10; the program prints the sum (30).

### Main file

[`practical_16b.c`](./practical_16b.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

for and while are interchangeable ways of writing the same repetition.
