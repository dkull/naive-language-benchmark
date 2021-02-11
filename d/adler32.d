import std.stdio;

void main(string[] args) {
    const uint MOD_ADLER = 65521;
    uint a = 1;
    uint b = 0;
    for (uint i = 0; i < 250000000; i++) {
        a = (a + i) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    }
    int result = b << 16 | a;
    writefln("|d|adler32|%x|N/A|", (result));
}
