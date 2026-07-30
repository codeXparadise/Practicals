/* 
 * Practical 14: Armstrong Number Check
 * 
 * Definition: 
 * An Armstrong number (for 3 digits) is a number that is equal to the sum 
 * of the cubes of its individual digits.
 * 
 * Example:
 * 153 = (1 * 1 * 1) + (5 * 5 * 5) + (3 * 3 * 3)
 *     = 1 + 125 + 27 = 153 -> [+] ARMSTRONG NUMBER
 * 
 * 123 = 1 + 8 + 27 = 36 != 123 -> [-] NOT ARMSTRONG
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num, sum = 0, rem, temp;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("    PRACTICAL 14: ARMSTRONG CHECK        \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter a 3-digit integer: ");
    scanf("%d", &num);

    temp = num;

    // Cube Sum Calculation
    while (temp != 0)
    {
        rem = temp % 10;
        sum += rem * rem * rem;
        temp /= 10;
    }

    printf("\n-----------------------------------------\n");
    printf(" INPUT NUMBER   : %d\n", num);
    printf(" SUM OF CUBES   : %d\n", sum);
    printf("-----------------------------------------\n");

    // Armstrong Result Verification
    if (num == sum)
        printf(" RESULT: [+] %d is an ARMSTRONG number.\n", num);
    else
        printf(" RESULT: [-] %d is NOT an ARMSTRONG number.\n", num);

    printf("=========================================\n");

    getch();
}
