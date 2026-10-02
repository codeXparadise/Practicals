/*
 * Practical 23: Star Pyramid Pattern
 *
 * Definition:
 * Prints a centered pyramid of stars using nested loops. For every row i:
 * - An inner loop prints the leading spaces (spaces = height - i)
 * - A second inner loop prints the stars (stars = 2 * i - 1, an odd count)
 * This keeps the pyramid perfectly centered and symmetric.
 *
 * Example:
 * Input : height = 5
 * Output:
 *         *
 *       * * *
 *     * * * * *
 *   * * * * * * *
 * * * * * * * * *
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int height, i, j;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 23: STAR PYRAMID PATTERN    \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter height of pyramid: ");
    scanf("%d", &height);

    printf("\n-----------------------------------------\n");
    printf(" CENTERED STAR PYRAMID (height = %d)\n", height);
    printf("-----------------------------------------\n");

    // Outer Loop for Rows
    for (i = 1; i <= height; i++)
    {
        // Inner Loop 1: Print Leading Spaces
        for (j = 1; j <= height - i; j++)
        {
            printf(" ");
        }

        // Inner Loop 2: Print Stars (odd count = 2 * i - 1)
        for (j = 1; j <= 2 * i - 1; j++)
        {
            printf("*");
        }

        printf("\n");
    }

    printf("=========================================\n");

    getch();
}
