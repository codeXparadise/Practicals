# Practical 15 — Menu-Driven Calculator (switch-case)

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To create a menu-driven calculator using the switch-case statement.

## 📌 Objective

Map a user's menu choice to one of several arithmetic operations.

## 🧠 Concept in simple words

The program shows a menu (1 Add, 2 Subtract, 3 Multiply, 4 Divide), reads the choice and two numbers, and uses a switch to run the matching case. Each case ends with break so control does not fall through to the next one, and the default case reports an invalid choice. Division checks for a zero divisor before dividing.

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `switch-case` | Selects one branch out of many based on a value. |
| `break` | Stops execution from falling into the next case. |
| `default` | Runs when no case matches - handles bad input. |
| `Division by zero` | Checked with an if before dividing. |

## ▶️ How to use

Run, choose option 3, then enter 4 and 5; the program prints 4.00 * 5.00 = 20.00.

### Main file

[`practical_15.c`](./practical_15.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

switch-case is the cleanest way to build a menu that performs different actions for different choices.
