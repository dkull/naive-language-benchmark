#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <stdint.h>
#include <unistd.h>

// the logic to measure time starts here
// from https://stackoverflow.com/questions/361363/how-to-measure-time-in-milliseconds-using-ansi-c
// by Alexander Saprykin

uint64_t get_posix_clock_time ()
{
    struct timespec ts;
#ifdef _SC_MONOTONIC_CLOCK
    if (sysconf (_SC_MONOTONIC_CLOCK) > 0) {
        /* A monotonic clock presents */
    }
#endif

    if (clock_gettime (CLOCK_MONOTONIC, &ts) == 0)
        return (uint64_t) (ts.tv_sec * 1000000 + ts.tv_nsec / 1000) / 1000;
    else
        return 0;
}

// the real benchmark starts here

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
    uint64_t begin = get_posix_clock_time();

    unsigned char key[] = "Keyfobsrulethebestofall";
    struct RC4* rc4 = rc4_new(key, 23);

    long long sum = 0;
    for (int i = 0; i < (long long) 250000000; i++) {
        sum += (long long) rc4_get_byte(rc4);
    }
    uint64_t timedelta = get_posix_clock_time() - begin;
    printf("|c|rc4|%lli|%li|\n", sum, timedelta);
}

int main() {
    bench();
}
