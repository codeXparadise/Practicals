/* 
 * Practical 16 (B): Even Series Sum using For Loop
 * 
 * Definition: 
 * Calculates the sum of even series (2 + 4 + 6 + 8 + ... + n) using a 'for' loop.
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
    int n, i, sumFor = 0;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("  PRACTICAL 16(B): EVEN SERIES (FOR)     \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter limit (n): ");
    scanf("%d", &n);

    // For Loop Execution
    for (i = 2; i <= n; i += 2)
    {
        sumFor += i;
    }

    printf("\n-----------------------------------------\n");
    printf(" INPUT LIMIT (n)  : %d\n", n);
    printf("-----------------------------------------\n");
    printf(" Sum (For Loop)   : %d\n", sumFor);
    printf("=========================================\n");

    getch();
}
