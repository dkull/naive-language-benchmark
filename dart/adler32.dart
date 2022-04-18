


const int MOD_ADLER = 65521;

void main() {
  int a = 1;
  int b = 0 ;
  for (int i = 0; i < 250000000; i++) {
    a = (a + i) % MOD_ADLER;
    b = (b + a) % MOD_ADLER;
  }
  int result = b << 16 | a;
  print("|dart|adler32|${result.toRadixString(16)}|N/A|");
}
