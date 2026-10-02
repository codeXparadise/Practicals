# Practical 12 — Sum of first N Natural Numbers using Recursion

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- What **recursion** is and how a function can call itself.
- The two essential parts of every recursive function: a **base case** and a **recursive step**.
- How the computer keeps track of recursive calls using the **call stack**.
- A full trace of `sumN(5)` — how the calls pile up and then unwind.
- Comparing recursion with a loop and with the closed-form formula `N(N+1)/2`.

## 🎯 Aim
To find the sum of the first N natural numbers using recursion.

## 🧠 The big idea
Recursion is when a function solves a problem by calling **itself** on a smaller version of the same problem. Think of standing between two mirrors — you see a smaller copy of yourself inside each reflection. Recursion works the same way: each call asks a slightly smaller question until the question becomes so small that the answer is obvious.

A good analogy is Russian nesting dolls. To count the total number of dolls, you open the biggest one, and inside there is a smaller set. You ask "how many dolls are in *this* smaller set?" — and that question looks exactly like the original one, just smaller. Eventually you reach the tiniest doll that does not open (the **base case**), and then you add up all the counts on the way back out.

The rule here is simple:
- `sumN(n) = n + sumN(n-1)` (the recursive step), and
- `sumN(0) = 0` (the base case).

## 🔍 Deep dive

### What recursion is and when to use it
A **recursive function** is a function whose body contains a call to itself. Many natural problems are defined in terms of themselves — factorials, Fibonacci numbers, tree traversal, sorting — and for these, recursion gives code that is short and easy to read. Use recursion when a problem can be broken into a smaller copy of itself *and* you can clearly identify a stopping point. Use a loop when the problem is a simple repetition (like counting 1 to N) and recursion would only add overhead.

### The base case and the recursive step
Every correct recursive function has exactly two kinds of lines:
1. **Base case** — a condition that returns an answer directly, *without* calling itself. Here: `if (n <= 0) return 0;`. Without a base case, the function would call itself forever and crash.
2. **Recursive step** — the line that reduces the problem and calls itself: `return n + sumN(n - 1);`. Notice `n` gets smaller each time (`n-1`), so we are always moving *toward* the base case.

The golden rule: **the recursive call must move closer to the base case.** If it moves away, you get infinite recursion.

### How the call stack works
When a function calls another function, the computer saves the current function's state (its local variables and where it was) on a special memory area called the **call stack**, then starts the new call on top. With recursion, the *same* function keeps being pushed on top of itself.

Two phases happen:
- **Winding (piling up):** calls go down from `sumN(5)` to `sumN(0)`. Each call pauses at the `return n + sumN(n-1)` line, waiting for the smaller answer. Nothing has been added yet.
- **Unwinding (coming back):** once `sumN(0)` returns `0`, each paused call finishes its addition and returns to the caller above it.

### Tracing sumN(5) fully
**Winding phase (going down):**
| Call | Waiting on | Meaning |
| :--- | :--- | :--- |
| sumN(5) | 5 + sumN(4) | needs sumN(4) |
| sumN(4) | 4 + sumN(3) | needs sumN(3) |
| sumN(3) | 3 + sumN(2) | needs sumN(2) |
| sumN(2) | 2 + sumN(1) | needs sumN(1) |
| sumN(1) | 1 + sumN(0) | needs sumN(0) |
| sumN(0) | — | base case, returns 0 |

**Unwinding phase (coming back up):**
| Call | Computes | Returns |
| :--- | :--- | :--- |
| sumN(0) | base case | 0 |
| sumN(1) | 1 + 0 | 1 |
| sumN(2) | 2 + 1 | 3 |
| sumN(3) | 3 + 3 | 6 |
| sumN(4) | 4 + 6 | 10 |
| sumN(5) | 5 + 10 | 15 |

So `sumN(5) = 15`, which is `1+2+3+4+5 = 15`. Correct.

### Compare with the loop version and the closed form
The same task with a loop:
```c
int sumN(int n)
{
    int s = 0, i;
    for (i = 1; i <= n; i++)
        s += i;
    return s;
}
```
The loop does the work in one pass with **no extra memory** and no risk of stack overflow. Recursion is elegant but uses one stack frame per call.

