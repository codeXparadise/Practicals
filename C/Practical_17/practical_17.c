/* 
 * Practical 17: Prime Number Check
 * 
 * Definition: 
 * A Prime Number is a natural number greater than 1 that is divisible only by 1 
 * and itself (has exactly two distinct factors).
 * 
 * Example:
 * - 7 -> Divisible by 1, 7 -> [+] PRIME NUMBER
 * - 9 -> Divisible by 1, 3, 9 -> [-] NOT PRIME NUMBER
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num, i, isPrime = 1;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 17: PRIME NUMBER CHECK    \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter a number: ");
    scanf("%d", &num);

    if (num <= 1)
        isPrime = 0;

    // Divisibility Test Loop
    for (i = 2; i <= num / 2; i++)
    {
        if (num % i == 0)
        {
            isPrime = 0;
            break;
        }
    }

    printf("\n-----------------------------------------\n");
    printf(" INPUT NUMBER : %d\n", num);
    printf("-----------------------------------------\n");

    // Prime Verification Result
    if (isPrime)
        printf(" RESULT: [+] %d is a PRIME number.\n", num);
    else
        printf(" RESULT: [-] %d is NOT a PRIME number.\n", num);

    printf("=========================================\n");

    getch();
}
