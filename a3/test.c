#include "stdio.h"
#include "stdlib.h"




int main (int argc, char* argv[]) {

    int a[10] = {0,1,2,3,4,5,6,7,8,9};
    int b = *(a + (&a[6]-a+2));
    int* e = &(a[7]);
    int* f = a;
    int* s = (a+2);

    int c = &a[7] - &a[2];
    int d = *(a+3);


    printf("t: %d\n", b);
    printf("t: %d\n", c);
    printf("t: %d\n", d);



    return 0;

}
