/* 
 * Practical 7: Increment and Decrement Operators
 * 
 * Definition: 
 * - Post-Increment (x++) / Post-Decrement (x--): Uses current value in expression first, then updates variable.
 * - Pre-Increment  (++x) / Pre-Decrement  (--x): Updates variable value first, then uses updated value.
 * 
 * Example:
 * Given initial x = 5:
 * - y = x++ -> y = 5, x = 6 (Post-Increment)
 * - y = ++x -> x = 6, y = 6 (Pre-Increment)
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int x, y, initialValue;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("  PRACTICAL 7: INCREMENT & DECREMENT     \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter initial value for x: ");
    scanf("%d", &initialValue);

    printf("\n-----------------------------------------\n");
    printf(" INITIAL VALUE: x = %d\n", initialValue);
    printf("-----------------------------------------\n");

    // 1. Post Increment
    x = initialValue;
    y = x++;
    printf(" Post-Increment (y = x++) -> x = %d, y = %d\n", x, y);

    // 2. Pre Increment
    x = initialValue;
    y = ++x;
    printf(" Pre-Increment  (y = ++x) -> x = %d, y = %d\n", x, y);

    // 3. Post Decrement
    x = initialValue;
    y = x--;
    printf(" Post-Decrement (y = x--) -> x = %d, y = %d\n", x, y);

    // 4. Pre Decrement
    x = initialValue;
    y = --x;
    printf(" Pre-Decrement  (y = --x) -> x = %d, y = %d\n", x, y);
    printf("=========================================\n");

    getch();
}
