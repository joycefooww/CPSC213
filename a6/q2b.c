#include <stdlib.h>
#include <stdio.h>



int x[8];
int y[8];


int f(int a0) {
    int j = 0;
    int l0 = 0x80000000;
    while (a0 != 0) {
        int l1 = a0;
        l1 = a0 & l0;
        if (l1 != 0) {
            j++;
        }
        a0 *= 2;


    }
    return j;

}


int main (int ac, char** av) {

  x[0] = 1;
  x[1] = 2;
  x[2] = 3;
  x[3] = 0xffffffff;
  x[4] = 0xfffffffe;
  x[5] = 0;
  x[6] = 184;
  x[7] = 340057058;
  y[0] = 0;
  y[1] = 0;
  y[2] = 0;
  y[3] = 0;
  y[4] = 0;
  y[5] = 0;
  y[6] = 0;
  y[7] = 0;
  for (int i = 7; i >= 0; i--) {
          y[i] = f(x[i]);
  }
  printf ("%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n", x[0],
  x[1], x[2], x[3], x[4], x[5], x[6], x[7]);

  printf ("%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n", y[0],
  y[1], y[2], y[3], y[4], y[5], y[6], y[7]);
}