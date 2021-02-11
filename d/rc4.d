
struct RC4 {
	ubyte[256] s;
	uint ii;
	uint jj;

	this(ubyte[] key) {
		s = RC4.key_schedule(key);
		ii = 0;
		jj = 0;
	}

	ubyte[256] key_schedule(ubyte[] key) {
		ubyte[256] data;
		foreach(ubyte i; 0 .. 256) {
			data[i] = i;
		}
		
		ubyte j = 0;
		foreach(int i; 0 .. 256) {
			j = (j + data[i] + key[i % key.length]) % 256;
			auto a = data[i];
			auto b = data[j];
			data[j] = a;
			data[i] = b;
		}
		return data;
	}
	
	ubyte get_byte() {
		this.ii = (this.ii + 1) % 256;
		this.jj = (this.jj + this.s[this.ii]) % 256;
		auto a = this.s[this.ii];
		auto b = this.s[this.jj];
		this.s[this.ii] = b;
		this.s[this.jj] = a;
		auto idx = (this.s[this.ii] + this.s[this.jj]) % 256;
		return this.s[idx];
	}
}

void bench() {
	import std.stdio : writeln, writefln;
	const key = "Keyfobsrulethebestofall";
	RC4* rc4 = new RC4(cast(ubyte[]) key);
	ulong sum = 0;
	for (uint x = 0; x < 250000000; x++) {
		sum += rc4.get_byte();
	}
	writefln("|d|rc4|%d|N/A|", sum);
}

void main() {
	bench();
}
