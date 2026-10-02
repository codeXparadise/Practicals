/* 
 * Practical 16 (A): Even Series Sum using While Loop
 * 
 * Definition: 
 * Calculates the sum of even series (2 + 4 + 6 + 8 + ... + n) using a 'while' loop.
 * 
 * Example:
 * Input : limit n = 10
 * Series: 2 + 4 + 6 + 8 + 10
 * Sum   : 30
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int n, i, sumWhile = 0;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf(" PRACTICAL 16(A): EVEN SERIES (WHILE)   \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter limit (n): ");
    scanf("%d", &n);

    // While Loop Execution
    i = 2;
    while (i <= n)
    {
        sumWhile += i;
        i += 2;
    }

    printf("\n-----------------------------------------\n");
    printf(" INPUT LIMIT (n)  : %d\n", n);
    printf("-----------------------------------------\n");
    printf(" Sum (While Loop) : %d\n", sumWhile);
    printf("=========================================\n");

    getch();
}
