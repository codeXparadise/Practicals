/* 
 * Practical 15: Menu Driven Arithmetic Calculator
 * 
 * Definition: 
 * Uses a switch-case control structure to present a menu to the user and execute 
 * specified mathematical operations (Add, Subtract, Multiply, Divide).
 * 
 * Example:
 * Select option 3 (Multiply), inputs 4 and 5 -> Result = 20.00
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int choice;
    float a, b;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("  PRACTICAL 15: MENU DRIVEN CALCULATOR   \n");
    printf("=========================================\n\n");

    // Display Menu Options
    printf(" 1. Addition (+)\n");
    printf(" 2. Subtraction (-)\n");
    printf(" 3. Multiplication (*)\n");
    printf(" 4. Division (/)\n");
    printf("-----------------------------------------\n");
    printf("Enter choice (1-4): ");
    scanf("%d", &choice);

    printf("Enter first number : ");
    scanf("%f", &a);

    printf("Enter second number: ");
    scanf("%f", &b);

    printf("\n-----------------------------------------\n");
    printf(" RESULT\n");
    printf("-----------------------------------------\n");

    // Switch Case Logic
    switch (choice)
    {
    case 1:
        printf(" Addition (%.2f + %.2f) = %.2f\n", a, b, a + b);
        break;
    case 2:
        printf(" Subtraction (%.2f - %.2f) = %.2f\n", a, b, a - b);
        break;
    case 3:
        printf(" Multiplication (%.2f * %.2f) = %.2f\n", a, b, a * b);
        break;
    case 4:
        if (b != 0)
            printf(" Division (%.2f / %.2f) = %.2f\n", a, b, a / b);
        else
            printf(" Error! Division by zero is undefined.\n");
        break;
    default:
        printf(" Invalid choice! Please enter between 1 and 4.\n");
    }

    printf("=========================================\n");

    getch();
}
