const MOD_ADLER: u32 = 65521;

fn main() {
    let mut a: u32 = 1;
    let mut b: u32 = 0;

    for i in 0..250_000_000u32 {
        a = (a + i) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    }

    let result = b << 16 | a;
    println!("|rust|adler32|{:x}|{}|", result, "N/A");
}
