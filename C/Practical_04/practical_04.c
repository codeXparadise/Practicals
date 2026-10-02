/*
 * Practical 4: Area and Volume of Shapes
 *
 * Definition:
 * Calculates geometric metrics for 2D and 3D shapes:
 * - Area of Circle    = PI * r * r
 * - Area of Rectangle = length * width
 * - Volume of Sphere  = (4/3) * PI * r^3
 * - Volume of Box     = length * width * height
 *
 * Example:
 * Given radius = 3, length = 4, width = 5, height = 6:
 * - Circle Area = 28.26
 * - Rect Area   = 20.00
 */

#include <stdio.h>
#include <conio.h>

void main()
{
    // Variable Declarations
    float radius, length, width, height;
    float circleArea, rectArea, sphereVol, boxVol;

    // Clear screen for Turbo C
    // clrscr();

    printf("=========================================\n");
    printf("   PRACTICAL 4: AREA & VOLUME OF SHAPES  \n");
    printf("=========================================\n\n");

    // Input Section
    printf("Enter radius for Circle/Sphere : ");
    scanf("%f", &radius);

    printf("Enter length of rectangle     : ");
    scanf("%f", &length);

    printf("Enter width of rectangle      : ");
    scanf("%f", &width);

    printf("Enter height of box           : ");
    scanf("%f", &height);

    // Area & Volume Calculations
    circleArea = 3.14 * radius * radius;
    rectArea = length * width;
    sphereVol = (4.0 / 3.0) * 3.14 * radius * radius * radius;
    boxVol = length * width * height;

    // Output Section
    printf("\n-----------------------------------------\n");
    printf(" CALCULATED RESULTS\n");
    printf("-----------------------------------------\n");
    printf(" Area of Circle      : %.2f\n", circleArea);
    printf(" Area of Rectangle   : %.2f\n", rectArea);
    printf(" Volume of Sphere    : %.2f\n", sphereVol);
    printf(" Volume of Box       : %.2f\n", boxVol);
    printf("=========================================\n");

    getch();
}
