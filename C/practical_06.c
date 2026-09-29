/* 
 * Practical 6: Multiplication Table
 * 
 * Definition: 
 * Generates the multiplication table for any given number using a 'for' loop 
 * running from 1 to 10.
 * 
 * Example:
 * Input : num = 5
 * Output: 5 x 1 = 5, 5 x 2 = 10 ... 5 x 10 = 50
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num, i;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 6: MULTIPLICATION TABLE   \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter number to generate table: ");
    scanf("%d", &num);

    printf("\n-----------------------------------------\n");
    printf(" MULTIPLICATION TABLE FOR %d\n", num);
    printf("-----------------------------------------\n");

    // For Loop to generate table
    for (i = 1; i <= 10; i++)
    {
        printf(" %d x %2d = %d\n", num, i, num * i);
    }
    printf("=========================================\n");

    getch();
}
