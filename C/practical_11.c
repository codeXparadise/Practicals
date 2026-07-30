/* 
 * Practical 11: Sum of Digits
 * 
 * Definition: 
 * Extracts individual digits of an integer using modulo division (% 10) 
 * and accumulates their sum while stripping digits using integer division (/ 10).
 * 
 * Example:
 * Input : num = 1234
 * Step 1: 1234 % 10 = 4, sum = 4,    num = 123
 * Step 2: 123 % 10  = 3, sum = 4+3=7, num = 12
 * Step 3: 12 % 10   = 2, sum = 7+2=9, num = 1
 * Step 4: 1 % 10    = 1, sum = 9+1=10,num = 0
 * Output: Sum of digits = 10
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num, originalNum, sum = 0, rem;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 11: SUM OF DIGITS         \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter an Integer Number: ");
    scanf("%d", &num);

    originalNum = num;

    // Sum of Digits Loop
    while (num != 0)
    {
        rem = num % 10;
        sum = sum + rem;
        num = num / 10;
    }

    printf("\n-----------------------------------------\n");
    printf(" INPUT NUMBER   : %d\n", originalNum);
    printf("-----------------------------------------\n");
    printf(" SUM OF DIGITS  : %d\n", sum);
    printf("=========================================\n");

    getch();
}
