/* 
 * Practical 12 (B): Fibonacci Series using Recursion
 * 
 * Definition: 
 * A Fibonacci series is a sequence where each number is the sum of the two preceding terms, 
 * starting with 0 and 1.
 * - Base Cases   : fibo(0) = 0, fibo(1) = 1
 * - Recursive Step : fibo(n) = fibo(n - 1) + fibo(n - 2)
 * 
 * Example:
 * First 7 terms: 0, 1, 1, 2, 3, 5, 8
 */

#include <stdio.h>
#include <conio.h>

// Recursive Function for nth Fibonacci Term
int fibo(int n)
{
    if (n <= 0)
        return 0;
    if (n == 1)
        return 1;
    return fibo(n - 1) + fibo(n - 2);
}

void main()
{
    // Variable Declarations
    int n, i;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf(" PRACTICAL 12(B): FIBONACCI (RECURSION)  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter number of terms (n): ");
    scanf("%d", &n);

    printf("\n-----------------------------------------\n");
    printf(" FIBONACCI SERIES UP TO %d TERMS\n", n);
    printf("-----------------------------------------\n ");

    // Print Series using Recursion Loop
    for (i = 0; i < n; i++)
    {
        printf("%d ", fibo(i));
    }
    printf("\n=========================================\n");

    getch();
}
