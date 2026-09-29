/* 
 * Practical 2: Arithmetic and Logical Operators
 * 
 * Definition: 
 * - Arithmetic Operators perform mathematical calculations (+, -, *, /, %).
 * - Logical Operators evaluate conditions and return 1 (True) or 0 (False) (&&, ||, !).
 * 
 * Example:
 * Given a = 10, b = 5:
 * - Arithmetic: a + b = 15, a % b = 0 (Remainder)
 * - Logical   : (a > 5 && b < 10) -> 1 (True because both conditions are true)
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int a = 10, b = 5;

    // Clear screen for Turbo C
    // clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 2: ARITHMETIC & LOGICAL     \n");
    printf("=========================================\n\n");

    // --- ARITHMETIC OPERATORS ---
    printf("-----------------------------------------\n");
    printf(" INPUT VALUES: a = %d, b = %d\n", a, b);
    printf("-----------------------------------------\n");
    printf(" Addition       (a + b) : %d\n", a + b);
    printf(" Subtraction    (a - b) : %d\n", a - b);
    printf(" Multiplication (a * b) : %d\n", a * b);
    printf(" Division       (a / b) : %d\n", a / b);
    printf(" Modulus        (a %% b) : %d\n", a % b);

    // --- LOGICAL OPERATORS ---
    printf("\n-----------------------------------------\n");
    printf(" LOGICAL EVALUATIONS\n");
    printf("-----------------------------------------\n");
    printf(" AND  (a > 5 && b < 10) : %d\n", (a > 5 && b < 10));
    printf(" OR   (a == 0 || b == 5): %d\n", (a == 0 || b == 5));
    printf(" NOT  !(a == b)        : %d\n", !(a == b));
    printf("=========================================\n");

    getch();
}
