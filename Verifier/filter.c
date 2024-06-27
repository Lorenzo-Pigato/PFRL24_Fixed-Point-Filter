#include <stdio.h>
#include <stdlib.h>

float power(float base, int exp){
    int result = 1;
    for(int i = 0; i < exp; i++)
        result *= base;
    return result;
}

int main(int argc, char const *argv[])
{
    float y;
    float x;
    float yp;
    int k;
    char quit;
    
    int iterations;

    printf("Insert alpha's exp: ");
    scanf("%d", &k);
    
    printf("Insert starting point: ");
    scanf("%f", &yp);

    cycle:
        printf("Insert iterations: ");
        scanf("%d", &iterations);

        printf("Insert input: ");
        scanf("%f", &x);

        for(int i = 0; i < iterations; i++){
            y = (x / power(2, k)) + yp - (yp / power(2, k));
            yp = y;

            printf("[%d] - Y:\t%f\t%.0f\n", i, y, y * power(2,15));
        }

        printf("\n\nPress 'c' to continue, 'q' to quit: ");
        scanf(" %c", &quit);

        if(quit != 'q' && quit != 'Q')
            goto cycle;
     
    return 0;
}
