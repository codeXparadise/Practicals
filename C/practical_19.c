/* 
 * Practical 19: Linear Search in Array
 * 
 * Definition: 
 * Linear Search traverses an array sequentially element-by-element to locate 
 * a target search key.
 * 
 * Example:
 * Array: [10, 25, 30, 45, 50], Search Key = 30
 * Result: [+] Element found at position 3
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    int arr[50], n, i, key, found = 0;

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("    PRACTICAL 19: LINEAR SEARCH ARRAY    \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter total number of elements: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++)
    {
        printf("Enter element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    printf("\n-----------------------------------------\n");
    printf(" ARRAY ELEMENTS : ");
    for (i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n-----------------------------------------\n");

    printf("Enter target element to search: ");
    scanf("%d", &key);

    // Linear Search Loop
    for (i = 0; i < n; i++)
    {
        if (arr[i] == key)
        {
            printf("\n RESULT: [+] Element %d found at position %d (Index %d).\n", key, i + 1, i);
            found = 1;
            break;
        }
    }

    if (!found)
        printf("\n RESULT: [-] Element %d not found in the array.\n", key);

    printf("=========================================\n");

    getch();
}