Mathematicians know a shortcut — the closed form:
```text
Sum = N(N+1)/2
```
For N = 5: `5 * 6 / 2 = 15`. This is instant, needs no loop and no recursion. Knowing the closed form helps you *verify* that your recursive and loop versions are correct.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Recursion | A function calling itself to solve a smaller version of the same problem. |
| Base case | The stopping condition that returns an answer without recursing. |
| Recursive step | The line where the function calls itself with a smaller input. |
| Call stack | Memory area where the computer stores each paused function call. |
| Winding | The phase where recursive calls pile up going down. |
| Unwinding | The phase where calls finish and return back up. |
| Stack overflow | A crash caused by too many nested calls (base case missing or too deep). |

## 🖼️ Diagram
![Call stack of sumN(5): winding down to the base case, then unwinding back up](screenshots/diagram_12.png)

## 🧮 Dry run (worked example)
Input: `n = 5`.

1. `main` reads `n = 5`, calls `sumN(5)`.
2. `sumN(5)`: `5 <= 0`? No. Return `5 + sumN(4)` → pause.
3. `sumN(4)`: `4 <= 0`? No. Return `4 + sumN(3)` → pause.
4. `sumN(3)`: `3 <= 0`? No. Return `3 + sumN(2)` → pause.
5. `sumN(2)`: `2 <= 0`? No. Return `2 + sumN(1)` → pause.
6. `sumN(1)`: `1 <= 0`? No. Return `1 + sumN(0)` → pause.
7. `sumN(0)`: `0 <= 0`? Yes → return `0`.
8. Now unwind: `sumN(1) = 1+0 = 1`; `sumN(2) = 2+1 = 3`; `sumN(3) = 3+3 = 6`; `sumN(4) = 4+6 = 10`; `sumN(5) = 5+10 = 15`.
9. `result = 15`. Prints the input limit and the cumulative sum.

## ⌨️ Reading the code
```c
#include <stdio.h>
#include <conio.h>

int sumN(int n)
{
    if (n <= 0)
        return 0;            /* base case: nothing left to add */
    return n + sumN(n - 1);  /* recursive step: n plus sum of smaller numbers */
}

void main()
{
    int n, result;
    clrscr();                                    /* clears the screen (Turbo C) */
    printf("Enter a positive number (n): ");
    scanf("%d", &n);                             /* read n from the user */
    result = sumN(n);                            /* start the recursion */
    printf(" INPUT LIMIT (n)  : %d\n", n);
    printf(" Cumulative Sum   : %d\n", result);
    getch();                                     /* wait for a key press (Turbo C) */
}
```
- `sumN` is declared to take an `int` and return an `int`.
- The first `if` is the base case; the `return n + sumN(n-1)` is the recursive step.
- In `main`, `clrscr()` and `getch()` are Turbo C / DOS-era functions (from `<conio.h>`); on modern compilers they may not exist, but they only clear the screen and wait for a key.
- `result = sumN(n)` is what actually kicks off the whole chain of calls.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `int sumN(int n)` | Function taking one integer and returning an integer. |
| `return n + sumN(n - 1);` | Recursive call on a smaller input, combined with `n`. |
| `if (n <= 0) return 0;` | Base case that stops the recursion. |
| `scanf("%d", &n);` | Read an integer from the keyboard into `n`. |
| `printf("... %d\n", result);` | Print an integer with a newline. |
| `clrscr();` / `getch();` | Clear screen / wait for key (Turbo C, `<conio.h>`). |

## 🖨️ Output
![Program output](screenshots/output.png)

## ⚠️ Common mistakes
- **Forgetting the base case** — the function calls itself forever and crashes (stack overflow).
- **Making the input bigger** instead of smaller (writing `sumN(n+1)`) — never reaches the base case.
- **Using `< 0` instead of `<= 0`** — `sumN(0)` would then still try to recurse to `sumN(-1)`, and on negative inputs the sum becomes wrong.
- **Assuming recursion is always better** — for simple counting, a loop or the formula `N(N+1)/2` is faster and uses less memory.
- **Using a very large `n`** — each call uses stack space; thousands of calls can overflow the stack.

## ✅ Key takeaways
- Recursion = a function calling itself on a smaller problem.
- Every recursive function needs a **base case** and a **recursive step** that moves toward it.
- The **call stack** stores paused calls: they wind down, then unwind back up.
- `sumN(n)` equals `n + sumN(n-1)`; for `n = 5` the answer is `15`.
- For this problem, a loop or the formula `N(N+1)/2` is simpler — recursion is mainly a teaching tool here.

## 🏋️ Try it yourself
1. Modify the program to also print the sum using the formula `N(N+1)/2` and check that both answers match.
2. Write a recursive function to compute the sum of the squares of the first N numbers: `1² + 2² + … + N²`.
