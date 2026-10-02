# Practical 05A — Biggest of Three Numbers (if-else)

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- What a **condition** is and how C evaluates it (true = non-zero, false = 0)
- **Relational operators** used inside conditions
- The **`if` statement** and the **`if … else if … else` ladder**
- Why exactly **one** branch of a ladder runs
- The **`&&` (AND)** operator, and why `a >= b && a >= c` needs *both* comparisons
- Why the **order** of the checks guarantees a correct answer
- Why we use **`>=`** instead of `>` to handle ties correctly

## 🎯 Aim
To find the biggest among three numbers using an if-else decision structure.

## 🧠 The big idea
Real decisions are made with "if". *If it is raining, take an umbrella; else, wear sunglasses.* C works the same way with the **`if` statement**: it asks a yes/no question and runs some code only when the answer is yes. When there are more than two possible outcomes, we chain the questions into an **`if … else if … else` ladder** — a stack of questions asked one after another until one answers "yes".

To find the biggest of three numbers we play a short tournament. First ask: "Is `a` at least as big as both of the others?" If yes, `a` wins — done. If no, `a` is out, so the winner must be `b` or `c`; ask "Is `b` at least as big as `c`?" If yes, `b` wins, otherwise `c` wins. Because we always stop at the first "yes", exactly one of the three branches runs and the answer is always correct.

## 🔍 Deep dive

### What is a condition?
A **condition** is an expression that is either **true** or **false**. In C there is no separate `bool` type here — a condition is just an integer: **`0` means false, any non-zero value means true**. The relational operators produce these values:

| Operator | Meaning | Example | Result |
| :--- | :--- | :--- | :--- |
| `>` | greater than | `5 > 3` | 1 (true) |
| `<` | less than | `5 < 3` | 0 (false) |
| `>=` | greater than or equal | `5 >= 5` | 1 (true) |
| `<=` | less than or equal | `5 <= 3` | 0 (false) |
| `==` | equal to | `5 == 3` | 0 (false) |
| `!=` | not equal to | `5 != 3` | 1 (true) |

### The `if` statement
The basic form:
```c
if (condition)
    statement;
```
If the condition is true, the statement runs; otherwise it is skipped. If you need more than one statement, wrap them in braces `{ }`:
```c
if (condition) {
    statement1;
    statement2;
}
```

### The `if … else if … else` ladder
When there are several possibilities, chain the tests:
```c
if (cond1)
    action1;
else if (cond2)
    action2;
else
    action3;
```
C checks `cond1` first. If it is true, `action1` runs and **the whole ladder is skipped** — `cond2` is never even tested. Only if `cond1` is false does C move on to `cond2`, and so on. If every condition fails, the final `else` runs. So **exactly one** branch executes, no matter what the inputs are. This "first true wins" behaviour is what makes the ladder a clean way to pick one winner.

### Why `a >= b && a >= c`
For `a` to be the maximum, it is not enough that `a` beats `b`; it must also beat `c`. That is **two** conditions, and they must both hold. The **`&&` (AND)** operator does exactly this — it is true only when *both* sides are true:

| A | B | A && B |
| :--- | :--- | :--- |
| 1 | 1 | 1 |
| 1 | 0 | 0 |
| 0 | 1 | 0 |
| 0 | 0 | 0 |

So `a >= b && a >= c` is true only when `a` is at least as big as both of the others — precisely the meaning of "a is the maximum".

### Why the order of checks works
The ladder is:
1. `if (a >= b && a >= c)` → `a` is the max. If this is false, `a` is **not** the maximum, so the max must be `b` or `c`.
2. `else if (b >= c)` → among the remaining two, `b` is the bigger, so `b` is the max.
3. `else` → neither of the above, so the max must be `c`.

Each step eliminates a possibility, and the last `else` mops up what is left. This is why the ladder is *provably* correct for any three numbers.

### Why `>=` and not `>`
Using `>=` ("greater than **or equal**") handles ties gracefully. Suppose the numbers are `7, 7, 3`. With `a >= b && a >= c` → `7 >= 7 && 7 >= 3` → true, so `a` (7) is reported as the maximum. That is a perfectly good answer. If we had used `>` instead, `a > b` would be false (`7 > 7` is false), `a` would be wrongly rejected, and the program would fall through to the `b >= c` test. The answer might still come out right in some cases, but `>=` states the intent clearly: "a is at least as big as the others". **When picking a maximum, prefer `>=`.**

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Condition | An expression that is true (non-zero) or false (0) |
| `if` | Runs a block only when its condition is true |
| `else if` | An extra test tried only when the earlier conditions failed |
| `else` | The fallback branch when no condition was true |
| Ladder | A chain of `if / else if / else` where exactly one branch runs |
| `&&` | Logical AND — true only when both sides are true |
| `>=` | Greater than or equal to |
| Tie | Two or more numbers equal; handled correctly by `>=` |

