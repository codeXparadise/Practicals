/*
 * Practical 5 (A): Maximum of Three Numbers using if-else
 *
 * Definition:
 * Compares three user-provided integer values using conditional 'if-else if-else'
 * structures to determine the greatest value.
 *
 * Example:
 * Input : a = 12, b = 25, c = 7
 * Output: Biggest using if-else: 25
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int a, b, c, maxIf;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("  PRACTICAL 5(A): BIGGEST OF 3 (IF-ELSE) \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter first number  (a): ");
    scanf("%d", &a);

    printf("Enter second number (b): ");
    scanf("%d", &b);

    printf("Enter third number  (c): ");
    scanf("%d", &c);

    // Conditional Logic
    if (a >= b && a >= c)
        maxIf = a;
    else if (b >= c)
        maxIf = b;
    else
        maxIf = c;

    // Output Section
    printf("\n-----------------------------------------\n");
    printf(" INPUT VALUES : a = %d, b = %d, c = %d\n", a, b, c);
    printf("-----------------------------------------\n");
    printf(" Maximum Number : %d\n", maxIf);
    printf("=========================================\n");

    getch();
}
