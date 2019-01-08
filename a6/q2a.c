#include <stdlib.h>
#include <stdio.h>




int *x;
int l0, l1;


void ping(int a0, int a1) {
    x[a1] = a0 + x[a1];
}


int main (int ac, char** av) {
  l0 = 1;
  l1 = 2;
  x = malloc(10* sizeof(int));
  x[0] = 0;
  x[1] = 0;
  x[2] = 0;
  x[3] = 0;
  x[4] = 0;
  x[5] = 0;
  x[6] = 0;
  x[7] = 0;
  x[8] = 0;
  x[9] = 0;

  ping(3, 4);

  ping(l0, l1);

  printf ("%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n", x[0],
  x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9]);
}