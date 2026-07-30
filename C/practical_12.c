/* 
 * Practical 12: Sum of first N Natural Numbers using Recursion
 * 
 * Definition: 
 * Recursion is a programming technique where a function calls itself to solve smaller instances 
 * of the same problem until a base condition is met.
 * - Base Case   : if (n <= 0) return 0
 * - Recursive Step: return n + sumN(n - 1)
 * 
 * Example:
 * sumN(5) = 5 + sumN(4)
 *         = 5 + 4 + 3 + 2 + 1 + 0 = 15
 */

#include <stdio.h>
#include <conio.h>

// Recursive Function to compute sum of N natural numbers
int sumN(int n)
{
    if (n <= 0)
        return 0;
    return n + sumN(n - 1);
}

void main()
{
    // Variable Declarations
    int n, result;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("  PRACTICAL 12: SUM OF N (RECURSION)     \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter a positive number (n): ");
    scanf("%d", &n);

    // Call Recursive Function
    result = sumN(n);

    printf("\n-----------------------------------------\n");
    printf(" INPUT LIMIT (n)  : %d\n", n);
    printf("-----------------------------------------\n");
    printf(" Cumulative Sum   : %d\n", result);
    printf("=========================================\n");

    getch();
}
