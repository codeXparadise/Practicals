/* 
 * Practical 5 (B): Maximum of Three Numbers using Ternary Operator
 * 
 * Definition: 
 * The ternary operator (?:) provides a concise inline syntax for conditional logic:
 * condition ? expression_if_true : expression_if_false
 * 
 * Example:
 * Given a = 12, b = 25, c = 7
 * Result: (12 > 25) ? ... : ((25 > 7) ? 25 : 7) -> 25
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int a, b, c, maxTernary;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf(" PRACTICAL 5(B): BIGGEST OF 3 (TERNARY)  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter first number  (a): ");
    scanf("%d", &a);

    printf("Enter second number (b): ");
    scanf("%d", &b);

    printf("Enter third number  (c): ");
    scanf("%d", &c);

    // Ternary Operator Logic
    maxTernary = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);

    // Output Section
    printf("\n-----------------------------------------\n");
    printf(" INPUT VALUES : a = %d, b = %d, c = %d\n", a, b, c);
    printf("-----------------------------------------\n");
    printf(" Maximum Number : %d\n", maxTernary);
    printf("=========================================\n");

    getch();
}
