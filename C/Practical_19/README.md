# Practical 19 — Linear Search in Array

> Introduction to Programming with C · Lab Manual · B.Sc. (Artificial Intelligence), Semester I

## 📌 What this practical covers
- What an **array** is, and why we store many values of the same type under one name.
- How array elements are numbered using **indices starting at 0**.
- **Linear (sequential) search** — visiting every element one by one until we find the target.
- Using a **`found` flag** to remember whether the search succeeded.
- Using **`break`** to stop the loop the moment the first match appears.
- The difference between **POSITION** (counting from 1) and **INDEX** (counting from 0).

## 🎯 Aim
To search an array for a target value using linear search.

## 🧠 The big idea
Imagine a row of 10 lockers. Each locker has a number painted on it — but the very first locker is numbered **0**, not 1. A linear search is what you do when you have no idea which locker holds the item: you open locker 0, look inside, close it, open locker 1, look inside, and so on, until you find the item or run out of lockers. You never skip a locker, and you never guess — you just go **one by one, left to right**.

That is the whole idea. Linear search is the "honest, patient" method. It is simple, it works on *any* array (sorted or not), and it needs no cleverness. Its only weakness is speed: if the item is at the very end — or not there at all — you may have to look at every single element. In this practical we make the computer do exactly that: compare each element with the search key, and the moment they match, report where it was found and stop.

## 🔍 Deep dive

### What is an array?
An **array** is a collection of values, all of the **same data type**, stored together under **one name**. Instead of creating `a1, a2, a3, ...`, we create a single array `arr` that can hold many integers. In our program:

```c
int arr[50];
```

This says: "`arr` is an array that can hold up to **50** integers." The number inside the square brackets is the **size** (capacity), not the last index.

The elements are numbered using an **index**, and — this is the part beginners trip on — **the first element is at index 0, not 1**.

```c
arr[0]   // 1st element
arr[1]   // 2nd element
arr[2]   // 3rd element
...
arr[n-1] // last element when n elements are used
```

So for an array holding 5 elements, the valid indices are `0, 1, 2, 3, 4`. Index `5` is *outside* the array. Accessing an index outside the valid range is a bug — it does not give a helpful error, it just reads or writes garbage memory.

### Traversal — visiting every element
To look at each element in turn, we use a `for` loop that walks the index from `0` up to `n - 1`:

```c
for (i = 0; i < n; i++)
{
    // here arr[i] is the current element
}
```

Notice the condition is `i < n`, **not** `i <= n`. If we wrote `i <= n`, the loop would reach `i == n`, which is one step past the last valid index — an out-of-bounds access. This off-by-one mistake is the single most common error in array programs.

### Linear (sequential) search — the core algorithm
The search itself is just a loop that compares every element with the target, which we store in a variable called `key`:

```c
for (i = 0; i < n; i++)
{
    if (arr[i] == key)
    {
        printf("\n RESULT: [+] Element %d found at position %d (Index %d).\n",
               key, i + 1, i);
        found = 1;
        break;
    }
}
```

Read this as: *"Start at the first element. If this element equals the key, report it and stop. Otherwise move to the next element and repeat."* The comparison uses `==` (equal to), **not** `=` (assignment). Writing `if (arr[i] = key)` would be a serious bug: it assigns `key` into `arr[i]` and the condition becomes true almost always — a classic trap.

### The `found` flag — why we need it
Here is a subtle problem. Suppose we search and find nothing. The loop simply ends quietly — no message is printed inside it. How does the program know it *failed*? It cannot tell from the loop alone whether "no match happened" or "the loop never ran".

So we use a **flag** — a variable that records a yes/no fact. We set it to `0` (meaning "not found yet") *before* the loop:

```c
int found = 0;
```

Inside the loop, the moment we find a match, we flip it to `1` ("found!"). After the loop finishes, we check the flag:

```c
if (!found)
    printf("\n RESULT: [-] Element %d not found in the array.\n", key);
```

`!found` means "if found is not true" — i.e. the search failed. Only if we never flipped the flag do we print the not-found message. Without this flag, the program would have no way to report failure at all.