## 🖼️ Diagram
![Diagram: if-else decision flow for the biggest of three numbers](screenshots/diagram_05.png)

## 🧮 Dry run (worked example)
**Input: a = 12, b = 25, c = 7.**

| Step | Test | Substitution | Result | Action |
| :--- | :--- | :--- | :--- | :--- |
| 1 | `a >= b && a >= c` | `12 >= 25 && 12 >= 7` → `0 && 1` | false (0) | skip first branch |
| 2 | `b >= c` | `25 >= 7` | true (1) | `maxIf = b = 25` |
| 3 | `else` | — | — | not reached |
| 4 | Print | — | — | prints **25** |

So the output is:

```
 INPUT VALUES : a = 12, b = 25, c = 7
 Maximum Number : 25
```

Try another set mentally: `a = 30, b = 10, c = 20`. Step 1: `30 >= 10 && 30 >= 20` → true, so `maxIf = 30` immediately, and the rest of the ladder is skipped.

## ⌨️ Reading the code
```c
#include <stdio.h>
#include <conio.h>
void main()
{
    int a, b, c, maxIf;
    clrscr();
    printf("Enter first number  (a): "); scanf("%d", &a);
    printf("Enter second number (b): "); scanf("%d", &b);
    printf("Enter third number  (c): "); scanf("%d", &c);
    if (a >= b && a >= c)
        maxIf = a;
    else if (b >= c)
        maxIf = b;
    else
        maxIf = c;
    printf(" INPUT VALUES : a = %d, b = %d, c = %d\n", a, b, c);
    printf(" Maximum Number : %d\n", maxIf);
    getch();
}
```

- **`#include <stdio.h>` / `#include <conio.h>`** — standard I/O and Turbo C's console helpers.
- **`int a, b, c, maxIf;`** — three inputs and one result, all integers. We compare whole numbers, so `int` is right.
- **`clrscr();`** — clears the Turbo C screen so the output starts fresh.
- **The three `printf` + `scanf` pairs** — prompt and read `a`, `b`, `c` with `%d` and `&`.
- **`if (a >= b && a >= c) maxIf = a;`** — the first (and strongest) test: is `a` at least as big as both others? If so, store `a`.
- **`else if (b >= c) maxIf = b;`** — reached only if the first test failed (so `a` is out). Compares the two remaining candidates and stores `b` if it wins.
- **`else maxIf = c;`** — the fallback: if neither of the above was true, `c` must be the maximum.
- **The two output `printf`s** — echo the inputs, then print `maxIf`.
- **`getch();`** — waits for a keypress before closing the window.

Note: the braces are omitted because each branch contains a single statement, which is allowed. Adding `{ }` around each `maxIf = ...;` would be equally correct and is often recommended for clarity.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `if (cond) stmt;` | Run `stmt` if `cond` is true |
| `if (cond) { … }` | Run several statements if `cond` is true |
| `else if (cond)` | Another test, tried only if earlier ones failed |
| `else` | Fallback branch |
| `a >= b` | `a` is greater than or equal to `b` |
| `A && B` | Logical AND — true only if both are true |
| `maxIf = a;` | Assignment: store `a` into `maxIf` |
| `clrscr();` | Clear the console screen (Turbo C) |

## 🖨️ Output
![Program output](screenshots/output.png)

```
Enter first number  (a): 12
Enter second number (b): 25
Enter third number  (c): 7
 INPUT VALUES : a = 12, b = 25, c = 7
 Maximum Number : 25
```

## ⚠️ Common mistakes
- Writing `if (a >= b && a >= c)` as `if (a >= b && c)` — the second part must be a full comparison, not just a variable.
- Using `=` instead of `==` inside a condition, which assigns instead of compares.
- Using `>` instead of `>=`, which mishandles ties.
- Forgetting that the first true branch skips the rest — adding a second `if` (instead of `else if`) can run two branches.
- Missing braces when a branch needs more than one statement, so only the first line belongs to the `if`.
- Mixing up the order of checks so that `a` is never tested against `c`.

## ✅ Key takeaways
- A condition is true (non-zero) or false (0); relational operators produce these values.
- The `if / else if / else` ladder runs exactly one branch — the first whose condition is true.
- `&&` combines two conditions and is true only when both hold.
- `a >= b && a >= c` is the precise test for "a is the maximum".
- `>=` (not `>`) correctly handles ties.
- The order of the checks is what makes the ladder correct.

## 🏋️ Try it yourself
1. Modify the program to find the **smallest** of the three numbers using a similar if-else ladder. (Hint: reverse every `>=` to `<=`.)
2. Run the program with `a = 15, b = 15, c = 9` and explain why the program still prints `15` correctly.
