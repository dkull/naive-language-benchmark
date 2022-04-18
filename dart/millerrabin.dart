int powmod(int base, int pow, int mod) {
  var result = 1;
  while (pow > 0) {
    if (pow & 1 == 1) {
      result = (result * base) % mod;
    }
    base = (base * base) % mod;
    pow >>= 1;
  }
  return result;
}

bool witness(int n, int s, int d, int a) {
  var x = powmod(a, d, n);
  var y = 0;
  while (s > 0) {
    y = (x * x) % n;
    if (y == 1 && x != 1 && x != n - 1) {
      return false;
    }
    x = y;
    s--;
  }
  return y == 1;
}

bool is_rabin_miller_prime(int n, List<int> witnesses) {
  var d = n ~/ 2;
  var s = 1;

  while (d & 1 != 1) {
    d ~/= 2;
    s++;
  }

  for (var row in witnesses) {
    if (!witness(n, s, d, row)) {
      return false;
    }
  }

  return true;
}

void main() {
  var sw = Stopwatch()..start();

  var witnesses = [2, 3, 5, 7, 11, 13, 17];
  var prime_count = 0;
  for (var i = 3; i < 2500000; i++) {
    if (is_rabin_miller_prime(i, witnesses)) {
      prime_count++;
    }
  }

  var timedelta = sw.elapsed.inMilliseconds;
  print("|dart|millerrabin|$prime_count|$timedelta|");
}
