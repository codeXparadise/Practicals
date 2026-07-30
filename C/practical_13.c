/* 
 * Practical 13: Palindrome Number Check
 * 
 * Definition: 
 * A Palindrome number is a number that reads the same backward as forward 
 * (Original Number == Reversed Number).
 * 
 * Example:
 * - 121 -> Reversed is 121 -> [+] PALINDROME
 * - 123 -> Reversed is 321 -> [-] NOT PALINDROME
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int num, rev = 0, rem, temp;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 13: PALINDROME CHECK        \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter an integer number: ");
    scanf("%d", &num);

    temp = num;

    // Reverse Number Logic
    while (temp != 0)
    {
        rem = temp % 10;
        rev = rev * 10 + rem;
        temp /= 10;
    }

    printf("\n-----------------------------------------\n");
    printf(" ORIGINAL NUMBER : %d\n", num);
    printf(" REVERSED NUMBER : %d\n", rev);
    printf("-----------------------------------------\n");

    // Palindrome Result Verification
    if (num == rev)
        printf(" RESULT: [+] %d is a PALINDROME number.\n", num);
    else
        printf(" RESULT: [-] %d is NOT a PALINDROME number.\n", num);

    printf("=========================================\n");

    getch();
}
