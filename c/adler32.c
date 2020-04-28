#include <stdio.h>

int main() {
    int MOD_ADLER = 65521;
    int a = 1;
    int b = 0;
    for (unsigned int i = 0; i < 250000000; i++) {
        a = (a + i) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    } 
    unsigned int result = b << 16 | a;
    printf("|c|adler32|%x|N/A|\n", (result));
}