### `break` — stopping at the first match
The `break;` statement jumps **out of the loop immediately**. The instant we find the element, there is no reason to keep scanning the rest of the array — we already have our answer. So we `break` and continue with the code after the loop.

If the array contained the key more than once, `break` makes sure we report only the **first** occurrence. If you wanted the last occurrence instead, you would remove the `break` (but then you must be careful not to print inside the loop each time).

### POSITION vs INDEX — the counting confusion
This practical prints **both** numbers, and it is worth understanding why they differ:

| What we call it | How it counts | First element | Third element |
| :--- | :--- | :--- | :--- |
| **Index** | starts from **0** | 0 | 2 |
| **Position** | starts from **1** | 1 | 3 |

The computer stores arrays using **indices** (0-based), but humans naturally say "the third one" (1-based). That is why the code prints `i + 1` for the position and `i` for the index. Same element, two different numbering schemes. Never mix them up when reading results.

### Best case, worst case, and why linear search is O(n)
Linear search has a very predictable cost. Let `n` be the number of elements:

- **Best case** — the key is the **first** element (`arr[0]`). We do **1** comparison and stop. This happens regardless of how big the array is.
- **Worst case** — the key is the **last** element, or **not present at all**. We do **n** comparisons.
- **Average case** — roughly **n / 2** comparisons.

Because the amount of work grows in direct proportion to `n`, we say linear search runs in **O(n)** time — "order of n". Double the array size, and in the worst case you roughly double the comparisons. This is fine for small arrays (like 50 elements here) but becomes slow for very large ones.

### How it differs from binary search
**Binary search** is a faster algorithm — but it has one strict condition: **the array must already be sorted**. Binary search jumps to the middle element and discards half the array each step, giving it **O(log n)** time, which is dramatically faster for large `n` (searching a million items takes about 20 steps, not a million).

Linear search needs **no sorting** and works on data in any order. So the trade-off is:

| | Linear search | Binary search |
| :--- | :--- | :--- |
| Data must be sorted? | No | Yes |
| Speed | O(n) | O(log n) |
| Simplicity | Very simple | More code |
| Good for | Small / unsorted data | Large sorted data |

Since our array is unsorted, linear search is the correct choice here.

## 📖 Key terms
| Term | Meaning |
| :--- | :--- |
| Array | A collection of values of the same type stored under one name. |
| Element | One single value stored inside the array. |
| Index | The position number of an element, **starting from 0**. |
| `n` | The number of elements actually used in the array. |
| Traversal | Visiting every element of an array, one by one, using a loop. |
| Linear search | Searching by checking elements sequentially from first to last. |
| Search key | The target value we are looking for (`key`). |
| Flag | A variable (like `found`) that records a yes/no state. |
| `break` | A statement that exits the loop immediately. |
| O(n) | Time complexity meaning the work grows in proportion to `n`. |

## 🖼️ Diagram
![Linear search scanning array elements one by one from index 0](screenshots/diagram_19.png)

## 🧮 Dry run (worked example)
Let us trace the program with the array `10 25 30 45 50` (so `n = 5`) and search for `key = 30`.

Initial state: `found = 0`, `i` starts at 0.

| Step | `i` | `arr[i]` | Compare `arr[i] == 30`? | Action |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 0 | 10 | 10 == 30 → No | move on |
| 2 | 1 | 25 | 25 == 30 → No | move on |
| 3 | 2 | 30 | 30 == 30 → **Yes** | print result, set `found = 1`, `break` |

The loop stops at `i = 2`. The program prints:

```
RESULT: [+] Element 30 found at position 3 (Index 2).
```

Here `i + 1 = 3` is the **position** and `i = 2` is the **index**. After the loop, `found` is `1`, so the "not found" message is skipped.

**Not-found case:** now search for `key = 99`.

| Step | `i` | `arr[i]` | Compare `arr[i] == 99`? | Action |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 0 | 10 | No | move on |
| 2 | 1 | 25 | No | move on |
| 3 | 2 | 30 | No | move on |
| 4 | 3 | 45 | No | move on |
| 5 | 4 | 50 | No | move on |
| — | 5 | — | loop ends (`i < n` is false) | `found` still `0` |

