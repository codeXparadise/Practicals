/* 
 * Practical 10: Grade Calculation using Else-If Ladder
 * 
 * Definition: 
 * Uses multi-way decision logic (else-if ladder) to assign academic grades based 
 * on percentage boundaries.
 * 
 * Grading Criteria:
 * - Marks >= 75 : Distinction
 * - Marks >= 60 : First Class
 * - Marks >= 50 : Second Class
 * - Marks >= 40 : Pass
 * - Marks <  40 : Fail
 * 
 * Example:
 * Marks = 82.5 -> Grade: Distinction
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    float marks;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 10: GRADE CALCULATION       \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter student marks (0-100): ");
    scanf("%f", &marks);

    printf("\n-----------------------------------------\n");
    printf(" MARKS OBTAINED : %.2f\n", marks);
    printf("-----------------------------------------\n");

    // Else-If Ladder Logic
    if (marks >= 75)
        printf(" Grade: Distinction\n");
    else if (marks >= 60)
        printf(" Grade: First Class\n");
    else if (marks >= 50)
        printf(" Grade: Second Class\n");
    else if (marks >= 40)
        printf(" Grade: Pass\n");
    else
        printf(" Grade: Fail\n");

    printf("=========================================\n");

    getch();
}
