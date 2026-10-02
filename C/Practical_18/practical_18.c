/* 
 * Practical 18: Bubble Sort Array Elements
 * 
 * Definition: 
 * Bubble Sort compares adjacent elements in an array and swaps them if they are 
 * out of order. This process repeats until the entire array is sorted in ascending order.
 * 
 * Example:
 * Input Array  : 5 2 8 1 4
 * Sorted Array : 1 2 4 5 8
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int arr[50], n, i, j, temp;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 18: BUBBLE SORT ARRAY     \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter total number of elements: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++)
    {
        printf("Enter element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    // Display Original Unsorted Array
    printf("\n-----------------------------------------\n");
    printf(" ORIGINAL ARRAY : ");
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n-----------------------------------------\n");

    // Bubble Sort Algorithm
    for (i = 0; i < n - 1; i++)
    {
        for (j = 0; j < n - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                // Swap adjacent elements
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    // Display Sorted Output Array
    printf(" SORTED ARRAY   : ");
    for (i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n=========================================\n");

    getch();
}
