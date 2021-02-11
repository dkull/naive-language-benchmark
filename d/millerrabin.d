import std.stdio;

uint powmod(uint _base, uint _pow, uint mod) {
	ulong base = _base;
	ulong pow = _pow;
	ulong result = 1;
	
	while ( pow > 0 ) {
		if ( ( pow & 1 ) == 1 ) {
			result = (result * base) % mod;
		}
		base = (base * base) % mod;
		pow >>= 1;
	}
	return cast(uint) result;
}

bool witness(uint n, uint s, uint d, uint a) {
	ulong x = powmod(a, d, n);
	ulong y = 0;
	bool is_witness = true;
	while ( s > 0 ) {
		y = (x * x) % n;
		if ( y == 1 && x != 1 && x != (n - 1) ) {
			is_witness = false;
			break;
		}
		x = y;
		s -= 1;
	}
	if (y != 1) {
		is_witness = false;
	}
	return is_witness;
}

bool is_miller_rabin_prime(uint n, uint[] witnesses) {
	uint d = n / 2;
	uint s = 1;
	while (!((d & 1) == 1)) {
		d /= 2;
		s += 1;
	}
	foreach (w; witnesses) {
		if (!witness(n, s, d, w)) {
			return false;
		}
	}
	return true;
}

void main() {
	uint[] witnesses = [2,3,5,7,11,13,17];
	uint prime_count = 0;
	foreach(uint i; 3 .. 2500000) {
		if (is_miller_rabin_prime(i, witnesses)) {
			prime_count += 1;
		}
	}
    writefln("|d|millerrabin|%d|%s|", prime_count, "N/A");
}

