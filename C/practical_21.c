/* 
 * Practical 21: Matrix Addition
 * 
 * Definition: 
 * Matrix addition is performed by adding corresponding elements of two matrices 
 * of equal dimensions (rows x columns).
 * Formula: Sum[i][j] = MatrixA[i][j] + MatrixB[i][j]
 * 
 * Example:
 * Matrix A (2x2):   Matrix B (2x2):   Sum Matrix (A + B):
 *   1  2              5  6              6   8
 *   3  4              7  8             10  12
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int rows, columns, i, j;
    int matrixA[10][10], matrixB[10][10], sumMatrix[10][10];

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("       PRACTICAL 21: MATRIX ADDITION     \n");
    printf("=========================================\n\n");

    // Input Matrix Dimensions
    printf("Enter row count    : ");
    scanf("%d", &rows);

    printf("Enter column count : ");
    scanf("%d", &columns);

    // Input Matrix A Elements
    printf("\n--- Input Matrix A Elements ---\n");
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < columns; j++)
        {
            printf("Enter Matrix A [%d][%d]: ", i, j);
            scanf("%d", &matrixA[i][j]);
        }
    }

    // Input Matrix B Elements
    printf("\n--- Input Matrix B Elements ---\n");
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < columns; j++)
        {
            printf("Enter Matrix B [%d][%d]: ", i, j);
            scanf("%d", &matrixB[i][j]);
        }
    }

    // Perform Matrix Addition
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < columns; j++)
        {
            sumMatrix[i][j] = matrixA[i][j] + matrixB[i][j];
        }
    }

    clrscr();

    printf("=========================================\n");
    printf("       MATRIX ADDITION DISPLAY           \n");
    printf("=========================================\n");

    // Display Matrix A
    printf("\n MATRIX A:\n");
    printf("-----------------------------------------\n");
    for (i = 0; i < rows; i++)
    {
        printf("   ");
        for (j = 0; j < columns; j++)
        {
            printf("%4d ", matrixA[i][j]);
        }
        printf("\n");
    }

    // Display Matrix B
    printf("\n MATRIX B:\n");
    printf("-----------------------------------------\n");
    for (i = 0; i < rows; i++)
    {
        printf("   ");
        for (j = 0; j < columns; j++)
        {
            printf("%4d ", matrixB[i][j]);
        }
        printf("\n");
    }

    // Display Sum Matrix
    printf("\n SUM MATRIX (A + B):\n");
    printf("-----------------------------------------\n");
    for (i = 0; i < rows; i++)
    {
        printf("   ");
        for (j = 0; j < columns; j++)
        {
            printf("%4d ", sumMatrix[i][j]);
        }
        printf("\n");
    }
    printf("=========================================\n");

    getch();
}
