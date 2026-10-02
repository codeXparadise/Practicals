# Practical 21 — Matrix Addition

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- How to read **two** matrices of the same size into two 2D arrays.
- Why matrices can only be added when their **dimensions match exactly**.
- **Element-by-element** addition: `sum[i][j] = A[i][j] + B[i][j]`.
- Storing the result in a **third matrix** so nothing is destroyed.
- Reusing the same **nested-loop pattern** for reading, adding, and printing.
- Printing all three matrices as neat aligned grids.

## 🎯 Aim
To read two matrices of equal dimensions and display their sum.

## 🧠 The big idea
Matrix addition is the friendliest of all matrix operations: you simply add the numbers that sit in the **same position**. The top-left of A plus the top-left of B gives the top-left of the sum, and so on for every cell. There is no multiplication, no carrying, no cleverness — just a straight cell-for-cell addition.

But there is one hard rule. The two matrices must be **the same shape**. You can only add a `2 × 2` to a `2 × 2`, or a `3 × 4` to a `3 × 4`. It is like pairing up students for a two-column register: if one register has a different number of rows or columns, the pairing breaks down. A cell in A would have no matching partner in B, so the addition is undefined. This is exactly why the program reads `rows` and `columns` **once** and uses them for both matrices.

## 🔍 Deep dive

### Two matrices, one shape
We declare two input arrays and one output array:

```c
int matrixA[10][10], matrixB[10][10], sumMatrix[10][10];
```

All three share the same dimensions. The user is asked for `rows` and `columns` a single time, and both A and B are filled using those same limits — this guarantees the shapes match.

### Element-by-element addition
The heart of the program is one line inside a nested loop:

```c
sumMatrix[i][j] = matrixA[i][j] + matrixB[i][j];
```

For every position `(i, j)`, we take the value in A at that position, the value in B at that position, add them, and store the answer in the same position of `sumMatrix`. The `(i, j)` on the right and the `(i, j)` on the left are identical — the result grid lines up perfectly with the inputs.

### Why use a third matrix
You *could* overwrite A with the answer (`matrixA[i][j] = matrixA[i][j] + matrixB[i][j]`), but then the original A is lost and you cannot print it afterwards. By writing the answer into a fresh `sumMatrix`, we keep all three versions intact: A, B, and A+B. This is good practice — keep your inputs and your output separate.

### One nested-loop pattern, used three times
Reading A, reading B, adding, and printing all use the very same skeleton:

```c
for (i = 0; i < rows; i++)
    for (j = 0; j < columns; j++)
        /* do something with (i, j) */
```

The outer loop selects the row, the inner loop walks every column of that row. Learn this pattern once and you can scan any 2D grid in C. Only the body of the loop changes: sometimes it reads, sometimes it adds, sometimes it prints.

### Printing aligned output
Each matrix is printed with `printf("%4d ", ...)` so numbers line up in columns, and `printf("\n")` at the end of the inner loop starts a new line for the next row. The three matrices then appear as three clean tables one after another.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Matrix | A rectangular grid of numbers in rows and columns. |
| Dimension | The size of a matrix, written as rows × columns. |
| Element-wise addition | Adding two matrices cell by cell, in matching positions. |
| Conformable | Two matrices that can be added because their dimensions match. |
| Result matrix | A third array that holds the sum. |
| Nested loop | A loop inside a loop, used to visit every cell of a 2D array. |
| `clrscr()` | Clears the screen (Turbo C / conio). |
| `getch()` | Waits for a key press before closing. |

## 🖼️ Diagram
![Matrix addition: matching elements of A and B are added into the sum matrix](screenshots/diagram_21.png)

## 🧮 Dry run (worked example)
Let both matrices be `2 × 2`:

```
A = [[1, 2],      B = [[5, 6],
     [3, 4]]           [7, 8]]
```

Add matching cells:

| i | j | A[i][j] | B[i][j] | A + B | goes to sumMatrix |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 0 | 0 | 1 | 5 | 6 | sum[0][0] = 6 |
| 0 | 1 | 2 | 6 | 8 | sum[0][1] = 8 |
| 1 | 0 | 3 | 7 | 10 | sum[1][0] = 10 |
| 1 | 1 | 4 | 8 | 12 | sum[1][1] = 12 |

The result:

```
SUM = [[6,  8],
       [10, 12]]
```

Every number is simply the top-left with the top-left, top-right with top-right, and so on — the grid stays `2 × 2`.

## ⌨️ Reading the code
- `int rows, columns, i, j;` and the three `[10][10]` arrays — the counters and the three tables.
- `clrscr();` — clear the screen.
- The program reads `rows` and `columns` **once**; both matrices will use these values, so their shapes are guaranteed equal.
- The first nested loop fills `matrixA`, asking for `Matrix A [i][j]` each time.
- The second nested loop fills `matrixB` the same way.
- The third nested loop computes `sumMatrix[i][j] = matrixA[i][j] + matrixB[i][j];` for every cell.
- `clrscr();` — clear the input prompts away.
- Three print loops then show **A**, **B**, and the **sum**, each with `%4d` alignment and a newline per row.
- `getch();` — pause at the end.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `int A[10][10], B[10][10], S[10][10];` | Declare three 10×10 integer matrices. |
| `A[i][j]` | The element at row i, column j. |
| `S[i][j] = A[i][j] + B[i][j];` | Element-wise addition into a third matrix. |
| `for (i = 0; i < rows; i++)` | Outer loop over rows. |
| `for (j = 0; j < columns; j++)` | Inner loop over columns. |
| `printf("%4d ", x)` | Print x in a 4-wide aligned field. |
| `scanf("%d", &A[i][j])` | Read an integer into cell (i, j). |

## 🖨️ Output
![Program output](screenshots/output.png)

## ⚠️ Common mistakes
- Reading different row/column counts for A and B, so the matrices no longer match and the addition is meaningless.
- Writing the addition with mismatched indices, e.g. `sum[i][j] = A[i][j] + B[j][i]` — this adds the wrong cells.
- Overwriting A with the sum and then trying to print the original A (which no longer exists).
- Using `<=` in the loop conditions and stepping one cell past the array bounds.
- Forgetting `&` in `scanf("%d", &matrixA[i][j])`.

## ✅ Key takeaways
- Matrices can be added **only when their dimensions are identical**.
- Addition is **element-wise**: each cell of the sum is the sum of the matching cells.
- Using a **third matrix** preserves the original inputs.
- The **nested-loop pattern** reads, processes, and prints any 2D grid.
- Aligned printing with `%4d` makes matrices look like proper tables.

## 🏋️ Try it yourself
1. Extend the program to also compute and print **A − B** (element-wise subtraction).
2. Add a check at the start: if `rows` or `columns` differ between A and B, print a clear error instead of adding.
3. Write a version that finds the **largest element** in the sum matrix after adding.
