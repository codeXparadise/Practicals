/* 
 * Practical 9: Positive, Negative, or Zero Check
 * 
 * Definition: 
 * Evaluates the sign of a numerical value:
 * - Positive : num > 0
 * - Negative : num < 0
 * - Zero     : num == 0
 * 
 * Example:
 * - 15 -> Positive Number
 * - -8 -> Negative Number
 * -  0 -> Zero
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
    printf(" PRACTICAL 9: POSITIVE / NEGATIVE CHECK  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter a number: ");
    scanf("%d", &num);

    printf("\n-----------------------------------------\n");
    printf(" RESULT\n");
    printf("-----------------------------------------\n");

    // Conditional Sign Check
    if (num > 0)
        printf(" [+] %d is POSITIVE.\n", num);
    else if (num < 0)
        printf(" [-] %d is NEGATIVE.\n", num);
    else
        printf(" [0] The number is ZERO.\n");

    printf("=========================================\n");

    getch();
}
