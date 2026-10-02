# Practical 05B — Biggest of Three Numbers (Ternary Operator)

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- The **ternary (conditional) operator `? :`** as a one-line `if-else`
- How the ternary **returns a value**, so it can be assigned to a variable
- The general form `condition ? value_if_true : value_if_false`
- **Nesting** two ternaries to pick the maximum of three numbers
- How to **read a nested ternary expression out loud** without getting lost
- **When to prefer** the ternary operator over if-else (brevity vs clarity)
- The equivalent **if-else version**, for comparison

## 🎯 Aim
To find the biggest among three numbers using the ternary (?:) operator.

## 🧠 The big idea
The **ternary operator `? :`** is a compact `if-else` that fits on one line. Instead of writing
```c
if (a > b)
    max = a;
else
    max = b;
```
you can write the whole thing as a single **expression**:
```c
max = (a > b) ? a : b;
```
The key difference is the word **expression**. An `if-else` is a *statement* — it does something, but it does not produce a value you can store. The ternary *is* an expression: it produces a value, which is why you can put it on the right-hand side of `=`. Read it as a question: **"Is `a` greater than `b`? If yes, use `a`; otherwise use `b`."**

To pick the biggest of three, we ask two questions: "Is `a` the biggest?" and, depending on the answer, "which of the two remaining is bigger?" We answer by **nesting** one ternary inside another — a ternary whose result is itself another ternary.

## 🔍 Deep dive

### The ternary operator `? :`
General form:
```c
condition ? value_if_true : value_if_false
```
C first evaluates `condition`. If it is **true**, the whole expression takes the value **before the colon** (`value_if_true`). If it is **false**, it takes the value **after the colon** (`value_if_false`). Only one of the two is ever used — the other is skipped, just like the two branches of an `if-else`.

Simple examples:
| Expression | Condition | Result |
| :--- | :--- | :--- |
| `(5 > 3) ? 100 : 200` | true | `100` |
| `(5 < 3) ? 100 : 200` | false | `200` |
| `(n % 2 == 0) ? 'E' : 'O'` | depends on n | `'E'` if even, else `'O'` |

### It returns a value
Because the ternary produces a value, you can:
- **assign** it: `max = (a > b) ? a : b;`
- **print** it: `printf("%d", (a > b) ? a : b);`
- **pass** it to another operator.

This is the property that makes it different from `if-else` and lets us build the maximum-of-three in a single line.

### Nesting to find the maximum of three
The program uses:
```c
maxTernary = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);
```
Break it into three parts — an outer ternary and two inner ones:

1. **The outer question:** `(a > b) ? … : …` — "Is `a` greater than `b`?"
2. **If YES (a is bigger than b):** the winner is `a` or `c`, so we ask the inner ternary `(a > c) ? a : c` — "Is `a` greater than `c`? Then `a`, else `c`."
3. **If NO (b is at least as big as a):** the winner is `b` or `c`, so we ask `(b > c) ? b : c` — "Is `b` greater than `c`? Then `b`, else `c`."

Notice that only **one** of the two inner ternaries is ever evaluated, because the outer ternary picks one side.

### Reading it out loud
Read the whole line as a sentence, from the outside in:

> "If `a` is greater than `b`, then *(if `a` is greater than `c`, use `a`; otherwise use `c`)*; otherwise *(if `b` is greater than `c`, use `b`; otherwise use `c`)*."

If you can say that sentence smoothly, you understand the expression. If you get lost, put the inner ternaries in parentheses (as the program does) and read each one separately.

### Ternary vs if-else — when to use which
| | Ternary `? :` | `if … else` |
| :--- | :--- | :--- |
| Lines | one | three or more |
| Kind | expression (has a value) | statement (no value) |
| Readability | good for one simple choice | better for complex logic |
| Nesting | gets hard to read quickly | stays clear with braces |

**Rule of thumb:** use the ternary for a *single, simple* choice, especially when you want the result as a value. When there are several branches, or the conditions are complex, use `if-else` — clarity beats cleverness. Nesting more than two ternaries is generally a sign that `if-else` would be kinder to the reader.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Ternary operator | The `? :` operator — a one-line conditional |
| Expression | Code that produces a value (the ternary is one) |
| Statement | Code that performs an action but has no value (if-else is one) |
| Nested ternary | A ternary used inside another ternary |
| Condition | The yes/no test before the `?` |
| `value_if_true` | The value chosen when the condition is true |
| `value_if_false` | The value chosen when the condition is false |

