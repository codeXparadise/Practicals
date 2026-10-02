# Practical 18 — Bubble Sort Array

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To sort entered array elements in ascending order using bubble sort.

## 📌 Objective

Learn array indexing, the swap idiom and how repeated passes sort an array.

## 🧠 Concept in simple words

The program stores the values in an array and uses two nested loops. It compares each neighbouring pair a[j] and a[j+1]; if they are out of order it swaps them using a temporary variable. After every pass the largest remaining value 'bubbles' to the end, so the inner loop gets shorter each time. For n elements it makes roughly n^2/2 comparisons.

![Concept diagram](screenshots/diagram_18.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `Array` | A list of values stored under one name and accessed by index. |
| `Swap idiom` | temp = a[j]; a[j] = a[j+1]; a[j+1] = temp; |
| `Nested loops` | The outer loop counts passes, the inner loop compares pairs. |
| `O(n^2)` | Roughly n^2/2 comparisons for n elements. |

## ▶️ How to use

Run and enter 5 elements such as 5 2 8 1 4; the program prints the original and the sorted array (1 2 4 5 8).

### Main file

[`practical_18.c`](./practical_18.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Bubble sort repeatedly swaps out-of-order neighbours until the whole array is sorted.
