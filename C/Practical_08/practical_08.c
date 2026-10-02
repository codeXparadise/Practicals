/* 
 * Practical 8: Even or Odd Check
 * 
 * Definition: 
 * An Even number is an integer perfectly divisible by 2 (num % 2 == 0).
 * An Odd number yields a remainder of 1 when divided by 2.
 * 
 * Example:
 * - 14 % 2 = 0 -> 14 is Even
 * - 9 % 2  = 1 -> 9 is Odd
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 8: EVEN OR ODD CHECK      \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter an integer number: ");
    scanf("%d", &num);

    printf("\n-----------------------------------------\n");
    printf(" RESULT\n");
    printf("-----------------------------------------\n");

    // Even / Odd Check using modulus operator
    if (num % 2 == 0)
        printf(" %d is EVEN.\n", num);
    else
        printf(" %d is ODD.\n", num);

    printf("=========================================\n");

    getch();
}
