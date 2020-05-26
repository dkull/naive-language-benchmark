fn powmod(_base: u32, _pow: u32, modu: u32) -> u32 {
    let mut result: u64 = 1;
    let mut base: u64 = _base as u64;
    let mut pow: u64 = _pow as u64;
    while pow > 0 {
        if pow & 1 == 1 {
            result = (result * base) % modu as u64;
        }
        base = (base * base) % modu as u64;
        pow >>= 1;
    }
    return result as u32;
}

fn witness(n: u32, _s: u32, d: u32, a: u32) -> bool {
    let mut x: u64 = powmod(a, d, n).into();
    let mut y: u64 = 0;

    let mut s = _s;
    let n = n as u64;
    let mut is_witness = true;
    while s > 0 {
        // powmod
        y = (x * x) % n;
        if y == 1 && x != 1 && x != n - 1 {
            is_witness = false;
            break;
        }
        x = y;
        s -= 1;
    }
    if y != 1 {
        is_witness = false;
    }
    return is_witness;
}

fn is_rabin_miller_prime(n: u32, witnesses: &[u32; 7]) -> bool {
    let mut d: u32 = n / 2;
    let mut s: u32 = 1;

    while d & 1 != 1 {
        d /= 2;
        s += 1;
    }

    for row in witnesses.to_vec().iter() {
        if !witness(n, s, d, *row) {
            return false;
        }
    }

    return true;
}

pub fn main() {
    let witnesses: [u32; 7] = [2, 3, 5, 7, 11, 13, 17];
    let mut prime_count: u32 = 0;
    for i in 3..2500000 {
        if is_rabin_miller_prime(i, &witnesses) {
            prime_count += 1;
        }
    }
    println!("|rust|millerrabin|{}|{}|", prime_count, "N/A");
}
