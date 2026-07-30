/* 
 * Practical 22: File Handling - Write Student Details
 * 
 * Definition: 
 * File handling provides persistence by reading/writing data directly to disk files.
 * Key Functions:
 * - FILE *filePointer : File pointer declaration
 * - fopen("filename", "w") : Opens file in write mode
 * - fprintf(filePointer, ...) : Writes formatted text to file
 * - fclose(filePointer) : Closes open file stream
 * 
 * Example:
 * Input : Roll Number = 44, Date of Birth = 23/04/2007
 * Output: Writes data into 'details.txt' on disk.
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    FILE *filePointer;
    int rollNumber;
    char dateOfBirth[15];

    // Clear screen for Turbo C
    clrscr();

    printf("=========================================\n");
    printf("     PRACTICAL 22: FILE HANDLING         \n");
    printf("=========================================\n\n");

    // Open file in write mode
    filePointer = fopen("details.txt", "w");

    // Check file creation status
    if (filePointer == NULL)
    {
        printf(" Error: Unable to create or open file on disk.\n");
        getch();
        return;
    }

    // Input Section
    printf("Enter Roll Number : ");
    scanf("%d", &rollNumber);

    printf("Enter Date of Birth (DD/MM/YYYY): ");
    scanf("%s", dateOfBirth);

    // Write formatted records to file
    fprintf(filePointer, "Roll Number : %d\n", rollNumber);
    fprintf(filePointer, "Date of Birth : %s\n", dateOfBirth);

    // Close File Stream
    fclose(filePointer);

    printf("\n-----------------------------------------\n");
    printf(" RESULT\n");
    printf("-----------------------------------------\n");
    printf(" [+] Student details successfully written to 'details.txt'.\n");
    printf("=========================================\n");

    getch();
}