Because `found` stayed `0`, the program prints:

```
RESULT: [-] Element 99 not found in the array.
```

## ⌨️ Reading the code
```c
#include <stdio.h>
#include <conio.h>
void main()
{
    int arr[50], n, i, key, found = 0;
    clrscr();
    printf("Enter total number of elements: "); scanf("%d", &n);
    for (i = 0; i < n; i++)
    {
        printf("Enter element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }
    printf("\n ARRAY ELEMENTS : ");
    for (i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\nEnter target element to search: ");
    scanf("%d", &key);
    for (i = 0; i < n; i++)
    {
        if (arr[i] == key)
        {
            printf("\n RESULT: [+] Element %d found at position %d (Index %d).\n", key, i + 1, i);
            found = 1;
            break;
        }
    }
    if (!found)
        printf("\n RESULT: [-] Element %d not found in the array.\n", key);
    getch();
}
```

- `#include <stdio.h>` brings in `printf` and `scanf`. `#include <conio.h>` brings in `clrscr()` (clear screen) and `getch()` (wait for a keypress), which are part of the older Turbo C environment.
- `int arr[50], n, i, key, found = 0;` declares the array (capacity 50) plus the element count `n`, the loop counter `i`, the target `key`, and the `found` flag initialised to `0`.
- `clrscr();` clears the console so output starts on a clean screen.
- The first loop **reads the input**: it asks how many elements (`n`), then reads each element into `arr[i]`. The prompt prints `i + 1` so the user sees "element 1, element 2, ..." instead of "element 0, ...".
- The next loop **prints the array** so the user can see what was stored, separated by spaces.
- Then it reads the **search key**.
- The search loop **compares each element with the key**. On a match it prints the result, sets `found = 1`, and `break`s out.
- `if (!found)` handles the **failure case** — printing the not-found message only when no match was ever seen.
- `getch();` pauses the program so the output stays on screen until the user presses a key.

## 🔑 Syntax cheat-sheet
| Syntax | Meaning |
| :--- | :--- |
| `int arr[50];` | Declare an integer array that can hold 50 elements. |
| `arr[i]` | Access the element at index `i`. |
| `for (i = 0; i < n; i++)` | Traverse the array from index 0 to `n - 1`. |
| `if (arr[i] == key)` | Test whether the current element equals the search key. |
| `found = 1;` | Set the flag to "found". |
| `if (!found)` | "If not found" — runs the failure branch. |
| `break;` | Exit the loop immediately. |
| `&arr[i]` in `scanf` | Pass the address of the element so `scanf` can store into it. |

## 🖨️ Output
![Program output](screenshots/output.png)

## ⚠️ Common mistakes
- Using `i <= n` in the loop instead of `i < n`, which reads one element past the end of the array.
- Writing `if (arr[i] = key)` (single `=`) instead of `if (arr[i] == key)` — this assigns instead of comparing.
- Forgetting to initialise `found = 0` before the loop, so the not-found check behaves unpredictably.
- Reporting `i` as the position without adding 1, confusing the 0-based index with the 1-based position.
- Forgetting `&` in `scanf("%d", &arr[i])`, which stops the input from being stored correctly.

## ✅ Key takeaways
- An array stores many values of one type under a single name, indexed **from 0**.
- Linear search checks elements **one by one** until it finds the key or reaches the end.
- The `found` flag lets the program report a **failed search** after the loop ends.
- `break` stops the loop at the **first match**, so only the first occurrence is reported.
- Linear search is **O(n)** and needs **no sorted data**, unlike binary search which is faster but needs sorted input.

## 🏋️ Try it yourself
1. Modify the program to report **all** occurrences of the key (remove the `break` and print each match), and count how many times it appears.
2. Change the program so that after finding the key, it also prints the number of comparisons it made before finding it.
3. Write a second version that performs the search **from the last element backwards**, and confirm that a key present once gives the same index.
4. Extend the program to search for a key in an array of `float` values instead of `int` values.
5. Write a program that first checks whether the array is **sorted**, and if it is, uses binary search instead of linear search to find the key.
