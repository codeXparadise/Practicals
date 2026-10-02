# Practical 01 — Pseudo Code & Flowchart

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To design pseudocode and flowcharts to determine the greatest of three numbers and to compute the sum of the first N natural numbers.

## 📌 Objective

Learn to express an algorithm in plain-language steps (pseudocode) and as a diagram (flowchart) before writing any code.

## 🧠 Concept in simple words

Before writing a program, we plan the solution. Pseudocode writes the steps in simple English (Start, Input, Condition, Output, Stop). A flowchart draws the same steps with standard shapes: an oval for Start/Stop, a parallelogram for Input/Output, a rectangle for a process and a diamond for a decision. Part A finds the greatest of three numbers using decision diamonds. Part B adds the first N numbers using a loop that keeps a running total.

![Concept diagram](screenshots/flowchart_max3.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Pseudocode` | A step-by-step plan written in plain language, not in any programming language. |
| `Flowchart` | A diagram of the same steps using standard symbols. |
| `Oval / Parallelogram / Rectangle / Diamond` | Start-Stop / Input-Output / Process / Decision symbols. |
| `AND condition` | 'A > B and A > C' is true only when both comparisons are true. |
| `Sum = N(N+1)/2` | Closed-form formula used to verify the loop result. |

## ▶️ How to use

Read the pseudocode, then trace the flowchart with sample values such as A=12, B=25, C=7 (answer 25) and N=10 (sum 55). No compilation is needed for this practical.

### Main file

[`practical_01.pdf`](./practical_01.pdf)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Any problem can be designed first in pseudocode and a flowchart, and then translated almost mechanically into code.
