/* 
 * Practical 12 (A): Factorial using Recursion
 * 
 * Definition: 
 * The factorial of a number 'n' (written as n!) is the product of all positive integers 
 * from 1 to n.
 * - Base Case    : if (n <= 1) return 1
 * - Recursive Step : return n * fact(n - 1)
 * 
 * Example:
 * 5! = 5 * 4 * 3 * 2 * 1 = 120
 */

#include <stdio.h>
#include <conio.h>

// Recursive Function to compute Factorial
int fact(int n)
{
    if (n <= 1)
        return 1;
    return n * fact(n - 1);
}

void main()
{
    // Variable Declarations
    int n, result;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf(" PRACTICAL 12(A): FACTORIAL (RECURSION)  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter a number (n): ");
    scanf("%d", &n);

    // Call Recursive Function
    result = fact(n);

    printf("\n-----------------------------------------\n");
    printf(" INPUT NUMBER (n) : %d\n", n);
    printf("-----------------------------------------\n");
    printf(" Factorial (%d!)   : %d\n", n, result);
    printf("=========================================\n");

    getch();
}
