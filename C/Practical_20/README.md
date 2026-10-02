# Practical 20 — Transpose of a Matrix

> **Introduction to Programming with C — Lab Manual**  
> B.Sc. (Artificial Intelligence), Semester I

---

## 🎯 Aim

To read a matrix and display its transpose.

## 📌 Objective

Understand two-dimensional indexing and how swapping the indices produces the transpose.

## 🧠 Concept in simple words

The transpose of a matrix is formed by turning rows into columns: trans[j][i] = mat[i][j]. The program reads an m x n matrix with two nested loops and places each element into the transposed position, changing the shape from m x n to n x m. It then prints both the original and the transposed matrix so the swap of rows and columns is visible.

![Concept diagram](screenshots/diagram_20.png)

## 🔑 Basic concepts used

| Concept | Meaning |
| :--- | :--- |
| `2D array` | A grid of values accessed as a[i][j] (row i, column j). |
| `Transpose` | trans[j][i] = mat[i][j] |
| `Shape change` | An m x n matrix becomes n x m. |
| `Nested loops` | Outer loop over rows, inner loop over columns. |

## ▶️ How to use

Run and enter 2 rows, 3 columns and the values 1 2 3 4 5 6; the program prints the original 2x3 and the transposed 3x2 matrix.

### Main file

[`practical_20.c`](./practical_20.c)

## 🖨️ Output

![Program output](screenshots/output.png)

## ✅ Conclusion

Swapping the row and column indices is all that is needed to transpose a matrix.
