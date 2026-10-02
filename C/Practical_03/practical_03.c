/*
 * Practical 3: Read and Print Different Data Types
 *
 * Definition:
 * Demonstrates basic input/output operations in C for standard data types:
 * - char  (%c) : Stores a single character (e.g., 'A')
 * - int   (%d) : Stores whole numbers (e.g., 18)
 * - float (%f) : Stores numbers with decimal points (e.g., 25000.50)
 *
 * Example:
 * Input : Grade = A, Age = 18, Salary = 25000.50
 * Output: Displays stored values formatted neatly.
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int age;
    float salary;
    char grade;

    // Clear screen for Turbo C
    // clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 3: READ & PRINT DATA TYPES  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter Your Grade (A,B,C,D,E,F) : ");
    scanf("%c ", &grade);
    printf("Enter Your Age : ");
    scanf("%d", &age);
    printf("Enter Your Salary : ");
    scanf("%f", &salary);

    // Displaying Input & Output
    printf("\n-----------------------------------------\n");
    printf("            DISPLAYING THE INPUTS         \n");
    printf("-----------------------------------------\n");
    printf(" Input Character (Grade)  : %c\n", grade);
    printf(" Input Integer   (Age)    : %d years\n", age);
    printf(" Input Float     (Salary) : %.2f\n", salary);
    printf("=========================================\n");

    getch();
}
