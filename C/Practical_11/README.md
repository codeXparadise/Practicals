# Practical 11 — Sum of Digits

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- The digit-extraction pattern: `n % 10` gives the last digit, `n / 10` removes it
- Why a `while` loop is the right choice here
- Why this loop always terminates
- Keeping a running total (the running sum)
- Why the original number must be saved before it is destroyed
- Tracing integer division and modulus together step by step

## 🎯 Aim
To find the sum of the digits of an integer using a `while` loop.

## 🧠 The big idea
Suppose someone hands you the number 1234 written on a strip of paper and asks for the sum of its digits. Naturally, you would peel off the last digit (4), add it to a running total, then look at what is left (123), peel off the 3, add it, and keep going until nothing remains. The final total is 10.

The computer does exactly the same thing, but it needs a way to "peel off the last digit" and "throw it away". Two operators give us this superpower: `% 10` and `/ 10`. And because we do not know in advance how many digits the number has, we cannot use a fixed-count `for` loop — we use a `while` loop that keeps going until the number runs out of digits.

## 🔍 Deep dive

### The digit-extraction pattern
This is the most important idea in the practical. For any positive integer `n`:

- `n % 10` gives the **last digit**. Because dividing by 10 leaves a remainder equal to the units place. Example: `1234 % 10 = 4`.
- `n / 10` (integer division) **removes the last digit**. Because integer division throws away the remainder. Example: `1234 / 10 = 123`.

Put the two together and you have a recipe: read the last digit with `% 10`, then discard it with `/ 10`, and repeat on the smaller number. Here is the pattern on 1234:

| Step | `n % 10` (last digit) | `n / 10` (new `n`) |
| :--- | :--- | :--- |
| Start | — | 1234 |
| 1 | 4 | 123 |
| 2 | 3 | 12 |
| 3 | 2 | 1 |
| 4 | 1 | 0 |

Once `n` becomes 0, there are no digits left — the job is done.

### Why a while loop, and why it always terminates
A `for` loop needs a known count. But we do not know how many digits a number has until we look at it (1234 has 4, 7 has 1, 100000 has 6). A `while` loop repeats **as long as a condition stays true** — here, `while (num != 0)`. It keeps running while there is at least one digit left.

Does it always stop? Yes. Every round divides `num` by 10, so `num` shrinks. For a positive number, `num / 10` is strictly smaller than `num`, and after enough rounds it reaches 0, at which point the condition `num != 0` becomes false. The number of rounds is exactly the number of digits. There is no way to get stuck.

### The running sum
`sum` starts at `0` and grows a little each round:

```c
sum = sum + rem;
```

This is called a **running total** (or accumulator). Each round we add the freshly peeled digit `rem` to whatever we have collected so far. After the last digit, `sum` holds the answer.

### Why we save the original number
The loop destroys `num` — by the end, `num` is 0. But we still want to print the *original* number in the output ("INPUT NUMBER : 1234"). So before the loop starts we make a copy:

```c
originalNum = num;
```

Now `originalNum` keeps the value while `num` is being whittled down. This is a very common and important habit: **make a copy of any value a loop is about to destroy.**

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Digit | A single numeral 0-9 that makes up a number |
| `%` (modulus) | Gives the remainder — used here to peel off the last digit |
| Integer division `/` | Division that discards any remainder |
| Running sum | A variable that accumulates a total across loop rounds |
| `while` loop | A loop that repeats while a condition is true |
| Termination | The loop is guaranteed to stop |
| `rem` | Short for "remainder" — the digit extracted this round |

## 🖼️ Diagram
![Digit extraction: n % 10 peels the last digit, n / 10 removes it, repeat until zero](screenshots/diagram_11.png)

## 🧮 Dry run (worked example)
The user enters `1234`. The program copies it into `originalNum`, sets `sum = 0`, and enters the loop. The full trace is:

| Round | `num` at test | `num != 0`? | `rem = num % 10` | `sum = sum + rem` | `num = num / 10` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 1234 | true | 4 | 0 + 4 = 4 | 123 |
| 2 | 123 | true | 3 | 4 + 3 = 7 | 12 |
| 3 | 12 | true | 2 | 7 + 2 = 9 | 1 |
| 4 | 1 | true | 1 | 9 + 1 = 10 | 0 |
| — | 0 | false | (loop ends) | 10 | 0 |

The loop ends when `num` becomes 0. The program then prints:

- `INPUT NUMBER   : 1234` (from the saved `originalNum`)
- `SUM OF DIGITS  : 10`

Check: 1 + 2 + 3 + 4 = 10. Correct.

## ⌨️ Reading the code
- `int num, originalNum, sum = 0, rem;` — four integers. `sum` is initialised to 0 because we are about to add to it.
- `printf("Enter an Integer Number: "); scanf("%d", &num);` — reads the number into `num`.
- `originalNum = num;` — saves a copy **before** the loop destroys `num`.
- `while (num != 0)` — keep looping while there are digits left.
- `rem = num % 10;` — extract the last digit.
- `sum = sum + rem;` — add it to the running total.
- `num = num / 10;` — remove the last digit so the loop makes progress.
- `printf(" INPUT NUMBER   : %d\n", originalNum);` — prints the saved original.
- `printf(" SUM OF DIGITS  : %d\n", sum);` — prints the final total.
- `getch();` — pauses the console.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `num % 10` | Last (units) digit of `num` |
| `num / 10` | `num` with the last digit removed |
| `while (num != 0)` | Repeat while `num` still has digits |
| `sum = sum + rem;` | Add the new digit to the running total |
| `sum = 0;` | Initialise an accumulator before a loop |
| `originalNum = num;` | Copy a value the loop is about to change |

## 🖨️ Output
![Program output](screenshots/output.png)

## ⚠️ Common mistakes
- Forgetting to update `num` (`num = num / 10;`) inside the loop — the loop then never terminates.
- Not initialising `sum` to 0, so the total starts from a random value.
- Printing `num` at the end instead of `originalNum` — `num` is 0 by then, so the input line would show 0.
- Swapping `%` and `/` (writing `num / 10` for the digit and `num % 10` for the removal) — the logic breaks.
- Applying this to a negative number without care — digits of a negative number need special handling (e.g. take the absolute value first).

## ✅ Key takeaways
- `n % 10` gives the last digit and `n / 10` removes it — together they peel digits one by one.
- A `while` loop is ideal when the number of rounds is not known in advance.
- The loop always terminates because `num` shrinks toward 0 every round.
- Use a running sum (`sum = sum + rem`) to accumulate a total.
- Save the original number before a loop destroys it.

## 🏋️ Try it yourself
1. Modify the program to also count how many digits the number has.
2. Find the product of the digits instead of the sum.
3. Write a program that reverses a number (e.g. 1234 → 4321) using the same extraction pattern.
