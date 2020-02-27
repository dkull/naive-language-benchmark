fn powmod(_base u32, _pow u32, mod u32) u32 {
    mut result := u64(1)
    mut base := u64(_base)
    mut pow := u64(_pow)
    for {
        if !(pow > 0) {
            break
        }
        if pow & 1 == 1 {
            result = (result * base) % mod
        }
        base = (base * base) % mod
        pow >>= 1
    }
    return result
}

fn witness(n u32, _s u32, d u32, a u32) bool {
    mut x := u64(powmod(a, d, n))
    mut y := u64(0)

    mut s := _s
    for {
        if !(s > 0) {
            break
        }
        // powmod
        y = (x * x) % n
        if y == 1 && x != 1 && x != n - 1 {
            return false
        }
        x = y
        s--
    }
    if y != 1 {
        return false
    }
    return true
}

fn is_rabin_miller_prime(n u32, witnesses []u32) bool {
    mut d := n / 2
    mut s := u32(1)

    for {
        if d & 1 == 1 {
            break
        }
        d /= 2
        s++
    }

    for _, row in witnesses {
        if !witness(n, s, d, row) {
            return false
        }
    }

    return true
}

pub fn main() {
    witnesses := [u32(2), 3, 5, 7, 11, 13, 17]
    mut prime_count := 0
    mut i := u32(3)
    for {
        if i == 2500000 {
            break
        }
        if (is_rabin_miller_prime(i, witnesses)) {
            prime_count++
        }
        i++
    }
    println("|v|millerrabin|" + prime_count.str() + "|N/A|")
}