## 🖼️ Diagram
![Diagram: ternary decision flow for the biggest of three numbers](screenshots/diagram_05.png)

## 🧮 Dry run (worked example)
**Input: a = 12, b = 25, c = 7.**

Expression: `(a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c)`

| Step | Evaluate | Substitution | Result | Next |
| :--- | :--- | :--- | :--- | :--- |
| 1 | outer condition `a > b` | `12 > 25` | false | take the **after-colon** part |
| 2 | so use `(b > c) ? b : c` | `25 > 7` | true | take `b` |
| 3 | value of whole expression | — | `25` | store in `maxTernary` |
| 4 | print | — | — | **25** |

The inner ternary `(a > c) ? a : c` was **never evaluated**, because the outer condition chose the other side. Output:

```
 INPUT VALUES : a = 12, b = 25, c = 7
 Maximum Number : 25
```

### The equivalent if-else version
The line above does exactly the same job as this ladder:
```c
if (a > b) {
    if (a > c)
        maxTernary = a;
    else
        maxTernary = c;
} else {
    if (b > c)
        maxTernary = b;
    else
        maxTernary = c;
}
```
Read them side by side: each `?` maps to an `if`, and each `:` maps to an `else`. The ternary is simply the same decision compressed onto one line.

## ⌨️ Reading the code
```c
#include <stdio.h>
#include <conio.h>
void main()
{
    int a, b, c, maxTernary;
    clrscr();
    printf("Enter first number  (a): "); scanf("%d", &a);
    printf("Enter second number (b): "); scanf("%d", &b);
    printf("Enter third number  (c): "); scanf("%d", &c);
    maxTernary = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);
    printf(" INPUT VALUES : a = %d, b = %d, c = %d\n", a, b, c);
    printf(" Maximum Number : %d\n", maxTernary);
    getch();
}
```

- **`#include <stdio.h>` / `#include <conio.h>`** — standard I/O and Turbo C's console helpers.
- **`int a, b, c, maxTernary;`** — three inputs and one result.
- **`clrscr();`** — clears the screen.
- **The three `printf` + `scanf` pairs** — read `a`, `b`, `c`.
- **`maxTernary = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);`** — the heart of the practical. The outer ternary picks the larger of `a` and `b`, and each inner ternary resolves the tie against `c`. The result of the whole expression is stored in `maxTernary`.
- **The two output `printf`s** — echo the inputs and print the maximum.
- **`getch();`** — waits for a keypress.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `cond ? A : B` | If `cond` is true, the expression's value is `A`; else `B` |
| `max = (a > b) ? a : b;` | Store the larger of `a`, `b` into `max` |
| `(a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c)` | Maximum of three, in one line |
| `printf("%d", cond ? x : y);` | Print a ternary's value |
| `a > b` | Relational test used as the condition |
| `if … else …` | The statement form of the same decision |

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
- Forgetting that the ternary **returns** a value — using it as a statement and throwing the value away.
- Missing or mismatched parentheses in a nested ternary, so the inner and outer parts bind wrongly.
- Mixing up the order: the value **before** the colon is used when the condition is **true**.
- Over-nesting ternaries until the line is unreadable — prefer `if-else` when the logic grows.
- Using `=` instead of `>` or `>=` in the condition.
- Using `>` in the outer test, which can mis-handle ties (a `>=` variant is safer if you want to be strict about equality).

## ✅ Key takeaways
- `condition ? value_if_true : value_if_false` is a one-line `if-else` that produces a value.
- Because it is an expression, its result can be assigned, printed, or passed on.
- Nesting two ternaries finds the maximum of three in a single line.
- Each `?` corresponds to an `if` and each `:` to an `else`.
- Read a nested ternary from the outside in, one question at a time.
- Use the ternary for simple choices; fall back to `if-else` when clarity matters more than brevity.

## 🏋️ Try it yourself
1. Rewrite the ternary line to find the **minimum** of three numbers, then confirm it gives the same answer as an equivalent if-else ladder.
2. Use a single ternary to print whether a number `n` is **even or odd**, e.g. `printf("%s", (n % 2 == 0) ? "Even" : "Odd");`.
