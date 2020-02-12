#include <stdio.h>

struct RC4 {
    unsigned char s[256];
    unsigned char i;
    unsigned char j;
} rc4 = { {}, 0, 0 };

struct RC4 *rc4_new(unsigned char key[], unsigned int key_len) {
    for (int i = 0; i < 256; i++) {
        rc4.s[i] = i;
    }

    int j = 0;
    for (int i = 0; i < 256; i++) {
        j = ((int)(j + rc4.s[i] + key[i % key_len])) % ((int) 256);
        char a = rc4.s[i];
        char b = rc4.s[j];
        rc4.s[i] = b;
        rc4.s[j] = a;
    }
    
    return &rc4;
}

int rc4_get_byte(struct RC4 *rc4) {
    rc4->i = (rc4->i + 1) % 256;
    rc4->j = (rc4->j + rc4->s[rc4->i]) % 256;
    
    char a = rc4->s[rc4->i];
    char b = rc4->s[rc4->j];
    rc4->s[rc4->i] = b;
    rc4->s[rc4->j] = a;

    int idx = (rc4->s[rc4->i] + rc4->s[rc4->j]) % 256;
    return rc4->s[idx];
}

void bench() {
    unsigned char key[] = "Keyfobsrulethebestofall";
    struct RC4* rc4 = rc4_new(key, 23);

    long long sum = 0;
    for (int i = 0; i < (long long) 1000000000; i++) {
        sum += (long long) rc4_get_byte(rc4);
    }
    printf("c    rc4 %lli\n", sum);
}

int main() {
    bench();
}
