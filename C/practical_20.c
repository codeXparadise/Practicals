/* 
 * Practical 20: Transpose of Matrix
 * 
 * Definition: 
 * The transpose of a matrix is obtained by interchanging its rows and columns.
 * Formula: transposed[j][i] = original[i][j]
 * 
 * Example:
 * Original Matrix (2x3):    Transposed Matrix (3x2):
 *  1  2  3                   1  4
 *  4  5  6                   2  5
 *                            3  6
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int r, c, i, j, mat[10][10], trans[10][10];

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("    PRACTICAL 20: TRANSPOSE OF MATRIX    \n");
    printf("=========================================\n\n");

    // Input Dimensions
    printf("Enter row count    : ");
    scanf("%d", &r);

    printf("Enter column count : ");
    scanf("%d", &c);

    // Input Matrix Elements
    printf("\n--- Input Matrix Elements ---\n");
    for (i = 0; i < r; i++)
    {
        for (j = 0; j < c; j++)
        {
            printf("Enter element [%d][%d]: ", i, j);
            scanf("%d", &mat[i][j]);
        }
    }

    // Compute Transpose
    for (i = 0; i < r; i++)
    {
        for (j = 0; j < c; j++)
        {
            trans[j][i] = mat[i][j];
        }
    }

    clrscr();

    printf("=========================================\n");
    printf("      MATRIX TRANSPOSE DISPLAY           \n");
    printf("=========================================\n");

    // Display Original Matrix
    printf("\n ORIGINAL MATRIX (%dx%d):\n", r, c);
    printf("-----------------------------------------\n");
    for (i = 0; i < r; i++)
    {
        printf("   ");
        for (j = 0; j < c; j++)
        {
            printf("%4d ", mat[i][j]);
        }
        printf("\n");
    }

    // Display Transposed Matrix
    printf("\n TRANSPOSED MATRIX (%dx%d):\n", c, r);
    printf("-----------------------------------------\n");
    for (i = 0; i < c; i++)
    {
        printf("   ");
        for (j = 0; j < r; j++)
        {
            printf("%4d ", trans[i][j]);
        }
        printf("\n");
    }
    printf("=========================================\n");

    getch();
}
